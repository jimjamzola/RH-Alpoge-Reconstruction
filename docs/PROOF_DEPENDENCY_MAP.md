# Proof dependency map

> **Note, 22 November 2026.** The status marks below are those of 21 November 2026. The internal packages PC-1 to PC-7 that the marks *[reconstructed above PC-n]* refer to have since been closed at the human-proof boundary. See [`STATUS.md`](STATUS.md).

This is the argument of the archive in mathematical order, from the analytic criterion to the conclusion. It is a map of mathematics, not a history of the audit and not a list of Lean declarations. Lean names appear in `code` where they help a reader find the corresponding statement in the manuscript or the archive. Section references (§) are to [`RH_Route_Notes.pdf`](../archive/route-notes/RH_Route_Notes.pdf).

**Naming clarification (issue #3).** `corA` is the manuscript's LaTeX label for the window-criterion corollary in [`sec2_criterion.tex`](../manuscript/sec2_criterion.tex), where it appears as `\label{corA}`. References to Corollary `corA` below use that manuscript label.

Status marks used below.

- **[proved here]** a complete proof is given in the manuscript from the stated classical inputs.
- **[reconstructed]** a theorem of the archive whose proof has been read from the Lean text and written in ordinary mathematics down to classical statements or named published theorems.
- **[reconstructed above PC-n]** the same, down to the internal package PC-n of [`RECONSTRUCTION_STATUS.md`](RECONSTRUCTION_STATUS.md), whose proof bodies are still under audit.

Every named published theorem at which a branch stops is on the external boundary, [`EXTERNAL_THEOREMS.md`](EXTERNAL_THEOREMS.md).

## 1. The spine

```text
 1  analytic RH criterion                      one-sided bound on windows ⇒ zero-free half-plane
            ↓
 2  smoothed prime sums / explicit formula     G, G_χ, sampled sums, the inert-prime identity
            ↓
 3  arithmetic Stepanov mechanism              chain of m theta lifts, lattices N_u, seven inequalities (A1)–(A7)
            ↓
 4  theta-lift divisibility                    kernel law, valuation estimate at inert primes
            ↓
 5  local p-adic gain and Hecke loss           gain_j(p) on a sublattice; colength bound from LPprime
            ↓
 6  integral period map / LinkDIV              B_u : N_u → R^∨, its height, BesselId;
                                               LinkS → PuNZ → MIstar2 → BesselId → LinkDIV, FrameF
            ↓
 7  slope and covolume inequalities            FrameF (A3), covolume of R^∨ in (A4): HSAt, DeepStR, FUN
            ↓
 8  automorphic / Galois / local lifting       R4 = VWin + LinkN: automorphy of deformation rings,
    inputs                                     Wach modules, Theorems B and C, integral theta series
            ↓
 9  records and the host field                 seesaw identities, existence of records, HostEx / R5
            ↓
10  positive prime-sum combination             excess ⇒ G_Ξ(x) ≤ x^{1/2+Cε} on windows (R6)
            ↓
11  zero-free half-plane                       Re s > 1/2 + Cε for ζ and the L(s,χ), χ in Ξ, every ε
            ↓
12  RH / corresponding GRH conclusion          the final theorem of the archive
```

Stages 1 to 3 and 10 to 11 form the **analytic frame**, which the manuscript proves. Stages 4 to 9 form the **geometric core**, the internal theorems of the archive between the frame and the published theorems it quotes, which the manuscript reconstructs from the Lean text. The two meet at the interface statements R1 to R6 of §6.

## 2. The stages

### Stage 1. The analytic criterion [proved here]

For $x\ge1$ let $G(x)=\sum_{n\le x}\Lambda(n)(x/n-1)-x\log x+(1+\gamma)x$, and let $G_\chi$ be the analogue with $\Lambda(n)\operatorname{Re}\chi(n)$ and the linear term $\operatorname{Re}(L'(1,\chi)/L(1,\chi))\,x$. The Mellin transform of $G$ has a pole at each nontrivial zero of $\zeta$, and that of $G_\chi$ at each nontrivial zero of $L(s,\chi)$ and $L(s,\bar\chi)$.

- **Window theorem** (§2.3, Theorem `engine`, Corollary `corA`; Result 1). If a positive combination $G_+=G+\sum_iw_iG_{\chi_i}$ satisfies $G_+(x)\le Cx^\theta$ for all $x$ in windows $Y\le x\le Y^\lambda$ with $Y$ arbitrarily large, then $\zeta$ and every $L(s,\chi_i)$ are free of zeros in $\operatorname{Re}s>\theta$.
- Input: Landau's theorem on Dirichlet integrals of one sign, and classical properties of $\zeta$ and $L(s,\chi)$.

### Stage 2. Smoothed prime sums and the explicit formula [proved here]

- **Sampled sums** (§2.5, Propositions `samp`, `dil`). Versions of the criterion for sums sampled at finitely many points near $x$.
- **The inert-prime identity** (§5, Proposition `inert`; Result 3). For a prime $d>3$, $d\equiv3\pmod 4$, with quadratic character $\chi$, the sum over inert primes $2\sum_{\chi(p)=-1}\sum_{i\text{ odd}}\log p\,\max(a/p^i-w,0)$ plus the term at $d$ equals an explicit main term plus $w\,(G(a/w)-G_\chi(a/w))$. So a bound for the sum over primes of the route is a bound for $G-G_\chi$ at the points $a/w$.

### Stage 3. The arithmetic Stepanov mechanism [proved here, hypotheses from the core]

- **Model** (§3). Bombieri's form of Stepanov's method over a finite field, and Bost's slope inequality over $\mathbb Z$, which plays the role of the count of zeros against poles.
- **The chain** (§4.1). A chain of $m$ theta lifts between unitary groups of growing rank, over the integers of a CM field. To each index $u$ it attaches a hermitian lattice $N_u$ and a period pairing $B_u:N_u\to R^\vee$ into the dual of a lattice of forms.
- **Accounting** (Proposition `acct`; Result 2). Seven inequalities (A1) to (A7) among slopes, heights and local terms bound the sum $S$ over primes by its main term, with error shapes $x\ell/m$, $m\,x^{c\varepsilon}$ and $x\ell m/k$. The first two balance at $m=\sqrt x$, the Stepanov balance with the chain length as the multiplicity.
- The hypotheses (A2), (A3), (A4) are supplied by the core (Stages 4 to 8) through the interface statements R1 (`LinkMu`), R2 (`WordFacts`, contained in `LinkDIV`), R3 (sizes) and R4 (`VWin`, `LinkN`).

### Stage 4. Theta-lift divisibility [reconstructed]

(§4.5.) At a prime $p$ inert in $\mathbb Q(\sqrt{-d})$:

- **Kernel law.** The theta kernel of one lift is $\exp(-\Upsilon)$ times an integral series, where $\Upsilon$ is a sum of values of a pairing that is semilinear for the Frobenius of $\mathbb Q_{p^2}$. The pairing is the coboundary, for the formal group law, of the logarithm of the normalized sigma function of an elliptic curve with CM by $\mathbb Q(\sqrt{-d})$, whose formal group has height two at $p$. The integrality reduces to theta functions of rank one (`lubin_tate_transfer_integral`).
- **Normal form** (`BetaIsG`, `TwoSumsCondition`). In a parameter with logarithm $\sum_j x^{p^{2j}}/p^j$ every such pairing has an explicit normal form. Semilinearity forces odd shifts.
- **Valuation estimate** (`valest`). At a top of weight $\alpha$ the credit is $\alpha p/(p^2-1)=\sum_{i\text{ odd}}\alpha/p^i$, which matches the charge of an inert prime in Proposition `inert`.

### Stage 5. Local $p$-adic gain and Hecke loss [reconstructed]

- **Gain.** The composite of the lifts is divisible by $p^{\mathrm{gain}_j(p)}$ on a sublattice of the base lattice. The local model of the chain at an inert place (`SysTw`) and the passage from the model to the column map (`CmpV`) carry this divisibility to the period pairing and to `LinkDIV`.
- **Loss** (`LPprime`). A Hecke operator attached to a Frobenius orbit is nondegenerate up to a bounded power of $p$ on most of the rank. This bounds the colength of the sublattice. The archive proves it from standard monomial theory, Pieri and branching rules and the extremal projector.
- **Hypothesis (A2).** The colength bound and the degree formula give `SlopesN`, which is (A2). With `LinkG` and R1 (`LinkMu`) this closes the gain side.

### Stage 6. The integral period map and `LinkDIV` [reconstructed above PC-4, PC-5]

- **Height** (§4.6). $B_u$ is the composite of the $m$ lifts followed by a pairing with forms on a second unitary group. Its height is at most the sum of the logarithms of the norms of these maps (`height_chain_atR`), which gives the term $m\,\mathrm{ph}(a_t)$ of (A4). The constant $\log\Omega$ is a mean logarithmic period of the CM curve, given by the formula of Chowla and Selberg (`MeanPeriod`). Its term $L'(1,\chi_d)/L(1,\chi_d)$ cancels against the same term of Proposition `inert`.
- **Identification with a period** (`BesselId`), a condition of `LinkDIV`.
- **Corrected dependency order.** The pairing identity is established in the order

  ```text
  LinkS → PuNZ → MIstar2 → BesselId → LinkDIV, FrameF
  ```

  `LinkS` gives near orthogonality of Poincaré series on the unitary group, from the decay of Bessel transforms (Theorem P, with the radial identities and the quantum-determinant collapse) and from a pre-trace formula that counts discrete series (the counting engine of `LinkS` and `LinkIRR`). `PuNZ`, the nonvanishing $P_u\ne0$, comes from the diagonal dominance of the Gram matrix of Poincaré series. `MIstar2` is an identity of theta integrals obtained from seesaw identities. `BesselId` identifies $B_u$ with a period, and `LinkDIV` and `FrameF` use it. This order has no cycle. `BesselId` stays on the `LinkDIV` side.
- Remaining packages attached here: PC-5 (lattice counting below `LinkS` and `LinkIRR`) and PC-4 (finite-place harmonic analysis below `MIstar2`).

### Stage 7. Slope and covolume inequalities [reconstructed above PC-1, PC-2, PC-6]

- **Frame theorem, (A3)** (`FrameF`) [reconstructed]. Slope theory with Hilbert–Schmidt control of $Q=\sum_u\gamma_uB_uB_u^*$. Inputs are the Harder–Narasimhan filtration and Bost's slope inequality.
- **Slope of $R^\vee$, the second half of (A4)** (`L3`, `CovolumeBoundOfX`). Covolumes of lattices of cusp forms on unitary Shimura varieties, bounded by arithmetic intersection theory.
  - **Effective arithmetic Hilbert–Samuel inequality** (`HSAt`) [reconstructed]. A Chow-form determinant argument in the style of Nesterenko and Philippon, with Mahler heights, Hadamard's inequality and a monomial count. Inputs are Kawamata–Viehweg vanishing, Bertini and Chow forms.
  - **Uniform lower bound for mean volume slopes on deep covers** (`DeepStR`) [reconstructed above PC-1, PC-2]. Uniformity in the level comes from a prime cutoff that tends to infinity together with an exact local identity at good primes. With $w=\zeta_p-1$, $w^{p-1}=up$ and $\mathrm{Lie}\subseteq W\subseteq w^{-1}\mathrm{Lie}$, the identity reduces to $\mathrm{ck}(\mathrm{Lie},W)+\mathrm{ck}(\omega,\omega^{\mathrm{HT}})=h_\tau-\lambda_\tau/(p-1)$ and $p^kh_\tau=h_{\mathrm{Fr}\tau}+\lambda_{\mathrm{Fr}\tau}$, solved on finite Frobenius orbits by $h_\tau=\sum_{n\ge0}p^{-k(n+1)}\lambda_{\mathrm{Fr}^{n+1}\tau}$.
  - **Slope bound for the target lattice $R$** (`FUN`) [reconstructed above PC-6]. $\mu_{\max}(R)\le x^{C_H}b-\operatorname{mean}_v\log\kappa_v$, through denominators of zeta values and toric periods.

### Stage 8. Automorphic, Galois and local lifting inputs [reconstructed above PC-3, PC-7]

These give the two bounds of R4, which control the local terms of the lifts at places where their local type is twisted.

- **`VWin`, the Selmer bound** [reconstructed, small leaves remain]. Lengths of Tate–Shafarevich groups of the cyclotomic field are bounded by valuations of $\operatorname{tr}\rho(\sigma)-t$ at the automorphic points of a deformation ring of a residually reducible representation. This needs the automorphy of every such point, which the archive proves internally (`P3core`, `x1`, `red`, `V0ok`), with Greenberg–Wiles and explicit local conditions, Mazur's presentation, Bellaïche–Chenevier generalized matrix algebras and Chebotarev. Rank four has its own chain and does not involve the rank-three statement.
- **`LinkN`, the congruence-module bound** [reconstructed above PC-3, PC-7]. The congruence ideal of a Hecke summand is bounded by Selmer lengths through a universal cocycle, lifted to integral crystalline lattices with exponents from Wach modules.
  - torsion bound for crystalline extensions (`torsion_bound_of_weight_hyp`), with a constant logarithmic in the Hodge weights;
  - $\gamma$-descent along a generator of the cyclotomic Galois group (`coreWA`), with $\lfloor H/(l-1)\rfloor+v_l(\lfloor H/(l-1)\rfloor!)\le Hl/(l-1)^2$;
  - Wach realization through Berger's filtration conditions at $\zeta_{l^{s+1}}-1$;
  - **Theorems B and C**, two local lifting theorems for Wach modules with alternating Hodge jumps [reconstructed above PC-3], with case bounds at most $40\,\mathrm{Sg}$, $\sigma\le3\,\mathrm{Sg}$ for $l\ge11$, and the constant $32$ for Theorem C;
  - integrality of theta series of level structures (`series_bound`, `SerN`) [reconstructed above PC-7].

### Stage 9. The records and the host field [reconstructed above PC-4, PC-6]

- **Records** (§4.7). The lattices, heights and local terms of R1 and R2 are fields of a record, and the content of the core is the existence of a family of records. The archive builds them from `MIstar2`, matched local data, the covolume bound and R4.
- **Seesaw value** (`valX`). Six exact identities give $c_V(j)=\kappa\,\mathrm{sc}_j\,\mathrm{sc}_{j+1}\,c_Q\,c_G\,c_T$. The level scalars cancel, the twist-place laws reduce to one split place in the linear model of the Weil representation, and root exchange is used in type.
- **Integral structure** (`DescIntAt`, `exists_forms_of_transSum`). Galois descent of integral forms, and the theta kernel at CM points as a classical short theta series.
- **Host field** (R5, `HostExW`, `hostOfFieldOf`) [reconstructed]. The field $E$ of degree $4n$ with $x^{2+8\varepsilon}\le n\le2x^{2+8\varepsilon}$ and its auxiliary primes $q$, $d$. Nonvacuity goes through `HostEx`, whose nine analytic inputs are on the external boundary.
- **Auxiliary primes** (§8; Result 5) [proved here from (C1)–(C8)]. Most primes $q\equiv3\pmod8$ in a thin range give characters with $\lvert G_\chi(y)\rvert\le y^{1/2+\tau}$ on the window and a zero-free box, by a mean square over prime moduli and seven classical statements, without assuming any zero-free half-plane.

### Stage 10. The positive prime-sum combination [proved here, given R1–R5]

(§7; Result 4, Theorem `step5`, Corollary `asm`.) A bound for the excess of the sum over primes, averaged over translations by a subgroup of the Galois group, gives a bound for a positive combination $\sum_\psi c_\psi\operatorname{Re}G_\psi(x)$ over a family of characters. With the sizes of R3 and the auxiliary characters of Stage 9 this is R6,

$$G_\Xi(x)\le x^{1/2+C\varepsilon}\quad\text{on the windows of R5,}$$

for a finite set $\Xi$ of primitive characters containing the trivial character.

### Stage 11. The zero-free half-plane [proved here]

Corollary `corA` applied to $G_\Xi$ with $\theta=\tfrac12+C\varepsilon$ gives that $\zeta$ and $L(s,\chi)$, $\chi\in\Xi$, have no zeros with $\operatorname{Re}s>\tfrac12+C\varepsilon$. Since $\varepsilon$ is arbitrary, the half-plane is $\operatorname{Re}s>\tfrac12$.

### Stage 12. The conclusion of the archive

The final theorem of the archive is `theorem riemannHypothesis : RiemannHypothesis`, stated with Mathlib's definition, together with statements on the zeros of Dirichlet $L$-functions (see [`SOURCE_MANIFEST.md`](SOURCE_MANIFEST.md)). This repository reconstructs the route to that statement. It does not assert the statement.

## 3. Where the current audit boundary meets the map

```text
 stage                               internal package under audit
 ─────────────────────────────────   ──────────────────────────────────────────────────────────
 1–3   analytic frame                none (proved here)
 4     theta-lift divisibility       none
 5     gain and loss                 none
 6     period map, LinkS → … LinkDIV PC-5 lattice counting (below LinkS, LinkIRR)
                                     PC-4 finite-place seesaw (below MIstar2)
                                     SL-3 small frame lemmas, model algebra (Theorem P side)
 7     slope and covolume            PC-1 local Hodge–Tate / finite flat (below DeepStR's exact identity)
                                     PC-2 global tower and covolume (below DeepStR, L3)
                                     PC-6 record construction (FUN, below L3 and LinkDIV)
                                     SL-1 flag and test leaves of DeepStR
 8     automorphic / Galois / local  PC-3 shared Wach-module layer of Theorems B and C (below LinkN)
                                     PC-7 FR-10 markings and integrality producers (below SerN → LinkN)
                                     SL-2 rank-four leaves; SL-4 FR-01/02, FR-18, FR-19 leaves
 9     records and host              PC-4, PC-6, PC-7 as above; SL-5 bookkeeping
                                     (auxiliary primes: proved here; small bookkeeping leaves at the host)
10–11  combination, half-plane       none (proved here)
```

Downstream chains of the packages, as recorded by the audit.

- PC-1: `FamilyExistsPos` → `HodgeLatticeFlagBound` → `Prop6` → level uniformity of `DeepStR` → `HeightAt` → `UAt` → `lowAt_of_cover` → `L3` → `LinkDIV`.
- PC-2: tower axioms of `DeepStR`; fields of `topCovolG_alt_alt` → `L3` → `LinkDIV`.
- PC-3: Theorems B and C → `LengthBoundAtPlaces` → `LinkN`.
- PC-4: `valX`, $c_V$, `ClsPinD` → `KerX`, `PerX`, `RdX` → `MIstar2` → `BesselId` → `LinkDIV`, `FrameF`.
- PC-5: `MainTheorem`, `KVIdentity`, row counts, the dimension clause of `LinkS`, `LinkIRR`.
- PC-6: `HostExW`, `CBHyp`, `adm2`, `DIVinN`; `FUN` → `L3`, `LinkDIV`.
- PC-7: `SerN` → crystalline lattices → `LinkN`.

Every remaining package lies below a reconstructed mechanism and above named published mathematics. None of them sits in the analytic frame. The external boundary, which is separate from these packages, is in [`EXTERNAL_THEOREMS.md`](EXTERNAL_THEOREMS.md).
