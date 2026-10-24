# Compatibility and feature limits

Excel provides cell editing, a formula engine, defined names, supported worksheet operations and legacy notes. Native hyperlink CRUD, supported local range/name navigation and explicit host-controlled external opening have synthetic SDK/editor checks; complete link semantics and candidate/runtime acceptance remain open. Formula conformance, reference rewriting, advanced charts, pivots/slicers, modern threaded comments, protection modes and the remaining Microsoft feature set are unfinished.

New scanner output uses `.xlsx`. Native templates and supported macro-enabled
containers may preserve parts, but macro/VBA execution is not provided by that
preservation. Import support is not a guarantee of lossless editing or rendering.
Legacy binary formats and text/CSV conversions have different fidelity limits;
retain originals and test your actual document corpus.

Unknown parts should survive supported unrelated operations; unsupported edits
must be rejected rather than silently flattening a document. Preservation,
extraction, UI exposure and host callbacks do not establish full feature parity.

Full Microsoft Word/Excel/PowerPoint parity is the requested target and remains
unfinished. Compatibility must be recorded against explicit desktop Office builds
and exercised through save/reopen/re-edit, undo/redo and platform tests. No new
physical-device or admin-mode certification is claimed by these documentation
screenshots. See [release gates](release-status.md).
