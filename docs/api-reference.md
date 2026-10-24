# API reference — development snapshot

These declarations are extracted from the current source wrappers. They are
not a frozen release contract. Named option types are re-exported by
`package:ares_excel/ares_excel.dart`. The final narrowed API and complete dartdoc
site must be validated against the protected candidate before release.

## Domain SDK

```dart
AresExcelSdk({required super.licenceKey, super.verifyLicence});

Future<AresExcelPicturesSnapshot> inspectPictures(
    String path, {
    required int sheetIndex,
  });

Future<(AresOfficeSaveResult, int)> insertImage(
    String path, {
    required Uint8List bytes,
    required String fileName,
    required int sheetIndex,
    required int row,
    required int column,
    double width = 320,
    double? height,
    double offsetX = 0,
    double offsetY = 0,
    String? expectedSourceFingerprint,
  });

Future<AresOfficeSaveResult> setPictureBounds(
    String path, {
    required int sheetIndex,
    required int pictureId,
    required int row,
    required int column,
    required double width,
    required double height,
    double offsetX = 0,
    double offsetY = 0,
    String? expectedSourceFingerprint,
  });

Future<AresOfficeSaveResult> deletePicture(
    String path, {
    required int sheetIndex,
    required int pictureId,
    String? expectedSourceFingerprint,
  });

Future<AresExcelNotesSnapshot> inspectNotes(
    String path, {
    required int sheetIndex,
  });

Future<AresExcelNoteOperationResult> addNote(
    String path, {
    required int sheetIndex,
    required String address,
    required String author,
    required String text,
    String? expectedSourceFingerprint,
  });

Future<AresExcelNoteOperationResult> replaceNoteText(
    String path, {
    required int sheetIndex,
    required String address,
    required String text,
    String? expectedSourceFingerprint,
  });

Future<AresExcelNoteOperationResult> setNotePlacement(
    String path, {
    required int sheetIndex,
    required String address,
    required AresExcelNotePlacement placement,
    String? expectedSourceFingerprint,
  });

Future<AresExcelNoteOperationResult> setNoteVisibility(
    String path, {
    required int sheetIndex,
    required String address,
    required bool visible,
    String? expectedSourceFingerprint,
  });

Future<AresExcelNoteOperationResult> removeNote(
    String path, {
    required int sheetIndex,
    required String address,
    String? expectedSourceFingerprint,
  });

Future<AresExcelHyperlinksSnapshot> inspectHyperlinks(
    String path, {
    required int sheetIndex,
  });

Future<AresExcelHyperlinkOperationResult> setHyperlink(
    String path, {
    required int sheetIndex,
    required String reference,
    String? target,
    String? location,
    String? display,
    String? tooltip,
    bool replace = false,
    String? expectedSourceFingerprint,
  });

Future<AresExcelHyperlinkOperationResult> removeHyperlink(
    String path, {
    required int sheetIndex,
    required String reference,
    String? expectedSourceFingerprint,
  });

Future<List<AresExcelDefinedName>> definedNames(String path);

Future<AresOfficePageOperationResult> setDefinedName(
    String path,
    AresExcelDefinedName value, {
    bool replace = false,
    String? expectedSourceFingerprint,
  });

Future<AresOfficePageOperationResult> removeDefinedName(
    String path,
    String name, {
    int? localSheetId,
    String? expectedSourceFingerprint,
  });

Future<AresOfficeScanGenerationResult?> scanToFile({
    required BuildContext context,
    required String outputPath,
    String? edgeSdkLicenceKey,
    bool isPro = false,
    AresExcelScanner? scanner,
    AresOfficePageRecognizer? recognizePages,
  });

Future<AresOfficeDocument> writeWorkbook({
    required String outputPath,
    required AresExcelWorkbook workbook,
    AresOfficeScanTemplate? template,
  });
```

## Common file and generation operations

