# Reconstruction status

> **Historical record.** This file records the state of 21 November 2026. The final internal audit of 22 November 2026 closed the internal packages listed here, and [`STATUS.md`](STATUS.md) supersedes this file.

Status as of 21 November 2026. This document is the authoritative public statement of the reconstruction state. It follows the post-closure synthesis in [`audit/Post_Closure_Synthesis.pdf`](../audit/Post_Closure_Synthesis.pdf) and its companion files [`audit/Post_Closure_Internal_Residuals.md`](../audit/Post_Closure_Internal_Residuals.md) and [`audit/Post_Closure_Verification_Boundary.md`](../audit/Post_Closure_Verification_Boundary.md), and it agrees with Sections 1.3 and 11 of [`RH_Route_Notes.pdf`](../archive/route-notes/RH_Route_Notes.pdf). If this file and those sources disagree, the sources govern and this file should be corrected.

## 1. Summary

The mathematical architecture of the argument has been reconstructed end to end, and every major mechanism has been reconstructed in ordinary mathematics. A finite set of isolated internal proof packages remains under audit, together with a separate literature-verification boundary. No completed reconstruction pass has identified a mathematical gap, but the present manuscript should not yet be described as an independent verification of every component of the formal proof.

| Question | Answer |
|---|---|
| Is the architecture of the argument known end to end? | Yes. The dependency order has no cycle. |
| Are the major mathematical mechanisms reconstructed? | Yes. Every major mechanism has been written in ordinary mathematics (Section 2). |
| Has any completed audit pass identified a mathematical gap? | No. None of the completed passes identified a mathematical gap, circular dependency, vacuous existence assumption, incompatible hypothesis, failed constant inequality or normalization mismatch. Seven hidden dependencies were found and recorded, and two constant checks remain open (Section 4). |
| Is the reconstruction closed down to classical statements and named external theorems? | Not yet. Seven internal packages (PC-1 to PC-7) and five groups of small leaves (SL-1 to SL-5) remain (Section 3). |
| Have the external theorems been checked against the literature? | Not yet. This is a separate task ([`EXTERNAL_THEOREMS.md`](EXTERNAL_THEOREMS.md)). |
| Has the archive been checked in Lean? | Yes. On 21 November 2026 the Lean and Mathlib communities certified that both the statement and the proof of the Riemann hypothesis in the archive are correct ([joint statement](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)). This repository did not build the archive itself (see [`SOURCE_MANIFEST.md`](SOURCE_MANIFEST.md)). |

The remaining internal packages are not gaps. Each is a set of Lean theorems of the archive whose proofs exist and have not yet been read down to classical statements or to named published theorems. The archive contains no `axiom`, `sorry`, `opaque` or `native_decide` in any of its 175,187 files, and its final theorem has no hypotheses. For each package the statement, the place of use, the top of the proof and the mechanism are known, and the earliest unread proof is located.

## 2. What is reconstructed

The analytic frame is **proved** in the manuscript from classical statements.

- The window criterion (one-sided bound on windows implies a zero-free half-plane), with its sampled versions (§2).
- The Stepanov model over a finite field and the slope inequality over $\mathbb Z$ (§3).
- The accounting of the chain, the inert-prime identity, the passage from the excess to a bound at a point, and the assembly (§§4.1, 5, 7).
- The auxiliary primes from (C1) to (C8), and the host field (§§8, 9).

The geometric core is **reconstructed** from the Lean text in ordinary mathematics. The major mechanisms are the following.

