# Issue #16: common denominators and finite coefficient tests

This note records conditional deductions for [issue #16](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/16), proposed by **erythrofr**, and separates them from the remaining arithmetic comparisons. It was prepared with ChatGPT Edu assistance. It does not establish the missing uniform bound for the prescribed periods or certify either finite-coefficient argument for the complete manuscript family. No Lean build or kernel replay was run.

The manuscript references below are pinned to `68f45d0770ebc9446c92d3c1138b4ec0a35def83`; the original Lean source is pinned to `40e56bab026552e089d7afcfeff08d2defb9c005`.


**Follow-up:** Sections 6–9 below give exact finite-family denominator formulas, prove a word-dependent refinement of the mean-slope reduction, exhibit a rank-two obstruction to a universally cheap shared-frame extension, and identify the canonical source integrality theorem with its scope. The required bound for the complete prescribed family remains open.

## 1. A common denominator adds its height cost once

Fix a finite family of rational maps $B_u:(N_u)_F\to C_F$ with the lattices and metrics of [Section 13](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/blob/68f45d0770ebc9446c92d3c1138b4ec0a35def83/JustRH/sec13_period_slopes.tex). Suppose one positive integer $D_x$ makes every $D_xB_u$ integral, with every word and finite place included. Retain the original bounds $\operatorname{ht}(B_u)\le h_u$ for nonzero maps. Write

$$
c=2\log D_x,\qquad \widetilde B_u=D_xB_u,\qquad
\widetilde h_u=h_u+c.
$$

Every complex embedding sends $D_x$ to the same positive real number. The doubled-height definition therefore gives $\operatorname{ht}(\widetilde B_u)=\operatorname{ht}(B_u)+c$ for nonzero maps. Zero maps remain zero. The rank-weighted mean becomes $\widetilde s=s-c$, and

$$
\max_u(\mu_{\max}(N_u)-\widetilde h_u)-\widetilde s=U,
\qquad
\lambda_i(N_u)-\widetilde h_u<\widetilde s-t
\iff \lambda_i(N_u)-h_u<s-t.
$$

Thus the source spread and deficit counts are unchanged. Since $c\ge0$, an old cutoff $H\ge(s+\mu_{\max}(R))_+$ still works. The Bessel row identity from [Section 14](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/blob/68f45d0770ebc9446c92d3c1138b4ec0a35def83/JustRH/sec14_bessel_periods.tex#L98-L120) becomes

$$
\rho A_u=(\kappa_u/D_x)\widetilde B_{u,v}I_u.
$$

The matrices $A_u$ and their Gram estimates stay fixed. The filtered-row proof also covers $\kappa_u=0$. Provided all the other hypotheses of the same mean-slope argument hold, it gives $\widetilde s\le\mu(C)+8U+12b$. Consequently

$$
s\le\mu(C)+8U+12b+c.
$$

Using this inequality at the mean-slope step of [Section 18](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/blob/68f45d0770ebc9446c92d3c1138b4ec0a35def83/JustRH/sec18_assembly.tex#L57-L81), while keeping the other accounting identities in their original normalization, adds $c$ once to the displayed excess bound. This is conditional on the stated rationality, height, Bessel and family comparisons.

For a fixed finite family some common integer denominator exists by clearing the finitely many matrix entries on lattice generators. The open question is its size uniformly over the required mesh points and families. Separate denominators for individual words do not automatically give the same common height shift.

## 2. How a uniform one-step lattice loss propagates

Suppose, in the same coefficient model, the shared-frame estimate controls $C_\nu$, and $p^{L_{p,j}}F_\nu\subseteq C_\nu$ after summing the input-factor allowances at lift $j$. Assume the comparison and the loss are uniform over all words, places and edge types used. The full-lattice entry estimate then loses at most $L_{p,j}$.

An efficient way to track this is to introduce auxiliary local maps $\widetilde K_j=p^{L_{p,j}}K_j$. These recover the original entry estimates. The Hecke relation of [Section 10](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/blob/68f45d0770ebc9446c92d3c1138b4ec0a35def83/JustRH/sec10_chain_divisibility.tex) is linear in $K_j$, so it is preserved by this scalar multiplication. Applying the original conditional chain argument to the auxiliary maps gives

$$
\mathcal K_mD_B\subseteq p^{G_B-\sum_jL_{p,j}}I_m.
$$

The differences defining the Hecke prices are unchanged. The actual identification of these lattices and transfers remains an input; the scalar argument does not prove it.

The source defines the sandwich exponent in [StatementW.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ThetaLogCoordinates/SandwichModelDomains/StatementW.lean#L9):

$$
\binom r2\lfloor\log_p(\ell+r-1)\rfloor.
$$

For $r\ge2$ and $\ell+r-1\ge1$ this allowance vanishes at primes greater than $\ell+r-1$. This is not the cutoff $Y=2xn\exp(x^{\varepsilon/3})$. [Section 12](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/blob/68f45d0770ebc9446c92d3c1138b4ec0a35def83/JustRH/sec12_inert_gain.tex#L24-L29) proves that its scalar credit $F_p$ vanishes above $Y$; it does not prove integrality of the period maps there. A nonzero sandwich allowance is also not a demonstration that an actual denominator occurs.

## 3. The algebra behind finite coefficient detection

Let $R$ be a discrete valuation ring with fraction field $K$ and residue field $k$. Suppose integral series $f_1,\ldots,f_a$ have linearly independent reductions, already detected by coefficients of total degree at most $N$. Then for $z_i\in K$, not all zero,

$$
\min_{|\alpha|\le N}v([T^\alpha]\textstyle\sum_i z_if_i)
=\inf_\alpha v([T^\alpha]\textstyle\sum_i z_if_i)
=\min_i v(z_i).
$$

To prove this, divide by a coefficient $z_i$ of least valuation. The normalized coefficients are integral and some is a unit. Independence after reduction implies a nonzero coefficient in the specified truncation. Integrality gives the reverse inequality. This requires the independence for the actual integral model, not just independence over characteristic zero.

For the first proposed test, assume the pulled-back translates really form such a primitive basis of sections of $\mathcal O(\sum_{Q\in E[M]}[Q])$ on the good elliptic model. The divisor has degree $M^2$. A nonzero section cannot vanish at a point to order greater than that degree, so the jet map through degree $M^2$ is injective on the special-fiber space. Tensoring $2r$ copies gives an injective coefficient test through total degree $2rM^2$.

If the source's doubled-series comparison is an integral invertible coordinate change times a power-series unit, it preserves both content and the vanishing order of the normalized reduction. A series with normalized reduction of order $k$ has doubled series of order $2k$. The tensor test therefore gives $k\le rM^2$. This explains the proposed cutoff under the integral-model premises; it does not independently verify all those premises for the prescribed kernels.

The [written source proof](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/blob/68f45d0770ebc9446c92d3c1138b4ec0a35def83/manuscript/sec8_kernel.tex#L427-L455) establishes bounded coefficients. The stronger exact minimum formula additionally needs the primitive reduction and injective coefficient test just described.

The small example can be checked directly. On $y^2=x^3-x$, put $t=-x/y$ and $w=-1/y$. Then $w=t^3-tw^2$, and

$$
t\frac2y=-2t^4+2t^8-4t^{12}+O(t^{16}).
$$

Here $t(2/y)$ is the coefficient in the local frame for $\mathcal O(\sum_{Q\in E[2]}[Q])$. At $p\ge5$ its leading coefficient is a unit. Dividing by $p$ is invisible in degrees zero through three and is detected in degree four. This confirms the example's cutoff obstruction; it is not a counterexample for the prescribed arithmetic normalization.

## 4. What Hacon's theorem supplies to the second test

Hacon, [*Singularities of pluri-theta divisors in characteristic p > 0*, Theorem 1.1 and Remark 1.2](https://arxiv.org/pdf/1112.2219), treats a principally polarized abelian variety over an algebraically closed field of positive characteristic. The stated multiplicity consequence for a divisor in $|m\Theta|$ is $\operatorname{mult}_x(D)\le m\dim X$.

Thus a nonzero primitive specialization of the doubled base section as a principal theta section on a good model of dimension $2d$ has order at most $2d$. If its germ agrees with the doubled corrected expansion through the claimed integral invertible coordinate and frame comparisons, the preceding doubling argument detects the base coefficient minimum through degree $d$.

This application requires the good abelian model, the principal polarization of the specialization, and the identification of its primitive local section with the corrected expansion. Matching Hacon's stated bound alone does not establish these premises.

Likewise, the proposed weighted-kernel equality follows abstractly if the relevant translations preserve coefficient content and integral character projectors isolate each summand. Indeed, the ultrametric inequality gives one direction. Applying the projector to a summand of minimum weighted content gives the other. The projector denominator must be a local unit, and the content-preserving comparisons must hold for these actual base vectors and intertwiners.

All these tests concern the full corrected series before restriction. Restricting variables can destroy coefficients or increase their valuation and does not preserve the full-series minimum in general.

## 5. The remaining arithmetic estimate

Finite detection locates a coefficient attaining a minimum; it does not bound that minimum at the prescribed scale. Replacing a nonzero base vector $e$ by $p^{-a}e$ leaves its generic divisor unchanged while lowering every coefficient valuation by $a$. This explains why a geometric multiplicity bound alone cannot provide the normalization estimate. It does not show failure for the fixed, prescribed base vector.

After all local frame, jet, endpoint and source-rescaling comparisons, one needs nonnegative integers $L_p(x)$, uniform over the entire selected family, such that

$$
p^{L_p(x)}B_u(N_{u,w})\subseteq C_w
\quad\text{for every word }u\text{ and finite place }w\mid p,
\qquad
2\sum_p L_p(x)\log p=o(b).
$$

The sums must cover primes outside the good-model hypotheses and the union of the auxiliary primes $T_u$. A per-word bound for a separate denominator does not automatically bound this common denominator.

Support at $p\le Y$, a polynomial bound for each weighted loss, polynomial growth of $n$, and a separately controlled auxiliary-prime contribution would suffice: for fixed $\varepsilon>0$ the small-prime cost is at most a polynomial in $x$ times $\exp(x^{\varepsilon/3})$, hence is $o(\exp(x^\varepsilon))$. A direct estimate of the full weighted sum would suffice as well.

No local theorem establishing that estimate for the complete prescribed family has been identified in this review. The common-denominator and finite-detection reductions therefore remain conditional progress on issue #16.

## Validation scope

- Read the cited manuscript passages and the definition of the pinned sandwich exponent.
- Read Hacon's stated theorem and multiplicity consequence, without claiming a new independent verification of that paper's proof.
- Checked the common-shift algebra symbolically and expanded the elliptic example using its formal equation.
- The conditional arguments above are ordinary mathematical deductions from the explicit premises; they are not Lean-certified.
- No manuscript LaTeX, existing hypothesis, numerical bound or research-status claim is changed by adding this note.

## 6. Exact denominators for a fixed finite family

Fix one mesh point and its finite family of rational period maps, and keep the prescribed source and target lattices. At a finite place w above p, choose local lattice bases and write M_(u,w) for the matrix of B_u. Normalize the valuation by v_p(p)=1. Put

\[
 t_{u,p}=\max_{w\mid p}\max\{0,-\min_{i,j}v_p((M_{u,w})_{ij})\},
 \qquad L_{u,p}=\lceil t_{u,p}\rceil,
 \qquad D_u=\prod_p p^{L_{u,p}}.
\]

For a zero matrix the minimum is infinity and the corresponding nonnegative loss is zero. The entrywise minimum is invariant under integral changes of source and target basis: multiplication by an integral matrix cannot decrease it, and the inverse basis changes give the reverse inequality. A rational integer with p-exponent L makes the map integral at every w above p precisely when L >= t_(u,p). Thus the displayed L_(u,p) are the exact minimal rational-integer exponents. Only finitely many are nonzero for each fixed finite family.

The smallest common rational-integer denominator uses max_u L_(u,p). Its existence is a finite-dimensional lattice fact. Neither that existence nor finitely many numerical examples establishes an asymptotic bound uniformly over the required windows.

For comparison with the chain bookkeeping, suppose the same local model gives a composite gain G_(u,w), total additional one-step loss R_(u,w), source inclusion N_(u,w) subset p^(-a_(u,w))D_(B,u,w), and final-pairing inclusion P_u(I_m) subset p^(-b_(u,w))C_w. The resulting period has coefficient valuation at least G_(u,w)-R_(u,w)-a_(u,w)-b_(u,w). A valid upper bound for L_(u,p) is therefore the ceiling of max_(w|p)(R_(u,w)+a_(u,w)+b_(u,w)-G_(u,w))_+. This retains any unused gain instead of automatically charging the full sandwich allowance. Establishing these inequalities for the same prescribed maps and frames is essential.

## 7. A common denominator is stronger than necessary

This section proves a refinement of the original common-shift argument. It uses the same rational maps, lattices, metrics, ranks, height allowances and frame bounds as Sections 13 and 14, but replaces the original integral inclusions by D_u B_u(N_u) subset C for positive integers D_u. All other hypotheses of the mean-slope theorem are retained.

Define

\[
 c_u=2\log D_u,\qquad
 \bar c=\Delta^{-1}\sum_u d_uc_u,\qquad
 c_{\min}=\min_u c_u,\qquad
 q=\bar c-c_{\min}\ge0.
\]

**Proposition.** With the original s,U,H, the same Gram parameters e,eta,delta give

\[
 s\le\mu(C)+\bar c+
 \frac{(\eta+4\sqrt e)H+4\min\{U+q,H\}}{1-\delta}.
\]

If delta <= 1/2 and (eta+4 sqrt(e))H <= 6b, this implies

\[
 s\le\mu(C)+8U+12b+9\bar c-8c_{\min}
       \le\mu(C)+8U+12b+9\bar c.
\]

**Proof.** Replace B_u by D_u B_u and h_u by h_u+c_u. The archimedean height changes by exactly c_u because every embedding sends the positive rational integer D_u to itself. The rank-weighted mean becomes s-bar(c). If a_u=mu_max(N_u)-h_u, the new spread is

\[
 \widetilde U=\max_u(a_u-c_u)-s+\bar c
 \le U+\bar c-c_{\min}=U+q.
\]

The original target cutoff still works because the mean decreased. In the equation rho A_u=B_(u,v) J_u, replace J_u by D_u^{-1}J_u. These are still isomorphisms, and every matrix A_u and its Gram estimates stay fixed. The original mean-slope proof uses only the integral inclusions, height bounds, row identity and Gram estimates, so it applies to these auxiliary data. Use monotonicity of min(U,H) and add bar(c). This proves the first bound. The second follows from 1/(1-delta)<=2, q>=0 and min(U+q,H)<=U+q. When all c_u=c, q=0 and the first bound is the original error plus c. Unlike the common-shift case, word-dependent shifts generally change the deficit proportions; the spread estimate pays for that change. This completes the proof.

The scalar-row version in Corollary `cor:bessel-mean` needs no nonvanishing assumption on its proportionality constants. Keep I_u and replace kappa_u by kappa_u/D_u. This preserves rho A_u=(kappa_u/D_u)(D_u B_(u,v))I_u and the required filtered-image inclusion, including when kappa_u=0. The same proof therefore applies to that formulation as well.

For comparison with the unshifted exact error, min(U+q,H)<=min(U,H)+q also gives the incremental allowance bar(c)+4q/(1-delta).

The [Section 13 proposition](../sec13_period_slopes.tex) records this argument. In Section 18 one can translate the auxiliary mean-slope inequality back to the original h_u and repeat the original accounting. This adds at most 9 bar(c)-8 c_min to the excess bound. Do not insert the shifted heights into the original special formula h_u=h_*-A log T_u; the translation back avoids that problem.

In particular, the strictly weaker arithmetic target

\[
 \frac{2}{\Delta}\sum_u d_u\sum_p L_{u,p}\log p=o(b)
\]

suffices for a negligible additional error. It does not require clearing the union of all auxiliary primes in one common integer. For example, conditional on residual auxiliary-prime losses A_u bounded by a fixed polynomial in x, the existing bound log T_u=O_epsilon(m x^epsilon) would give a polynomial bound for each 2 A_u log T_u, hence o(b), independently of the number of words. No such residual-exponent bound is proved here. The finite allowances already included in Section 16 must be kept separate to avoid charging them twice.

The o(b) criterion is convenient but stronger than necessary. To preserve Section 18's existing error order, the weaker estimate bar(c)=O_epsilon(x^epsilon B), with the same mathematical budget B used there, would suffice. The resulting total remains O_epsilon(x^epsilon B), hence is eventually smaller than x^(5 epsilon)B for each fixed epsilon>0. Neither of these averaged estimates for the actual family is established in this note.

## 8. Why the lattice sandwich alone does not give a cheap denominator

For nontrivial factors write M_j=ell_j+r_j-1 >= 1 and a_j=binom(r_j,2). If one uses the full black-box allowance

\[
 L_p=\sum_j a_j\lfloor\log_p M_j\rfloor,
\]

then its exact clearing integer is

\[
 D_{\rm sandwich}
 =\prod_j\operatorname{lcm}(1,2,\ldots,M_j)^{a_j}.
\]

Indeed the exponent of p in lcm(1,...,M) is floor(log_p M). This is an exact identity for the chosen envelope, not a claim that every prescribed period needs that envelope.

The problem is already present for a rank-two, one-row shape. Put

\[
 F_\ell=\bigoplus_{i=0}^{\ell}\mathbb Z X^iY^{\ell-i},\qquad
 C_\ell=\bigoplus_{i=0}^{\ell}
      \binom\ell i\mathbb Z X^iY^{\ell-i}.
\]

These are precisely the full monomial lattice and the coefficient lattice of (z_1 X+z_2 Y)^ell. The rational functional

\[
 \lambda(X^iY^{\ell-i})=\binom\ell i^{-1}
\]

is integral on C_ell. The least integer D with D lambda(F_ell) subset Z is lcm_i binom(ell,i). Consequently

\[
 D\ge\max_i\binom\ell i\ge\frac{2^\ell}{\ell+1},
 \qquad 2\log D\ge2\ell\log2-2\log(\ell+1).
\]

The middle inequality is just the fact that the largest of ell+1 nonnegative binomial coefficients is at least their average. Hence a universal claim of o(b) cost from shared-frame integrality alone is false when ell is comparable with b. This is an obstruction for the abstract coefficient/full-lattice inference, not a counterexample for the prescribed theta kernels.

The obstruction can be isolated in the large-prime tail. Legendre's formula gives

\[
 v_p\binom\ell i=\sum_{a\ge1}
  \left(\left\lfloor\frac\ell{p^a}\right\rfloor
  -\left\lfloor\frac i{p^a}\right\rfloor
  -\left\lfloor\frac{\ell-i}{p^a}\right\rfloor\right)
  \le\lfloor\log_p\ell\rfloor,
\]

since each summand is zero or one and vanishes when p^a>ell. Thus the small-prime part of the exact D satisfies log D_(<=Y)<=Y log ell. Its remaining part satisfies

\[
 \log D_{>Y}\ge\ell\log2-\log(\ell+1)-Y\log\ell.
\]

Taking ell=ceil(b) and the proposed Y, whose prefactor grows polynomially in x, gives a positive constant times b as a lower bound for this tail at large x. Thus the abstract lattice model really can have a non-negligible large-prime tail. This does not imply failure of the whole arithmetic argument: o(b) is a sufficient target, not a necessary one, and the prescribed theta family may enjoy additional integrality.

The same functional is realized by differential pairing with f(X,Y)=(sum_i X^i Y^(ell-i))/ell!. Each individual monomial differential has value 1/binom(ell,i), while the shared-frame differential has the integral coefficients of sum_i z_1^i z_2^(ell-i). This supplies an explicit check of the simultaneous denominator phenomenon rather than just a loose upper bound.

On the other hand, restricting the sandwich allowance to p<=Y really is cheap under the polynomial rank, factor-count and chain-length bounds. Since floor(log_p M) log p <= log M,

\[
 2\log D_{\le Y}\le 2Y\sum_j a_j\log M_j
        \le Yx^{O_\varepsilon(1)}=o(b).
\]

Thus the reviewer's cutoff criterion works. What cannot be inferred is the missing large-prime integrality or a sufficiently small actual large-prime tail.

The stabilizer part specified in Section 16 is separately inexpensive. For s=2fN_m, its exponent sum is at most 2s at each p and vanishes for p>s+1. Therefore log D_Gamma <= 2s(s+1)log(s+1), a polynomial bound; multiplying through polynomially many lifts is still o(b). This calculation uses the stabilizer denominator stipulated in that section and does not prove its other integral-model comparisons.

## 9. The source result and the missing transport

The original source pin in all links below is `40e56bab026552e089d7afcfeff08d2defb9c005`.

| Source item | What it supplies | What it does not supply by itself |
|---|---|---|
| [`kernels_integral_inert`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/InertKernelTheory/KernelsIntegralInert.lean#L9) | A theorem producing `IntInert` under its stated `CM2` fact. | An identification with every independently prescribed manuscript kernel. |
| [`IntInert`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/InertKernelTheory/StatementInt.lean#L20) | The resulting assertion is for the canonical `B.eNat` family, all admitted lattice pairs and all inert primes p>=5, under its curve and character premises. It has no p<=Y cutoff. | The class-sum frame factors, full transfer, endpoint pairing and rescaled manuscript source are not identified by this assertion alone. |
| [`LocForm`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLatticesGL3.lean#L488) | A precise target for a normalization comparison: a local orthonormal expression through an intertwiner, multiplied by an algebraic p-adic unit. | This is a definition. Finding it is not a proof that the manuscript's chosen base section satisfies it. |
| [`IntAt` / `oddInt`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLatticesGL3.lean#L544) | These definitions specify the corrected-series and full-jet properties to be matched. `oddInt` excludes the indicated level primes and requires coprimality to the curve ideal. | They are properties, not proofs of those properties for arbitrary kernels. |
| [`int22`](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GlobalSchurBounds/TaylorLogMetric.lean#L103) | The package explicitly distinguishes primes away from the host discriminant from its special ramified-prime clause. | One cannot replace the ramified clause by unconditional full-jet integrality. |

This source comparison rules out the explanation that the formal source only asserts an unspecified scalar for every kernel. It does not complete the missing human comparison for the independently prescribed JustRH family.

The actual remaining bridge consists of: matching the canonical base section at its prescribed arithmetic scale; matching its translations and finite weights; transporting the full integral coefficient model to the adapted frames and both parities; preserving the Hecke identities for these same kernels; comparing the rescaled N_(u,w) and final pairing; and bounding all residual losses, including exceptional and auxiliary primes, in the displayed rank-weighted mean. The spacing incompatibility already recorded in Section 7 is an additional obstacle to identifying the entire construction with the standard source record; the kernel theorem does not repair that mismatch.

Neither the boundedness scalar in Section 8 nor a multiplicity bound controls this arithmetic scale. For the Hacon-based follow-up, Theorem 1.1 and Remark 1.2 of [the cited paper](https://arxiv.org/pdf/1112.2219) do give the stated multiplicity bound on a principally polarized special fiber. Applying it still requires the primitive integral specialization and the claimed coordinate/frame identifications. A finite coefficient test locates a minimum; a uniform lower bound at the prescribed scale is a different assertion.

**Disposition:** the common-denominator reduction is proved, the word-dependent refinement above is proved under the mean-slope theorem's other hypotheses, and the abstract lattice obstruction is explicit. The uniform arithmetic estimate for the complete prescribed family is not proved here. Issue #16 should not be described as resolved on the strength of this note.
