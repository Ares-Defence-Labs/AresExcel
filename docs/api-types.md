# Exported type and member reference

Exported named classes, enums, typedefs and named extensions; declaration/member signatures only; conditional export union; inherited members listed on their declaring type; internal-annotated members omitted. Top-level functions, variables and unnamed extensions are outside this inventory. Not a frozen protected-customer API.

This is generated from the current canonical full import, not a hand-written claim that every helper is a stable customer API. Declaration origins identify libraries; they do not expose private paths or method bodies. Conditional storage implementations are listed as a union. Inherited declarations are listed on the declaring type. Domain aliases inherit session methods even when the session class is not exported by name. The final narrowed customer API remains a release gate.

Use [SDK constructors and operations](api-reference.md), [managed lifecycle](low-level-api.md) and [domain recipes](workbooks-cells-formulas.md) alongside this reference.

**171 named exported declarations.** Machine-readable: [API inventory](api-inventory.json).

## AresDataValidation

`package:ares_office_core/src/office_data_validation.dart`

```dart
class AresDataValidation
const AresDataValidation({required this.type, this.operator = 'between', this.first = '', this.second = '', this.allowBlank = true, this.message = 'This value does not meet the cell validation rule.'});
final String type, operator, first, second, message;
final bool allowBlank;
void validate();
bool accepts(String value);
static (String, String?) Function(int, int, String) inputConverter(String? source, {bool date1904 = false});
static List<String> choices(String? source, int row, int column);
static void checkChanges(String source, List<List<String>> before, List<List<String>> after, {String? Function(int row, int column)? calculatedValue, String? Function(String formula)? evaluateFormula});
static String set(String source, AresSpreadsheetRange range, AresDataValidation? validation);
static void insertMetadata(XmlElement root, XmlElement node);
```

## AresExcelDates

`package:ares_office_core/src/office_excel_dates.dart`

```dart
class AresExcelDates
const AresExcelDates({this.date1904 = false});
final bool date1904;
int get maximum;
int parseDate(String value);
static double parseTime(String value);
int serial(DateTime value);
void check(num value);
(int, int, int) parts(num value);
int date(int year, int month, int day);
int shiftMonth(num value, int months, {bool endOfMonth = false});
int weekday(num value, int type);
String? format(num value, String code);
```

## AresExcelDefinedName

`package:ares_office_core/src/office_defined_names.dart`

```dart
class AresExcelDefinedName
const AresExcelDefinedName({required this.name, required this.formula, this.localSheetId, this.hidden = false, this.comment});
final String name;
final String formula;
final int? localSheetId;
final bool hidden;
final String? comment;
bool get builtIn;
```

## AresExcelDefinedNames

`package:ares_office_core/src/office_defined_names.dart`

```dart
class AresExcelDefinedNames
static List<AresExcelDefinedName> read(XmlDocument xml);
static String? nameError(String name);
static void remapScopes(XmlDocument xml, Map<int, int> mapping, {int? duplicateSheet, int? duplicateScope, Map<String, String> duplicateRenames = const {}});
static void set(XmlDocument xml, AresExcelDefinedName value, {bool replace = false});
static void remove(XmlDocument xml, String name, {int? localSheetId});
```

## AresExcelDocument

`package:ares_excel/src/ares_excel_sdk.dart`

```dart
typedef AresExcelDocument = AresOfficeDocument;
```

## AresExcelEditSession

`package:ares_excel/src/ares_excel_sdk.dart`

```dart
typedef AresExcelEditSession = AresDomainEditSession;
```

## AresExcelEditor

`package:ares_excel/src/ares_excel_sdk.dart`

```dart
class AresExcelEditor extends StatelessWidget
const AresExcelEditor({super.key, required this.sdk, required this.documentPath, this.controller, this.viewerConfig = const AresOfficeViewerConfig(), this.appBarConfig = const AresOfficeViewerAppBarConfig(), this.toolsSheetConfig = const AresOfficeToolsSheetConfig(), this.theme, this.darkTheme, this.themeMode = ThemeMode.system, this.autoSaveEnabled = true, this.onDocumentReady, this.onDocumentModified, this.onDocumentSaved, this.onError, this.onRequestSaveAsPath, this.onOpenHyperlink, this.onRequestSaveAsFormatPath, this.onRequestPdfExportPath, this.onExternalToolAction, this.onScanPage, this.showProBadge = false, this.onUpgrade, this.autoSaveIdleDelay = const Duration(milliseconds: 500), this.onAutoSaved, this.onDocumentImagesExtracted, this.onPdfExported, this.onDocumentCompressed, this.onTextExtracted, this.onRequestCompressedCopyPath, this.onRequestTextExportPath, this.onLoadCustomStamps, this.onScanWatermark, this.onEmbedVideos, this.onEmbedAudio});
final Future<void> Function(AresExcelHyperlink)? onOpenHyperlink;
final AresExcelSdk sdk;
final String documentPath;
final AresOfficeViewerController? controller;
final AresOfficeViewerConfig viewerConfig;
final AresOfficeViewerAppBarConfig appBarConfig;
final AresOfficeToolsSheetConfig toolsSheetConfig;
final ThemeData? theme;
final ThemeData? darkTheme;
final ThemeMode themeMode;
final bool autoSaveEnabled;
final ValueChanged<AresOfficeDocument>? onDocumentReady;
final VoidCallback? onDocumentModified;
final ValueChanged<AresOfficeSaveResult>? onDocumentSaved;
final ValueChanged<Object>? onError;
final Future<String?> Function(AresOfficeDocument)? onRequestSaveAsPath;
final AresOfficeSaveAsFormatPathRequest? onRequestSaveAsFormatPath;
final Future<String?> Function(AresOfficeDocument)? onRequestPdfExportPath;
final AresOfficeExternalToolHandler? onExternalToolAction;
final Future<AresOfficeScanResult?> Function(AresOfficeExternalToolAction)? onScanPage;
final bool showProBadge;
final VoidCallback? onUpgrade;
final Duration autoSaveIdleDelay;
final ValueChanged<AresOfficeSaveResult>? onAutoSaved;
final ValueChanged<AresOfficeImageExtractionResult>? onDocumentImagesExtracted;
final ValueChanged<AresOfficePdfExportResult>? onPdfExported;
final ValueChanged<AresOfficeCompressionResult>? onDocumentCompressed;
final ValueChanged<String>? onTextExtracted;
final Future<String?> Function(AresOfficeDocument)? onRequestCompressedCopyPath;
final Future<String?> Function(AresOfficeDocument)? onRequestTextExportPath;
final Future<List<AresStampModel>> Function()? onLoadCustomStamps;
final Future<AresStampModel?> Function()? onScanWatermark;
final Future<List<String>?> Function()? onEmbedVideos;
final Future<String?> Function()? onEmbedAudio;
Widget build(BuildContext context);
```

## AresExcelExtractor

`package:ares_office_core/src/scanner/ares_excel_scan.dart`

```dart
class AresExcelExtractor
static AresExcelWorkbook extract(List<AresOfficeRecognizedPage> pages, List<String> paths, AresExcelOutput output, {bool headers = true, bool numberFormats = true, bool perPage = false, bool tableDetection = true});
```

## AresExcelGrid

`package:ares_office_core/src/scanner/ares_excel_review.dart`

```dart
class AresExcelGrid extends StatelessWidget
const AresExcelGrid({super.key, required this.sheet, this.headers = true, this.limit = 100});
final AresExcelSheet sheet;
final bool headers;
final int limit;
Widget build(BuildContext context);
```

## AresExcelHyperlink

`package:ares_office_core/src/office_excel_hyperlinks.dart`

```dart
class AresExcelHyperlink
const AresExcelHyperlink({required this.sheetIndex, required this.reference, this.target, this.location, this.display, this.tooltip, this.restriction, this.formulaBased = false});
final int sheetIndex;
final String reference;
final String? target, location, display, tooltip, restriction;
final bool formulaBased;
AresSpreadsheetRange get range;
bool get canEdit;
```

## AresExcelHyperlinkOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresExcelHyperlinkOperationResult extends AresOfficePageOperationResult
const AresExcelHyperlinkOperationResult({required super.document, required super.activeIndex, required this.reference, required this.snapshot});
final String reference;
final AresExcelHyperlinksSnapshot snapshot;
```

## AresExcelHyperlinks

`package:ares_office_core/src/office_excel_hyperlinks.dart`

```dart
class AresExcelHyperlinks
static List<AresExcelHyperlink> formulaLinks(AresOfficeDocument document, int sheetIndex);
static AresExcelHyperlinksSnapshot inspect(Archive archive, int sheetIndex);
static void set(Archive archive, int sheetIndex, String reference, {String? target, String? location, String? display, String? tooltip, bool replace = false});
static void remove(Archive archive, int sheetIndex, String reference);
```

## AresExcelHyperlinksSnapshot

`package:ares_office_core/src/office_excel_hyperlinks.dart`

```dart
class AresExcelHyperlinksSnapshot
const AresExcelHyperlinksSnapshot({required this.sheetIndex, required this.sheetName, required this.hyperlinks, this.restriction, this.sourceFingerprint, this.formulaHyperlinks = const []});
final int sheetIndex;
final String sheetName;
final List<AresExcelHyperlink> hyperlinks;
final List<AresExcelHyperlink> formulaHyperlinks;
final String? restriction, sourceFingerprint;
bool get canCreate;
AresExcelHyperlinksSnapshot withSourceFingerprint(String? value);
AresExcelHyperlinksSnapshot withFormulaLinks(AresOfficeDocument document);
```

## AresExcelLinkDestination

`package:ares_office_core/src/office_excel_link_navigation.dart`

```dart
class AresExcelLinkDestination
const AresExcelLinkDestination({required this.sheetIndex, required this.range});
final int sheetIndex;
final AresSpreadsheetRange range;
```

## AresExcelLinkNavigation

`package:ares_office_core/src/office_excel_link_navigation.dart`

```dart
class AresExcelLinkNavigation
static AresExcelLinkDestination resolve(AresOfficeDocument document, String location, {required int currentSheetIndex});
```

## AresExcelNote

`package:ares_office_core/src/office_excel_notes.dart`

```dart
class AresExcelNote
const AresExcelNote({required this.sheetIndex, required this.address, required this.author, required this.text, required this.plainText, this.restriction, this.visible, this.placement});
final int sheetIndex;
final String address, author, text;
final bool plainText;
final bool? visible;
final AresExcelNotePlacement? placement;
bool get canSetPlacement;
bool get canSetVisibility;
final String? restriction;
AresSpreadsheetRange get cell;
bool get canReplaceText;
bool get canDelete;
```

## AresExcelNoteOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresExcelNoteOperationResult extends AresOfficePageOperationResult
const AresExcelNoteOperationResult({required super.document, required super.activeIndex, required this.address, required this.snapshot});
final String address;
final AresExcelNotesSnapshot snapshot;
```

## AresExcelNotePlacement

`package:ares_office_core/src/office_excel_notes.dart`

```dart
enum AresExcelNotePlacement { moveAndSize, moveOnly, fixed }
```

## AresExcelNotes

`package:ares_office_core/src/office_excel_notes.dart`

```dart
class AresExcelNotes
static const dynamic spreadsheetNamespace;
static const dynamic strictNamespace;
static const dynamic relationshipBase;
static const dynamic strictRelationshipBase;
static const dynamic packageNamespace;
static const dynamic contentTypesNamespace;
static const dynamic commentsContentType;
static const dynamic vmlContentType;
static const dynamic vmlNamespace;
static const dynamic excelVmlNamespace;
static void add(Archive archive, int sheetIndex, String address, {required String author, required String text});
static void setPlacement(Archive archive, int sheetIndex, String address, AresExcelNotePlacement placement);
static void setVisibility(Archive archive, int sheetIndex, String address, bool visible);
static void replaceText(Archive archive, int sheetIndex, String address, String text);
static void remove(Archive archive, int sheetIndex, String address);
static void cloneWorksheetDependencies(Archive archive, int sourceIndex, String sourcePath, String destinationPath);
static AresExcelNotesSnapshot inspect(Archive archive, int sheetIndex);
```

