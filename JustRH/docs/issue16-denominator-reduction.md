# Issue #16: common denominators and finite coefficient tests

This note records conditional deductions for [issue #16](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/16), proposed by **erythrofr**, and separates them from the remaining arithmetic comparisons. It was prepared with ChatGPT Edu assistance. It does not establish the missing uniform bound for the prescribed periods or certify either finite-coefficient argument for the complete manuscript family. No Lean build or kernel replay was run.

The manuscript references below are pinned to `68f45d0770ebc9446c92d3c1138b4ec0a35def83`; the original Lean source is pinned to `40e56bab026552e089d7afcfeff08d2defb9c005`.

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
