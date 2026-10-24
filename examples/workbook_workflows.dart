import 'package:ares_excel/ares_excel.dart';

// All managed grid coordinates are zero-based. A1 ranges are inclusive.
Future<AresOfficeDocument> editWorkbook(AresExcelSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.setRangeValues(sectionIndex: 0, row: 0, column: 0, values: [
      ['Item', 'Quantity', 'Unit price', 'Amount'],
      ['Paper', '2', '5.50', '=B2*C2'],
    ]);
    final quantity = AresSpreadsheetRange.parse('B2:B20');
    session.setDataValidation(0, quantity, const AresDataValidation(
      type: 'whole', operator: 'between', first: '0', second: '1000'));
    session.freezeWorksheetPanes(0, rows: 1);
    session.applyFormatting(const AresOfficeFormatChange(
      sectionIndex: 0, row: 1, column: 2, numberFormatCode: '0.00'));
    final formula = AresOfficeFormulaEngine(session.document).evaluateCell(0, 1, 3);
    if (!formula.supported || formula.error != null) {
      throw StateError('Formula requires review.');
    }
    return (await sdk.save(session)).document;
  } finally {
    session.dispose();
  }
}

// The scan-review workbook is a string matrix with explicit output settings.
Future<AresOfficeDocument> writeReviewedWorkbook(AresExcelSdk sdk, String path) =>
  sdk.writeWorkbook(outputPath: path, workbook: const AresExcelWorkbook(
    output: AresExcelOutput.cleanTable,
    sheets: [AresExcelSheet(name: 'Stock', rows: [
      ['Item', 'Quantity'], ['Paper', '2'],
    ])],
  ));

// Source-exported typed workbook helper; not an independent licensing boundary.
// Import through the managed SDK before further licensed document operations.
Future<AresOfficeDocument> createTypedWorkbook(AresExcelSdk sdk, {String? nativePath}) async {
  final workbook = Excel.createExcel();
  final sheet = workbook['Budget'];
  sheet.cell(CellIndex.indexByString('A1')).value = TextCellValue('Budget');
  sheet.cell(CellIndex.indexByString('B2')).value = const IntCellValue(2);
  sheet.cell(CellIndex.indexByString('C2')).value = const DoubleCellValue(5.5);
  sheet.cell(CellIndex.indexByString('D2')).value = const FormulaCellValue('B2*C2');
  sheet.cell(CellIndex.indexByString('E2')).value = const DateCellValue(year: 2026, month: 10, day: 22);
  final bytes = workbook.encode();
  if (bytes == null) throw StateError('Workbook encoding failed.');
  return sdk.loadBytes(name: 'budget.xlsx', bytes: bytes, path: nativePath);
}


// Explicitly set optional match modes, then save through the licensed SDK.
Future<AresFormulaResult> extractText(AresExcelSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.setCell(sectionIndex: 0, row: 0, column: 0,
      value: '=TEXTAFTER(TEXTBEFORE("North-South-East","-",-1),"-")');
    final saved = await sdk.save(session);
    return AresOfficeFormulaEngine(saved.document).evaluateCell(0, 0, 0);
  } finally { session.dispose(); }
}

Future<AresFormulaResult> insertTextFormula(AresExcelSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.setCell(sectionIndex: 0, row: 29, column: 0,
      value: '=TEXTJOIN(" | ",TRUE,SUBSTITUTE("Old name","Old","New"),REPT("!",3))');
    final saved = await sdk.save(session);
    return AresOfficeFormulaEngine(saved.document).evaluateCell(0, 29, 0);
  } finally { session.dispose(); }
}

Future<AresFormulaResult> insertBinaryLookupFormula(AresExcelSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.setCell(sectionIndex: 0, row: 29, column: 0,
      value: '=XLOOKUP(25,{10;20;30},{100;200;300},,-1,2)');
    final saved = await sdk.save(session);
    return AresOfficeFormulaEngine(saved.document).evaluateCell(0, 29, 0);
  } finally { session.dispose(); }
}

Future<AresFormulaResult> insertMatchIndexFormula(AresExcelSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.setCell(sectionIndex: 0, row: 29, column: 0,
      value: '=INDEX({10,20;30,40},XMATCH("B",{"A";"B"}),XMATCH("Q2",{"Q1","Q2"}))');
    final saved = await sdk.save(session);
    return AresOfficeFormulaEngine(saved.document).evaluateCell(0, 29, 0);
  } finally { session.dispose(); }
}

Future<AresFormulaResult> insertCashFlowFormula(AresExcelSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.setCell(sectionIndex: 0, row: 29, column: 0,
      value: '=NPV(10%,-10000,3000,4200,6800)');
    await sdk.save(session);
    return AresOfficeFormulaEngine(session.document).evaluateCell(0, 29, 0);
  } finally { session.dispose(); }
}

// File-level note/name operations require no concurrent dirty session.
Future<void> nameAndReviewCell(AresExcelSdk sdk, String path) async {
  final document = await sdk.load(path);
  final named = await sdk.setDefinedName(path, const AresExcelDefinedName(
    name: 'ReviewQuantity', formula: "'Stock'!B2", localSheetId: 0),
    expectedSourceFingerprint: document.sourceFingerprint);
  final snapshot = await sdk.inspectNotes(path, sheetIndex: 0);
  if (!snapshot.canCreate || snapshot.notes.any((n) => n.address == 'B2')) return;
  final added = await sdk.addNote(path, sheetIndex: 0, address: 'B2',
    author: 'Reviewer', text: 'Check quantity.',
    expectedSourceFingerprint: named.document.sourceFingerprint);
  final updated = await sdk.replaceNoteText(path, sheetIndex: 0, address: 'B2',
    text: 'Checked.', expectedSourceFingerprint: added.document.sourceFingerprint);
  await sdk.removeNote(path, sheetIndex: 0, address: 'B2',
    expectedSourceFingerprint: updated.document.sourceFingerprint);
}

Future<void> showFirstSupportedNote(AresExcelSdk sdk, String path) async {
  final snapshot = await sdk.inspectNotes(path, sheetIndex: 0);
  final notes = snapshot.notes.where((n) => n.canSetVisibility).toList();
  if (notes.isEmpty) return;
  await sdk.setNoteVisibility(path, sheetIndex: 0, address: notes.first.address,
    visible: true, expectedSourceFingerprint: snapshot.sourceFingerprint);
}

Future<void> setFirstNotePlacement(AresExcelSdk sdk, String path) async {
  final snapshot = await sdk.inspectNotes(path, sheetIndex: 0);
  final notes = snapshot.notes.where((n) => n.canSetPlacement).toList();
  if (notes.isEmpty) return;
  await sdk.setNotePlacement(path, sheetIndex: 0, address: notes.first.address,
    placement: AresExcelNotePlacement.moveOnly,
    expectedSourceFingerprint: snapshot.sourceFingerprint);
}

int invoiceDateSerial(AresOfficeDocument document, String isoDate) =>
  AresExcelDates(date1904: document.date1904).parseDate(isoDate);
