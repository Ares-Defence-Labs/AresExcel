# Scanner workflow

**Android and iOS only.** Desktop and browser applications use the editors and
document APIs; they do not initialize camera/OCR dependencies. Web on a phone
is still web and cannot use the native scanner. Check
`AresOfficePlatforms.canScan` before showing a Scan action. The scanner widget
and `scanToFile` reject unsupported platforms before authorization or capture.
Import `package:ares_excel/platforms.dart` for that lightweight platform query.

Import `package:ares_excel/scanner.dart` for the domain SDK, capture/review types
and generation result. The full import also exposes the editor and file API.

`sdk.scanToFile` performs product authorization, capture, crop review,
recognition, domain review, generation and reopen verification. The output path
must end in `.xlsx`. A successful `AresOfficeScanGenerationResult` contains
`path`, `document` and `template`. Cancellation returns `null`.

Excel review displays the matrix that will be written. AresExcelOutput selects clean/exact/raw tables, receipt, invoice or inventory extraction. Inspect headers, columns, amounts and number formats. Use sdk.writeWorkbook for an explicitly reviewed AresExcelWorkbook.

For custom capture navigation, `AresExcelScanner(sdk: sdk)` is a capture widget;
present it in a route and handle its raw capture result. It does not by itself
write an Office file. Prefer `scanToFile` for the complete workflow. An optional
`scanner:` supplied to `scanToFile` must use the exact same SDK instance.

`recognizePages:` accepts an `AresOfficePageRecognizer` for an explicit OCR
integration. It returns recognized pages for the supplied image paths. The
caller must keep page counts/order and processed coordinates consistent; errors
are propagated. Default recognition uses the current on-device mobile OCR
integration. Supplying a callback can change data handling; review that service's
privacy policy and storage behavior separately.

Templates must belong to this SDK. `initialTemplateId`, processing options,
gallery selection, customization and scan quality can be configured on the
scanner. `isPro` and display options are UI capabilities; they do not authorize
a product. The legacy `edgeSdkLicenceKey` option defaults to the Office key;
customers do not need to buy Edge separately for this bundled scanner.

Use readable, well-lit pages; review OCR before export. Denied camera permission,
unreadable text, native licence rejection or unsupported templates must be handled
as failures. A preview screenshot does not establish camera/device compatibility.
See [platform setup](platforms.md) and [licensing](licensing.md).