- **Gain at inert primes.** The kernel law $\exp(-\Upsilon)\,U$, the normal form `BetaIsG`, the valuation estimate with credit $\alpha p/(p^2-1)$, and the route of the divisibility to `LinkDIV` (§4.5).
- **Loss.** The nondegeneracy statement `LPprime`, from standard monomial theory and the extremal projector (§4.5).
- **Height and CM period.** The height of the period map and the Chowla–Selberg mean period (§4.6).
- **Effective arithmetic Hilbert–Samuel inequality** `HSAt`, by a Chow-form determinant argument (§4.6).
- **Uniform mean-slope bound** `DeepStR`, its descent through the cutoff limit, the exact identity at good primes and the solution of its Frobenius recursion (§4.6).
- **Frame theorem** `FrameF` (§4.6).
- **Theorem P** and the radial identities behind the Bessel decay in `LinkS`, and the discrete-series counting engine (pre-trace formula, regions near, far, deep and rare) (§4.6).
- **The pairing order** `LinkS → PuNZ → MIstar2 → BesselId → LinkDIV, FrameF`, with no cycle (§1.2).
- **Automorphy for `VWin`**, including `P3core`, `x1`, `red`, `V0ok` and the rank-four argument (§4.6).
- **The torsion bound, `coreWA` and the Wach realization**, and the relay of Theorem B and the eight interior lemmas of Theorem C, with their constants (§4.6).
- **The seesaw value** `valX` with its six identities, the constant $c_V$ and root exchange (§4.7).
- **Integrality of theta series**, the descent of integral forms and the first marking (§4.7).
- **The host field and the nonvacuity route** through `HostEx` (§4.7).

## 3. Remaining internal audit packages

These are independent. A shared dependency is listed once, at the package that holds it. Lean names are given second, for locating the statements. File and line references for every item are in [`audit/Post_Closure_Internal_Residuals.md`](../audit/Post_Closure_Internal_Residuals.md).

### PC-1. Local finite-flat / integral Hodge–Tate package at a good prime

- **Mathematical role.** The uniform covolume bound rests on an exact identity at good primes. That identity reduces to two lattice relations at one prime $p$,
  $$\mathrm{ck}_k(\mathrm{Lie}_\tau,W_\tau)+\mathrm{ck}_k(\omega_\tau,\omega^{\mathrm{HT}}_\tau)=h_\tau-\frac{\lambda_\tau}{p-1},\qquad p^kh_\tau=h_{\mathrm{Fr}\tau}+\lambda_{\mathrm{Fr}\tau}.$$
  These relations and their consequences are reconstructed. The package is the proof that the lattice family of the $p$-torsion group scheme $G[p]$ satisfies the test-point facts behind them ($\ker H_\tau=(\zeta_p-1)^{-1}\mathrm{Lie}_\tau$, $\operatorname{im}H_\tau=\omega_\tau$, and the Frobenius step on coordinates), the construction of that lattice family, the calculus of Chern characters on models over a discrete valuation ring, model change, and the trivial flag.
- **Representative earliest blocker.** `FamEx.TestPt.testFacts`.
- **Reconstruction status.** Everything above the test-point facts is reconstructed. The proof bodies below are unread. Size medium to major, mechanism known (Raynaud's description of $\mathbb F$-vector space schemes with Fargues's integral Hodge–Tate sequence), risk moderate. If `testFacts` matches Raynaud with Fargues as a published statement, part of the package becomes an internal proof of a published theorem (boundary item V20).
- **Why it matters.** It feeds the level uniformity of `DeepStR`, and through it the covolume bound `L3` and `LinkDIV`. It is the largest package.

### PC-2. Global tower / covolume package

- **Mathematical role.** The existence of the cutoff tower of integral models and its qualitative axioms, the lattice-point transfer from the tower to the components of a deep cover, and the covolume statements beside the mean-slope bound. These include theta spanning at minimal level, a nonvanishing level determinant, and the Bergman constant behind $\log\beta\le4000z^3$.
- **Representative earliest blocker.** `exists_good_tower`. Open constant `SupModel.comp_bound` ($\log\mathrm{supConst}\le250f^2r^2L$).
- **Reconstruction status.** The top-level twist and comparison statements are reconstructed, and the arithmetic $250\cdot25/2=3125\le4000$ is checked. The tower producers and covolume leaves are unread. Size medium, mechanism known, risk low to moderate. The constants are killed by the cutoff limit, so the risk is to existence.
- **Why it matters.** It gives the tower axioms used by `DeepStR` and the fields of the covolume bound other than the height, which bound the slope of $R^\vee$ in (A4).