## AresExcelNotesSnapshot

`package:ares_office_core/src/office_excel_notes.dart`

```dart
class AresExcelNotesSnapshot
const AresExcelNotesSnapshot({required this.sheetIndex, required this.sheetName, required this.notes, this.restriction, this.sourceFingerprint});
final int sheetIndex;
final String sheetName;
final List<AresExcelNote> notes;
final String? restriction, sourceFingerprint;
bool get canCreate;
AresExcelNotesSnapshot withSourceFingerprint(String? value);
```

## AresExcelOutput

`package:ares_office_core/src/scanner/ares_excel_scan.dart`

```dart
enum AresExcelOutput { cleanTable, exactTable, rawGrid, receiptSummary, receiptItems, receiptBatch, invoiceSummary, invoiceItems, invoiceBatch, inventoryQuantity, inventoryTable, inventoryBatch }
```

## AresExcelOutputDetails

`package:ares_office_core/src/scanner/ares_excel_scan.dart`

```dart
extension AresExcelOutputDetails on AresExcelOutput
String get label;
String get description;
String get category;
bool get isBatch;
List<AresExcelOutput> get choices;
bool get isSummary;
```

## AresExcelPicture

`package:ares_office_core/src/office_excel_pictures.dart`

```dart
class AresExcelPicture
const AresExcelPicture({required this.id, required this.name, required this.row, required this.column, required this.offsetX, required this.offsetY, required this.width, required this.height, required this.bytes});
final int id, row, column;
final String name;
final double offsetX, offsetY, width, height;
final Uint8List bytes;
```

## AresExcelPicturesSnapshot

`package:ares_office_core/src/office_excel_pictures.dart`

```dart
class AresExcelPicturesSnapshot
const AresExcelPicturesSnapshot({required this.pictures, this.unsupportedPictures = 0, this.restriction, this.sourceFingerprint});
final List<AresExcelPicture> pictures;
final int unsupportedPictures;
final String? restriction, sourceFingerprint;
bool get canEdit;
```

## AresExcelReviewResult

`package:ares_office_core/src/scanner/ares_excel_review.dart`

```dart
class AresExcelReviewResult
const AresExcelReviewResult(this.workbook, this.pages, this.paths);
final AresExcelWorkbook workbook;
final List<AresOfficeRecognizedPage> pages;
final List<String> paths;
```

## AresExcelReviewScreen

`package:ares_office_core/src/scanner/ares_excel_review.dart`

```dart
class AresExcelReviewScreen extends StatefulWidget
const AresExcelReviewScreen({super.key, required this.output, required this.prepare, required this.adjustCrop, this.headers = true, this.numberFormats = true, this.perPage = false, this.tableDetection = true});
final AresExcelOutput output;
final Future<(List<AresOfficeRecognizedPage>, List<String>)> Function() prepare;
final Future<(List<AresOfficeRecognizedPage>, List<String>)?> Function() adjustCrop;
final bool headers, numberFormats, perPage, tableDetection;
State<AresExcelReviewScreen> createState();
```

## AresExcelScanner

`package:ares_excel/src/ares_excel_sdk.dart`

```dart
class AresExcelScanner extends StatelessWidget
const AresExcelScanner({super.key, required this.sdk, this.edgeSdkLicenceKey, this.isPro = false, this.scanMode = EdgeDetectionScannerMode.Balanced, this.templates, this.initialTemplateId, this.initialProcessingMode, this.initialScanOptions = const {}, this.onCustomiseTemplates, this.onTemplateSelected, this.onPickFromGallery, this.onUpgrade});
final AresExcelSdk sdk;
final String? edgeSdkLicenceKey;
final bool isPro;
final EdgeDetectionScannerMode scanMode;
final List<AresOfficeScanTemplate>? templates;
final String? initialTemplateId;
final AresOfficeScanProcessingMode? initialProcessingMode;
final Map<String, String> initialScanOptions;
final AresOfficeTemplateManagerLauncher? onCustomiseTemplates;
final AresOfficeTemplateSelectionChanged? onTemplateSelected;
final AresOfficeGalleryPicker? onPickFromGallery;
final Future<void> Function()? onUpgrade;
Widget build(BuildContext context);
```

## AresExcelSdk

`package:ares_excel/src/ares_excel_sdk.dart`

```dart
class AresExcelSdk extends AresDomainSdk
AresExcelSdk({required super.licenceKey, super.verifyLicence});
Future<AresExcelPicturesSnapshot> inspectPictures(String path, {required int sheetIndex});
Future<(AresOfficeSaveResult, int)> insertImage(String path, {required Uint8List bytes, required String fileName, required int sheetIndex, required int row, required int column, double width = 320, double? height, double offsetX = 0, double offsetY = 0, String? expectedSourceFingerprint});
Future<AresOfficeSaveResult> setPictureBounds(String path, {required int sheetIndex, required int pictureId, required int row, required int column, required double width, required double height, double offsetX = 0, double offsetY = 0, String? expectedSourceFingerprint});
Future<AresOfficeSaveResult> deletePicture(String path, {required int sheetIndex, required int pictureId, String? expectedSourceFingerprint});
Future<AresExcelNotesSnapshot> inspectNotes(String path, {required int sheetIndex});
Future<AresExcelNoteOperationResult> addNote(String path, {required int sheetIndex, required String address, required String author, required String text, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> replaceNoteText(String path, {required int sheetIndex, required String address, required String text, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> setNotePlacement(String path, {required int sheetIndex, required String address, required AresExcelNotePlacement placement, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> setNoteVisibility(String path, {required int sheetIndex, required String address, required bool visible, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> removeNote(String path, {required int sheetIndex, required String address, String? expectedSourceFingerprint});
Future<AresExcelHyperlinksSnapshot> inspectHyperlinks(String path, {required int sheetIndex});
Future<AresExcelHyperlinkOperationResult> setHyperlink(String path, {required int sheetIndex, required String reference, String? target, String? location, String? display, String? tooltip, bool replace = false, String? expectedSourceFingerprint});
Future<AresExcelHyperlinkOperationResult> removeHyperlink(String path, {required int sheetIndex, required String reference, String? expectedSourceFingerprint});
Future<List<AresExcelDefinedName>> definedNames(String path);
Future<AresOfficePageOperationResult> setDefinedName(String path, AresExcelDefinedName value, {bool replace = false, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> removeDefinedName(String path, String name, {int? localSheetId, String? expectedSourceFingerprint});
Future<AresOfficeScanGenerationResult?> scanToFile({required BuildContext context, required String outputPath, String? edgeSdkLicenceKey, bool isPro = false, AresExcelScanner? scanner, AresOfficePageRecognizer? recognizePages});
Future<AresOfficeDocument> writeWorkbook({required String outputPath, required AresExcelWorkbook workbook, AresOfficeScanTemplate? template});
```

## AresExcelSheet

`package:ares_office_core/src/scanner/ares_excel_scan.dart`

```dart
class AresExcelSheet
const AresExcelSheet({required this.name, required this.rows, this.sourcePaths = const [], this.columnWidths = const []});
final String name;
final List<List<String>> rows;
final List<String> sourcePaths;
final List<double> columnWidths;
AresExcelSheet selectColumns(Set<int> columns);
```

## AresExcelWorkbook

`package:ares_office_core/src/scanner/ares_excel_scan.dart`

```dart
class AresExcelWorkbook
const AresExcelWorkbook({required this.output, required this.sheets, this.headers = true, this.numberFormats = true});
final AresExcelOutput output;
final List<AresExcelSheet> sheets;
final bool headers;
final bool numberFormats;
bool get hasContent;
```

## AresFormulaResult

`package:ares_office_core/src/office_formula_engine.dart`

```dart
class AresFormulaResult
const AresFormulaResult(this.value, {this.error, this.supported = true, this.fromReference = false, this.hyperlinkTarget});
final Object? value;
final String? error;
final bool supported;
final bool fromReference;
final String? hyperlinkTarget;
String get displayText;
```

## AresOfficeAnnotation

`package:ares_office_core/src/office_annotations.dart`

```dart
class AresOfficeAnnotation
const AresOfficeAnnotation({required this.id, required this.type, required this.sectionIndex, required this.created, this.text, this.author, this.start, this.end, this.colorValue, this.modified, this.data = const <String, Object?>{}});
final String id;
final AresOfficeAnnotationType type;
final int sectionIndex;
final DateTime created;
final String? text;
final String? author;
final int? start;
final int? end;
final int? colorValue;
final DateTime? modified;
final Map<String, Object?> data;
Map<String, Object?> toJson();
factory AresOfficeAnnotation.fromJson(Map<String, Object?> json);
```

## AresOfficeAnnotationStore

`package:ares_office_core/src/office_annotations.dart`

```dart
class AresOfficeAnnotationStore
const AresOfficeAnnotationStore();
Future<List<AresOfficeAnnotation>> load(String documentPath);
Future<void> save(String documentPath, Iterable<AresOfficeAnnotation> annotations);
Future<AresOfficeAnnotation> embedMedia(String documentPath, {required Uint8List bytes, required String fileName, required int sectionIndex, Rect? initialRect, Map<String, Object?> metadata = const <String, Object?>{}});
Future<List<PdfBoundMedia>> loadMedia(String documentPath);
static Rect mediaRect(AresOfficeAnnotation annotation);
Future<void> confirmMediaPlacement(String documentPath, String id, Rect rect);
Future<void> discardPendingMedia(String documentPath, String id);
```

## AresOfficeAnnotationType

`package:ares_office_core/src/office_annotations.dart`

```dart
enum AresOfficeAnnotationType { comment, highlight, underline, strikeout, link, stamp, drawing, redaction, attachment }
```

## AresOfficeCellBorders

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeCellBorders { none, all, bottom }
```

## AresOfficeChartInsertion

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeChartInsertion
const AresOfficeChartInsertion({required this.id, required this.sectionIndex, required this.range, required this.title, this.line = false, required this.fromRow, required this.fromColumn});
final String id;
final int sectionIndex;
final String range;
final String title;
final bool line;
final int fromRow;
final int fromColumn;
```

## AresOfficeCompressionResult

`package:ares_office_core/src/office_service_utilities.dart`

```dart
class AresOfficeCompressionResult
const AresOfficeCompressionResult({required this.path, required this.originalBytes, required this.compressedBytes});
final String path;
final int originalBytes;
final int compressedBytes;
double get ratio;
```

## AresOfficeDisplayMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficeDisplayMode { singleSection, continuous, twoPage, horizontal, grid }
```

## AresOfficeDocument

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocument
const AresOfficeDocument({required this.path, required this.type, required this.sections, this.metadata = const AresOfficeDocumentMetadata(), this.formatChanges = const <AresOfficeFormatChange>[], this.sourceFingerprint, this.nativeEditingRestricted = false, this.slideWidthEmu, this.slideHeightEmu, this.date1904 = false, this.definedNames = const <AresExcelDefinedName>[], this.customShows = const <AresPresentationCustomShow>[], this.showSettings = const AresPresentationShowSettings(), this.slideSections = const <AresPresentationSlideSection>[], this.presentationPartChanges = const <AresPresentationPartChange>[], this.presentationThemeChanges = const <AresPresentationThemeChange>[], this.slideChartChanges = const <AresSlideChartChange>[], this.chartInsertions = const <AresOfficeChartInsertion>[], this.wordHeaderFooterChanges = const <AresWordHeaderFooterChange>[]});
final int? slideWidthEmu, slideHeightEmu;
final String path;
final AresOfficeDocumentType type;
final List<AresOfficeDocumentSection> sections;
final AresOfficeDocumentMetadata metadata;
final List<AresOfficeFormatChange> formatChanges;
final String? sourceFingerprint;
final bool nativeEditingRestricted;
final bool date1904;
final List<AresExcelDefinedName> definedNames;
final List<AresPresentationCustomShow> customShows;
final AresPresentationShowSettings showSettings;
final List<AresPresentationSlideSection> slideSections;
final List<AresPresentationPartChange> presentationPartChanges;
final List<AresPresentationThemeChange> presentationThemeChanges;
final List<AresSlideChartChange> slideChartChanges;
final List<AresOfficeChartInsertion> chartInsertions;
final List<AresWordHeaderFooterChange> wordHeaderFooterChanges;
String get text;
AresOfficeDocument copyWith({String? path, AresOfficeDocumentType? type, List<AresOfficeDocumentSection>? sections, AresOfficeDocumentMetadata? metadata, List<AresOfficeFormatChange>? formatChanges, String? sourceFingerprint, bool? nativeEditingRestricted, int? slideWidthEmu, int? slideHeightEmu, bool? date1904, List<AresExcelDefinedName>? definedNames, List<AresPresentationCustomShow>? customShows, AresPresentationShowSettings? showSettings, List<AresPresentationSlideSection>? slideSections, List<AresPresentationPartChange>? presentationPartChanges, List<AresPresentationThemeChange>? presentationThemeChanges, List<AresSlideChartChange>? slideChartChanges, List<AresOfficeChartInsertion>? chartInsertions, List<AresWordHeaderFooterChange>? wordHeaderFooterChanges});
```

## AresOfficeDocumentException

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocumentException
const AresOfficeDocumentException(this.message, {this.cause});
final String message;
final Object? cause;
String toString();
```

## AresOfficeDocumentMetadata

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocumentMetadata
const AresOfficeDocumentMetadata({this.title, this.subject, this.creator, this.lastModifiedBy, this.description, this.keywords, this.category, this.application, this.company, this.created, this.modified, this.pageCount, this.wordCount, this.slideCount});
final String? title;
final String? subject;
final String? creator;
final String? lastModifiedBy;
final String? description;
final String? keywords;
final String? category;
final String? application;
final String? company;
final DateTime? created;
final DateTime? modified;
final int? pageCount;
final int? wordCount;
final int? slideCount;
bool get isEmpty;
```

## AresOfficeDocumentSection

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocumentSection
const AresOfficeDocumentSection({required this.index, required this.title, required this.text, this.sourceSectionIndex, this.sourceXml, this.speakerNotes, this.slideLayoutPath, this.slideAudioRelationships = const <String, String>{}, this.isTable = false, this.rowCount, this.columnCount, this.cellValues, this.cellTypes = const <String, String>{}});
final int? sourceSectionIndex;
final String? sourceXml;
final String? speakerNotes;
final String? slideLayoutPath;
final Map<String, String> slideAudioRelationships;
final bool isTable;
final int index;
final String title;
final String text;
final int? rowCount;
final int? columnCount;
final List<List<String>>? cellValues;
final Map<String, String> cellTypes;
List<List<String>> get cells;
AresOfficeDocumentSection copyWith({int? index, int? sourceSectionIndex, String? sourceXml, String? speakerNotes, String? slideLayoutPath, Map<String, String>? slideAudioRelationships, bool? isTable, String? title, String? text, int? rowCount, int? columnCount, List<List<String>>? cellValues, Map<String, String>? cellTypes});
```

## AresOfficeDocumentType

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeDocumentType { word, spreadsheet, presentation, csv, text, markdown, unknown }
```

## AresOfficeEditorMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficeEditorMode { view, page, navigation, ink, draw, edit, text, annotate, fillAndSign, prepareForm, insert, measure, redact, ai, favorites }
```

## AresOfficeEmbeddedImageExtractor

`package:ares_office_core/src/office_embedded_image_extractor.dart`

```dart
class AresOfficeEmbeddedImageExtractor
const AresOfficeEmbeddedImageExtractor({this.maximumCompressedBytes = 128 * 1024 * 1024, this.maximumExpandedBytes = 256 * 1024 * 1024, this.maximumImageBytes = 64 * 1024 * 1024, this.maximumArchiveEntries = 10000});
final int maximumCompressedBytes;
final int maximumExpandedBytes;
final int maximumImageBytes;
final int maximumArchiveEntries;
Future<AresOfficeImageExtractionResult> extract(String documentPath, {String? outputDirectory});
```

## AresOfficeEncryptedDocumentException

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeEncryptedDocumentException extends AresOfficeDocumentException
const AresOfficeEncryptedDocumentException();
```

## AresOfficeExternalToolAction

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeExternalToolAction
const AresOfficeExternalToolAction({required this.mode, required this.label, required this.documentPath, required this.documentType, required this.sectionIndex, this.selectedText, this.selectedSectionIndexes = const <int>[], this.insertImagePath, this.insertImageBytes, this.insertText});
final String mode;
final String label;
final String documentPath;
final AresOfficeDocumentType documentType;
final int sectionIndex;
final String? selectedText;
final List<int> selectedSectionIndexes;
final Future<void> Function(String path)? insertImagePath;
final Future<void> Function(Uint8List bytes)? insertImageBytes;
final Future<void> Function(String text)? insertText;
```

## AresOfficeExternalToolHandler

`package:ares_office_core/src/office_document.dart`

```dart
typedef AresOfficeExternalToolHandler = FutureOr<void> Function(AresOfficeExternalToolAction action);
```

## AresOfficeFormatChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeFormatChange
const AresOfficeFormatChange({required this.sectionIndex, this.row, this.column, this.fontFamily, this.fontSize, this.bold, this.italic, this.underline, this.underlineStyle, this.strikethrough, this.textPosition, this.fontColorArgb, this.fillColorArgb, this.alignment, this.wrapText, this.numberFormatCode, this.paragraphStyle, this.listKind, this.spaceBeforePoints, this.spaceAfterPoints, this.lineSpacing, this.leftIndentPoints, this.rightIndentPoints, this.firstLineIndentPoints, this.keepWithNext, this.keepLinesTogether, this.widowOrphanControl, this.pageBreakBefore, this.suppressAutoHyphens, this.contextualSpacing, this.rightToLeft, this.tabStops, this.pageWidthPoints, this.pageHeightPoints, this.pageMarginTopPoints, this.pageMarginRightPoints, this.pageMarginBottomPoints, this.pageMarginLeftPoints, this.pageColumnCount, this.pageColumnSpacingPoints, this.verticalAlignment, this.cellBorders});
final int sectionIndex;
final int? row;
final int? column;
final String? fontFamily;
final double? fontSize;
final bool? bold;
final bool? italic;
final bool? underline;
final String? underlineStyle;
final bool? strikethrough;
final AresOfficeTextPosition? textPosition;
final int? fontColorArgb;
final int? fillColorArgb;
final AresOfficeHorizontalAlignment? alignment;
final bool? wrapText;
final String? numberFormatCode;
final String? paragraphStyle;
final String? listKind;
final double? spaceBeforePoints;
final double? spaceAfterPoints;
final double? lineSpacing;
final double? leftIndentPoints;
final double? rightIndentPoints;
final double? firstLineIndentPoints;
final bool? keepWithNext;
final bool? keepLinesTogether;
final bool? widowOrphanControl;
final bool? pageBreakBefore;
final bool? suppressAutoHyphens;
final bool? contextualSpacing;
final bool? rightToLeft;
final List<AresWordTabStop>? tabStops;
final double? pageWidthPoints;
final double? pageHeightPoints;
final double? pageMarginTopPoints;
final double? pageMarginRightPoints;
final double? pageMarginBottomPoints;
final double? pageMarginLeftPoints;
final int? pageColumnCount;
final double? pageColumnSpacingPoints;
final AresOfficeVerticalAlignment? verticalAlignment;
final AresOfficeCellBorders? cellBorders;
bool get targetsCell;
bool targets({required int sectionIndex, int? row, int? column});
AresOfficeFormatChange at({required int sectionIndex, int? row, int? column});
AresOfficeFormatChange merge(AresOfficeFormatChange other);
```

## AresOfficeFormulaEngine

`package:ares_office_core/src/office_formula_engine.dart`

```dart
class AresOfficeFormulaEngine
AresOfficeFormulaEngine(this.document, {DateTime? calculationTime});
final DateTime calculationTime;
final AresOfficeDocument document;
static const Set<String> supportedFunctions;
AresFormulaResult evaluateFormula(int sheet, String formula);
AresFormulaResult evaluateCell(int sheet, int row, int column);
AresFormulaResult definedName(int sheet, String name, [String? sheetName]);
AresFormulaResult reference(int sheet, String address, [String? sheetName]);
```

## AresOfficeGalleryCapture

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeGalleryCapture
const AresOfficeGalleryCapture({required this.bytes, required this.frame});
final Uint8List bytes;
final QuadFrame frame;
```

## AresOfficeGalleryPicker

`package:ares_office_core/src/scanner/ares_office_scanner.dart`

```dart
typedef AresOfficeGalleryPicker = FutureOr<AresOfficeGalleryCapture?> Function();
```

## AresOfficeHorizontalAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeHorizontalAlignment { left, center, right, justify }
```

## AresOfficeImageExtractionResult

`package:ares_office_core/src/office_embedded_image_extractor.dart`

```dart
class AresOfficeImageExtractionResult
AresOfficeImageExtractionResult({required this.images, required this.outputDirectory, required bool ownsOutputDirectory});
final List<ExtractedOfficeImage> images;
final String outputDirectory;
Future<void> discard();
```

## AresOfficeInteropExporter

`package:ares_office_core/src/office_interop_exporter.dart`

```dart
class AresOfficeInteropExporter
const AresOfficeInteropExporter();
Future<String> export(String sourcePath, {required String outputPath});
```

## AresOfficeLicence

`package:ares_office_core/src/sdk/ares_office_licence.dart`

```dart
class AresOfficeLicence
static Future<bool> verify(AresOfficeProduct product, String licenceKey);
```

## AresOfficeLicenceException

`package:ares_office_core/src/sdk/ares_domain_sdk.dart`

```dart
class AresOfficeLicenceException
const AresOfficeLicenceException(this.product);
final AresOfficeProduct product;
String toString();
```

## AresOfficeLicenceVerifier

`package:ares_office_core/src/sdk/ares_domain_sdk.dart`

```dart
typedef AresOfficeLicenceVerifier = FutureOr<bool> Function(AresOfficeProduct product, String licenceKey);
```

## AresOfficeModeAction

`package:ares_office_core/src/office_editor_modes.dart`

```dart
class AresOfficeModeAction
const AresOfficeModeAction({required this.icon, required this.label, this.destructive = false, this.isPro = false});
final IconData icon;
final String label;
final bool destructive;
final bool isPro;
```

## AresOfficeModeDescriptor

`package:ares_office_core/src/office_editor_modes.dart`

```dart
class AresOfficeModeDescriptor
const AresOfficeModeDescriptor({required this.mode, required this.label, required this.icon});
final AresOfficeEditorMode mode;
final String label;
final IconData icon;
```

## AresOfficePackageFormat

`package:ares_office_core/src/office_package_format.dart`

