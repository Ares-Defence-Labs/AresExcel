# Excel workbooks, cells, ranges, formulas and dates

AresExcel exposes two source surfaces. The managed `AresExcelSdk` validates the
product and wraps loading, sessions, saving and scan-review workbook writing.
The currently exported `Excel` workbook helper offers typed XLSX construction;
it is a low-level helper, not an independent licence/protection boundary. The
final protected customer export surface remains under review.

## Build or import a workbook

`AresExcelWorkbook` contains `AresExcelSheet` objects with string `rows`, names,
source paths and optional column widths. It also records extraction `output`,
`headers` and `numberFormats`. Use `sdk.writeWorkbook` to write a reviewed scanner
matrix, then reopen it as an editor model. Do not confuse this string matrix
with the typed `Excel` library's cells.

The typed helper uses `TextCellValue`, `IntCellValue`, `DoubleCellValue`,
`BoolCellValue`, `FormulaCellValue`, `DateCellValue`, `TimeCellValue` and
`DateTimeCellValue`. A formula helper value holds formula text without a leading
`=`; managed grid input uses a leading `=`. `encode()` returns XLSX bytes or null.
Import those bytes through `sdk.loadBytes`; native hosts supply a writable path.
[Compilable workbook examples](../examples/workbook_workflows.dart)

## Edit cells and ranges

`setCell` takes a string value, zero-based sheet/row/column. `setRangeValues`
applies a rectangular string matrix as one undo step and preserves embedded tabs
and newlines. Ragged/empty matrices reject. The model infers cell types; use the
typed helper when constructing explicit types before managed import.

`AresSpreadsheetRange.parse('A1:D20')` supports absolute dollar markers, with
inclusive endpoints. Bounds are A1:XFD1048576; interactive operations cap a
selection at 100,000 cells and the dense editing grid at one million materialized
cells. `rangeValues` pads missing cells with blanks. Current-region, sorting,
filtering, duplicate removal, fill and formatting operations each have scoped
behavior; they are not a guarantee of Excel's entire table/reference semantics.

## Formulas and dates

`AresOfficeFormulaEngine(document)` evaluates a stable model snapshot.
`evaluateCell(sheet,row,column)` / `evaluateFormula(sheet,formula)` return an
`AresFormulaResult`. Check both `supported` and `error`; a display string alone
cannot establish calculation success. Supported scalar functions, references and
cycles are bounded; full Excel formula/array/external-link parity is unfinished.
Evaluation does not replace formulas with their calculated values. Construct a
new engine after edits; `calculationTime` can be supplied for deterministic
TODAY/NOW evaluation.

The Financial picker includes NPV, XNPV, IRR, XIRR, MIRR and RRI. NPV discounts the first flow
at period one; add an immediate investment outside it. Numeric range/array
entries keep their order and zeros, while text/logical/blank entries are skipped.
Direct NPV numeric-text/logical arguments coerce. Errors/unsupported formulas
propagate. A combined 100,000 numeric-flow bound applies. MIRR requires both flow
signs and rates above -100%; RRI requires positive periods, nonzero present value
and compatible value signs. Full financial and Microsoft reference conformance,
dynamic arrays and external workbook calculation remain open.

XNPV discounts paired numeric flows/dates by actual serial-day differences over
365 days, with the first flow at time zero. Dates truncate to integer serials
within the workbook's 1900/1904 bounds. Later dates can be unsorted/equal but
cannot precede the first. Row-major flattened values/dates must have equal counts
up to 100,000; nonnumeric/blank entries reject rather than shifting pairings.
Both flow signs and rates above -100% are required. Use numeric serials or cells
containing DATE expressions; locale strings and expressions inside literal
arrays are not parsed. Full desktop reference/date-coercion conformance remains
unfinished.

IRR solves periodic numeric flows; zero entries retain periods and array/reference
text, logical and blank entries are ignored. XIRR uses the paired date rules above
and actual-day intervals. Both require positive and negative flows and default to
a 10% guess. This bounded implementation accepts guesses above -100%, uses at
most 20 (IRR) or 100 (XIRR) Newton iterations, and returns `#NUM!` on failed
convergence. A residual check avoids treating an asymptote as a root. Different
guesses can select different roots; no complete Microsoft root-selection or
pathological numerical-conformance claim is made. Both are in the Financial
picker and retain formula expressions through save/reopen and saved history.

`AresExcelDates(date1904: document.date1904)` preserves the workbook's date system.
Use `parseDate('YYYY-MM-DD')` or `serial` for date values and explicit number
formats for display. The 1900 system deliberately retains serial 60 compatibility;
locale guesses and JavaScript timestamps are not interchangeable Excel serials.
Validation can convert supported ISO date/time input using the workbook's system.

[Validation and notes](names-notes-validation.md) · [API types](api-types.md) ·
[Feature limits](compatibility.md)
