# Research status

**Release:** *On the Riemann Hypothesis*

**Date:** November 27, 2026

**Status:** incomplete, conditional working manuscript; ongoing research

## What this release claims

The manuscript gives a human-readable specialization of the Alpöge–Claude route to the classical Riemann hypothesis. Section 2 proves a one-sided analytic criterion: a suitable upper bound for the smoothed prime-sum error on arbitrarily large power windows excludes zeros to the right of the corresponding exponent. The later sections organize a conditional route to that bound.

The manuscript does **not** claim:

- an unconditional proof of the Riemann hypothesis;
- an independently verified conventional proof of every arithmetic input;
- independent verification of the manuscript as a whole;
- equivalence between every manuscript construction and the corresponding construction in the formal source; or
- novelty or priority for the Alpöge–Claude argument.

The hypotheses labeled **Open input** in the manuscript remain part of its stated dependency boundary.

## Known Section 7 incompatibility

Section 7 fixes the node gap

\[
h_0=2\lceil x^{402}\rceil.
\]

The source defines the [scale parameter](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean#L17) and imposes a [node-spacing bound](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowNodeGapBlockLength.lean#L56). The standard record uses \(T_O=\lceil x^{377}\rceil\) and requires

\[
4T_O^2+2t_r\le h_0.
\]

For \(x\ge2\), the left side is at least \(4x^{754}\), while the chosen \(h_0\) is at most \(2(x^{402}+1)<4x^{754}\). The current Section 7 family therefore cannot simply be identified with that standard source record. The manuscript now flags this point explicitly. It does not claim a fix.

The source allows a larger polynomial gap, and such a gap can remain inside the asymptotic node ranges used by the manuscript. What is still missing is one verified choice carried through the corresponding integral lifts, period maps, metrics and height estimates on the same selected family.

## Direct route to the Section 2 criterion

A trace through the pinned source revision `40e56bab026552e089d7afcfeff08d2defb9c005` supports the following conditional observation. If the arithmetic and geometric producers in the released source are accepted, its window comparison specializes at the trivial character to a bound for the same smoothed prime sum \(G(x)\) used in Section 2, on arbitrarily large windows \([Y,Y^{3/2}]\), before the source applies its own zero-free argument.

Relevant source statements include:

- [`LevelGmLeOnFamilyScales.lean`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean#L22-L30), the window comparison;
- [`StatementOC.lean`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/StatementOC.lean#L9-L13), the definition of the zeta prime sum; and
- [`TopWin.lean`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean#L23-L32), the window quantifiers.

This is a source-level dependency trace, not an independent human proof of the upstream arithmetic. No new Lean replay was performed for this release, and a separate candidate extraction of the specialized corollary has not been compiled.

## Current reconstruction priorities

These are priority bottlenecks, not a complete list of every open hypothesis in the manuscript.

1. **Uniform Selmer-window bound.** The relevant source branch requires a bound uniform over the selected fields, all primes including \(2\), and a growing range of twists on one window. Finiteness at each fixed prime is not enough. The precise source-level shape is recorded in [`ExistsPageN.lean`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean#L12-L49).
2. **Rank-three automorphy argument.** One proposed conventional route to the generic odd-plus part of the Selmer estimate needs automorphy and finiteness for qualifying ordinary rank-three lifts with reducible residual constituents. A direct application of the published lifting theorem examined during the audit does not by itself verify the hypotheses used in that route. This is a reconstruction problem, not a claim that the formal source lacks a proof term.
3. **Uniform covolume estimate.** The standalone manuscript needs a mean-slope/covolume estimate uniform as the level of deep covers varies. A fixed-model arithmetic Hilbert–Samuel estimate does not by itself provide that uniformity. The released source has a separate covolume construction; translating and checking it conventionally remains open.

Other open inputs are stated at their points of use, including integral realization of the lift chain, period-map and frame comparisons, Bessel estimates, finite corrections, twisted congruence defects and simultaneous selection on the required windows.

## Verification record for this release

- The source files in this directory compile to the accompanying PDF.
- The PDF title remains *On the Riemann Hypothesis*.
- The compiled page count and file hash are recorded in the release commit and can be checked with `pdfinfo` and `shasum -a 256`.
- The wording above distinguishes statements proved in the manuscript, conditional deductions, source-level traces and unresolved conventional reconstructions.
- No push is implied by this local release commit.
