import 'package:flutter/material.dart';
import 'package:ares_excel/ares_excel.dart';

class AresExcelHost extends StatefulWidget {
  const AresExcelHost({super.key, required this.sdk, required this.path});
  final AresExcelSdk sdk;
  final String path;
  @override
  State<AresExcelHost> createState() => _AresExcelHostState();
}

class _AresExcelHostState extends State<AresExcelHost> {
  final controller = AresOfficeViewerController();
  @override
  void dispose() {
    controller.dispose(); // Host owns this controller; widget owns its workspace.
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => AresExcelEditor(
    sdk: widget.sdk,
    documentPath: widget.path,
    controller: controller,
    theme: ThemeData(colorSchemeSeed: const Color(0xff008577)),
    darkTheme: ThemeData.dark(),
    viewerConfig: const AresOfficeViewerConfig(
      allowEditing: true,
      initialZoom: 1,
      commentAuthorName: 'Reviewer',
    ),
    appBarConfig: const AresOfficeViewerAppBarConfig(title: 'AresExcel workspace'),
    toolsSheetConfig: const AresOfficeToolsSheetConfig(showPrint: false),
    onDocumentReady: (document) { /* show document metadata in your app */ },
    onDocumentModified: () { /* reflect unsaved work */ },
    onDocumentSaved: (saved) { /* update current path from saved.document.path */ },
    onAutoSaved: (saved) { /* acknowledge successful persistence */ },
    onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to complete the document operation.')),
      );
    },
  );
}
