# Issue #1: period normalization and the scope of rationality

Source-level comparison for [issue #1](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/1). The original archive is pinned at `40e56bab026552e089d7afcfeff08d2defb9c005`. The manuscript base is `68f45d0770ebc9446c92d3c1138b4ec0a35def83`. No Lean compilation, kernel replay or revised manuscript build was run for this change.

## Conclusion

The suggested literal identification of the pairing multiplier with `c(t)/c(mu0)` is not required for H-rat. The rationality proof uses the base tuple, where the source multiplier is 1. Away from the base tuple, the source distinguishes a coefficient **multiplying the period** from a coefficient **multiplying the rational pairing**, and passes between them by inversion. A comparison with independently defined manuscript periods must preserve this distinction, the embeddings, and the coordinate maps.

This resolves the normalization-convention question and explains why the guessed off-base identity is unnecessary for the base-tuple rationality deduction. It does **not** establish the separate geometric dictionary between independently constructed period models.

## Answers to the three questions

1. **Domain of identity (3):** yes, the section identity holds on the good subspace. Its extension to the degree-zero space is equivalent, under the defining tie, to vanishing on the kernel of the row map. `DataBu.lean` states both facts separately.
2. **Where the defining identity comes from:** the selected-family caller explicitly supplies `(Fm.ties x i).bu_def`. This discharges that premise of `buRational_of`; it does not discharge the theorem's separate row, period and realization premises.
3. **Which scalar is compatible:** after matching the period models, embedding and coordinates, a coefficient `rho = c(t)/c(mu0)` in `rho*P = B` corresponds to the inverse pairing coefficient in `P = zeta_pair*B` whenever the pairing is nonzero. The H-rat proof uses only the base tuple, where the source pairing factor is 1. An off-base scalar is not determined by these identities on a zero pairing fiber.

These are answers to the three source-comparison questions in issue #1. They do not claim that an independently constructed geometric period model has been identified with the source model. The local unit comparison for such a model remains a separate requirement.

## 1. The good-subspace restriction and the family tie

[Rows.Data.sec_iota](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalRingCardinality/DataBu.lean#L22) assumes membership in `Qsp`. Combining that identity with `Rows.BuDefQ` gives the period identity on the good subspace. The larger degree-zero statement is different: [D7.periodIdentity_iff_period_kills](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalRingCardinality/DataBu.lean#L49) identifies it with `Rows.PerKillsU`, under `BuDefQ`.

The selected-family caller [buRat_rrFull_closed_alt](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/BurrbPlug.lean#L55) passes `(Fm.ties x i).bu_def` to `buRational_of`. This is a conditional family theorem: its row, definite-period, selection, primitivity and realization hypotheses still matter. The fact that the defining tie is supplied does not independently establish all those comparisons.

The original short manuscript lemma also assumes a rational good-part lift. The source's actual descent proof is more flexible: [PerDescent.per_sec](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/Divisibility/DivisibilityRemainder/RationalColumns/Descent.lean#L29) uses a rational ambient preimage, then a potentially complex orthogonal projection. It does not assume that the orthogonal section of every rational row is rational over the coefficient field. The later paragraph “Rationality on the selected record” follows that descent strategy. The proposed edit only makes the short lemma's good-part domain explicit.

## 2. Two coefficients with inverse conventions

For one fixed word and tuple, suppress the projected row and column coordinates and write `P` for the definite period and `B` for the rational pairing value.

| Convention | Identity | Source |
|---|---|---|
| Normalized complex coefficient `rho` | `rho * sigma(P) = sigma(B)` | [miStar2_of_anchored](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/MiStar2OfAnchored.lean#L18) sets the coefficient to `c(t)/c(mu0)` in the anchored complex model. |
| Algebraic matrix coefficient `nu` | `nu * P = B` | [MatrixIdentityOffBase](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteForms/PairingConditionOfInverseMatrixIdentity.lean#L39). |
| Stored pairing coefficient `zeta_pair` | `P = zeta_pair * B` | [PairingFactorsThroughPeriods](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteForms/IndefSide.lean#L383). |
| Conversion | `zeta_pair = inverse(nu)` | [ColData.invZ](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteForms/PairingConditionOfInverseMatrixIdentity.lean#L24) and [pairing_condition_of_inverse_matrix_identity](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteForms/PairingConditionOfInverseMatrixIdentity.lean#L45). |

The construction of the package also exposes this inversion: [PrimitiveStatementsBaseLiftsOnly.cols](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteReal/PackageFromPrimitiveStatements.lean#L106) constructs the pairing interface with `colDef (fun u t => (zeta u t)^(-1))`.

### Embeddings and zero periods matter

The actual realization performs coordinate transport and can conjugate the complex coefficients. In [MiStar2AtRealisation.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/MiStar2AtRealisation.lean#L132), the embeddings are related using `cj`; line 135 chooses the transported coefficient as `cj (c u t)`. Thus a raw equality between complex scalars from different realizations must not be asserted before applying that transport.

There is also a degenerate case. [zetaOf](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteReal/IsometricPeriodsOfHypotheses.lean#L118) selects an algebraic preimage of the normalized complex coefficient if one exists, and chooses 1 otherwise. [matrix_identity_of_unit_hypotheses](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteReal/IsometricPeriodsOfUnitHypotheses.lean#L102) proves that the period vanishes when that coefficient has no algebraic preimage. Consequently the period identity can hold without a globally prescribed numerical scalar on a zero fiber.

Once the period models and embeddings are matched, the algebra is unambiguous. If

```math
\rho(t)P_t=b_t,\qquad P_t=\sigma(\zeta_{\rm pair}(u,t))b_t,
```

then

```math
(\rho(t)\sigma(\zeta_{\rm pair}(u,t))-1)b_t=0.
```

For a nonzero pairing value this gives

```math
\sigma(\zeta_{\rm pair}(u,t))=\rho(t)^{-1},
```

rather than `rho(t)`. If all pairing values at that tuple are zero, cancellation is unavailable and the scalar is not determined by this identity alone. This is a statement about the normalization convention, not an assertion that the independent geometric model comparison has been completed.

## 3. Why H-rat does not need an off-base scalar comparison

Fix the selected record's coefficient field and embedding. In [buRational_of](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/Divisibility/DivisibilityRemainder/RationalColumns/BuRationalOf.lean#L26), the rational column and row are first pulled back through their coordinate isomorphisms. The proof rewrites using `BuDefQ` and `colsBk`, then invokes `per_sec` at the base tuple. Its period-factorization step explicitly uses [the base identity zeta = 1](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/Divisibility/DivisibilityRemainder/RationalColumns/BuRationalOf.lean#L46). No numerical formula for the off-base pairing factor enters that proof.

In ordinary linear algebra, the descent works as follows. The rational row preimage map `p` is onto, the complex level vectors `A(F)` span the degree-zero space, and their row and period values satisfy

```math
\iota A(F)=j_R e_R(pF),\qquad
\operatorname{perCol}_0(j_N\varphi,A(F))=\sigma(\beta(pF)).
```

Extend the rational functional through the chosen row basis to a complex linear functional `Lambda`. The two sides agree on the spanning vectors, so `perCol_0(j_N(phi), -)` agrees with `Lambda` composed with `iota` throughout the degree-zero space. Subtracting the orthogonal projection to the kernel of `iota` gives a vector in the good part with the same image. Evaluating the defining section then gives H-rat. This argument uses the base factor 1 and the stated comparison premises; it does not use `zeta_pair(t) = c(t)/c(mu0)`.

The manuscript's passage to H-see likewise takes all tuple terms at the base tuple. Multiplying a relation by the common nonzero scalar `c(mu0)` preserves that relation. The Bessel identity permits a nonzero complex proportionality coefficient. This does not permit an arbitrary rescaling of the fixed rational map: its rationality and metrics remain those of the chosen record.

## 4. What the finite-place argument needs

At a finite place, a nonzero complex proportionality factor alone gives no valuation estimate. The multiplier for the actual algebraic periods must have valuation zero at the places where the gain is used.

Inversion preserves this condition:

```math
v_w(a^{-1})=-v_w(a),\qquad
v_w(a)=0\Longleftrightarrow v_w(a^{-1})=0.
```

The source proves that transformation in [vw_inv](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteForms/PairingConditionOfInverseMatrixIdentity.lean#L16) and uses it in the pairing conversion. The normalized seesaw coefficient and its unit condition are produced, under the stated family hypotheses, in [rel_of_links_alt](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/RelOfLinks.lean#L34); the unit proof begins at line 41.

If an actual local comparison is `b = a*P` with `a` a unit, a lower bound on the valuation of `P` transfers to `b` unchanged. Thus the arithmetic argument can use the period-multiplier convention or its inverse, provided it applies to the same periods and local lattices. The identification of those actual models remains necessary; a Bessel proportionality coefficient cannot replace it.

## 5. Proposed manuscript change and remaining obligation

The accompanying edit to `manuscript/sec14_bessel.tex` does three things: restricts the short lemma's last two identities to the good part, distinguishes the inverse scalar conventions in the selected-record paragraph, and adds the normalization remark above. It does not remove H-dict or any other hypothesis, alter a bound, or claim the integral model comparison has been proved.

What remains for a complete geometric comparison is to identify the independently defined column and row spaces, embeddings, projected periods and rational pairing in one common realization. Equality on basis pairs proves the bilinear-map comparison. Off-base arithmetic use additionally requires the actual local unit condition for those same data. These obligations remain visible in the manuscript and in `review/README.md`.

## Validation

- Read the cited original sources at `40e56bab026552e089d7afcfeff08d2defb9c005`.
- Compared the complete contents of DataBu, IndefSide, BuRationalOf, PairingConditionOfInverseMatrixIdentity, and MiStar2OfAnchored with the issue's mirror revision `4e8bb36faa8c9e3f1bda144ccf5a637f8b96066e`; all five files are byte-for-byte equal as retrieved.
- Checked the scalar conversion and anchored normalization by exact symbolic algebra, including the nonzero denominators. A rational scalar example distinguishes a ratio from its inverse.
- Checked that the short lemma's proof remains unchanged, the new label is unique, and no existing labels, environments or manuscript hypotheses were removed.
- Did not compile the original archive, the mirror archive, a standalone Lean check, or the revised manuscript PDF.

### Follow-up clarification

The selected-record paragraph now distinguishes its surjective rational row map from the later complex orthogonal projection. The descent needs a rational ambient preimage; it does not need a rational orthogonal section. The manuscript states the good-part restriction and the role of the defining family tie together. No hypothesis or arithmetic normalization is removed.
