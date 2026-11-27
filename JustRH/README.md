# On the Riemann Hypothesis

**Working manuscript — November 27, 2026**

This directory is a dated release of a 59-page working manuscript specialized to the classical Riemann hypothesis. It is an incomplete, conditional human-readable reconstruction of the Alpöge–Claude formal argument.

The manuscript is not presented as an unconditional proof of the Riemann hypothesis. It has not been independently verified as a mathematical manuscript, and it does not claim independent certification of the formal source or of the mathematical exposition. Research is ongoing.

## Files

| File | Description |
| --- | --- |
| [`main.pdf`](main.pdf) | Compiled working manuscript |
| [`main.tex`](main.tex) and `sec*.tex` | Complete LaTeX source |
| [`references.bib`](references.bib) | Bibliography |
| [`RESEARCH_STATUS.md`](RESEARCH_STATUS.md) | Conditional status, known incompatibility and current reconstruction priorities |

## Scope of the release

The manuscript proves an analytic criterion and a conditional deduction of RH from a uniform arithmetic estimate. Its arithmetic reconstruction contains hypotheses explicitly labeled **Open input**. In particular, Section 7 flags rather than silently repairs a node-spacing incompatibility with the source's standard record.

A source-level trace also identifies a shorter route from the released source's window comparison to the manuscript's Section 2 criterion. That trace is conditional on arithmetic and geometric theorems in the released source; it is not an independent conventional proof of those inputs. See [`RESEARCH_STATUS.md`](RESEARCH_STATUS.md).

## Building

A standard TeX Live installation with `latexmk`, BibTeX, `mathpazo`, `natbib`, `fancyhdr`, `booktabs` and `longtable` is sufficient.

```sh
cd JustRH
latexmk -pdf main.tex
```

The repository's root license applies to this directory.