```dart
enum AresOfficePackageFormat { docx, docm, dotx, dotm, xlsx, xlsm, xltx, xltm, pptx, pptm, potx, potm, ppsx, ppsm }
const AresOfficePackageFormat(this.extension, this.documentType, this.label, this.contentType, {this.isTemplate = false, this.supportsMacros = false});
final String extension;
final AresOfficeDocumentType documentType;
final String label;
final String contentType;
final bool isTemplate;
final bool supportsMacros;
String get mainPart;
static AresOfficePackageFormat? forPath(String path);
static List<AresOfficePackageFormat> forDocumentType(AresOfficeDocumentType type);
```

## AresOfficePageFitMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficePageFitMode { fitPage, fitWidth, actualSize }
```

## AresOfficePageOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresOfficePageOperationResult
const AresOfficePageOperationResult({required this.document, required this.activeIndex});
final AresOfficeDocument document;
final int activeIndex;
```

## AresOfficePageOperations

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresOfficePageOperations
const AresOfficePageOperations({this.loader = const AresOfficeDocumentLoader()});
final AresOfficeDocumentLoader loader;
Future<AresPresentationCommentsSnapshot> presentationComments(String path);
Future<AresPresentationCommentOperationResult> addPresentationComment(String path, {required int slideIndex, required String text, required String author, String initials = '', int x = 0, int y = 0, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> addPresentationCommentCoordinates(String path, {required int slideIndex, required String text, required String author, String initials = '', String x = '0', String y = '0', DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> replacePresentationCommentText(String path, AresPresentationComment comment, String text, {DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> movePresentationComment(String path, AresPresentationComment comment, {required int x, required int y, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> movePresentationCommentCoordinates(String path, AresPresentationComment comment, {required String x, required String y, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removePresentationSlideComments(String path, {required int slideIndex, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removeAllPresentationComments(String path, {String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removePresentationComment(String path, AresPresentationComment comment, {String? expectedSourceFingerprint});
Future<AresWordCommentsSnapshot> wordComments(String path);
Future<AresWordCommentCreationResult> addWordComment(String path, {required int sectionIndex, required String text, required String author, String? initials, int? startOffset, int? endOffset, DateTime? date, String? expectedSourceFingerprint});
Future<AresWordCommentCreationResult> addWordCommentThread(String path, {required int sectionIndex, required String text, required String author, String? initials, int? startOffset, int? endOffset, DateTime? date, String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> migrateLegacyWordComments(String path, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> replaceWordCommentText(String path, String id, String text, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> replyToWordComment(String path, String parentId, {required String text, required String author, String? initials, DateTime? date, String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> replaceWordThreadCommentText(String path, String id, String text, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeWordCommentReply(String path, String commentId, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeWordCommentThread(String path, String rootCommentId, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> setWordCommentThreadResolved(String path, String rootCommentId, {required bool resolved, String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeAllLegacyWordComments(String path, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeWordComment(String path, String id, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reusePresentationSlides(String path, {required String sourcePath, required List<int> slideIndexes, required int afterIndex, AresSlideReuseFormatting formatting = AresSlideReuseFormatting.source, String? expectedSourceFingerprint, String? expectedImportFingerprint});
Future<AresOfficePageOperationResult> setExcelDefinedName(String path, AresExcelDefinedName value, {bool replace = false, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> removeExcelDefinedName(String path, String name, {int? localSheetId, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> addExcelNote(String path, {required int sheetIndex, required String address, required String author, required String text, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> replaceExcelNoteText(String path, {required int sheetIndex, required String address, required String text, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> setExcelNotePlacement(String path, {required int sheetIndex, required String address, required AresExcelNotePlacement placement, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> setExcelNoteVisibility(String path, {required int sheetIndex, required String address, required bool visible, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> removeExcelNote(String path, {required int sheetIndex, required String address, String? expectedSourceFingerprint});
Future<AresExcelHyperlinksSnapshot> excelHyperlinks(String path, int sheetIndex);
Future<AresExcelHyperlinkOperationResult> setExcelHyperlink(String path, {required int sheetIndex, required String reference, String? target, String? location, String? display, String? tooltip, bool replace = false, String? expectedSourceFingerprint});
Future<AresExcelHyperlinkOperationResult> removeExcelHyperlink(String path, {required int sheetIndex, required String reference, String? expectedSourceFingerprint});
Future<AresExcelNotesSnapshot> excelNotes(String path, int sheetIndex);
Future<List<AresWordRevision>> wordRevisions(String path);
Future<AresOfficePageOperationResult> reviewWordRevisions(String path, List<AresWordRevision> revisions, AresWordRevisionDecision decision, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reviewWordRevision(String path, AresWordRevision revision, AresWordRevisionDecision decision, {String? expectedSourceFingerprint});
Future<List<AresWordBookmark>> wordBookmarks(String documentPath);
Future<AresOfficePageOperationResult> addWordBookmark(String documentPath, {required int sectionIndex, required String name, int? startOffset, int? endOffset, int? endSectionIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> redefineWordBookmark(String documentPath, {required String name, required int sectionIndex, int? startOffset, int? endOffset, int? endSectionIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> renameWordBookmark(String documentPath, {required String name, required String newName, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> removeWordBookmark(String documentPath, String name, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> addBlankPage(String documentPath, {required int afterIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> duplicatePage(String documentPath, {required int index, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> deletePage(String documentPath, {required int index, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> movePresentationSection(String path, {required String sectionId, required int toIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reorderPages(String documentPath, {required List<int> order, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> extractPage(String documentPath, {required int index, required String outputPath});
```

## AresOfficePageRecognizer

`package:ares_office_core/src/sdk/ares_scan_workflow.dart`

```dart
typedef AresOfficePageRecognizer = Future<List<AresOfficeRecognizedPage>> Function(List<String> imagePaths);
```

## AresOfficePdfExportOptions

`package:ares_office_core/src/office_pdf_exporter.dart`

```dart
class AresOfficePdfExportOptions
const AresOfficePdfExportOptions({this.pageFormat = PdfPageFormat.a4, this.margin = 32, this.maximumSpreadsheetColumns = 20, this.maximumSpreadsheetRows, this.maximumSections, this.maximumTextCharacters, this.useCurrentMediaPositions = false, this.font, this.boldFont, this.italicFont, this.boldItalicFont, this.fontFallback = const <pw.Font>[]});
final bool useCurrentMediaPositions;
final PdfPageFormat pageFormat;
final double margin;
final int maximumSpreadsheetColumns;
final int? maximumSpreadsheetRows;
final int? maximumSections;
final int? maximumTextCharacters;
final pw.Font? font;
final pw.Font? boldFont;
final pw.Font? italicFont, boldItalicFont;
final List<pw.Font> fontFallback;
```

## AresOfficePdfExportResult

`package:ares_office_core/src/office_pdf_exporter.dart`

```dart
class AresOfficePdfExportResult
const AresOfficePdfExportResult({required this.path, required this.bytesWritten, required this.pageCount});
final String path;
final int bytesWritten;
final int pageCount;
```

## AresOfficePdfExporter

`package:ares_office_core/src/office_pdf_exporter.dart`

```dart
class AresOfficePdfExporter
const AresOfficePdfExporter();
Future<AresOfficePdfExportResult> export(AresOfficeDocument document, {required String outputPath, AresOfficePdfExportOptions options = const AresOfficePdfExportOptions(), bool overwrite = false});
```

## AresOfficePlatform

`package:ares_office_core/src/sdk/ares_office_platforms.dart`

```dart
enum AresOfficePlatform { android, ios, macos, windows, linux, web }
```

## AresOfficePlatforms

`package:ares_office_core/src/sdk/ares_office_platforms.dart`

```dart
class AresOfficePlatforms
static const Set<AresOfficePlatform> editorTargets;
static const Set<AresOfficePlatform> documentApiTargets;
static const Set<AresOfficePlatform> scannerTargets;
static AresOfficePlatform get current;
static bool get canScan;
static void requireScanner();
```

## AresOfficeProduct

`package:ares_office_core/src/sdk/ares_office_product.dart`

```dart
enum AresOfficeProduct { word, excel, powerpoint }
```

## AresOfficeProductIdentity

`package:ares_office_core/src/sdk/ares_office_product.dart`

```dart
extension AresOfficeProductIdentity on AresOfficeProduct
String get sdkProduct;
```

## AresOfficeRawScanCapture

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeRawScanCapture
const AresOfficeRawScanCapture({required this.format, required this.template, required this.processingMode, required this.frames, this.wordDocumentOutput = AresWordDocumentOutput.editableDocument, this.wordSettings = const AresWordDocumentSettings(), this.notesSettings = const AresNotesSettings(), this.handwritingSettings = const AresHandwritingSettings(), this.formOutput = AresWordFormOutput.editableForm, this.excelOutput = AresExcelOutput.cleanTable, this.scanOptions = const {}, this.recognizedPages = const <AresOfficeRecognizedPage>[]});
final AresOfficeScannerFormat format;
final AresOfficeScanTemplate template;
final AresOfficeScanProcessingMode processingMode;
final List<QuadFrame> frames;
final AresWordDocumentOutput wordDocumentOutput;
final AresWordDocumentSettings wordSettings;
final AresNotesSettings notesSettings;
final AresHandwritingSettings handwritingSettings;
final AresWordFormOutput formOutput;
final AresExcelOutput excelOutput;
final Map<String, String> scanOptions;
final List<AresOfficeRecognizedPage> recognizedPages;
```

## AresOfficeReadingMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficeReadingMode { light, dark, sepia, grayscale, highContrast }
```

## AresOfficeRecognizedPage

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeRecognizedPage
const AresOfficeRecognizedPage({required this.text, this.rows = const <List<String>>[], this.imagePaths = const <String>[], this.elements = const <AresWordScanElement>[], this.sourceAspectRatio, this.slidePlan, this.handwriting});
final double? sourceAspectRatio;
final AresSlidePlan? slidePlan;
final AresHandwritingPage? handwriting;
final String text;
final List<List<String>> rows;
final List<String> imagePaths;
final List<AresWordScanElement> elements;
```

## AresOfficeSampleDocuments

`package:ares_office_core/src/office_sample_documents.dart`

```dart
class AresOfficeSampleDocuments
static const String wordAssetPath;
static const String excelAssetPath;
static const String powerpointAssetPath;
static Future<String> installWordSample({required String outputPath, AssetBundle? bundle, bool overwrite = false});
static Future<String> installExcelSample({required String outputPath, AssetBundle? bundle, bool overwrite = false});
static Future<String> installPowerPointSample({required String outputPath, AssetBundle? bundle, bool overwrite = false});
```

## AresOfficeSaveAsFormatPathRequest

`package:ares_office_core/src/office_package_format.dart`

```dart
typedef AresOfficeSaveAsFormatPathRequest = Future<String?> Function(AresOfficeDocument document, AresOfficePackageFormat format);
```

## AresOfficeSaveConflictException

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeSaveConflictException extends AresOfficeDocumentException
const AresOfficeSaveConflictException(super.message);
```

## AresOfficeSaveResult

`package:ares_office_core/src/office_document_writer.dart`

```dart
class AresOfficeSaveResult
const AresOfficeSaveResult({required this.path, required this.document, required this.bytesWritten, required this.sourceOverwritten});
final String path;
final AresOfficeDocument document;
final int bytesWritten;
final bool sourceOverwritten;
```

## AresOfficeScanGenerationResult

`package:ares_office_core/src/scanner/ares_office_scan_generator.dart`

```dart
class AresOfficeScanGenerationResult
const AresOfficeScanGenerationResult({required this.path, required this.document, required this.template});
final String path;
final AresOfficeDocument document;
final AresOfficeScanTemplate template;
```

## AresOfficeScanProcessingMode

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
enum AresOfficeScanProcessingMode { wordLayout, wordText, wordForms, wordHandwriting, spreadsheetSmart, spreadsheetTables, spreadsheetReceipts, spreadsheetForms, spreadsheetInvoices, spreadsheetInventory, presentationAutoArrange }
```

## AresOfficeScanResult

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeScanResult
const AresOfficeScanResult({required this.format, required this.template, required this.processingMode, required this.imagePaths, this.wordDocumentOutput = AresWordDocumentOutput.editableDocument, this.wordSettings = const AresWordDocumentSettings(), this.notesSettings = const AresNotesSettings(), this.handwritingSettings = const AresHandwritingSettings(), this.formOutput = AresWordFormOutput.editableForm, this.excelOutput = AresExcelOutput.cleanTable, this.notesActions = const [], this.excelWorkbook, this.recognizedPages = const <AresOfficeRecognizedPage>[]});
final AresOfficeScannerFormat format;
final AresOfficeScanTemplate template;
final AresOfficeScanProcessingMode processingMode;
final List<String> imagePaths;
final AresWordDocumentOutput wordDocumentOutput;
final AresWordDocumentSettings wordSettings;
final AresNotesSettings notesSettings;
final AresHandwritingSettings handwritingSettings;
final AresWordFormOutput formOutput;
final AresExcelOutput excelOutput;
final List<AresNotesAction> notesActions;
final AresExcelWorkbook? excelWorkbook;
final List<AresOfficeRecognizedPage> recognizedPages;
```

## AresOfficeScanTemplate

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeScanTemplate
const AresOfficeScanTemplate({required this.id, required this.name, required this.description, required this.format, this.sourcePath, this.isUserTemplate = false, this.designId, this.previewBuilder});
final bool isUserTemplate;
final String? designId;
final String id;
final String name;
final String description;
final AresOfficeScannerFormat format;
final String? sourcePath;
final WidgetBuilder? previewBuilder;
bool get isCustom;
```

## AresOfficeScannerFormat

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
enum AresOfficeScannerFormat { word, spreadsheet, presentation }
```

## AresOfficeSearchResult

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeSearchResult
const AresOfficeSearchResult({required this.sectionIndex, required this.start, required this.length, required this.preview});
final int sectionIndex;
final int start;
final int length;
final String preview;
```

## AresOfficeSecurityInspector

`package:ares_office_core/src/office_security_inspector.dart`

```dart
class AresOfficeSecurityInspector
const AresOfficeSecurityInspector({this.maximumCompressedBytes = 128 * 1024 * 1024, this.maximumExpandedBytes = 256 * 1024 * 1024, this.maximumArchiveEntries = 10000});
final int maximumCompressedBytes;
final int maximumExpandedBytes;
final int maximumArchiveEntries;
Future<AresOfficeSecurityReport> inspect(String documentPath);
```

## AresOfficeSecurityReport

`package:ares_office_core/src/office_security_inspector.dart`

```dart
class AresOfficeSecurityReport
const AresOfficeSecurityReport({required this.isOpenXml, required this.isEncrypted, required this.hasDigitalSignatures, required this.hasMacros, required this.externalRelationshipCount, required this.embeddedObjectCount, required this.signaturePartCount});
final bool isOpenXml;
final bool isEncrypted;
final bool hasDigitalSignatures;
final bool hasMacros;
final int externalRelationshipCount;
final int embeddedObjectCount;
final int signaturePartCount;
```

## AresOfficeServiceUtilities

`package:ares_office_core/src/office_service_utilities.dart`

```dart
class AresOfficeServiceUtilities
const AresOfficeServiceUtilities({this.loader = const AresOfficeDocumentLoader()});
final AresOfficeDocumentLoader loader;
Future<AresOfficeCompressionResult> compress(String documentPath, {required String outputPath, int level = 9, bool overwrite = false});
Future<String> extractText(AresOfficeDocument document, {required String outputPath, bool overwrite = false});
```

## AresOfficeStorage

`package:ares_office_core/src/storage/ares_office_storage.dart`

```dart
class AresOfficeStorage
static Future<String> importBytes({required String name, required List<int> bytes, String? path, bool overwrite = false});
static Future<String> open(String path);
static Future<Uint8List> readBytes(String path);
static Future<List<String>> list({String? directoryPath});
static Future<void> remove(String path);
```

## AresOfficeStorageConflict

`package:ares_office_core/src/storage/office_storage_error.dart`

```dart
class AresOfficeStorageConflict extends AresOfficeStorageException
const AresOfficeStorageConflict();
```

## AresOfficeStorageException

`package:ares_office_core/src/storage/office_storage_error.dart`

```dart
class AresOfficeStorageException
const AresOfficeStorageException(this.message);
final String message;
String toString();
```

## AresOfficeTemplateManagerLauncher

`package:ares_office_core/src/scanner/ares_office_scanner.dart`

```dart
typedef AresOfficeTemplateManagerLauncher = FutureOr<List<AresOfficeScanTemplate>?> Function(BuildContext context, AresOfficeScannerFormat format);
```

## AresOfficeTemplateSelectionChanged

`package:ares_office_core/src/scanner/ares_office_scanner.dart`

```dart
typedef AresOfficeTemplateSelectionChanged = FutureOr<void> Function(AresOfficeScanTemplate template);
```

## AresOfficeTextPosition

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeTextPosition { normal, superscript, subscript }
```

## AresOfficeToolConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeToolConfig
const AresOfficeToolConfig({required this.label, required this.icon, this.isPro = false});
final String label;
final IconData icon;
final bool isPro;
```

## AresOfficeToolsSheetConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeToolsSheetConfig
const AresOfficeToolsSheetConfig({this.header = 'Extra Document Tools', this.showSaveCopy = true, this.showShare = true, this.showPrint = true, this.showExportPdf = true, this.showReadAloud = true, this.showDocumentInfo = true, this.showExtractImages = true, this.showAnnotations = true, this.showCompress = true, this.showExtractText = true, this.showSecurityInfo = true, this.customTools = const <AresOfficeToolConfig>[]});
final String header;
final bool showSaveCopy;
final bool showShare;
final bool showPrint;
final bool showExportPdf;
final bool showReadAloud;
final bool showDocumentInfo;
final bool showExtractImages;
final bool showAnnotations;
final bool showCompress;
final bool showExtractText;
final bool showSecurityInfo;
final List<AresOfficeToolConfig> customTools;
```

## AresOfficeVerticalAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeVerticalAlignment { top, center, bottom }
```

## AresOfficeViewerAppBarConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeViewerAppBarConfig
const AresOfficeViewerAppBarConfig({this.title, this.showBackButton = true, this.showSearch = true, this.showTools = true});
final String? title;
final bool showBackButton;
final bool showSearch;
final bool showTools;
```

## AresOfficeViewerConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeViewerConfig
const AresOfficeViewerConfig({this.initialSectionIndex = 0, this.initialZoom = 1, this.minimumZoom = 0.75, this.maximumZoom = 4, this.showBottomNavigation = true, this.allowEditing = true, this.allowCopy = true, this.authorizeAction, this.commentAuthorName = '', this.photoTextRecognizer, this.supportedExternalTools = const <String>{}, this.padding = const EdgeInsets.only(bottom: 24)});
final int initialSectionIndex;
final double initialZoom;
final double minimumZoom;
final double maximumZoom;
final bool showBottomNavigation;
final bool allowEditing;
final bool allowCopy;
final String commentAuthorName;
final Future<bool> Function(String action)? authorizeAction;
final Future<List<AresWordScanElement>> Function(String path)? photoTextRecognizer;
final Set<String> supportedExternalTools;
final EdgeInsets padding;
```

## AresOfficeViewerController

`package:ares_office_core/src/office_viewer_controller.dart`

```dart
class AresOfficeViewerController extends ChangeNotifier
AresOfficeDocument? get document;
bool get isReady;
int get sectionIndex;
double get zoom;
String get searchQuery;
List<AresOfficeSearchResult> get searchResults;
int get activeSearchResult;
int get reloadGeneration;
Set<int> get bookmarkedSections;
int get sectionCount;
void goToSection(int index);
void nextSection();
void previousSection();
bool isSectionBookmarked(int index);
void toggleBookmark([int? sectionIndex]);
void clearBookmarks();
void setZoom(double zoom);
void zoomIn();
void zoomOut();
void resetZoom();
void search(String query);
void clearSearch();
void nextSearchResult();
void previousSearchResult();
void reload();
```

## AresPresentationCommentOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresPresentationCommentOperationResult extends AresOfficePageOperationResult
const AresPresentationCommentOperationResult({required super.document, required super.activeIndex, required this.commentId, required this.snapshot});
final String commentId;
final AresPresentationCommentsSnapshot snapshot;
```

## AresPresentationCustomShow

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationCustomShow
AresPresentationCustomShow({required this.id, required this.name, required List<int> slides});
final int id;
final String name;
final List<int> slides;
```

## AresPresentationPartChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationPartChange
const AresPresentationPartChange({required this.id, required this.path, required this.sourceXml});
final String id, path, sourceXml;
```

## AresPresentationShowSettings

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationShowSettings
const AresPresentationShowSettings({this.type = AresPresentationShowType.speaker, this.loop = false, this.showNarration = true, this.showAnimation = true, this.useTimings = true, this.showScrollbar = true, this.startSlide, this.endSlide, this.customShowId});
final AresPresentationShowType type;
final bool loop, showNarration, showAnimation, useTimings, showScrollbar;
final int? startSlide, endSlide;
final int? customShowId;
bool get usesRange;
AresPresentationShowSettings copyWith({AresPresentationShowType? type, bool? loop, bool? showNarration, bool? showAnimation, bool? useTimings, bool? showScrollbar, int? startSlide, int? endSlide, int? customShowId, bool clearRange = false, bool clearCustomShow = false});
bool ==(Object other);
int get hashCode;
```

## AresPresentationShowType

`package:ares_office_core/src/office_document.dart`

```dart
enum AresPresentationShowType { speaker, individual, kiosk }
```

## AresPresentationSlideSection

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationSlideSection
const AresPresentationSlideSection({required this.id, required this.name, required this.slides});
final String id, name;
final List<int> slides;
```

## AresPresentationThemeChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationThemeChange
AresPresentationThemeChange({required this.id, required this.name, required Map<String, String> colors, this.headingFont, this.bodyFont});
final String id, name;
final Map<String, String> colors;
final String? headingFont, bodyFont;
```

## AresSlideChartChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresSlideChartChange
AresSlideChartChange({required this.id, required this.sectionIndex, required this.relationshipId, required this.title, required this.line, this.kind, this.firstSliceAngle = 0, this.holeSize = 50, this.showLegend = true, this.showValues, this.showPercent, required List<List<String>> rows});
final String id, relationshipId, title;
final int sectionIndex;
final bool line;
final AresSlideChartKind? kind;
final int firstSliceAngle, holeSize;
final bool showLegend;
final bool? showValues, showPercent;
AresSlideChartKind get effectiveKind;
final List<List<String>> rows;
```

## AresSlideChartKind

`package:ares_office_core/src/office_document.dart`

```dart
enum AresSlideChartKind { column, line, pie, doughnut, bar, stackedColumn, stackedBar, percentColumn, percentBar }
```

## AresSpreadsheetClipboard

`package:ares_office_core/src/office_spreadsheet_range.dart`

```dart
class AresSpreadsheetClipboard
static String encode(List<List<String>> rows);
static List<List<String>> decode(String source);
```

## AresSpreadsheetRange

`package:ares_office_core/src/office_spreadsheet_range.dart`

```dart
class AresSpreadsheetRange
AresSpreadsheetRange({required this.startRow, required this.startColumn, required this.endRow, required this.endColumn});
factory AresSpreadsheetRange.parse(String address);
final int startRow;
final int startColumn;
final int endRow;
final int endColumn;
int get rowCount;
int get columnCount;
int get cellCount;
bool contains(int row, int column);
String get address;
static String columnName(int column);
void validateInteractiveSize();
```

## AresWordCommentCreationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresWordCommentCreationResult extends AresWordCommentOperationResult
const AresWordCommentCreationResult({required super.document, required super.activeIndex, required super.commentId, required super.snapshot});
```

## AresWordCommentOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresWordCommentOperationResult extends AresOfficePageOperationResult
const AresWordCommentOperationResult({required super.document, required super.activeIndex, required this.commentId, required this.snapshot});
final String commentId;
final AresWordCommentsSnapshot snapshot;
```

## AresWordHeaderFooterChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresWordHeaderFooterChange
const AresWordHeaderFooterChange({required this.id, required this.kind, this.variant = AresWordHeaderFooterVariant.defaultPages, this.text, this.textAlignment, this.textBold, this.textItalic, this.textUnderline, this.textFontSize, this.pageNumber, this.pageNumberAlignment = AresWordPageNumberAlignment.center, this.pageNumberFormat, this.pageNumberStart});
final String id;
final AresWordHeaderFooterKind kind;
final AresWordHeaderFooterVariant variant;
final String? text;
final AresWordPageNumberAlignment? textAlignment;
final bool? textBold;
final bool? textItalic;
final bool? textUnderline;
final double? textFontSize;
final bool? pageNumber;
final AresWordPageNumberAlignment pageNumberAlignment;
final AresWordPageNumberFormat? pageNumberFormat;
final int? pageNumberStart;
```

## AresWordHeaderFooterKind

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordHeaderFooterKind { header, footer }
```

## AresWordHeaderFooterVariant

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordHeaderFooterVariant { defaultPages, firstPage, evenPages }
```

## AresWordPageNumberAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordPageNumberAlignment { left, center, right }
```

## AresWordPageNumberFormat

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordPageNumberFormat { decimal, lowerRoman, upperRoman, lowerLetter, upperLetter }
```

## AresWordTabAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordTabAlignment { left, center, right, decimal, bar }
```

## AresWordTabLeader

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordTabLeader { none, dot, hyphen, underscore, heavy, middleDot }
```

## AresWordTabStop

`package:ares_office_core/src/office_document.dart`

```dart
class AresWordTabStop
const AresWordTabStop({required this.positionPoints, this.alignment = AresWordTabAlignment.left, this.leader = AresWordTabLeader.none});
final double positionPoints;
final AresWordTabAlignment alignment;
final AresWordTabLeader leader;
```

## AresWordTableStylePreset

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordTableStylePreset { plain, grid, header, bandedRows }
```

## AresWorksheetEditing

`package:ares_office_core/src/office_worksheet_editing.dart`

```dart
class AresWorksheetEditing
static String setTabColor(String source, int argb);
static void expandSharedFormulas(XmlDocument xml);
static String toggleGridlines(String source);
static String toggleHeadings(String source);
static String freezePanes(String source, {int rows = 0, int columns = 0});
static String setSize(String source, AresSpreadsheetRange range, {double? rowHeight, double? columnWidth});
static String setVisibility(String source, AresSpreadsheetRange range, {required bool rows, required bool hidden});
static String setAutoFilter(String source, AresSpreadsheetRange range, {required int keyColumn, required String value, required Set<int> hiddenRows});
static String clearAutoFilter(String source);
static String rebaseLayout(String base, String edited);
static List<AresSpreadsheetRange> merges(String source);
static String merge(String source, AresSpreadsheetRange range, {bool remove = false});
```

## BoolCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class BoolCellValue extends CellValue
final bool value;
const BoolCellValue(this.value);
String toString();
int get hashCode;
dynamic ==(Object other);
```

## BoolParsing

`package:ares_office_core/excelXEngine/src/sheet/header_footer.dart`

```dart
extension BoolParsing on String
bool parseBool();
String simplifyText();
```

## Border

`package:ares_office_core/excelXEngine/src/sheet/border_style.dart`

```dart
class Border extends Equatable
final BorderStyle? borderStyle;
final String? borderColorHex;
Border({BorderStyle? borderStyle, ExcelColor? borderColorHex});
String toString();
List<Object?> get props;
```

## BorderStyle

`package:ares_office_core/excelXEngine/src/sheet/border_style.dart`

```dart
enum BorderStyle { None, DashDot, DashDotDot, Dashed, Dotted, Double, Hair, Medium, MediumDashDot, MediumDashDotDot, MediumDashed, SlantDashDot, Thick, Thin }
final String style;
const BorderStyle(this.style);
```

## CellIndex

`package:ares_office_core/excelXEngine/src/sheet/cell_index.dart`

```dart
class CellIndex extends Equatable
factory CellIndex.indexByColumnRow({required int columnIndex, required int rowIndex});
factory CellIndex.indexByString(String cellIndex);
String get cellId;
final int rowIndex;
final int columnIndex;
List<Object?> get props;
```

## CellStyle

`package:ares_office_core/excelXEngine/src/sheet/cell_style.dart`

```dart
class CellStyle extends Equatable
NumFormat numberFormat;
CellStyle({ExcelColor fontColorHex = ExcelColor.black, ExcelColor backgroundColorHex = ExcelColor.none, int? fontSize, String? fontFamily, FontScheme? fontScheme, HorizontalAlign horizontalAlign = HorizontalAlign.Left, VerticalAlign verticalAlign = VerticalAlign.Bottom, TextWrapping? textWrapping, bool bold = false, Underline underline = Underline.None, bool italic = false, int rotation = 0, Border? leftBorder, Border? rightBorder, Border? topBorder, Border? bottomBorder, Border? diagonalBorder, bool diagonalBorderUp = false, bool diagonalBorderDown = false, this.numberFormat = NumFormat.standard_0});
CellStyle copyWith({ExcelColor? fontColorHexVal, ExcelColor? backgroundColorHexVal, String? fontFamilyVal, FontScheme? fontSchemeVal, HorizontalAlign? horizontalAlignVal, VerticalAlign? verticalAlignVal, TextWrapping? textWrappingVal, bool? boldVal, bool? italicVal, Underline? underlineVal, int? fontSizeVal, int? rotationVal, Border? leftBorderVal, Border? rightBorderVal, Border? topBorderVal, Border? bottomBorderVal, Border? diagonalBorderVal, bool? diagonalBorderUpVal, bool? diagonalBorderDownVal, NumFormat? numberFormat});
ExcelColor get fontColor;
dynamic set fontColor(ExcelColor fontColorHex);
ExcelColor get backgroundColor;
dynamic set backgroundColor(ExcelColor backgroundColorHex);
HorizontalAlign get horizontalAlignment;
dynamic set horizontalAlignment(HorizontalAlign horizontalAlign);
VerticalAlign get verticalAlignment;
dynamic set verticalAlignment(VerticalAlign verticalAlign);
TextWrapping? get wrap;
dynamic set wrap(TextWrapping? textWrapping);
String? get fontFamily;
dynamic set fontFamily(String? family);
FontScheme get fontScheme;
dynamic set fontScheme(FontScheme scheme);
int? get fontSize;
dynamic set fontSize(int? _fs);
int get rotation;
dynamic set rotation(int _rotate);
Underline get underline;
dynamic set underline(Underline value);
bool get isBold;
dynamic set isBold(bool bold);
bool get isItalic;
dynamic set isItalic(bool italic);
Border get leftBorder;
dynamic set leftBorder(Border? leftBorder);
Border get rightBorder;
dynamic set rightBorder(Border? rightBorder);
Border get topBorder;
dynamic set topBorder(Border? topBorder);
Border get bottomBorder;
dynamic set bottomBorder(Border? bottomBorder);
Border get diagonalBorder;
dynamic set diagonalBorder(Border? diagonalBorder);
bool get diagonalBorderUp;
dynamic set diagonalBorderUp(bool diagonalBorderUp);
bool get diagonalBorderDown;
dynamic set diagonalBorderDown(bool diagonalBorderDown);
List<Object?> get props;
```

## CellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class CellValue
const CellValue();
```

## ColorType

`package:ares_office_core/excelXEngine/src/utilities/colors.dart`

```dart
enum ColorType { color, material, materialAccent }
```

## CustomDateTimeNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class CustomDateTimeNumFormat extends DateTimeNumFormat
const CustomDateTimeNumFormat({required super.formatCode});
String toString();
```

## CustomNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class CustomNumFormat
String get formatCode;
```

## CustomNumericNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class CustomNumericNumFormat extends NumericNumFormat
const CustomNumericNumFormat({required super.formatCode});
bool accepts(CellValue? value);
String toString();
```

## CustomTimeNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class CustomTimeNumFormat extends TimeNumFormat
const CustomTimeNumFormat({required super.formatCode});
String toString();
```

## Data

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class Data extends Equatable
static Data newData(Sheet sheet, int row, int column);
int get rowIndex;
int get columnIndex;
String get sheetName;
CellIndex get cellIndex;
void setFormula(String formula);
dynamic set value(CellValue? val);
CellValue? get value;
CellStyle? get cellStyle;
dynamic set cellStyle(CellStyle? value);
List<Object?> get props;
```

## DateCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class DateCellValue extends CellValue
final int year;
final int month;
final int day;
const DateCellValue({required this.year, required this.month, required this.day});
DateCellValue.fromDateTime(DateTime dt);
DateTime asDateTimeLocal();
DateTime asDateTimeUtc();
String toString();
int get hashCode;
dynamic ==(Object other);
```

## DateTimeCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class DateTimeCellValue extends CellValue
final int year;
final int month;
final int day;
final int hour;
final int minute;
final int second;
final int millisecond;
final int microsecond;
const DateTimeCellValue({required this.year, required this.month, required this.day, required this.hour, required this.minute, this.second = 0, this.millisecond = 0, this.microsecond = 0});
DateTimeCellValue.fromDateTime(DateTime date);
DateTime asDateTimeLocal();
DateTime asDateTimeUtc();
String toString();
int get hashCode;
dynamic ==(Object other);
```

## DateTimeNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class DateTimeNumFormat extends NumFormat
const DateTimeNumFormat({required super.formatCode});
CellValue read(String v);
String writeDate(DateCellValue value);
String writeDateTime(DateTimeCellValue value);
bool accepts(CellValue? value);
```

## DoubleCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class DoubleCellValue extends CellValue
final double value;
const DoubleCellValue(this.value);
String toString();
int get hashCode;
dynamic ==(Object other);
```

## EdgeDetectionScannerMode

`package:ares_defence_labs_embedded_edge_detection/edgeTypes.dart`

```dart
enum EdgeDetectionScannerMode { LowResFast, Balanced, UltraDetailed }
```

## Excel

`package:ares_office_core/excelXEngine/src/excel.dart`

```dart
class Excel
Parser parser;
factory Excel.createExcel();
factory Excel.decodeBytes(List<int> data);
factory Excel.decodeBuffer(InputStream input);
Map<String, Sheet> get tables;
Sheet [](String sheet);
Map<String, Sheet> get sheets;
dynamic []=(String sheet, Sheet sheetObject);
void link(String sheet1, Sheet existingSheetObject);
void unLink(String sheet);
void copy(String fromSheet, String toSheet);
void rename(String oldSheetName, String newSheetName);
void delete(String sheet);
List<int>? encode();
List<int>? save({String fileName = 'FlutterExcel.xlsx'});
String? getDefaultSheet();
bool setDefaultSheet(String sheetName);
void insertColumn(String sheet, int columnIndex);
void removeColumn(String sheet, int columnIndex);
void insertRow(String sheet, int rowIndex);
void removeRow(String sheet, int rowIndex);
void appendRow(String sheet, List<CellValue?> row);
void insertRowIterables(String sheet, List<CellValue?> row, int rowIndex, {int startingColumn = 0, bool overwriteMergedCells = true});
int findAndReplace(String sheet, Pattern source, dynamic target, {int first = -1, int startingRow = -1, int endingRow = -1, int startingColumn = -1, int endingColumn = -1});
void updateCell(String sheet, CellIndex cellIndex, CellValue? value, {CellStyle? cellStyle});
void merge(String sheet, CellIndex start, CellIndex end, {CellValue? customValue});
List<String> getMergedCells(String sheet);
void unMerge(String sheet, String unmergeCells);
```

## ExcelColor

`package:ares_office_core/excelXEngine/src/utilities/colors.dart`

```dart
class ExcelColor extends Equatable
String get colorHex;
int get colorInt;
ColorType? get type;
String? get name;
factory ExcelColor.fromInt(int colorIntValue);
factory ExcelColor.fromHexString(String colorHexValue);
static const dynamic none;
static const dynamic black;
static const dynamic black12;
static const dynamic black26;
static const dynamic black38;
static const dynamic black45;
static const dynamic black54;
static const dynamic black87;
static const dynamic white;
static const dynamic white10;
static const dynamic white12;
static const dynamic white24;
static const dynamic white30;
static const dynamic white38;
static const dynamic white54;
static const dynamic white60;
static const dynamic white70;
static const dynamic redAccent;
static const dynamic pinkAccent;
static const dynamic purpleAccent;
static const dynamic deepPurpleAccent;
static const dynamic indigoAccent;
static const dynamic blueAccent;
static const dynamic lightBlueAccent;
static const dynamic cyanAccent;
static const dynamic tealAccent;
static const dynamic greenAccent;
static const dynamic lightGreenAccent;
static const dynamic limeAccent;
static const dynamic yellowAccent;
static const dynamic amberAccent;
static const dynamic orangeAccent;
static const dynamic deepOrangeAccent;
static const dynamic red;
static const dynamic pink;
static const dynamic purple;
static const dynamic deepPurple;
static const dynamic indigo;
static const dynamic blue;
static const dynamic lightBlue;
static const dynamic cyan;
static const dynamic teal;
static const dynamic green;
static const dynamic lightGreen;
static const dynamic lime;
static const dynamic yellow;
static const dynamic amber;
static const dynamic orange;
static const dynamic deepOrange;
static const dynamic brown;
static const dynamic grey;
static const dynamic blueGrey;
static const dynamic redAccent100;
static const dynamic redAccent400;
static const dynamic redAccent700;
static const dynamic pinkAccent100;
static const dynamic pinkAccent400;
static const dynamic pinkAccent700;
static const dynamic purpleAccent100;
static const dynamic purpleAccent400;
static const dynamic purpleAccent700;
static const dynamic deepPurpleAccent100;
static const dynamic deepPurpleAccent400;
static const dynamic deepPurpleAccent700;
static const dynamic indigoAccent100;
static const dynamic indigoAccent400;
static const dynamic indigoAccent700;
static const dynamic blueAccent100;
static const dynamic blueAccent400;
static const dynamic blueAccent700;
static const dynamic lightBlueAccent100;
static const dynamic lightBlueAccent400;
static const dynamic lightBlueAccent700;
static const dynamic cyanAccent100;
static const dynamic cyanAccent400;
static const dynamic cyanAccent700;
static const dynamic tealAccent100;
static const dynamic tealAccent400;
static const dynamic tealAccent700;
static const dynamic greenAccent100;
static const dynamic greenAccent400;
static const dynamic greenAccent700;
static const dynamic lightGreenAccent100;
static const dynamic lightGreenAccent400;
static const dynamic lightGreenAccent700;
static const dynamic limeAccent100;
static const dynamic limeAccent400;
static const dynamic limeAccent700;
static const dynamic yellowAccent100;
static const dynamic yellowAccent400;
static const dynamic yellowAccent700;
static const dynamic amberAccent100;
static const dynamic amberAccent400;
static const dynamic amberAccent700;
static const dynamic orangeAccent100;
static const dynamic orangeAccent400;
static const dynamic orangeAccent700;
static const dynamic deepOrangeAccent100;
static const dynamic deepOrangeAccent400;
static const dynamic deepOrangeAccent700;
static const dynamic red50;
static const dynamic red100;
static const dynamic red200;
static const dynamic red300;
static const dynamic red400;
static const dynamic red600;
static const dynamic red700;
static const dynamic red800;
static const dynamic red900;
static const dynamic pink50;
static const dynamic pink100;
static const dynamic pink200;
static const dynamic pink300;
static const dynamic pink400;
static const dynamic pink600;
static const dynamic pink700;
static const dynamic pink800;
static const dynamic pink900;
static const dynamic purple50;
static const dynamic purple100;
static const dynamic purple200;
static const dynamic purple300;
static const dynamic purple400;
static const dynamic purple600;
static const dynamic purple700;
static const dynamic purple800;
static const dynamic purple900;
static const dynamic deepPurple50;
static const dynamic deepPurple100;
static const dynamic deepPurple200;
static const dynamic deepPurple300;
static const dynamic deepPurple400;
static const dynamic deepPurple600;
static const dynamic deepPurple700;
static const dynamic deepPurple800;
static const dynamic deepPurple900;
static const dynamic indigo50;
static const dynamic indigo100;
static const dynamic indigo200;
static const dynamic indigo300;
static const dynamic indigo400;
static const dynamic indigo600;
static const dynamic indigo700;
static const dynamic indigo800;
static const dynamic indigo900;
static const dynamic blue50;
static const dynamic blue100;
static const dynamic blue200;
static const dynamic blue300;
static const dynamic blue400;
static const dynamic blue600;
static const dynamic blue700;
static const dynamic blue800;
static const dynamic blue900;
static const dynamic lightBlue50;
static const dynamic lightBlue100;
static const dynamic lightBlue200;
static const dynamic lightBlue300;
static const dynamic lightBlue400;
static const dynamic lightBlue600;
static const dynamic lightBlue700;
static const dynamic lightBlue800;
static const dynamic lightBlue900;
static const dynamic cyan50;
static const dynamic cyan100;
static const dynamic cyan200;
static const dynamic cyan300;
static const dynamic cyan400;
static const dynamic cyan600;
static const dynamic cyan700;
static const dynamic cyan800;
static const dynamic cyan900;
static const dynamic teal50;
static const dynamic teal100;
static const dynamic teal200;
static const dynamic teal300;
static const dynamic teal400;
static const dynamic teal600;
static const dynamic teal700;
static const dynamic teal800;
static const dynamic teal900;
static const dynamic green50;
static const dynamic green100;
static const dynamic green200;
static const dynamic green300;
static const dynamic green400;
static const dynamic green600;
static const dynamic green700;
static const dynamic green800;
static const dynamic green900;
static const dynamic lightGreen50;
static const dynamic lightGreen100;
static const dynamic lightGreen200;
static const dynamic lightGreen300;
static const dynamic lightGreen400;
static const dynamic lightGreen600;
static const dynamic lightGreen700;
static const dynamic lightGreen800;
static const dynamic lightGreen900;
static const dynamic lime50;
static const dynamic lime100;
static const dynamic lime200;
static const dynamic lime300;
static const dynamic lime400;
static const dynamic lime600;
static const dynamic lime700;
static const dynamic lime800;
static const dynamic lime900;
static const dynamic yellow50;
static const dynamic yellow100;
static const dynamic yellow200;
static const dynamic yellow300;
static const dynamic yellow400;
static const dynamic yellow600;
static const dynamic yellow700;
static const dynamic yellow800;
static const dynamic yellow900;
static const dynamic amber50;
static const dynamic amber100;
static const dynamic amber200;
static const dynamic amber300;
static const dynamic amber400;
static const dynamic amber600;
static const dynamic amber700;
static const dynamic amber800;
static const dynamic amber900;
static const dynamic orange50;
static const dynamic orange100;
static const dynamic orange200;
static const dynamic orange300;
static const dynamic orange400;
static const dynamic orange600;
static const dynamic orange700;
static const dynamic orange800;
static const dynamic orange900;
static const dynamic deepOrange50;
static const dynamic deepOrange100;
static const dynamic deepOrange200;
static const dynamic deepOrange300;
static const dynamic deepOrange400;
static const dynamic deepOrange600;
static const dynamic deepOrange700;
static const dynamic deepOrange800;
static const dynamic deepOrange900;
static const dynamic brown50;
static const dynamic brown100;
static const dynamic brown200;
static const dynamic brown300;
static const dynamic brown400;
static const dynamic brown600;
static const dynamic brown700;
static const dynamic brown800;
static const dynamic brown900;
static const dynamic grey50;
static const dynamic grey100;
static const dynamic grey200;
static const dynamic grey300;
static const dynamic grey350;
static const dynamic grey400;
static const dynamic grey600;
static const dynamic grey700;
static const dynamic grey800;
static const dynamic grey850;
static const dynamic grey900;
static const dynamic blueGrey50;
static const dynamic blueGrey100;
static const dynamic blueGrey200;
static const dynamic blueGrey300;
static const dynamic blueGrey400;
static const dynamic blueGrey600;
static const dynamic blueGrey700;
static const dynamic blueGrey800;
static const dynamic blueGrey900;
static List<ExcelColor> get values;
static Map<String, ExcelColor> get valuesAsMap;
List<Object?> get props;
```

## ExtractedOfficeImage

`package:ares_office_core/src/office_embedded_image_extractor.dart`

```dart
class ExtractedOfficeImage
const ExtractedOfficeImage({required this.path, required this.packagePath, required this.bytes});
final String path;
final String packagePath;
final int bytes;
```

## FastList

`package:ares_office_core/excelXEngine/src/utilities/fast_list.dart`

```dart
class FastList<K>
FastList();
FastList.from(FastList<K> other);
void add(K key);
bool contains(K key);
void remove(K key);
void clear();
List<K> get keys;
bool get isNotEmpty;
```

## FileType

`package:ares_office_core/src/file_type_detector.dart`

```dart
enum FileType { image, video, word, excel, csv, powerpoint, text, md }
```

## FontFamily

`package:ares_office_core/excelXEngine/src/sheet/font_family.dart`

```dart
enum FontFamily { Al_Bayan_Plain, Abadi_MT_Condensed_Light, Abadi_MT_Condensed_Extra_Bold, Al_Nile, Al_Tarikh_Regular, American_Typewriter, Andale_Mono, Angsana_New, Apple_Braille_Outline_8_Dot, Apple_Chancery, Apple_Color_Emoji, Apple_Symbols, Arial, Arial_Hebrew, Arial_Hebrew_Scholar, Arial_Narrow, Arial_Rounded_MT_Bold, Arial_Unicode_MS, Athelas_Regular, Avenir_Book, Avenir_Next_Regular, Avenir_Next_Condensed_Regular, Ayuthaya, Baghdad, Bangla_MN, Bangla_Sangam_MN, Baskerville, Baskerville_Old_Face, Bauhaus_93, Beirut, Bell_MT, Bernard_MT_Condensed, Big_Caslon, Bodoni_72, Bodoni_72_Oldstyle, Bodoni_72_Smallcaps, Bodoni_Ornaments, Book_Antiqua, Bookman_Old_Style, Bookshelf_Symbol_7, Bradley_Hand, Braggadocio, Britannic_Bold, Brush_Script_MT, Calibri, Calisto_MT, Cambria, Cambria_Math, Candara, Century, Century_Gothic, Century_Schoolbook, Chalkboard, Chalkboard_SE, Chalkduster, Charter, Cochin, Colonna_MT, Comic_Sans_MS, Consolas, Constantia, Cooper_Black, Copperplate, Copperplate_Gothic_Bold, Corbel, Cordia_New, CordiaUPC, Corsiva_Hebrew, Courier, Courier_New, Curlz_MT, Damascus, David, DecoType_Naskh, Desdemona, Devanagari_MT, Devanagari_Sangam_MN, Didot, DIN_Alternate, DIN_Condensed, Diwan_Kufi, Diwan_Thuluth, Dubai, Edwardian_Script_ITC, Engravers_MT, Euphemia_UCAS, Eurostile, Farah, Farisi, Footlight_MT_Light, Franklin_Gothic_Book, Franklin_Gothic_Demi, Franklin_Gothic_Demi_Cond, Franklin_Gothic_Heavy, Franklin_Gothic_Medium, Franklin_Gothic_Medium_Cond, Futura, Gabriola, Galvji, Garamond, Gautami, Geeza_Pro, Geneva, Georgia, Gill_Sans, Gill_Sans_MT, Gill_Sans_MT_Condensed, Gill_Sans_MT_Ext_Condensed_Bold, Gill_Sans_Ultra_Bold, Gloucester_MT_Extra_Condensed, Goudy_Old_Style, Gujarati_MT, Gujarati_Sangam_MN, Gurmukhi_MN, Gurmukhi_MT, Gurmukhi_Sangam_MN, Haettenschweiler, Harrington, Helvetica, Helvetica_Neue, Herculanum, Hoefler_Text, Impact, Imprint_MT_Shadow, InaiMathi, Iowan_Old_Style, ITF_Devanagari, ITF_Devanagari_Marathi, Kailasa, Kannada_MN, Kannada_Sangam_MN, Kartika, Kefa, Khmer_MN, Khmer_Sangam_MN, Kino_MT, Kohinoor_Bangla, Kohinoor_Devanagari, Kohinoor_Gujarati, Kohinoor_Telugu, Kokonor, Lao_MN, Lao_Sangam_MN, Latha, Lucida_Blackletter, Lucida_Bright, Lucida_Calligraphy, Lucida_Console, Lucida_Fax, Lucida_Grande, Lucida_Handwriting, Lucida_Sans, Lucida_Sans_Typewriter, Lucida_Sans_Unicode, Luminari, Malayalam_MN, Malayalam_Sangam_MN, Mangal, Marion, Marker_Felt, Marlett, Matura_MT_Script_Capitals, Menlo, Microsoft_New_Tai_Lue, Microsoft_Sans_Serif, Microsoft_Tai_Le, Microsoft_Yi_Baiti, Mishafi, Mishafi_Gold, Mistral, Monaco, Monotype_Corsiva, Monotype_Sorts, MS_Reference_Sans_Serif, MS_Reference_Specialty, Mshtakan, MT_Extra, Mukta_Mahee, Muna, Myanmar_MN, Myanmar_Sangam_MN, Myanmar_Text }
```

## FontScheme

`package:ares_office_core/excelXEngine/src/utilities/enum.dart`

```dart
enum FontScheme { Unset, Major, Minor }
```

## FormulaCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class FormulaCellValue extends CellValue
final String formula;
const FormulaCellValue(this.formula);
String toString();
int get hashCode;
dynamic ==(Object other);
```

## HeaderFooter

`package:ares_office_core/excelXEngine/src/sheet/header_footer.dart`

```dart
class HeaderFooter
bool? alignWithMargins;
bool? differentFirst;
bool? differentOddEven;
bool? scaleWithDoc;
String? evenFooter;
String? evenHeader;
String? firstFooter;
String? firstHeader;
String? oddFooter;
String? oddHeader;
HeaderFooter({this.alignWithMargins, this.differentFirst, this.differentOddEven, this.scaleWithDoc, this.evenFooter, this.evenHeader, this.firstFooter, this.firstHeader, this.oddFooter, this.oddHeader});
XmlNode toXmlElement();
static HeaderFooter fromXmlElement(XmlElement headerFooterElement);
```

## HorizontalAlign

`package:ares_office_core/excelXEngine/src/utilities/enum.dart`

```dart
enum HorizontalAlign { Left, Center, Right }
```

## IntCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class IntCellValue extends CellValue
final int value;
const IntCellValue(this.value);
String toString();
int get hashCode;
dynamic ==(Object other);
```

## NumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class NumFormat
final String formatCode;
static const dynamic defaultNumeric;
static const dynamic defaultFloat;
static const dynamic defaultBool;
static const dynamic defaultDate;
static const dynamic defaultTime;
static const dynamic defaultDateTime;
static const dynamic standard_0;
static const dynamic standard_1;
static const dynamic standard_2;
static const dynamic standard_3;
static const dynamic standard_4;
static const dynamic standard_9;
static const dynamic standard_10;
static const dynamic standard_11;
static const dynamic standard_12;
static const dynamic standard_13;
static const dynamic standard_14;
static const dynamic standard_15;
static const dynamic standard_16;
static const dynamic standard_17;
static const dynamic standard_18;
static const dynamic standard_19;
static const dynamic standard_20;
static const dynamic standard_21;
static const dynamic standard_22;
static const dynamic standard_37;
static const dynamic standard_38;
static const dynamic standard_39;
static const dynamic standard_40;
static const dynamic standard_45;
static const dynamic standard_46;
static const dynamic standard_47;
static const dynamic standard_48;
static const dynamic standard_49;
const NumFormat({required this.formatCode});
static CustomNumFormat custom({required String formatCode});
CellValue read(String v);
int get hashCode;
dynamic ==(Object other);
bool accepts(CellValue? value);
static NumFormat defaultFor(CellValue? value);
```

## NumFormatMaintainer

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class NumFormatMaintainer
void add(int numFmtId, CustomNumFormat format);
int findOrAdd(CustomNumFormat format);
void clear();
NumFormat? getByNumFmtId(int numFmtId);
```

## NumericNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class NumericNumFormat extends NumFormat
const NumericNumFormat({required super.formatCode});
CellValue read(String v);
String writeDouble(DoubleCellValue value);
String writeInt(IntCellValue value);
```

## Parser

`package:ares_office_core/excelXEngine/src/parser/parse.dart`

```dart
class Parser
```

## Save

`package:ares_office_core/excelXEngine/src/save/save_file.dart`

```dart
class Save
final Parser parser;
```

## SharedString

`package:ares_office_core/excelXEngine/src/sharedStrings/shared_strings.dart`

```dart
class SharedString
final XmlElement node;
SharedString({required this.node});
String toString();
TextSpan get textSpan;
String get stringValue;
int get hashCode;
dynamic ==(Object other);
bool matches(String value);
```

## Sheet

`package:ares_office_core/excelXEngine/src/sheet/sheet.dart`

```dart
class Sheet
bool get isRTL;
dynamic set isRTL(bool _u);
Data cell(CellIndex cellIndex);
List<List<Data?>> get rows;
List<List<Data?>?> selectRangeWithString(String range);
List<List<Data?>?> selectRange(CellIndex start, {CellIndex? end});
List<List<dynamic>?> selectRangeValuesWithString(String range);
List<List<dynamic>?> selectRangeValues(CellIndex start, {CellIndex? end});
void removeColumn(int columnIndex);
void insertColumn(int columnIndex);
void removeRow(int rowIndex);
void insertRow(int rowIndex);
void updateCell(CellIndex cellIndex, CellValue? value, {CellStyle? cellStyle});
void merge(CellIndex start, CellIndex end, {CellValue? customValue});
void unMerge(String unmergeCells);
void setMergedCellStyle(CellIndex start, CellStyle mergedCellStyle);
void appendRow(List<CellValue?> row);
void insertRowIterables(List<CellValue?> row, int rowIndex, {int startingColumn = 0, bool overwriteMergedCells = true});
double? get defaultRowHeight;
double? get defaultColumnWidth;
Map<int, bool> get getColumnAutoFits;
Map<int, double> get getColumnWidths;
Map<int, double> get getRowHeights;
bool getColumnAutoFit(int columnIndex);
double getColumnWidth(int columnIndex);
double getRowHeight(int rowIndex);
void setDefaultColumnWidth([double columnWidth = _excelDefaultColumnWidth]);
void setDefaultRowHeight([double rowHeight = _excelDefaultRowHeight]);
void setColumnAutoFit(int columnIndex);
void setColumnWidth(int columnIndex, double columnWidth);
void setRowHeight(int rowIndex, double rowHeight);
int findAndReplace(Pattern source, String target, {int first = -1, int startingRow = -1, int endingRow = -1, int startingColumn = -1, int endingColumn = -1});
bool clearRow(int rowIndex);
List<String> get spannedItems;
String get sheetName;
List<Data?> row(int rowIndex);
int get maxRows;
int get maxColumns;
HeaderFooter? get headerFooter;
dynamic set headerFooter(HeaderFooter? headerFooter);
```

## StandardDateTimeNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class StandardDateTimeNumFormat extends DateTimeNumFormat
final int numFmtId;
String toString();
```

## StandardNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class StandardNumFormat
int get numFmtId;
```

## StandardNumericNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class StandardNumericNumFormat extends NumericNumFormat
final int numFmtId;
bool accepts(CellValue? value);
String toString();
```

## StandardTimeNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class StandardTimeNumFormat extends TimeNumFormat
final int numFmtId;
String toString();
```

## StringExt

`package:ares_office_core/excelXEngine/src/utilities/colors.dart`

```dart
extension StringExt on String
ExcelColor get excelColor;
```

## TextCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class TextCellValue extends CellValue
final TextSpan value;
TextCellValue(String text);
TextCellValue.span(this.value);
String toString();
int get hashCode;
dynamic ==(Object other);
```

## TextSpan

`package:ares_office_core/excelXEngine/src/sharedStrings/shared_strings.dart`

```dart
class TextSpan
final String? text;
final List<TextSpan>? children;
final CellStyle? style;
const TextSpan({this.children, this.text, this.style});
String toString();
dynamic ==(Object other);
int get hashCode;
```

## TextWrapping

`package:ares_office_core/excelXEngine/src/utilities/enum.dart`

```dart
enum TextWrapping { WrapText, Clip }
```

## TimeCellValue

`package:ares_office_core/excelXEngine/src/sheet/data_model.dart`

```dart
class TimeCellValue extends CellValue
final int hour;
final int minute;
final int second;
final int millisecond;
final int microsecond;
const TimeCellValue({this.hour = 0, this.minute = 0, this.second = 0, this.millisecond = 0, this.microsecond = 0});
factory TimeCellValue.fromFractionOfDay(num fractionOfDay);
factory TimeCellValue.fromDuration(Duration duration);
TimeCellValue.fromTimeOfDateTime(DateTime dt);
Duration asDuration();
String toString();
int get hashCode;
dynamic ==(Object other);
```

## TimeNumFormat

`package:ares_office_core/excelXEngine/src/number_format/num_format.dart`

```dart
class TimeNumFormat extends NumFormat
const TimeNumFormat({required super.formatCode});
CellValue read(String v);
String writeTime(TimeCellValue value);
bool accepts(CellValue? value);
```

## Underline

`package:ares_office_core/excelXEngine/src/utilities/enum.dart`

```dart
enum Underline { None, Single, Double }
```

## VerticalAlign

`package:ares_office_core/excelXEngine/src/utilities/enum.dart`

```dart
enum VerticalAlign { Top, Center, Bottom }
```
