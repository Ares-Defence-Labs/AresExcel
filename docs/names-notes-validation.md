# Excel names, validation, notes and hyperlinks

## Validation and worksheet state

`session.setDataValidation(sheetIndex, range, rule)` adds/replaces a native rule
as one pending undo step; pass null to remove. `AresDataValidation` supports whole,
decimal, textLength, list, date, time and supported custom formulas. Numeric rules
use an operator/first/second bound; inline lists are comma-separated and bounded.
The worksheet must contain native XML; CSV is not an XLSX validation container.
Rules can reject edits, and unsupported formulas/rules need explicit review.

`freezeWorksheetPanes`, worksheet size/autofit, visibility/tab color and gridline/
heading operations modify supported worksheet state. Merge operations preserve
secondary values rather than silently discarding them. Test your actual workbook
and reference formulas before structural changes. [Workbook recipe](../examples/workbook_workflows.dart)

## Native worksheet pictures

Use `sdk.inspectPictures`, `insertImage`, `replacePicture`, `setPictureMetadata`,
`setPictureBounds` and `deletePicture`
for supported one-cell PNG/JPEG pictures, separately from Ares private attachments.
The editor Image action inserts them; selecting a picture opens move/size/delete
controls and payload replacement with saved undo/redo. [Picture API, geometry and rendering limits](low-level-api.md#excel-worksheet-pictures)

## Defined names

`sdk.definedNames` reads workbook and worksheet-scoped names, including hidden
ones. `setDefinedName` / `removeDefinedName` commit native changes, accepting
scope and source fingerprint arguments. A name's existence does not establish
that every referenced expression is calculable. Preserve unsupported external
references and inspect scope before replacing a name.

The name manager saves pending edits before opening, binds writes to its displayed
path/version and returns the committed name list. A background reload cannot
authorize old records. After a failed/ambiguous action, close and reopen the panel
before further mutations. Draft retention across closing, name renaming/reference
rewrites and scope migration remain unfinished.

## Legacy cell notes

`inspectNotes(path, sheetIndex:)` provides the current legacy-note snapshot and
restrictions. `addNote`, `replaceNoteText` and `removeNote` target an A1 address.
`setNoteVisibility(path, sheetIndex:, address:, visible:,
expectedSourceFingerprint:)` changes the supported persisted legacy-note setting.
Snapshot `visible` is null for unknown/conflicting flags or styles, and
`canSetVisibility` includes native write restrictions. The Notes panel exposes
Show/Hide note in file and saved undo, preserving rich bodies and unrelated VML
controls. Floating note boxes are not yet rendered in the Ares grid; markers and
the panel remain its display. Strict authoring and box geometry remain open.
Save pending session edits first and pass the fresh fingerprint. Native legacy
notes are distinct from modern collaborative threaded comments, which remain
outside the completed feature set.

`placement` and `canSetPlacement` describe supported native movement/resize
behavior. `setNotePlacement(path, sheetIndex:, address:, placement:,
expectedSourceFingerprint:)` accepts `AresExcelNotePlacement.moveAndSize`,
`moveOnly` or `fixed`. The panel's Note placement action writes native VML flags
with version/permission checks and saved undo; rich bodies, anchors, styles,
visibility and unrelated controls survive. Ambiguous/unknown flags and
resize-without-move combinations remain unsupported. These are persisted Office
settings; full Ares structural anchor remapping and floating boxes remain open.

## Hyperlinks

`inspectHyperlinks`, `setHyperlink` and `removeHyperlink` operate on saved native
worksheet links. `reference` is the worksheet cell/range; `target` and `location`
distinguish external and internal targets. Optional display/tooltip and replace
behavior are explicit. These APIs have synthetic source SDK/editor checks; protected customer and
Microsoft interoperability acceptance remain separate. The Link panel supports native CRUD, saved undo and stale-version rejection.
`AresExcelLinkNavigation.resolve` handles supported local A1 ranges, quoted
worksheet names and simple scoped name chains. Computed, 3D and external-workbook
locations reject instead of choosing a guessed target. Internal opening uses the
`navigateLink` host policy action, distinct from external `openLink`. `onOpenHyperlink` on
`AresExcelEditor` is the explicit external-opening callback; `authorizeAction`
receives `openLink` before dispatch and the displayed file version is rechecked.
No external URI is launched implicitly. A link does not authorize the host to
launch arbitrary schemes or fetch external content; enforce your app policy.
The AresScan integration accepts only HTTP/HTTPS targets without URL credentials,
asks for confirmation and rechecks its project export policy before opening.
Internal sheet navigation remains a separate navigation action.

`HYPERLINK(link_location, [friendly_name])` calculates supported scalar labels and
explicit target metadata. References, supported names/expressions and lazy IF
branches can provide its arguments. Failed/unsupported calculations, arrays,
invalid locations and text cells that merely contain formula-looking text do not
activate a link. Calculation never fetches or launches a target. An ordinary cell
reference to a hyperlink cell returns the label without inheriting activation.

`inspectHyperlinks` keeps native `hyperlinks` separate from `formulaHyperlinks`.
The Link panel lists both; formula links can be opened or selected, and must be
edited through the source cell formula. `AresExcelHyperlinks.formulaLinks` is the
pure source-document inspector, bounded to 10,000 candidate formulas per sheet.
`AresFormulaResult.hyperlinkTarget` is calculation metadata, not authorization.
Opening recalculates a formula target against the current source and rejects a
changed target until reload; volatile formulas can consequently require reload.
Internal `#` locations use the same supported local navigation as native links.
External targets use the same explicit, policy-checked host callback. Complete
formula/array/linked-workbook conformance and every click gesture remain open.
See [Microsoft's HYPERLINK syntax](https://support.microsoft.com/en-us/excel/functions/hyperlink-function)
for the reference function contract; these are the implemented Ares source bounds.

All file-level operations return updated committed state. Dispose stale sessions
and reopen from their returned document. [Ownership/conflicts](low-level-api.md)