The domain class fixes the product; do not construct or use a generic core SDK
to bypass product restrictions. `generateDocument` consumes already recognized
pages; it does not invoke the camera. `scanToFile` performs the complete workflow.

```dart
AresDomainSdk({
    required this.product,
    required this.licenceKey,
    this.verifyLicence,
  });

Future<AresOfficeDocument> createFromTemplate({
    required String templatePath,
    required String outputPath,
    bool overwrite = false,
  });

Future<AresOfficeSaveResult> saveAsTemplate({
    required AresOfficeEditSession session,
    required String outputPath,
    bool overwrite = false,
  });

Future<void> authorize();

Future<AresOfficeDocument> load(String path);

Future<List<AresOfficeAnnotation>> readAnnotations(String path);

Future<AresOfficeSaveResult> replaceAnnotations(
    String path, {
    required Iterable<AresOfficeAnnotation> annotations,
    String? expectedSourceFingerprint,
  });

Future<(AresOfficeSaveResult, AresOfficeAnnotation)> embedMedia(
    String path, {
    required Uint8List bytes,
    required String fileName,
    required int sectionIndex,
    Rect? initialRect,
    Map<String, Object?> metadata = const {},
    String? expectedSourceFingerprint,
  });

Future<AresOfficeSaveResult> confirmMediaPlacement(
    String path,
    String id,
    Rect rect, {
    String? expectedSourceFingerprint,
  });

Future<AresOfficeSaveResult> discardPendingMedia(
    String path,
    String id, {
    String? expectedSourceFingerprint,
  });

Future<AresOfficeDocument> loadBytes({
    required String name,
    required List<int> bytes,
    String? path,
    bool overwrite = false,
  });

Future<Uint8List> exportBytes(String path);

Future<AresDomainEditSession> edit(AresOfficeDocument document);

Future<AresOfficeSaveResult> save(
    AresOfficeEditSession session, {
    String? outputPath,
    bool overwrite = false,
  });

Future<AresOfficeScanGenerationResult> generateDocument({
    required String outputPath,
    required AresOfficeScanTemplate template,
    required List<AresOfficeRecognizedPage> pages,
    AresWordDocumentSettings wordSettings = const AresWordDocumentSettings(),
    AresWordFormOutput? formOutput,
    List<String> formSourcePaths = const [],
  });
```

## Scanner construction

```dart
const AresExcelScanner({
    super.key,
    required this.sdk,
    this.edgeSdkLicenceKey,
    this.isPro = false,
    this.scanMode = EdgeDetectionScannerMode.Balanced,
    this.templates,
    this.initialTemplateId,
    this.initialProcessingMode,
    this.initialScanOptions = const {},
    this.onCustomiseTemplates,
    this.onTemplateSelected,
    this.onPickFromGallery,
    this.onUpgrade,
  });
```

## Editor construction

```dart
const AresExcelEditor({
    super.key,
    required this.sdk,
    required this.documentPath,
    this.controller,
    this.viewerConfig = const AresOfficeViewerConfig(),
    this.appBarConfig = const AresOfficeViewerAppBarConfig(),
    this.toolsSheetConfig = const AresOfficeToolsSheetConfig(),
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.autoSaveEnabled = true,
    this.onDocumentReady,
    this.onDocumentModified,
    this.onDocumentSaved,
    this.onError,
    this.onRequestSaveAsPath,
    this.onOpenHyperlink,
    this.onRequestSaveAsFormatPath,
    this.onRequestPdfExportPath,
    this.onExternalToolAction,
    this.onScanPage,
    this.showProBadge = false,
    this.onUpgrade,
    this.autoSaveIdleDelay = const Duration(milliseconds: 500),
    this.onAutoSaved,
    this.onDocumentImagesExtracted,
    this.onPdfExported,
    this.onDocumentCompressed,
    this.onTextExtracted,
    this.onRequestCompressedCopyPath,
    this.onRequestTextExportPath,
    this.onLoadCustomStamps,
    this.onScanWatermark,
    this.onEmbedVideos,
    this.onEmbedAudio,
  });
```

