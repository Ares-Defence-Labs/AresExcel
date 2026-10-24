# Embedded editor

The editor must support **Android, iOS, macOS, Windows, Linux and web**, with
the same document features and file round-trip behavior. The low-level document
API has the same six-platform requirement. Only scanning is restricted to mobile.
The source integration includes desktop files and browser IndexedDB/byte adapters.
All three full SDK imports compile for web and pass synthetic browser API
round trips. This does not certify protected customer packages or full Microsoft
feature parity. See [storage](storage.md) and [platforms](platforms.md).
Windows runtime acceptance is tracked in [Windows validation](windows-validation.md).

Landscape layouts expose Undo and Redo in the document bar. They restore saved
package history as well as pending edits, respect read-only/host policy and are
disabled while a file operation is busy. Compact bars place fit/zoom actions in
a Zoom menu to keep history controls usable without overflowing.

`AresExcelEditor(sdk: sdk, documentPath: path)` embeds the domain editor and its
editing controls. It checks the SDK licence and the document domain before
loading. Use an absolute native path, or a virtual path returned by browser storage.
Import browser picker bytes with `sdk.loadBytes`; export with `sdk.exportBytes`.

Pass an `AresOfficeViewerController` to observe readiness and the current
document. The lifecycle callbacks are `onDocumentReady`, `onDocumentModified`,
`onDocumentSaved`, `onAutoSaved` and `onError`. Keep error handling visible to the
host; do not discard an unsaved edit after an error.

Autosave defaults to enabled with a 500 ms idle delay. Set `autoSaveEnabled:
false` when your host manages explicit saves. Autosave is not a crash-recovery
guarantee. Use the Save As callbacks to supply a writable destination; the editor
does not grant your app filesystem access. Save-as-format, PDF export, compression,
text export and media actions have separate host callbacks and format limits.

`viewerConfig`, `appBarConfig`, `toolsSheetConfig`, themes and `themeMode`
configure the UI. Host actions such as `onScanPage`, `onLoadCustomStamps`,
`onEmbedVideos` and `onEmbedAudio` require host integrations. A visible action or
callback does not mean every Microsoft feature is implemented.

Use the same SDK configuration for scanner, loader, writer and editor. Customer
examples must not inject a mock verifier or owner mode. See [API declarations](api-reference.md)
for constructor options and [compatibility limits](compatibility.md).

## Excel native pictures

For OOXML workbooks, Image inserts a native one-cell PNG/JPEG picture. Select a
supported picture to change its row, column, offsets and size, replace its image,
or delete it. Alternative text edits the native name, title and description;
the description/title supplies the accessible label. Its saved changes participate
in undo/redo without changing media or geometry. Replace image retains native identity, saved geometry and metadata,
and isolates shared image bytes. Use Apply to save position/size field edits.
The dialog uses one-based row/column labels and pixel dimensions; saved changes
participate in undo/redo. Read-only/protected files cannot change pictures.
The viewer renders this subset within its 500-row/100-column preview bounds;
unsupported drawing types and off-preview pictures are preserved/reported.
See [picture APIs and compatibility limits](low-level-api.md#excel-worksheet-pictures).
