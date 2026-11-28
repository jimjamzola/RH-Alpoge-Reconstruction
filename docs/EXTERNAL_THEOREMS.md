# External theorems: the verification boundary

> **Note, 22 November 2026.** The comparison status below is that of 21 November 2026, before the source-fidelity audit began. That audit has since matched, corrected or reclassified part of this boundary, but not all of it. See [`STATUS.md`](STATUS.md), Section 5.

This file lists the named published or classical theorems at which the reconstruction stops. It is drawn from [`audit/Post_Closure_Verification_Boundary.md`](../audit/Post_Closure_Verification_Boundary.md), which is the authoritative and more detailed list. Internal theorems of the archive whose proofs are still unread are a separate list, in [`RECONSTRUCTION_STATUS.md`](RECONSTRUCTION_STATUS.md). The two lists are disjoint.

**No fidelity check against the literature has yet been made for any entry.** Every entry still needs a comparison in both directions. The archive's statement must not be stronger than the published theorem, and the published hypotheses must hold where the archive applies it.

## 1. How to read the table

Column *Hypotheses matched?* records whether anyone has compared the archive's statement and its use with the published hypotheses, and "not recorded" means that the audit recorded no comparison. Column *Verification status* uses the following terms.

| Term | Meaning |
|---|---|
| `source match pending` | The exact published source has not been located or opened. The attribution was recorded from memory or through a secondary source. These entries most need a literature match. |
| `not compared` | A source is named, and the statement has not been compared with it. |
| `partially compared` | A specific feature (a constant, a normalization, a hypothesis) has been checked, and the full comparison has not been made. |
| `proved in archive` | The archive contains its own Lean proof of a statement of published type. The reconstruction stops at the published statement. The archive's proof is a separate task (Layer 3), and the comparison with print is still pending. |
| `classical` | A standard statement (textbook level). It is still on the boundary, and its exact form should be confirmed. |

Some inputs enter the archive through `instance : Fact _` declarations (54 in the archive). The final theorem has no instance binders, so each is discharged by a term, but a `Fact` hides the input from the statement that uses it. Locating the term for each instance on the route is part of the verification (V16).

## 2. Priority checks

