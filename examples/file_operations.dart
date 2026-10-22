import 'package:ares_excel/ares_excel.dart';

// A focused example for a known editable fixture with at least one section.
// Imported complex files may reject operations; preserve originals and handle errors.
Future<void> updateFile(AresExcelSdk sdk, String inputPath, String newOutputPath) async {
  final AresOfficeDocument original = await sdk.load(inputPath);
  final AresExcelEditSession session = await sdk.edit(original);
  try {
    session.setCell(sectionIndex: 0, row: 1, column: 0, value: 'Updated item');
    await sdk.save(session, outputPath: newOutputPath);
  } finally {
    session.dispose();
  }
}