### PC-3. Shared Wach-module layer for Theorems B and C

- **Mathematical role.** The Wach-module calculus below the two local lifting theorems for alternating Hodge jumps. It consists of Berger's membership criterion along an arc with its level maps, the truncation of Frobenius images with its level expansion, the annihilating polynomials in a generator $\gamma$ of the cyclotomic group, three fields of a generic lifting package, and the case bodies and interior tools above them. Theorems B and C share this layer, and it is counted once.
- **Representative earliest blocker.** The Berger level layer, `LevC.secCrit_all` (Theorem B side) and `expCrit_D'` with `frobenius_power_congruence_local` (Theorem C side).
- **Reconstruction status.** The relay of Theorem B (its $\gamma$-equation, truncation, saturation, transport and uniqueness), the eight interior lemmas of Theorem C with their supplier, and the constants ($40\,\mathrm{Sg}$, $\sigma\le3\,\mathrm{Sg}$ for $l\ge11$, $32$ at $l=11$) are reconstructed. Several proof bodies in the shared layer are unread. Size medium and large in lines, mechanism known, risk low to moderate.
- **Why it matters.** Theorems B and C bound the exponents in `LinkN`, one of the two bounds of R4, on alternating arcs.

### PC-4. Finite-place seesaw harmonic-analysis package

- **Mathematical role.** The local harmonic analysis behind the seesaw value. It consists of the local double-step identity at a split place in the linear (Schrödinger) model of the Weil representation of $\mathrm{GL}_a\times\mathrm{GL}_b$, the laws at the level and unramified places, the class data on which the laws are stated, and small unit, Weil, bottom and anchor producers.
- **Representative earliest blocker.** `GlobalTheory.TriStep.tri`.
- **Reconstruction status.** The seesaw value with its six identities, the constant $c_V$, the cancellation at level places, the reduction to one split place, root exchange in type and the unit property of $c(\mathbf t)$ are reconstructed. The local proof bodies are unread. Size medium, mechanism known, risk low. If root exchange matches Ginzburg–Rallis–Soudry (boundary item V19), one leaf can stop at a published statement.
- **Why it matters.** It feeds `valX` and $c_V$, hence `MIstar2`, `BesselId`, `LinkDIV` and `FrameF`.

### PC-5. FR-12 lattice-counting package

- **Mathematical role.** Mean counts of primitive sublattices over a genus, the local factorization of the counting kernel, and the counting-engine leaves behind the discrete-series multiplicity count.
- **Representative earliest blocker.** `count_terms_gramClass_over_sublattice`, the shared first step of the loop-count lemmas.
- **Reconstruction status.** The pre-trace formula, its division into regions and the dependence of the later thresholds on the counting constants are reconstructed. The counting lemmas are unread. Size medium, mechanism known (Siegel's mean value theorem and Schmidt's counts), risk moderate. One compatibility check is open, between the level idempotents of the dimension clause of `LinkS` and the hypothesis of `NearUnip`.
- **Why it matters.** It gives the dimension clause of `LinkS` and the statement `LinkIRR`, which sit at the start of the pairing order.

### PC-6. Global record-construction package

