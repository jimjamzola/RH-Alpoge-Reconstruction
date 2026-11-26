# Human-readable reconstruction of the Alpöge/Claude RH argument

The purpose of this repository is to provide a human-readable reconstruction of the proof of the Riemann hypothesis in Alpöge and Claude's Lean archive. Given how quickly this has all developed and how I am not a number theorist, I cannot guarantee that everything in this repository is correct. All priority of the results belongs to Levent and Claude. I have learned a lot during this process and continue to do so.

## Current status

**[Read the canonical working manuscript](canonical/main.pdf)** · *The Alpöge–Claude Argument for the Riemann Hypothesis* · Jimmie Adriazola · 117 pages · 26 November 2026. [LaTeX source](canonical/main.tex) · [Bibliography](canonical/references.bib)

The project began with Levent Alpöge and Claude’s original Lean archive. The [297-page reconstruction of that archive](manuscript/main.pdf) remains available. The canonical manuscript follows the [readable Lean 4 refactor by Luke Sernau, colleagues at Anthropic, and Claude](https://github.com/lsernau/grh-lean/tree/72fead102f663d5c7a407964a13dc0cf9d977207/grh).

This edition is open for community review. Theorem 1.1 deduces Dirichlet GRH from the signed determinant criterion, and Corollary 7.2 proves the converse. The remaining arithmetic task is to establish all the construction estimates on one datum at each sufficiently large cutoff. Appendix E records those inputs. Proposition 12.3 gives a sufficient precision for the two moment estimates when both hold for the same normalized map. The written reconstruction remains conditional.

## Earlier reconstruction from the original archive

Section 17.4.3 now follows the original cohomological argument for K1. Section 18.7 traces one family through the estimates to the final deduction and identifies the comparisons and inputs that still need mathematical verification. The correspondence between the manuscript and the archive remains partial.

The reference is the original release, pinned at `40e56bab026552e089d7afcfeff08d2defb9c005`. Its terminal declaration is `riemannHypothesis : RiemannHypothesis`. The passage ledger currently links 60 manuscript passages to Lean declarations. The Lean companion to the November 25 manuscript checks ten deductions locally. Its two archive-dependent files still await a build against the full original environment.

## The argument and its reconstruction

Levent Alpöge released the Lean archive on 20 November 2026. His note credits him with the plan of the proof and Claude with the proposal to use a chain of theta lifts of length about $\sqrt{X}$. The argument extends to Dirichlet $L$-functions. On 21 November the Lean and Mathlib communities certified the formal statement and proof of RH. [Alpöge’s note](https://alpo.ge/remark.pdf) · [Lean community statement](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)

I began at the Lean declaration `riemannHypothesis` and worked backwards through its dependencies. One mathematical idea can occupy hundreds of declarations. In one part of the argument, I found that 631 Lean theorems reduced to eight propositions. For each proposition, the task is to write the argument, check the hypotheses of any published theorem it uses, and follow each open step back into the archive.

**Manuscript by Jimmie Adriazola, Arizona State University.** I used Claude, GPT and Kimi in the reconstruction and manuscript preparation. I thank SAIR for giving me access to Open Math earlier this month. After I exhausted most of my other compute resources, that access allowed me to complete the final stage of the project.

## Files

| Material | Where to find it |
| --- | --- |
| Canonical manuscript from the refactor | [PDF](canonical/main.pdf) · [LaTeX](canonical/main.tex) · [BibTeX](canonical/references.bib) |
| Manuscripts from the original archive | [297-page PDF](manuscript/main.pdf) and [source](manuscript/) · [Earlier 66-page manuscript](archive/route-notes/RH_Route_Notes.pdf) and [source](archive/route-notes/RH_Route_Notes.tex) |
| Structure of the argument | [Proof dependency map](docs/PROOF_DEPENDENCY_MAP.md) · [Published theorems](docs/EXTERNAL_THEOREMS.md) |
| Reconstruction history | [Dated status reports](docs/STATUS.md) · [21 November reconstruction](docs/RECONSTRUCTION_STATUS.md) |
| Verification | [Archive version](docs/SOURCE_MANIFEST.md) · [Audit reports](audit/README.md) · [Passage-to-Lean review materials](review/README.md) · [Replay instructions](review/REPLAY.md) |
| Citation and reuse | [Citation](CITATION.cff) · [License](LICENSE) |

## How to help

Corrections and comments from specialists are very welcome. For the canonical edition, please identify the section, the first inference in question, and any relevant result in the literature or declaration in the readable refactor. I would especially appreciate checks of the hypotheses and normalizations in Appendix E. The [review materials](review/README.md) collect the November 25 manuscript-to-Lean correspondences and unresolved questions. Please use the [issue tracker](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/new) to report corrections or raise questions.

## Proof optimization

I am preparing a separate project on shorter arguments and sharper bounds. The proposed integrated deficit bound and the earlier alternative K1 argument are preserved in [Issue 2](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/2) and the [optimization notes](review/optimization_preservation/README.md).

## Acknowledgments

- I thank Timothy Wesley Stone for raising the rationality question for the period maps and pointing me to the relevant Lean declarations. [Issue 1](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/1)
- I thank **erythrofr** for proposing a sharper bound for the integrated deficit. [Issue 2](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/2)
- I thank **a-ratz** for identifying the original commit to cite, questioning my attribution of V17, and pointing out discrepancies between the declaration names I cited and those in the later community repository. [Issue 3](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/3)

<details>
<summary>Building the manuscripts</summary>

Build the canonical manuscript with TeX Live, Biber, and latexmk.

```sh
cd canonical
latexmk -pdf main.tex
```

For the 297-page manuscript, start at the repository root.

```
cd manuscript
pdflatex main
bibtex main
pdflatex main
pdflatex main
```

It needs a standard TeX Live installation with `mathpazo`, `natbib`, `fancyhdr`, `booktabs`, `longtable` and the `wncyr` fonts.

To build the earlier manuscript, start at the repository root.

```
cd archive/route-notes
pdflatex RH_Route_Notes.tex
pdflatex RH_Route_Notes.tex
pdflatex RH_Route_Notes.tex
```

Its preamble needs `newtx`, the TeX Gyre fonts, `pgfplots`, `natbib`, `fancyhdr`, `booktabs` and `longtable`. No BibTeX run is needed.

</details>

## Earlier announcements

<details>
<summary>Read the updates and corrections from 22–23 November 2026</summary>

> **Status, 23 November 2026, evening. A brief update on the Alpöge RH reconstruction.**
>
> This morning I posted a manuscript and repository status reflecting the result of a global dependency audit: every live internal dependency in the Lean route had been assigned either to a reconstructed mathematical mechanism or to an explicit external boundary. I want to clarify that this was a statement about coverage of the formal route, not a claim that every internal theorem had already been written out as a complete conventional proof.
>
> A referee pass this afternoon pushed the human-proof audit further and found that the list of open statements in the current manuscript is incomplete. The largest newly exposed piece is a $\mathrm{GSp}_4$ argument that had been absorbed into the non-generic cases. The referee also isolated several points that need specialist attention, including `RegDet`, a patching step that moves between different points, and the role of the internal theorem `AdjointLiftingTheorem`. No false statement was identified; the effect of the pass was to make the remaining frontier more precise.
>
> A separate reconciliation of the external boundary also found a substantial number of literature inputs that are used by the route but are not yet represented in the current external-theorem ledger, most of them foundational results in automorphic forms and representation theory. I am therefore treating the present manuscript as a reconstruction in progress rather than a finished conventional proof. The next step is to produce a complete verification map of the remaining internal and external obligations, referee that map, and then work through the resulting finite list systematically.
>
> I am leaving the earlier status material in place so that the chronology of the reconstruction and its corrections remains visible.
>
> **Status, 23 November 2026.** The reconstruction has now reached a 225-page working manuscript, [`manuscript/main.pdf`](manuscript/main.pdf). Reconciling the final dependency audit with the manuscript clarified an important distinction in the status reported here on 22 November. The audit closed the live Lean dependency graph at the level of dependency identification and mathematical packaging. Every live internal dependency had been located, assigned to a reconstructed component, or isolated behind an explicit boundary. The audit did **not** mean that every internal statement on that route had already been written out with a complete conventional proof.
>
> The current manuscript makes that boundary explicit. Its Section 19 lists the internal statements for which a conventional proof is still being reconstructed, together with the published inputs whose exact forms still need source verification. The manuscript therefore does **not yet** constitute a proof of the Riemann hypothesis independent of the Lean development.
>
> I am actively working to complete the original goal of this repository, a human-readable mathematical proof that can be checked from the paper and its cited literature without any appeal to Lean. At the same time I am working to compress the exposition. The increase from 66 pages to 225 pages came from opening the internal packages that the earlier manuscript had summarized and writing out the mathematics they contain.
>
> This is a very large argument, and the reconstruction is developing quickly. Please treat the manuscript as a working document while this process continues. Corrections and specialist scrutiny are extremely welcome.
>
> **Historical status, 22 November 2026.** The statement below gives the conclusion of the final dependency audit as it was understood at that stage. It is kept here unchanged.
>
> **Status, 22 November 2026.** The internal reconstruction phase is complete. A final dependency audit starting from the Lean theorem `riemannHypothesis` finds no unresolved internal mathematical residuals on the live proof route. The exact-edge live subgraph contains 766,788 declarations, including 622,409 theorems. Every live internal mathematical dependency has been reconstructed at the human-proof level, assigned to an already reconstructed package, or transferred to an explicit external theorem boundary. The remaining work is source-fidelity verification of those external inputs and reconciliation of the audit into the human-readable manuscript. Details are in [`STATUS.md`](docs/STATUS.md). The certification report and its tables are in [`audit/final_certification/`](audit/final_certification/), and every report it cites is in [`audit/`](audit/).
>
> This repository does not claim an independent proof of RH by the reconstruction author. The proof being reconstructed is Alpöge's formally verified proof. The manuscript posted here predates the final audit and has not yet been reconciled with it.

### Manuscript status recorded on 23 November 2026

Status as of 23 November 2026. [`STATUS.md`](docs/STATUS.md) gives the details.

The manuscript [`manuscript/main.pdf`](manuscript/main.pdf) proves the Riemann hypothesis from the published theorems it cites and from a finite list of internal statements that it states precisely and does not yet prove. Each such statement appears as a numbered hypothesis at its point of use, and Section 19 collects them with their dependencies. The open internal statements are the following.

- The residual engines of the nondegeneracy of Hecke operators that controls the loss (Section 12).
- The normalization and odd-transfer statements that make the theta lifts a chain datum (Section 11).
- The automorphic inputs for Bessel Poincaré series, namely the kernel expansion, the multiplicity formula, the main-row and loop-row estimates, and the seesaw relation in the theta tower behind the Bessel identity (Section 14).
- The covolume bound with a constant uniform in the level of deep covers, and a few norm and multiplicity statements in the height computation (Section 15).
- The bound for Tate–Shafarevich groups on windows of scales and the congruence bound at the twisted places (Section 17).
- The check that Sections 11 to 17 give the conditions on the chain used in the proof of Theorem A (Section 18).

One finding concerns the strength of these statements. The bound for Tate–Shafarevich groups on windows implies a bound in the direction of Vandiver's conjecture that is stronger than the published bounds of Soulé (1999) and of de la Torre Durán (2026). The Lean development derives it from an automorphy statement for residually reducible Galois representations that lies outside the hypotheses of the published automorphy lifting theorems for residually reducible representations. The manuscript states this step as a hypothesis and does not claim it.

No statement on the route has failed. The Lean development proves each of the statements above, and the Lean and Mathlib communities certified that development on 21 November 2026. The remaining work is to write their proofs as conventional mathematics, to finish the comparison of the cited published theorems with their sources, and to compress the exposition.

## Record of 22 November 2026

The two passages below are the purpose paragraph and the status section of this file as they stood on 22 November 2026. They are kept here unchanged.

The purpose of this repository is to provide a human-readable proof of the Riemann hypothesis. Given how quickly this has all developed, I cannot guarantee that everything in this repository is correct. I am actively working through it and hope that the fact that the manuscript here is currently fewer than 70 pages provides some relief as we collectively process these astonishing results. All priority of the results belongs to Levent and Claude. The architecture of the argument and all of its major mechanisms have been reconstructed, and a final global audit of Alpöge's formal proof has found no unresolved internal residual on the live route. The comparison of the named published theorems with the literature is under way but not finished. The manuscript posted here predates the final audit (see [Current status](#current-status)). I am actively working to clean up the manuscript so that it reads more clearly. My ultimate hope is that this makes the process of human verification easier for the community.

### Current status (22 November 2026)

Status as of 22 November 2026. [`STATUS.md`](docs/STATUS.md) gives the details.

The internal reconstruction phase is complete. The final global audit started from the Lean declaration that proves `riemannHypothesis`, rebuilt the live dependency graph with no depth cap, and gave every live declaration an owner and a status. Its internal residual set is empty. What remains is the source-fidelity check of the external theorem boundary, the reconciliation of the audit into the manuscript, and an independent line-by-line check of the resulting human proof.

The manuscript currently available here predates the final audit and many of the closure and source-fidelity passes before it. A reconciled revision will be prepared in a separate pass. Until then, [`STATUS.md`](docs/STATUS.md) is the current statement, and [`RECONSTRUCTION_STATUS.md`](docs/RECONSTRUCTION_STATUS.md) and [`EXTERNAL_THEOREMS.md`](docs/EXTERNAL_THEOREMS.md) record the state of 21 November 2026.

In more detail.

- **Architecture: reconstructed.** The route is known end to end, from the analytic criterion for zeros through the arithmetic form of Stepanov's method, the divisibility of theta lifts, the slope and covolume estimates and the automorphic and Galois inputs, to the final explicit-formula argument. The dependency order has no cycle.
- **Major mechanisms: reconstructed.** Each major mechanism of the archive has been written in ordinary mathematics (see [`RECONSTRUCTION_STATUS.md`](docs/RECONSTRUCTION_STATUS.md), Section 2).
- **Internal packages: closed at the human-proof boundary.** The seven packages PC-1 to PC-7 listed on 21 November, the small leaves, and the blocks isolated by later passes (D1 to D9, E1 to E5, W1 to W3, the kernel leaves K-a to K-c, and `ramBijective_holds`) have all been closed, PC-1 to PC-7 modulo explicit external inputs where they apply. The final pass also found several under-owned upstream items and closed them. [`STATUS.md`](docs/STATUS.md) lists the blocks.
- **Literature verification: under way, not complete.** A dedicated audit now compares the archive's form of each named published theorem with the theorem in print, including hypotheses and normalizations. Its first pass took 26 high-risk inputs. Two match their published statements exactly, five match after a change of notation, and nine match after short bridge lemmas, which the audit writes out. Nine still have at least one unchecked clause, and for one no published source for the exact required statement has yet been found. The rest of the external boundary has not yet been checked statement for statement. Besides confirmations, the pass found corrections to some attributions and to one hypothesis as stated in an earlier human account, and it raised some interface questions. These findings concern the human account. The archive contains no axioms and its final theorem has no hypotheses, so each of these published statements is also proved inside the archive, and a mismatch with print cannot open a gap in the formal proof. Two external questions raised by that audit have since been settled, the doubling form of the Siegel–Weil formula (R-1, through an explicit bridge) and the integral Hodge–Tate input at $p=2$ (R-2). The largest external region identified by the final audit, the existence and local–global compatibility of Galois representations for regular algebraic polarized cuspidal representations over CM fields (from `Row0b` to `galoisLocalGlobalStrong_recParameter`, cited in the manuscript to Harris–Taylor, Shin, Chenevier–Harris and Caraiani), has not yet had a detailed source-fidelity check. The external boundary as a whole has not been verified.
- **Formal verification: done by the Lean and Mathlib communities.** On 21 November 2026, the Lean and Mathlib communities certified that both the statement and the proof of the Riemann hypothesis in Alpöge's Lean library are correct ([joint statement](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)). This repository did not build or replay the archive itself. A textual audit of the source (no `axiom`, `sorry`, `admit`, `native_decide`, `opaque` or kernel-disabling option in any of its 175,187 files) is recorded in [`SOURCE_MANIFEST.md`](docs/SOURCE_MANIFEST.md).

</details>
