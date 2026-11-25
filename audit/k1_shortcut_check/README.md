# The K1 shortcut (Section 17, "The effective cohomology bound"): a check, and the archive's own route

This directory records an outside check of the shortcut and a comparison with the Lean archive.
It responds to the request in the README for a check of §17.4.3 and to the questions in #7.

**How it was made.** Prepared with Claude (Anthropic) working in Claude Code, at manuscript revision `aa9c86b`.
No specialist has reviewed it. The Lean files here were compiled; the comparison with the two cited papers
was made against their arXiv versions (1406.5953v3 and 1501.07561v2). Weibel's Theorem 73 and Schmidt's
Proposition 2.3 were **not** opened.

## 1. Result of the check

No error was found in the argument as written. Specifically:

- **Generators.** `A/pA` embeds in `H²(G_{L,S}, μ_p)`; the Kummer sequence and the absence of real places give
  `r log p ≤ log h_L + d log p`. Minkowski and the ideal count give `h_L ≤ 2^{3d} D` (`4^d · ζ(2)^d ≤ 8^d`).
- **Level three.** The binomial argument for torsion-freeness is correct for `q ≠ 3` and for `q = 3`.
- **Cell count.** A cell with minimal set `U` is the relative interior of the face cut out by any subset of `U`
  whose augmented equations span those of `U`, so at most `s+1` vectors determine it. The count
  `(1+M)^{(s+1)²}` per degree follows.
- **Torsion and transfer.** Column norms at most `i+2`, Hadamard on a maximal minor, and `I·T` kills the
  torsion of `H_i(Γ)`, including at primes dividing `I`.
- **Assembly.** `p^{i+4}·I·T` kills `A`. Every displayed inequality holds for `u ≥ 4`.
- **The constant.** The argument gives `C_K = 24`; the last displayed inequality already shows it.

## 2. On the questions in #7

**Stability range (question 1).** Bayer-Fluckiger–Emery–Houriet use the same `N`: their §3.1 says the homology
of `GL(O_F)` equals that of `GL_N(O_F)` for `N ≥ 2n+1`, citing van der Kallen and Maazen (their reference [12],
Theorem 4.11). The archive is more conservative: `KStability` gives an isomorphism from `n ≥ 2i + s + 2` under
`StableRangeLe R s`, with `s = 2` for Dedekind domains (`dedekindSR`), which is why the formal route uses
`GL_{4e+4}`. Changing `N` to `2i+2` or `4e+4` in the shortcut changes the constants polynomially and
`C_K = 24` still holds with room to spare.

**Hypotheses of the two external inputs (question 2).**

| Input | Statement in the source | Hypotheses | Met here |
|---|---|---|---|
| Bayer-Fluckiger–Emery–Houriet, Cor. 5.2 | There is `Φ ⊂ L` with `γ·M(L,h) ⊂ Φ` for some `γ ∈ GL_N(O_F)`, for every well-rounded `h`, and `card Φ ≤ N^{3N²d²} d^{5N³d⁴} |D_F|^{9N³d³}` | `L` a free `O_F`-lattice of rank `N ≥ 5`, `F ≠ ℚ` | Yes: `N = 2i+1 ≥ 5`, `L` totally imaginary |
| Mathew, Thm. 6.3 | For `X` an `(m−1)`-connected infinite loop space, the kernel of the unstable Hurewicz map `π_n(X) → H_n(X;ℤ)` is annihilated by `exp(τ_{[1,n−m]} S⁰)`; its `p`-exponent is at most `⌈(n−m)/2⌉+3` for `p = 2` and `⌈(n−m+3)/(2p−2)⌉+1` for `p > 2` | `X` an infinite loop space, `(m−1)`-connected | Yes with `X = BGL(O_L)^+`, `m = 1`, `n = i` |

Mathew's theorem is stated for the unstable map of an infinite loop space, so no passage from a spectrum-level
statement is needed. Bayer-Fluckiger–Emery–Houriet also confirm that the face relation used in the cell count is Ash's:
`C(h') ⊂ C(h)` exactly when `M(L,h') ⊃ M(L,h)` (their §2.3).

**Use site (question 3).** In the archive the bound is `UpperTheory.V.LemmaK`, consumed through
`UpperTheory.V.HV.U.lemmaK` by `hostVanE` (`HeightAndVanishing/FinalU.lean`), and by
`LevelCohomology/IntIffNorm.lean` and `UnitaryThreeGroups/KatoUse.lean`. Where the manuscript consumes it
was not checked.

## 3. The statement is the archive's `LemmaK`, and the archive's proof has the same three parts

`AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean` states, for `L` totally complex with a primitive
`l`-th root of unity (fourth root when `l = 2`) and `e ≥ 1`:

```lean
Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤ Real.exp ((2 * e * n) ^ CK * Real.log (2 * D))
```

with `n = [L:ℚ]` and `D = |disc L|`. This is the displayed bound of the shortcut.