- **Mathematical role.** The slope bound for the target lattice $R$ through denominators of zeta values and toric periods, the cores that build the stages of the record, the entries of `GlobalTheory.Fc.S0.OpenParameterStatements` (see source-name note below) and `ON`, and small leaves of the nonvacuity route.
- **Representative earliest blocker.** The sixteen leaves of `FUN` under `fun0Fit_of_leaves`.
- **Reconstruction status.** The host size lemmas, the assembly of the host and the nonvacuity route are reconstructed. The bespoke part is the slope bound `FUN`. The rest is assembly over named statements whose wiring is known. Size medium, mechanism known at statement level, risk moderate. One compatibility check is open, that the family constants can be chosen with $C_l\ge1.6\cdot10^{15}(C_g+4)$ and $\log\mathrm{rd}_E\le L/C_l$ together with the other record conditions.
- **Why it matters.** It gives the existence of the records, whose fields are the lattices, heights and local terms of R1 and R2, and `FUN` feeds `L3` and `LinkDIV`.
- **Source-name clarification (issue #3).** At the original source pin, `GlobalTheory.T.open0_of_unitary_group_hypotheses` concludes `GlobalTheory.Fc.S0.OpenParameterStatements`: see the [producer](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/OpenOrbitOfUnramifiedExponents.lean#L75) and [structure definition](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/GeometricWeakTies.lean#L39). The archive also contains a separate structure, [`GlobalTheory.Fc.S0.Open0`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/GeometricWeakTiesOfStrong.lean#L40). This clarification identifies the source references without asserting equivalence between the two structures.

### PC-7. FR-10 remainder (markings and integrality producers)

- **Mathematical role.** Two marking theorems for theta series of level structures, the dual marking of a self-dual hermitian lattice and the lift of marked points through level covers of the moduli space, together with seven producers of the integrality exponent and the Galois-side leaves behind them.
- **Representative earliest blocker.** `Dict.DualMark.dual_marking`.
- **Reconstruction status.** The descent of integral forms, the identification of the kernel at CM points, the first marking and the level-uniform exponent of `series_bound` are reconstructed. Size small to medium, mechanism known (elementary lattice algebra and level structures on PEL moduli), risk low to moderate.
- **Why it matters.** It gives the integral crystalline lattices used in `LinkN`.

### SL-1 to SL-5. Small leaves and bookkeeping

None of these involves a new mechanism.

- **SL-1.** Flag and test leaves of `DeepStR` (first `testRest_bound`), and small children of the sandwich construction.
- **SL-2.** Rank-four standard leaves and elementary interiors of the automorphy argument.
- **SL-3.** Frame lemmas of the model algebra on the `LinkS` side (first `core2`) and fields of `StepImportsQ`.
- **SL-4.** Producers and children in FR-18, FR-19 and FR-01/02 (patching, growth bounds and related leaves). The patching reference `detFin` denotes [`UpperTheory.V.Pa.Det.detFin`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/DeterminantPadicFree/DetFin.lean#L127). Under `PhiCond` and `Detects k S`, this theorem produces a finite subset of `S` satisfying the same detection condition.
- **SL-5.** Bookkeeping, including the choice between two declarations of `UniqGap`, a budget inequality with margin, and the trace of the existence route to the final theorem.

## 4. Open compatibility checks

1. **Record constants (PC-6, from PC-5).** The gap supply of the counting engine needs $C_l\ge2C$ and $\log\mathrm{rd}_E\le L/C_l$ of the family. With $C=8\cdot10^{14}(C_g+4)$ this requires $C_l\ge1.6\cdot10^{15}(C_g+4)$, compatibly with the other record conditions.
2. **`NearUnip` idempotents (PC-5).** The level idempotents of the dimension clause of `LinkS` against the condition of `NearUnip`.

## 5. What this status does not claim

- It is not yet a complete written proof. The internal packages of Section 3 still have to be written out in ordinary mathematics.
- It is not an independent verification of the remaining internal packages, of the published theorems that the archive quotes, or of the archive's own Lean proofs of statements of published type.
- It is not itself a Lean check. The reconstruction was done by reading the Lean source as text, and the formal check of the archive is the one certified by the Lean and Mathlib communities ([joint statement](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)).
- It does not certify that every internal definition of the archive means what its name suggests, beyond the definitions the manuscript states in ordinary terms.

## 6. Tasks that remain outside the reconstruction

1. Closure of the internal packages of Section 3.
2. Comparison of each external theorem with its published source in both directions ([`EXTERNAL_THEOREMS.md`](EXTERNAL_THEOREMS.md)), including locating the term behind each of the 54 `Fact` instances on the route.
3. The archive's own Lean proofs of published theorems (called Layer 3 in the audit).
4. Refereeing of Sections 7 to 9 of the manuscript.