## Platform contract

`AresOfficePlatforms.editorTargets` and `documentApiTargets` require Android,
iOS, macOS, Windows, Linux and web. These are release requirements, not a list
of already certified builds. `scannerTargets` is Android/iOS only.
`AresOfficePlatforms.canScan` is a lightweight runtime check; it does not grant
a licence or camera permission. `requireScanner()` throws `UnsupportedError`
outside mobile. Import `package:ares_excel/platforms.dart` to query this without
loading camera, OCR, editor or filesystem libraries.

## Models and low-level operations

`AresOfficeDocument` contains logical sections and the source fingerprint.
`AresOfficeSaveResult.document` is the reopened saved model. A domain edit session
tracks pending changes and in-session undo/redo; dispose it after use. Its
`undoSaved`/`redoSaved` methods operate on in-place saved history, and require no
pending edits. Saved history is not a durable cross-process recovery journal.

`AresOfficeScanTemplate`, `AresOfficeRecognizedPage` and
`AresOfficeScanGenerationResult` describe generation inputs and verified output.
OOXML operations may return operation-specific snapshots/results. Consult their
restriction/status fields before enabling mutations. Pass
`expectedSourceFingerprint` when a mutation supports it to prevent stale writes.

The current source still broadly exports shared core classes. Those exports are
under a [security boundary review](security-and-assets.md); direct low-level
helpers are not an independent authorization boundary. Customer distribution
requires a narrowed adapter API whose native operations enforce the product.

See [scanning](scanning.md), [editor lifecycle](editor.md) and the compilable
[integration example](../examples/scan_and_edit.dart). Exceptions include
`AresOfficeLicenceException`, invalid-domain/path errors and unsupported package
operations. Preserve the original on a failed edit and present a recoverable error.


## Domain edit-session signatures

Selected inherited session declarations relevant to this product; operations still enforce format and structure limits. See [full exported declarations](api-types.md) for helper/model types.