| Part | Shortcut | Archive |
|---|---|---|
| Generators | Kummer theory and the Brauer group: `#(A/pA) ≤ h_L · p^d` | Poitou–Tate and a Tate–Shafarevich count: the same bound, `Reduction.card_mod_le` |
| Link to `H_*(GL_N)` | Quillen–Lichtenbaum, stability at `N = 2i+1`, Mathew's Hurewicz bound (exponent linear in `e`) | `KBridge`: stability at `N = 4e+4`, Arlettaz-type exponent `l^{c(2e)}`, `c(m) = m(m+5)/2` |
| Torsion of `H_i(GL_N(O_L))` | Level-three subgroup, transfer, the cell count of Cor. 5.2, Hadamard: an exponent only | `UpperTheory.V.KT.torsBound`: a bound on the order of the whole torsion subgroup, proved in Lean with its own simplex count and `mink3` for the stabilizers |

So the shortcut replaces the archive's formal proofs of the second and third parts by two citations, and
its generator count by a more elementary one.

## 4. A standalone extract of the formal torsion bound and of stability

Two of the archive's ingredients depend on little else and compile on Mathlib alone:

| Theorem | Modules | Lines | Manifest |
|---|---:|---:|---|
| `UpperTheory.V.KT.torsBound : K.TorsBound (2 * 24 + 1)` and `tors_le` | 129 | 10,482 | `MANIFEST-torsion.txt` |
| `PositivityTheory.v8.KStability.kStability : Published.KStability` | 79 | 6,116 | `MANIFEST-stability.txt` |

Together they are 208 modules and 16,598 lines out of the archive's 175,187 modules. Copied unchanged
into a fresh project against the archive's Mathlib revision (`0df444a3`, Lean v4.33.1), they built in under
five minutes on a laptop, and `#print axioms` for `torsBound`, `tors_le`, `kStability` and `mink3` reports
`propext`, `Classical.choice`, `Quot.sound`.

The archive's files are not copied into this repository, because the archive states no licence. `extract.sh`
copies the listed modules out of a reader's own unpacked archive:

```
./extract.sh <archive>/lean/src MANIFEST-torsion.txt extract
./extract.sh <archive>/lean/src MANIFEST-stability.txt extract
```

The rest of the archive's route to `LemmaK` is not small: the import closure of `GeneratorCountTuples/Reduction.lean`
is 911 modules and about 152,000 lines, and that of `LemmaKOfPublished.lean` about 23,700 modules.

## 5. The arithmetic of the shortcut in Lean

`lean/` is a small project (541 lines, same toolchain and Mathlib revision as the archive).

- `K1/Arithmetic.lean`: the class-number estimate, `r ≤ u⁴Y`, the counting paragraph (`log I ≤ u⁵`,
  `log B ≤ u²³Y`), and the final assembly.
- `K1/TorsionFree.lean`: an integer matrix congruent to 1 modulo 3 with `g^k = 1`, `k > 0`, is 1.
  (The archive's `mink3` is stronger.)
- `K1/Main.lean`: `effective_bound`, which derives `log |A| ≤ exp(u²⁴ · log 2D)` from five hypotheses.

The five hypotheses are numerical statements of what the manuscript takes from mathematics that is not
formalized here: the generator count, the class-number bound, the index of the level-three subgroup, the
bound of Cor. 5.2 in the form `log(1+M)`, and the exponent bound `p^{i+4}·I·T` with `log T ≤ B log(i+2)`.
The project proves only that the conclusion follows from them. It builds with no `sorry`, and
`#print axioms K1.effective_bound` reports the three standard axioms.

```
cd lean && lake exe cache get && lake build
```

## 6. Suggested rows for `docs/EXTERNAL_THEOREMS.md`

If the shortcut is kept, its inputs belong on the ledger. The comparison status that this check supports:

| External input | Source | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Bound on the set `Φ` of minimal vectors | Bayer-Fluckiger–Emery–Houriet, Doc. Math. Extra Vol. Merkurjev (2015), Cor. 5.2 | Cell count in the K1 shortcut | Yes (free lattice, `N ≥ 5`, `F ≠ ℚ`) | `partially compared` (statement and hypotheses; proof not read) |
| Kernel of the unstable Hurewicz map | Mathew, Algebr. Geom. Topol. 16 (2016), Thm. 6.3 | Exponent `p^{i+4}` in the K1 shortcut | Yes (`X = BGL(O_L)^+`, `m = 1`) | `partially compared` |
| Stability at `N ≥ 2n+1` | van der Kallen; Maazen, as cited in Bayer-Fluckiger–Emery–Houriet §3.1 | `N = 2i+1` in the K1 shortcut | Through the secondary citation only | `source match pending` |
| `K_{2e}(O_L){p} ≅ H²(O_L[1/p], ℤ_p(e+1))` | Weibel, Handbook of K-theory, Thm. 73 | Identification of `A` | Not opened | `source match pending` |
| Étale versus restricted-ramification cohomology | Schmidt, Doc. Math. 12 (2007), Prop. 2.3 | Identification of `A` | Not opened | `source match pending` |
