import 'package:ares_excel/ares_excel.dart';

// Native callers supply nativeDestination; browsers leave it null.
Future<List<int>> importEditExport(AresExcelSdk sdk, List<int> bytes,
    {String? nativeDestination}) async {
  final imported = await sdk.loadBytes(name: 'document.xlsx', bytes: bytes,
    path: nativeDestination);
  final session = await sdk.edit(imported);
  try {
    session.setCell(sectionIndex: 0, row: 0, column: 0, value: 'Hello Excel!');
    final saved = await sdk.save(session);
    return await sdk.exportBytes(saved.document.path);
  } finally {
    session.dispose();
  }
}