```dart
AresOfficeDocument get originalDocument;
AresOfficeDocument get document;
bool get isDirty;
bool get canUndo;
bool get canRedo;
void setWordHeaderFooter(AresWordHeaderFooterKind kind, {AresWordHeaderFooterVariant variant = AresWordHeaderFooterVariant.defaultPages, String? text, AresWordPageNumberAlignment? textAlignment, bool? textBold, bool? textItalic, bool? textUnderline, double? textFontSize, bool? pageNumber, AresWordPageNumberAlignment pageNumberAlignment = AresWordPageNumberAlignment.center, AresWordPageNumberFormat? pageNumberFormat, int? pageNumberStart});
void setWordPageNumbers({required bool enabled, AresWordHeaderFooterKind? kind, AresWordPageNumberAlignment alignment = AresWordPageNumberAlignment.center, AresWordPageNumberFormat? format, int? start});
void replaceWordTextRange(int sectionIndex, int start, int end, String replacement);
void replaceWordTextRangePreservingRuns(int sectionIndex, int start, int end, String replacement);
void replaceWordTextRangeWithFormatting(int sectionIndex, int start, int end, String replacement, AresOfficeFormatChange style);
void insertWordPageBreakAtTextRange(int sectionIndex, int start, int end);
void insertWordTable(int afterIndex, int rows, int columns);
void editWordTableAxis(int sectionIndex, int index, {required bool column, required bool insert});
void resizeWordTable(int sectionIndex, int rows, int columns);
void setWordTableCell(int sectionIndex, int row, int column, String value, {int? fillColorArgb, String? verticalAlignment, String? textDirection, String? tableLayout, String? borderPreset, double? cellMarginPoints, double? columnWidthPoints, double? rowHeightPoints, String? rowHeightRule, bool? repeatHeaderRow, bool? preventRowSplit});
void applyWordTableStylePreset(int sectionIndex, AresWordTableStylePreset preset);
void mergeWordTableCells(int sectionIndex, String range, {bool split = false});
void formatWordTextRange(int sectionIndex, int start, int end, AresOfficeFormatChange style);
void clearWordTextRangeFormatting(int sectionIndex, int start, int end);
void clearWordParagraphFormatting(int sectionIndex);
void replaceWordTextRangeWithParagraphs(int index, int start, int end, String replacement);
bool wordParagraphHasListFormatting(int index);
void toggleWorksheetGridlines(int sectionIndex);
void toggleWorksheetHeadings(int sectionIndex);
void freezeWorksheetPanes(int sectionIndex, {int rows = 0, int columns = 0});
void setWorksheetSize(int sectionIndex, AresSpreadsheetRange range, {double? rowHeight, double? columnWidth});
void autoFitWorksheet(int sectionIndex, AresSpreadsheetRange range, {required bool rows});
void setWorksheetVisibility(int sectionIndex, AresSpreadsheetRange range, {required bool rows, required bool hidden});
void setWorksheetTabColor(int sectionIndex, int argb);
void setDataValidation(int sectionIndex, AresSpreadsheetRange range, AresDataValidation? rule);
void mergeCells(int sectionIndex, AresSpreadsheetRange range, {bool remove = false});
void clearPresentationTextFormatting(int sectionIndex);
List<List<String>> previewTextToColumns(int sectionIndex, AresSpreadsheetRange range, String delimiter);
void splitTextToColumns(int sectionIndex, AresSpreadsheetRange range, String delimiter, {bool overwrite = false});
void insertWorksheetChart(int sectionIndex, AresSpreadsheetRange range, {required String title, bool line = false, int? fromRow, int? fromColumn});
void setCell({required int sectionIndex, required int row, required int column, required String value});
void setRangeValues({required int sectionIndex, required int row, required int column, required List<List<String>> values});
List<List<String>> rangeValues(int sectionIndex, AresSpreadsheetRange range);
AresSpreadsheetRange currentRegion(int sectionIndex, {required int row, required int column});
void sortRange(int sectionIndex, AresSpreadsheetRange range, {int keyColumn = 0, bool descending = false, bool hasHeader = false});
int removeDuplicateRows(int sectionIndex, AresSpreadsheetRange range, {bool hasHeader = false});
void filterRange(int sectionIndex, AresSpreadsheetRange range, {required int keyColumn, required String value});
void clearFilter(int sectionIndex);
void clearRange(int sectionIndex, AresSpreadsheetRange range);
void fillRange(int sectionIndex, AresSpreadsheetRange range, {bool down = true});
void applyRangeFormatting(int sectionIndex, AresSpreadsheetRange range, AresOfficeFormatChange style);
void applyFormatting(AresOfficeFormatChange change);
AresOfficeFormatChange formattingFor({required int sectionIndex, int? row, int? column});
int replaceAll(String query, String replacement, {bool matchCase = false, bool wholeWords = false, bool includePresentationNotes = false});
int replaceSpreadsheetCells(String query, String replacement, {bool matchCase = false, bool wildcards = false, int? sectionIndex});
void redactRange(int sectionIndex, int start, int end, {String replacement = '[REDACTED]'});
void undo();
void redo();
void refreshPackageMetadata(AresOfficeDocument refreshed);
void markSaved(AresOfficeDocument savedDocument);
void markSnapshotSaved(AresOfficeDocument savedDocument, AresOfficeDocument savedSnapshot);
void reset();
```

Saved-session history extensions (inherited by the domain alias):

```dart
final AresDomainSdk sdk;
bool get canUndoSaved;
bool get canRedoSaved;
Future<bool> undoSaved();
Future<bool> redoSaved();
void dispose();
void markSaved(AresOfficeDocument savedDocument);
void refreshPackageMetadata(AresOfficeDocument refreshed);
void markSnapshotSaved(AresOfficeDocument savedDocument, AresOfficeDocument savedSnapshot);
```
