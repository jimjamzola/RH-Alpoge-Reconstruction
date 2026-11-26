# Status

## 26 November 2026

The [current working manuscript](../canonical/main.pdf), *The Alpöge–Claude Argument for the Riemann Hypothesis*, follows the readable refactor at revision `72fead1`. Its [source](../canonical/main.tex) and [29-entry bibliography](../canonical/references.bib) accompany the PDF. Appendix E records the arithmetic inputs still required on one datum at each sufficiently large cutoff. Proposition 12.3 gives a sufficient error tolerance for two moments of the same normalized map. The [November 25 manuscript](../manuscript/main.pdf) reconstructs the original archive.

In the earlier manuscript, the abstract term-family definition in §14 permits a term to count in both the identity and nongeneric subclasses. The three-term example breaks the deduction from the two subtotals as written. The suggested disjointness condition also needs to be checked for the intended operator family. The current manuscript assumes classification inputs for its own moment argument. Two other corrections concern the earlier manuscript. At subgroup index three, the favored weight in the sampling argument of §5 exceeds its printed upper bound. In §17, evaluation on a single Frobenius can identify distinct characters. The linked discussions give the examples and proposed repairs. [Issue 8](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/8) · [Top-set probabilities in the earlier §5](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/pull/4) · [Character multiplicities in the earlier §17](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/5)

## 25 November 2026

The [297-page manuscript](../manuscript/main.pdf) follows the original K1 argument in §17.4.3 and records the remaining comparisons in §18.7. The [review guide](../review/README.md) links passages to the pinned release and identifies open questions for independent checking.

## 24 November 2026

