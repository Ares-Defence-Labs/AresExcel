# Excel text calculations

The source calculation engine and editor Text functions picker support
`TEXTJOIN`, `SUBSTITUTE`, `REPT`, `TEXTBEFORE` and `TEXTAFTER`. These extend the existing scalar text
functions; they do not complete Excel's text/function catalog or dynamic arrays.

## TEXTJOIN

`TEXTJOIN(delimiter, ignore_empty, text1, ...)` accepts 1–252 text arguments.
Text arguments can be scalars, native ranges or supported array expressions.
Ranges flatten in row-major order. Scalar separators repeat between included
items; a delimiter array cycles in row-major order across all included items,
including across separate text arguments. Number/boolean items use the existing
engine text conversion. True `ignore_empty` skips both blank values and empty
strings; false retains their positions with separators. Errors and unsupported
calculations propagate instead of being skipped. `_xlfn.TEXTJOIN` uses the same
calculation implementation.

Examples:

```text
=TEXTJOIN(" | ",TRUE,{"A","";"B","C"})     → A | B | C
=TEXTJOIN({",",";"},TRUE,{"A","B";"C","D"}) → A,B;C,D
```

## SUBSTITUTE

`SUBSTITUTE(text, old_text, new_text, [instance_num])` replaces literal,
case-sensitive, nonoverlapping occurrences. Without an instance it replaces all
matches. A positive instance selects one match, truncating fractional numeric
instances; an instance beyond the match count leaves text unchanged. Empty
`old_text` leaves text unchanged. Wildcard and regex metacharacters are literal.
Nonpositive/nonfinite instances reject. This function changes returned text;
it does not rewrite other cells or references.

```text
=SUBSTITUTE("Quarter 1, 2011","1","2",3) → Quarter 1, 2012
=SUBSTITUTE("aaaaa","aa","X")            → XXa
```

## REPT

`REPT(text, number_times)` repeats scalar text. Fractional nonnegative counts
truncate, zero returns empty text and negative/nonfinite counts reject. Output
length is checked before allocation or conversion of a huge repetition count to
an integer. Empty text remains empty even for a huge nonnegative count.

```text
=REPT("*-",3) → *-*-*-
```

## TEXTBEFORE and TEXTAFTER

`TEXTBEFORE(text, delimiter, [instance_num], [match_mode], [match_end], [if_not_found])`
and `TEXTAFTER` return the portion before/after a literal delimiter. Positive
instances scan forward; negative instances scan backward. The default is the
first case-sensitive match. Mode 1 ignores case. End mode 1 permits one virtual
boundary after actual matches in the chosen direction. Missing optional arguments
use defaults, including interior argument holes. Missing required arguments reject.

An empty delimiter matches immediately: before/after return empty/full text
forward, and full/empty text backward. Empty input returns empty text. Missing
matches return `#N/A` or the lazily evaluated fallback, preserving its scalar type.
Unused fallback errors and unsupported arrays are not evaluated. Zero instances,
instances beyond nonempty text length and invalid modes return `#VALUE!`.
Finite fractional instances truncate toward zero. `_xlfn.` names are recognized.

```text
=TEXTBEFORE("North-South-East","-",-1) → North-South
=TEXTAFTER("North-South-East","-",2)   → East
=TEXTAFTER("abc","z",1,0,0,42)        → 42
```

Scalar values/options only: delimiter arrays and argument broadcasting report
unsupported. Directional matching selects nonoverlapping occurrences; case
matching uses the runtime's Unicode-aware literal regular expression while
returning original-text offsets. Inputs/delimiters are capped at 32,767 UTF-16
units and scans consume the shared calculation budget. Unicode compatibility
versions, coercion/error precedence and overlapping-delimiter behavior still need
an executed Microsoft-reference corpus. Native future-function metadata and
spill behavior are not accepted by these source tests.

## Bounds and remaining conformance

These functions enforce a 32,767 UTF-16 code-unit output limit with `#VALUE!` on
overflow. TEXTJOIN visits and SUBSTITUTE match scans use the shared calculation
step budget; an exhausted budget is explicitly unsupported. Numeric/native
coercion, workbook compatibility versions, supplementary Unicode character
counting and locale behavior still need a pinned Microsoft-reference corpus.

Scalar options do not broadcast: an array-valued TEXTJOIN `ignore_empty`, or an
array argument to SUBSTITUTE/REPT reports `supported: false`; IFERROR does not
turn those unimplemented operations into a fabricated value. Omitted argument
holes in TEXTJOIN/SUBSTITUTE/REPT, dynamic spill and complete lifting/coercion
conformance remain open.
TEXTJOIN consumes arrays to one scalar string; it does not create a spill region.

Managed SDK `setCell`/save retains formula text and uses existing entitlement,
source-conflict, native package/history and storage paths. The Text functions
picker uses the existing edit/read-only/host-authorization workflow. Pure
`AresOfficeFormulaEngine` calculation does not read files or activate a licence.
Actual Excel future-function serialization/recalculation and issued protected
customer/admin acceptance remain release gates. Source fixtures do not certify
Microsoft or six-platform parity. Scanners remain Android/iOS only; editor and
low-level APIs retain the six-platform target. No publication/deployment.

## Published contracts

- [Microsoft TEXTJOIN](https://support.microsoft.com/en-us/excel/functions/textjoin-function)
- [Microsoft SUBSTITUTE](https://support.microsoft.com/en-us/excel/functions/substitute-function)
- [Microsoft TEXTBEFORE](https://support.microsoft.com/en-us/excel/functions/textbefore-function)
- [Microsoft TEXTAFTER](https://support.microsoft.com/en-us/excel/functions/textafter-function)
- [Microsoft REPT](https://support.microsoft.com/en-us/excel/functions/rept-function)

The published contracts guide implementation; they are not an executed reference
build. Source regression evidence is recorded separately in the validation log.
