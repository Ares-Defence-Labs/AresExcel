import 'package:ares_excel/ares_excel.dart';

Future<AresOfficeSaveResult> updateAresExcel(
  AresExcelSdk sdk, String path, String copyPath,
) async {
  final original = await sdk.load(path);
  final session = await sdk.edit(original);
  try {
    // Use a supported editable fixture containing at least one section.
    session.setCell(sectionIndex: 0, row: 0, column: 0, value: 'Hello Excel!');
    return await sdk.save(session, outputPath: copyPath);
  } finally {
    session.dispose();
  }
}