The [manuscript](../manuscript/main.pdf) now treats the volume, decay and near-orbit estimates in Section 14 and the base change, classical points and uniform cohomological bound in Section 17. The alternative argument for the last bound awaits independent human verification. Section 18.7 records the hypotheses still needed for the deduction of RH. See the [current status](../README.md#current-status).

## 23 November 2026, evening

A brief update on the Alpöge RH reconstruction.

This morning I posted a manuscript and repository status reflecting the result of a global dependency audit: every live internal dependency in the Lean route had been assigned either to a reconstructed mathematical mechanism or to an explicit external boundary. I want to clarify that this was a statement about coverage of the formal route, not a claim that every internal theorem had already been written out as a complete conventional proof.

A referee pass this afternoon pushed the human-proof audit further and found that the list of open statements in the current manuscript is incomplete. The largest newly exposed piece is a $\mathrm{GSp}_4$ argument that had been absorbed into the non-generic cases. The referee also isolated several points that need specialist attention, including `RegDet`, a patching step that moves between different points, and the role of the internal theorem `AdjointLiftingTheorem`. No false statement was identified; the effect of the pass was to make the remaining frontier more precise.

A separate reconciliation of the external boundary also found a substantial number of literature inputs that are used by the route but are not yet represented in the current external-theorem ledger, most of them foundational results in automorphic forms and representation theory. I am therefore treating the present manuscript as a reconstruction in progress rather than a finished conventional proof. The next step is to produce a complete verification map of the remaining internal and external obligations, referee that map, and then work through the resulting finite list systematically.

I am leaving the earlier status material in place so that the chronology of the reconstruction and its corrections remains visible.

## 23 November 2026

The current manuscript is [`manuscript/main.pdf`](../manuscript/main.pdf), a 225-page working document. Reconciling the final dependency audit of 22 November with the manuscript clarified what the audit verdict below means. The audit closed the live Lean dependency graph at the level of dependency identification and mathematical packaging. Every live internal dependency had been located, assigned to a reconstructed component, or isolated behind an explicit boundary. The verdict `|R_internal| = 0` does **not** mean that every internal statement on that route has been written out with a complete conventional proof.

The manuscript proves the Riemann hypothesis from the published theorems it cites and from a finite list of internal statements that it states precisely, as numbered hypotheses at their points of use, and does not yet prove. Section 19 of the manuscript collects these statements with their dependencies and gives the source-verification status of the cited published theorems. The manuscript therefore does **not yet** constitute a proof of the Riemann hypothesis independent of the Lean development.

The open internal statements are the residual engines of the nondegeneracy of Hecke operators (Section 12), the normalization and odd-transfer statements for the theta lifts (Section 11), the automorphic inputs for Bessel Poincaré series (Section 14), the uniform covolume bound and a few norm and multiplicity statements in the height computation (Section 15), the bound for Tate–Shafarevich groups on windows and the congruence bound at the twisted places (Section 17), and the check that Sections 11 to 17 give the conditions on the chain used in the proof of Theorem A (Section 18). The bound for Tate–Shafarevich groups on windows implies a bound in the direction of Vandiver's conjecture that is stronger than the published bounds of Soulé (1999) and of de la Torre Durán (2026). The Lean development derives it from an automorphy statement for residually reducible Galois representations outside the hypotheses of the published automorphy lifting theorems for such representations. The manuscript does not claim this step.

The sections below give the status of 22 November 2026. They are kept unchanged.

## Status of 22 November 2026

22 November 2026. This file is the current statement of the reconstruction state. It supersedes [`RECONSTRUCTION_STATUS.md`](RECONSTRUCTION_STATUS.md) of 21 November 2026, which is kept as a historical record.

The proof being reconstructed is Alpöge's formally verified proof. This repository does not claim an independent proof of RH by the reconstruction author.

## 1. Current phase

The internal reconstruction phase is complete. The next phases are

1. the source-fidelity check of the external theorem boundary,
2. the reconciliation of the audit into the manuscript [`RH_Route_Notes.pdf`](../archive/route-notes/RH_Route_Notes.pdf), which predates the final audit,
3. an independent line-by-line check of the resulting human proof.

## 2. Internal residual verdict

The final global internal certification pass started from the Lean declaration that proves `riemannHypothesis` and rebuilt the live dependency graph with no depth cap. It gave every live declaration one of four classes.

| Class | Declarations |
|---|---:|
| Closed | 4,506 |
| Closed via prior package | 631,740 |
| External | 130,542 |
| Residual | 0 |
| **Exact-edge live graph** | **766,788** |

The internal residual set is empty, `|R_internal| = 0`. Every live internal mathematical dependency has been reconstructed at the human-proof level, assigned to an already reconstructed package, or transferred to an explicit external theorem boundary.

## 3. The live graph

- The exact-edge live graph has 766,788 declarations, of which 622,409 are theorems.
- The archive has no `sorry` and no `axiom` declarations.
- Qualification on the graph extraction. About 102,000 further declarations are reached through dot-notation dependency edges. Their ownership is inherited from the declarations that reach them. They produce no internal residual, but the extraction method for these edges has not yet been documented in full.
- Evidence tiers. About 3,800 declarations are closed by a report that names them. About 379,000 are classed by region, since they lie under a package head that a report closed, and no report names them individually. Section 3 of the certification report states this inference.
- The certification did not run the Lean kernel.

## 4. Closed blocks

| Block | Status |
|---|---|
| PC-1 to PC-7 | closed internally, modulo explicit external inputs where they apply |
| D1 to D9 | closed |
| E1 to E5 | closed |
| W1 to W3 | closed |
| K-a, K-b, K-c | closed |
| `ramBijective_holds` | closed internally |
| R-1, doubling Siegel–Weil formula | closed after an explicit bridge |
| R-2, integral Hodge–Tate input at $p=2$ | closed internally, using Scholze–Weinstein (2013), Prop. 5.1.6(iii) |

The final pass also found items that were under-owned or lay upstream of several packages, and closed them. These are `split_pair_generation`, `ramBijective_holds`, the K-support leaves, `HidaSetting`, the small leaves SL-1 to SL-4, and the torsion-field inputs they need.

## 5. Remaining external-fidelity work

The source-fidelity check of the external theorem boundary is not complete.

- The largest external region identified by the final audit runs from `Row0b` to `galoisLocalGlobalStrong_recParameter`. It supplies the existence and local–global compatibility of Galois representations for regular algebraic polarized cuspidal representations over CM fields. The manuscript cites Harris–Taylor, Shin, Chenevier–Harris and Caraiani for it. This region has not yet had a detailed source-fidelity check.
- The certification added two external rows, the Taylor–Wiles–Kisin patching region and the Néron–Ogg–Shafarevich criterion (used by `dvd_discr_torsionField`). The full list of external declarations is [`audit/final_certification/Global_External_Boundary.tsv`](../audit/final_certification/Global_External_Boundary.tsv).
- The rest of the boundary is listed in [`EXTERNAL_THEOREMS.md`](EXTERNAL_THEOREMS.md) as of 21 November 2026. The source-fidelity audit since then has matched, corrected or reclassified part of it, and has not covered all of it.

## 6. Reconstruction, formal certification and human verification

These are three different things.

| | What it is | State |
|---|---|---|
| Reconstruction | A human-readable account of the live internal route of Alpöge's formal proof, with a dependency audit. This is the work of this repository. | Internal phase complete. External fidelity and manuscript reconciliation outstanding. |
| Formal certification | A check of the Lean statement and proof. | Done by the Lean and Mathlib communities, joint statement of 21 November 2026 ([link](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)). This repository did not build or replay the archive. |
| Independent human verification | A line-by-line check of the human proof by mathematicians independent of the reconstruction. | Not done. |

## 7. Documents

- The manuscript [`RH_Route_Notes.pdf`](../archive/route-notes/RH_Route_Notes.pdf) predates the final audit. Its Section 1.3 and Section 11 describe the state of 21 November 2026, when internal packages were still under audit.
- The final certification is in [`audit/final_certification/`](../audit/final_certification/). [`Global_Residual_Reconciliation.tsv`](../audit/final_certification/Global_Residual_Reconciliation.tsv) names, for each former residual, the report that closed it. Those reports are in [`audit/closure_reports/`](../audit/closure_reports/) and [`audit/pre_synthesis/`](../audit/pre_synthesis/).
- [`RECONSTRUCTION_STATUS.md`](RECONSTRUCTION_STATUS.md), [`EXTERNAL_THEOREMS.md`](EXTERNAL_THEOREMS.md), [`PROOF_DEPENDENCY_MAP.md`](PROOF_DEPENDENCY_MAP.md) and the files in [`audit/`](../audit/) are kept as records of the reconstruction and its corrections. Where they differ from this file, this file is more recent.