| # | External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|---|
| V1 | Primes in progressions with relative error, (C7) = `PNTAPRelW` | Gallagher, Invent. Math. 11 (1970), Thm 7, at level $\max(M,e^{\sqrt{\log X}})$ with partial summation. The form was taken from Thorner–Zaman (arXiv:2108.10878, (3.3)–(3.4)) and arXiv:2508.16400, Lemma 7.3 | Second stage of the auxiliary primes (§8) | No. Derivation written, not compared line by line with Gallagher, including the two exceptional-zero windows | `source match pending` (Gallagher's paper not opened) |
| V2 | Prime ideal theorem for ray classes of $\mathbb Q(\sqrt{-d})$ in the Landau–Page range, `ShortNorm` | Hecke–Landau; Davenport ch. 20 for $\mathbb Q$; Fogels, Lagarias–Montgomery–Odlyzko, Weiss, Thorner–Zaman | Primes $p=\pi\bar\pi$, $\pi\equiv1\pmod M$, for the host field; used with $h=1$, $\log B\le10(\log Y)^{2/5}$ | No | `source match pending` (citation from memory); proved in archive by an elementary convolution |
| V3 | `GdEndAlt` and `SmallClassNumbers.Bound` against Skinner–Wiles, Thorne, Allen–Newton–Thorne, and Soulé | Skinner–Wiles; Thorne; Allen–Newton–Thorne; Soulé | Weakened Vandiver statement; residually reducible automorphy | No. The test against $K_4(\mathbb Z)$, $K_8(\mathbb Z)$ was not run. These are comparisons: the archive proves `GdEndAlt` internally (Section 4) | `not compared` |
| V4 | Kato's theorem in the range used, with `exists_admissible_hecke_projection_nonvanishing` | Kato; Rubin | Nonvanishing $L$-value in the Selmer bound | No. The $L$-value must meet Kato's hypotheses | `not compared`; proved in archive on the operative branch |
| V5 | Siegel–Weil formula, `SiegelWeilStd`, `EisBL` | Siegel–Weil; Gan–Takeda §7.1 | Theta tower, records | Partially. Constant matched with Gan–Takeda §7.1. Tamagawa number 2, probability Haar measure and holomorphy at $s_0=(m-n)/2$ to confirm | `partially compared` |
| V6 | Siegel–Weil in the convergent range, two declarations `SiegelWeilUnitaryConvergent` | Weil; Ichino | `RowDiag` (Fourier-coefficient form, $2n<M$, $n=1$); doubling form | No. The doubling form needs its own check | `not compared` |
| V7 | Published bundles of the covolume branch: `PublishedHodgeBundleTheorems` (28 fields), `HSCore.Quoted` (8), the eleven statements under `deepStR_of_use`, `GrothendieckDeformation`, `SiegelToroidalIntegral`, `ToroidalForFanKS`, `SemiAbelianLieSeminegative` | Kawamata–Viehweg vanishing and the other fields of `HSCore.Quoted`; Nadel vanishing, principalisation, Hirzebruch–Mumford, Faltings–Chai, Lan, Grothendieck–Messing as fields of `PublishedHodgeBundleTheorems` | Covolume bound (`HSAt`, `topCovolG_alt_alt`, PC-2) | No. Several fields not unfolded. This is the largest published bundle | `not compared` |
| V8 | Wach and Berger clauses (`p3`, `p4` with rational converse, `p5`, `p9`, `p10`, `SATcore`, `F1`, `F2`, $\Delta$-invariant forms) | Wach (1996); Berger (2004) | Relay of Theorem B, half of `ArcCore`, `LinkN` | Partially. Ring relations of `p9` ($\pi_0(\zeta_p-1)=-p$, $q=\varepsilon q_A$) checked classically | `proved in archive`; `partially compared` |
| V9 | Local class field theory, `LocAb` / `LocCFT`: $\sum_v d'_v=[L^+:\mathbb Q]$ | Local class field theory | Exponent $D_0$ of FR-01 (cancels exactly); rank four through `b1Ar` | No | `not compared` |
| V10 | Standard monomial theory in exact integral form; extremal projector constants | Standard monomial theory; Asherova–Smirnov–Tolstoy, Zhelobenko | `LPprime` (loss side) | Classical in substance; constants unchecked | `proved in archive`; constants `not compared` |
| V11 | Slope bound $\mu_{\max}(\mathrm{Lie})\le C_s\log(2+\mathrm{rk}+\max(-\deg,0))$, `SlopeBoundSt` | Candidate sources Bost, Graftieaux, Gaudron–Rémond | Constant $C_h$ of `DeepStR` | No. Printed source not matched | `source match pending`; proved in archive |
| V12 | Route-level leaves of `deep_slim_use` | Hironaka (resolution, principalisation in characteristic zero); inverse Poincaré–Lelong; `HSUse`; `MoriwakiBigStatement`; Fargues (`FarguesExact`, `FarguesHodgeTate`); Zarhin's trick (`ZarhinStatement`); `NefRR` | `DeepStR`; `FarguesHodgeTate` and `ZarhinStatement` are the stopping points of PC-1 | No | `not compared` |
| V13 | Rallis's constant-term formula for theta integrals in the convergent range; `SiegelSetUnitary` | Rallis (1984); Kudla–Rallis | `GenBig`, `GenAniso`, `GenSmall` of the theta tower; `WeilConv`, `KDecay` | No | `not compared` |
| V14 | Weighted integrability of discrete-series matrix coefficients, `CoefWeightedLoc` | Harish-Chandra; Trombi–Varadarajan type | `Wu_spec` (through a `Fact` instance), counting engine | No | `not compared` |
| V15 | Thorne's localized $R=\mathbb T$ at nice points, $n=3,4$, clause `P1core` | Thorne | Rank four, at every link through `b1Ar`, `b2Ar`, `raw`, `N4` | No | `not compared` |
| V16 | The 54 `Fact` instances | (various) | Throughout | Term for each instance on the route not yet located | open |
| V17 | Nine named premises of `GlobalTheory.EX.hostEx_of_zeroFreeRegion`. `RayField` enters a subsequent record construction. | Historical published-input route | OFF_ROUTE for this host theorem and its three named descendants. RH uses `UpperTheory.Top.supplyChi` with a character-specific window. | [Dependency evidence](../review/evidence/V17.tsv) | Three named predicates occur elsewhere in RH: `LogDerOne`, `ZeroCount`, `ZFRDirichlet`. Trace other formulations separately. |
| V18 | Prime number theorem for primitive characters in the form of `psi_thin`, $\lvert\psi_0(u,\chi)\rvert\le Cu(\log u+\lambda)^2\exp(-c\log u/(\lambda+\sqrt{\log u}))$ outside an exceptional zero | de la Vallée Poussin's zero-free region; truncated explicit formula; Davenport ch. 14, 17, 19, 20 | `QH.thinH`, host field | No | `source match pending` (cited from memory); proved in archive |
| V19 | Root exchange for $\mathrm{GL}_n$ over a nonarchimedean local field; linear-model seesaw | Ginzburg–Rallis–Soudry, *The descent map from automorphic representations of GL(n) to classical groups* (2011), Ch. 7; Kudla, *Seesaw dual reductive pairs* (1984) and *Notes on the local theta correspondence* (1996), §§1–3 | `exchange_isPos`; candidate stopping point for the PC-4 leaf `exchange_support` | No. The archive proves root exchange internally (`RootEx`) | `not compared` |
| V20 | Raynaud's classification of $\mathbb F$-vector space schemes with Fargues's integral Hodge–Tate sequence | Raynaud, *Schémas en groupes de type (p, …, p)* (1974); Fargues | Candidate stopping point for `testFacts` (PC-1). Not an input of the archive today | No | candidate; `not compared` |

## 3. The boundary by family

### Analytic frame, auxiliary primes and host field

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Landau's theorem; functional equations; (C1)–(C6), (C8) | Landau; as cited in the manuscript | Window criterion, auxiliary primes (§§2, 8) | Quoted in the form used; (C2), (C4), (C5) not compared | `not compared` |
| Gallagher's prime number theorem, (C7) | Gallagher (1970) | §8 | See V1 | `source match pending` |
| Landau–Page prime ideal theorem for ray classes (`ShortNorm`, `NormPrimes`, `LevelPrime`) | Hecke–Landau; Page; see V2 | Host field | See V2 | `source match pending` |
| Linnik's theorem (`SmallOne`, via `primesRel_holds`) | Linnik (1944) | Least prime $\equiv1\bmod M$ at most $M^A$, relative form for $X\ge M^{c_2}$ | No | `not compared` |
| Chebyshev $\psi-\vartheta\ll\sqrt X$; Dirichlet's theorem | classical | §8 | not recorded | `classical` |
| Analytic inputs for character-specific hosts | Short-interval lower bound for imaginary quadratic norm primes and relative error for primes in progressions, among the inputs | Character-specific host construction at window 3/2 | [Dependency evidence](../review/evidence/RH-paths.tsv) | Direct source and dependency witnesses identified. Full conventional proofs and their hypotheses remain under review. |
| $\int_1^\infty(\psi(u)-u)u^{-2}\,du=-1-\gamma$ | from the Laurent expansion of $-\zeta'/\zeta$ at $s=1$ | `g_integral` | not recorded | `classical`; the archive proves `l21a` |
| $L(1,\chi)\ne0$ and continuity at $s=1$; Dirichlet character theory; quadratic reciprocity; Galois theory of $\mathbb Q(\zeta_N)$; quadratic Gauss sums | classical; Mathlib | `QH.small_zeros`, host moduli | Spot-checked | `classical` |
| Behrend's construction | Behrend (1946) | `thickFrame2`, `hostThickExists` | Proved in the manuscript; key identity checked symbolically | proved in manuscript |

### Gain and loss (theta-lift divisibility, `LPprime`)

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Global Artin reciprocity, ray class fields, main theorem of CM; good models of CM elliptic curves at $l\ge5$, $l\nmid d$ | classical CM theory | Gain at inert primes (`CM2`, FR-19) | Use read | `not compared` |
| Weak approximation; Jacobowitz's classification at unramified and inert primes | Jacobowitz | `intInert_of` | No | `not compared` |
| Standard monomial theory, Pieri, branching, Weyl dimension formula; extremal projector; straightening law (Doubilet–Rota–Stein, De Concini–Eisenbud–Procesi) | as named | `LPprime`, `adm7` | Constants unchecked (V10) | `proved in archive` / `not compared` |

### Slopes, frame theorem and covolumes

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Harder–Narasimhan theory; slope inequality | Stuhler, Grayson, Bost, Gaudron | `FrameF`, (A3) | Hand proof in the audit | `not compared` |
| Kawamata–Viehweg vanishing; Bertini for simple zeros of generic sections over number fields; Chow forms | as named | `HSAt` (`HSCore.Quoted`) | See V7 | `not compared` |
| Chowla–Selberg formula; Kronecker limit formula | Chowla–Selberg (1967) | Mean period in (A4) | Normalization consistent; Colmez conjecture not used | `proved in archive`; `partially compared` |
| Fargues's integral Hodge–Tate sequence; Zarhin's trick; quotients by finite flat group schemes | Fargues; Zarhin | `familyExistsPos_holds`, PC-1 | See V12, V20 | `not compared` |
| Raynaud's classification of $\mathbb F$-vector space schemes | Raynaud (1974) | Candidate for PC-1 | See V20 | candidate |
| Layer 3 statements under `DeepStR`: arithmetic intersection theory (Gillet–Soulé, Burgos–Kramer–Kühn type), Zhang's successive minima, arithmetic Hilbert–Samuel bounds, Moret-Bailly's key formula, toroidal compactifications and integral models, strong approximation, Hirzebruch–Mumford proportionality, heights of flag varieties | as named | `DeepStR`, PC-2 | No | `proved in archive` |
| Slope bound of Bost type | Bost, Graftieaux, Gaudron–Rémond | `DeepStR` | See V11 | `source match pending` |
| Mertens-type bound $\sum_{p\le B}\log p/(p-1)\le\log B+3.4$ | elementary | `sum_log_div_pred_SB` | Checked numerically | `classical` |
| Ray class fields; product formula; Mahler measure; Hadamard; Schwartz–Zippel; Dedekind's complementary module | classical | Covolume bound | not recorded | `classical` |

### `LinkS`, `LinkIRR`, Theorem P and discrete-series counting

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Quantum minors, Capelli's theorem, centrality of the quantum determinant | Molev, *Yangians and Classical Lie Algebras*, ch. 1, 7 | Theorem P, radial identities | Identities confirmed numerically in nine low-rank cases; RLL relation and quantum determinant checked symbolically | `partially compared` |
| Cauchy–Binet; Laplace expansion; multivariate Lagrange interpolation; A. A. Markov's inequality; Cauchy's estimate; Fatou; dominated convergence | classical | Theorem P | not recorded | `classical` |
| Siegel–Weil in the convergent range | Weil; Ichino | `RowDiag` → `PuNZ` | See V6 | `not compared` |
| Siegel mass formula in ratio form; Siegel mean value theorem; mean counts of primitive sublattices over a genus | Siegel, Ann. of Math. 46 (1945); W. M. Schmidt, Duke Math. J. 35 (1968) | Counting engine, PC-5 | No | `not compared` |
| Schmid's characterisation of discrete series; Harish-Chandra (square integrability, formal degree, finiteness); Borel–Harish-Chandra; Schur orthogonality; weighted integrability | Schmid; Harish-Chandra; see V14 | Discrete-series counting | No | `not compared` |
| Landherr with Jacobowitz; rank-one class number formula; Louboutin; Minkowski | as named | Lattice and volume bounds | Louboutin: archive form follows | `proved in archive` / `partially compared` |
| Green's characters of $\mathrm{GL}_r(\mathbb F_g)$; Gelfand–Graev multiplicity one; degenerate Whittaker models (Zelevinsky, Gelfand–Kazhdan); uniqueness of Bessel models (Jiang–Sun–Zhu, Sun–Zhu) | as named | Bessel periods | No | `not compared` |

### Automorphy and Galois cohomology (`VWin`)

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Greenberg–Wiles; local Tate duality; local and global Euler characteristic; Poitou–Tate | Greenberg–Wiles; Tate | `x1` ($h^2+h^0+2d\le h^1$), `CohP` | No | `not compared` |
| Mazur's presentation lemma; Noetherian finiteness under Mazur's $\Phi_l$ condition | Mazur | `obs_pres`, `Det.matFg` | not recorded | `proved in archive` / `classical` |
| Chebotarev density theorem; Brauer–Nesbitt | classical | `cheb_holds`, `V0ok` | not recorded | `classical` |
| Bellaïche–Chenevier generalized matrix algebras | Bellaïche–Chenevier | Residually multiplicity-free Cayley–Hamilton algebra | Hypotheses match (audit) | `partially compared` |
| Taylor–Wiles–Kisin patching | Taylor–Wiles; Kisin | `pmodEx` | not recorded | `proved in archive` (through `litN`) |
| Hida theory for definite unitary groups, $2\le n\le4$ | Hida; Geraghty | Automorphy | not recorded | `proved in archive` |
| Thorne's localized $R=\mathbb T$ | Thorne | `P1core` | See V15 | `not compared` |
| Kato's Euler system; Rubin | Kato; Rubin | See V4 | See V4 | `proved in archive` |
| Adjoint Selmer vanishing | Allen; Newton–Thorne | `AdjointLiftingTheorem` | not recorded | `proved in archive` |
| Skinner–Wiles, Thorne, Allen–Newton–Thorne (residually reducible automorphy) | as named | Comparison only for `GdEndAlt` | See V3 | comparison, not an input |
| Soulé; Dwyer–Friedlander; Borel; Clozel | as named | Exponent $l^{c(2e)}$, $c(m)=m(m+5)/2$ | Archive weaker than Soulé (safe direction) | `partially compared` |
| Ferrero–Washington | Ferrero–Washington | $\mu=0$ behind `Bounds` in `x2` | Field abelian over $\mathbb Q$ | `partially compared` |
| Mazur–Wiles, Rubin; Stickelberger; Herbrand-type triviality | as named | Kolyvagin system of Gauss sums; `CorX` | No | `not compared` |
| Automorphic induction and cyclic base change (Arthur–Clozel); Labesse; Ramakrishnan's $\mathrm{GL}_2\times\mathrm{GL}_2\to\mathrm{GL}_4$; Deligne–Serre; Gelbart–Jacquet | as named | Seeds, descent | No | `not compared` |
| Galois representations of RACSDC representations, local–global compatibility, purity | Harris–Taylor, Shin, Chenevier–Harris, Caraiani; Clozel | Clauses `pur`, `aut` | No | `not compared` |
| Krull, Nakayama, prime avoidance; Grothendieck connectedness (SGA 2, XIII); Serre's multiplicities | classical | `redDim`, `clChain`, `rulePos` | not recorded | `classical` / `proved in archive` |

### Local $p$-adic Hodge theory (`LinkN`, Theorems B and C)

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Tate's results on $H^1(H_K,\mathcal O_C)$ and the normalized decomposition; Ax–Sen–Tate | Tate (1967) | Torsion bound, Theorem TB (a) | Explicit-constant versions derived | `proved in archive` |
| Hodge–Tate decomposition of de Rham representations; $\mathrm{gr}^iB_{\mathrm{dR}}^+\cong\mathbb C_p(i)$ | Sen (1980); Fontaine (1994) | Theorem TB | not recorded | `proved in archive` |
| Tate's filtered invariants; Fontaine's finiteness and de Rham property | Tate; Fontaine | Step A of Theorem TB (a) | No | `not compared` |
| Bloch–Kato, Cor. 3.8.4; dual exponential; crystalline extension criterion | Bloch–Kato (1990) | $H^1_f$, `exponent_le`, Theorem C record | No | `not compared` |
| Local Tate duality; local Euler characteristic | Tate (1962) | Theorems B and C producers | No | `not compared` |
| Prismatic F-crystals for crystalline lattices | Bhatt–Scholze (2023), Thm 1.2 | Crystalline lattices | No | `not compared` |
| Wach lattices; specialization at $\zeta_{p^n}-1$; level maps and Hodge filtration; Berger's membership criterion | Wach (1996); Berger (2004) | See V8; candidate stopping points for PC-3 | See V8 | `proved in archive` |
| Herr complex; class formula; naturality | Herr (1998); Benois (2000); Berger (2003) | `local_lemmas_of_literature`, Theorem C | not recorded | `proved in archive` |
| Exactness and strictness of $D_{\mathrm{cris}}$; $D_{\mathrm{dR}}=D_{\mathrm{cris}}\otimes K$; full faithfulness and exactness of $D$ | Fontaine (1990, 1994) | `SplitCore`, Theorem C | not recorded | `classical` |
| Wach module as value of the prismatic F-crystal | Abhinandan (2023); Du–Liu–Moon–Shimizu (2022) | Wach realization | not recorded | the archive reproves it |
| Lifting-the-exponent lemma; Legendre; Kummer; Weierstrass preparation in $\mathcal O[[\pi]]$; $\mathcal O[[\pi]]^\Delta=\mathcal O[[\pi_0]]$ | classical | Ring relations, case exponents | Proofs written in the audit | `classical` |
| CM theory for the Weber function; Shimura; Deligne | as named | `mul_twist_mem_intForms` | No | `not compared` |
| Local Langlands for $\mathrm{GL}_n$; Bernstein–Zelevinsky; Moy–Prasad | as named | Classification, genericity, depth zero | No | `not compared` |
| Class field theory (characters with prescribed local components) | classical | `LinkN` | not recorded | `classical` |

### Theta correspondence, seesaw and records

| External input | Source / authors | Used in | Hypotheses matched? | Verification status |
|---|---|---|---|---|
| Siegel–Weil, `SiegelWeilStd`, `EisBL` | see V5 | Theta tower | Constant matched | `partially compared` |
| Rallis's constant-term formula; Kudla–Rallis | Rallis (1984); Kudla–Rallis | See V13 | No | `not compared` |
| Rallis inner product formula; doubling method | Rallis | `GlobalTheory.LiftRows.AForm`, `GlobalTheory.LiftRows.BForm`; FR-14 lower-bound interface `GlobalTheory.BigTop.LambdaLowerBound₂` (see source-name note below); `nonZeroBottom_of_doubling_integral` | No | `not compared` |
| Yamana | not named | The boundary does not name Yamana. Whether the doubling-form check V6 needs his results has not been determined | not recorded | not on the boundary |
| $(\mathrm{GL}_a,\mathrm{GL}_b)$ Howe duality on $\mathbb C[M_{b\times a}]$; multiplicity-one branching $U(n+1)\downarrow U(n)$; irreducibility of Weyl modules; Bernstein–Zelevinsky geometric lemma; Kudla's filtration of the Jacquet module | as named | `KerX`, `PerX`, `finRam`, `finSplit` | not recorded | `proved in archive` |
| Howe duality (Howe, Waldspurger, Mínguez, Gan–Takeda); unramified Howe duality at inert places | as named | `howeInert` | No | `not compared` |
| Root exchange; Kudla's linear-model seesaw | Ginzburg–Rallis–Soudry; Kudla | See V19 | No | `not compared` |
| Haar measure on quotients and Fubini over places | A. Weil, *L'intégration dans les groupes topologiques*, ch. II | `collapse_factor`, `iterated_integral_product_groups` | Haar pair at $Q$ normalized by $\mathrm{vol}(K_Q)=1$ | `not compared` |
| Adelic and classical theta dictionary | A. Weil, Acta Math. 111 (1964) | `thetaKO_transSum_eq_short_series`, `kernel_identity_tuple` | Read at statement level | `not compared` |
| Projective lifting; density of a global lattice in its completion | classical; Mathlib | `AdMark.exists_marking` | not recorded | `classical` |
| Level structures on PEL moduli and lifting through level covers | Kottwitz, J. AMS 5 (1992), §5; Lan (2013), ch. 1 | `Dict.MarkLift.exists_lift_marked` (PC-7) | No | `not compared` |
| Hasse's norm theorem; orthonormal integral bases of unramified extensions (Serre, *Corps locaux*, I §6); Galois descent | classical | `IsUnfEx`, `DescIntAt` | not recorded | `classical` |
| `SiegelMassRatioCM`, `RayField`, `PrincipalIdealSt`, `CMCurveGoodOutsidePrimeSt`; the thirteen hypotheses of `miStar2_of_allTrue_alt_alt` | as stated | Record nonemptiness, `window_lower`, `MIstar2` | No | `not compared` |
| Tate's thesis; Hecke $L$ nonvanishing at 1 | Tate | Functional equations | Local statements are closed terms | `classical` |

**FR-14 source-name clarification (issue #3).** At the original source pin, `GlobalTheory.BigTop.lamLow_of_hypotheses_alt_alt` concludes `GlobalTheory.BigTop.LambdaLowerBound₂`: see the [producer](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LamLowOfPublished.lean#L17) and the [recorded RH paths](../review/evidence/passage-RH-paths.tsv).

The two `LamLow` candidates in the [original-name audit](../review/evidence/issue3-85.tsv) are distinct declarations. Both names are absent from their retained source files at the later revision `a18a350c3e5aad997766cff2670b292313e46574`, while the qualified producer and `LambdaLowerBound₂` remain. This identifies source references; it does not establish equivalence with either older interface or a match to the hypotheses and normalizations of a published Rallis formula. The comparison remains `not compared`.


## 4. Not inputs

These are comparisons or internal theorems. They should not be cited as places where the route stops.

- Skinner–Wiles, Thorne, Allen–Newton–Thorne as a source for residually reducible automorphy lifting. `GdEndAlt`, `SymplecticFourImageDense` and `ThmS6Core_s` are theorems of the archive (V3).
- The arithmetic Hilbert–Samuel formula `q9`. The explicit inequality `HSAt` is internal and reconstructed.
- The Capelli identity and the RTT presentation as models for the radial and model-algebra identities.
- The Siegel–Walfisz range. None of `ShortNorm`, (C7), `SmallOne` uses it.
- Raynaud's classification, until V20 is settled.
- For PC-3's level-annihilator bound, the precise statement is `Formalism.MainNotions.UnusedSlot80.KillerLevelsTheorem`, proved by [`Formalism.MainNotions.UnusedSlot80.annihilator_levels_unramified_statement`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/LevelLetterCocycles/AnnihilatorLevelsUnramifiedStatement.lean#L576).
- `Formalism.MainNotions.ArcLiftingSetup.KillerKap` is a defined predicate. Its internal proof with constant 8 is [`Formalism.MainNotions.ArcLiftingSetup.killerKap_holds`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/LevelLetterCocycles/DivisibilityInvariantMulLinear.lean#L185).
- `CVEq` (a definition).

## 5. Separate campaigns

- The archive's own Lean proofs of published theorems (Layer 3), including `litN`, the explicit-constant versions behind Theorem TB (a), the archive's proof of V18 and the internal `RootEx` proof of root exchange.
- Refereeing of Sections 7 to 9 of the manuscript.
