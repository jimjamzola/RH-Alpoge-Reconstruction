import Mathlib

/-!
# The arithmetic of §17.4.3 (the effective cohomology bound)

Adriazola's reconstruction, §17.4.3, proposes a short proof of
`log #H²(G_{L,S}, ℤ_p(e+1)) ≤ exp((2ed)^C · log(2D))`.

This file checks the *arithmetic* of that argument. The inputs from algebraic
K-theory, the well-rounded retract and the Hurewicz map are hypotheses here;
nothing in this file proves them.

Notation follows the manuscript: `i = 2e`, `u = i·d`, `Y = log(2D)`, `N = 2i+1`,
`v = d·N`.
-/

namespace K1

open Real

/-- `log 2 ≥ 1/2`, the only numerical fact about logarithms that is used. -/
theorem half_le_log_two : (1 : ℝ) / 2 ≤ Real.log 2 := by
  have := Real.log_two_gt_d9
  linarith

/-- The class-number estimate: Minkowski's bound `2^d √D` on the norm of an ideal in
each class, and at most `B² ζ_L(2) ≤ B² ζ(2)^d` ideals of norm at most `B`, give
`h ≤ 2^{3d} D`. Here `z` stands for `ζ(2) ≤ 2`. -/
theorem classNumber_arith (d : ℕ) (D z : ℝ) (hD : 0 ≤ D) (hz0 : 0 ≤ z) (hz : z ≤ 2) :
    ((2 : ℝ) ^ d * Real.sqrt D) ^ 2 * z ^ d ≤ (2 : ℝ) ^ (3 * d) * D := by
  have h1 : ((2 : ℝ) ^ d * Real.sqrt D) ^ 2 = (4 : ℝ) ^ d * D := by
    rw [mul_pow, Real.sq_sqrt hD, ← pow_mul, mul_comm d 2, pow_mul]
    norm_num
  have h2 : z ^ d ≤ (2 : ℝ) ^ d := pow_le_pow_left₀ hz0 hz d
  have h3 : (2 : ℝ) ^ (3 * d) = (4 : ℝ) ^ d * (2 : ℝ) ^ d := by
    rw [← mul_pow, pow_mul]
    norm_num
  rw [h1, h3]
  have h4 : (0 : ℝ) ≤ (4 : ℝ) ^ d * D := by positivity
  nlinarith [mul_le_mul_of_nonneg_left h2 h4]

/-- The number of generators: from `r log p ≤ log h + d log p` and `h ≤ 2^{3d} D`
one gets `r ≤ u⁴ Y`. -/
theorem rank_le (r d D lp lh u Y : ℝ)
    (hd : 0 ≤ d) (hdu : 2 * d ≤ u) (hu : 4 ≤ u) (hD : 1 ≤ D)
    (hY : Y = Real.log (2 * D))
    (hlp : Real.log 2 ≤ lp)
    (hlh : lh ≤ 3 * d * Real.log 2 + Real.log D)
    (hr : r * lp ≤ lh + d * lp) :
    r ≤ u ^ 4 * Y := by
  have hl2 := half_le_log_two
  have hlD : 0 ≤ Real.log D := Real.log_nonneg hD
  have hYeq : Y = Real.log 2 + Real.log D := by
    rw [hY, Real.log_mul (by norm_num) (by linarith)]
  have hYhalf : 1 / 2 ≤ Y := by linarith
  -- first: r ≤ 4 d + 2 log D
  have h1 : r ≤ 4 * d + 2 * Real.log D := by
    by_contra hcon
    push Not at hcon
    have hpos : 0 < r - d := by nlinarith
    have h2 : (r - d) * Real.log 2 ≤ (r - d) * lp :=
      mul_le_mul_of_nonneg_left hlp hpos.le
    have h3 : (r - d) * lp ≤ lh := by linarith
    have h4 : (r - d) * Real.log 2 ≤ 3 * d * Real.log 2 + Real.log D := by linarith
    -- (r - 4d) log 2 ≤ log D, and r - 4d > 2 log D
    have h5 : (r - 4 * d) * Real.log 2 ≤ Real.log D := by nlinarith
    have h6 : 2 * Real.log D < r - 4 * d := by linarith
    have h7 : 2 * Real.log D * Real.log 2 ≤ (r - 4 * d) * Real.log 2 :=
      mul_le_mul_of_nonneg_right h6.le (by linarith)
    nlinarith
  have h8 : r ≤ 2 * u + 2 * Y := by linarith
  have hu4 : (256 : ℝ) ≤ u ^ 4 := by
    have := pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 4) hu 4
    norm_num at this
    linarith
  have hu3 : 64 * u ≤ u ^ 4 := by nlinarith [pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 4) hu 3]
  -- 2u ≤ u⁴ Y / 2 and 2Y ≤ u⁴ Y / 2
  have h9 : 2 * u ≤ u ^ 4 * Y / 2 := by nlinarith
  have h10 : 2 * Y ≤ u ^ 4 * Y / 2 := by nlinarith
  linarith

/-- The counting paragraph. With `v = d·N`, the bounds
`log I ≤ dN² log 3`, the Bayer-Fluckiger–Emery–Houriet bound on `M`, and
`B = I (1+M)^{(s+1)²}` give `log I ≤ u⁵` and `log B ≤ u²³ Y`.
The hypotheses are stated after the elementary reductions `log N ≤ v`, `log d ≤ v`,
`log 3 ≤ 2`, `N³d⁴ ≤ v⁴`, `s + 1 ≤ v²`, which hold for `d ≥ 2`, `N ≥ 5`. -/
theorem count_le (u v Y logI logM logB : ℝ)
    (hu : 4 ≤ u) (hv10 : 10 ≤ v) (hvu : v ≤ 3 * u) (hY : 1 / 2 ≤ Y)
    (hI : logI ≤ 2 * v ^ 2)
    (hM : logM ≤ 3 * v ^ 3 + 5 * v ^ 5 + 9 * v ^ 3 * Y + Y)
    (hB : logB ≤ logI + (v ^ 2) ^ 2 * logM) :
    logI ≤ u ^ 5 ∧ logB ≤ u ^ 23 * Y := by
  have hv0 : 0 ≤ v := by linarith
  have hu0 : 0 ≤ u := by linarith
  have hv2 : 100 ≤ v ^ 2 := by nlinarith
  have hv3 : 0 ≤ v ^ 3 := by positivity
  have hv5 : 100 * v ^ 3 ≤ v ^ 5 := by
    have : v ^ 5 = v ^ 2 * v ^ 3 := by ring
    rw [this]; nlinarith
  -- log M ≤ 11 v⁵ Y
  have hM' : logM ≤ 11 * v ^ 5 * Y := by
    have a1 : 3 * v ^ 3 ≤ 6 * v ^ 3 * Y := by nlinarith
    have a2 : 5 * v ^ 5 ≤ 10 * v ^ 5 * Y := by
      have : 0 ≤ v ^ 5 := by positivity
      nlinarith
    have a3 : 15 * v ^ 3 * Y + Y ≤ v ^ 5 * Y := by
      have : 15 * v ^ 3 + 1 ≤ v ^ 5 := by nlinarith
      nlinarith
    nlinarith
  have hv4 : 0 ≤ (v ^ 2) ^ 2 := by positivity
  have hB' : logB ≤ 12 * v ^ 9 * Y := by
    have b1 : (v ^ 2) ^ 2 * logM ≤ (v ^ 2) ^ 2 * (11 * v ^ 5 * Y) :=
      mul_le_mul_of_nonneg_left hM' hv4
    have b2 : (v ^ 2) ^ 2 * (11 * v ^ 5 * Y) = 11 * v ^ 9 * Y := by ring
    have b3 : 2 * v ^ 2 ≤ v ^ 9 * Y := by
      have c1 : 4 * v ^ 2 ≤ v ^ 9 := by
        have : v ^ 9 = v ^ 2 * v ^ 2 * v ^ 2 * v ^ 2 * v := by ring
        rw [this]
        have h100 : 100 * 100 * 100 * v ^ 2 ≤ v ^ 2 * v ^ 2 * v ^ 2 * v ^ 2 := by
          have e1 : 100 * v ^ 2 ≤ v ^ 2 * v ^ 2 := by nlinarith
          have e2 : 100 * (v ^ 2 * v ^ 2) ≤ v ^ 2 * v ^ 2 * v ^ 2 := by nlinarith
          have e3 : 100 * (v ^ 2 * v ^ 2 * v ^ 2) ≤ v ^ 2 * v ^ 2 * v ^ 2 * v ^ 2 := by nlinarith
          nlinarith
        have hpos : 0 ≤ v ^ 2 * v ^ 2 * v ^ 2 * v ^ 2 := by positivity
        nlinarith
      have : 0 ≤ v ^ 9 := by positivity
      nlinarith
    linarith
  have hu2 : 16 ≤ u ^ 2 := by nlinarith
  refine ⟨?_, ?_⟩
  · -- log I ≤ 2 v² ≤ 18 u² ≤ u⁵
    have d1 : v ^ 2 ≤ 9 * u ^ 2 := by nlinarith
    have d2 : 18 * u ^ 2 ≤ u ^ 5 := by
      have : u ^ 5 = u ^ 2 * u ^ 3 := by ring
      rw [this]
      have : (64 : ℝ) ≤ u ^ 3 := by
        have := pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 4) hu 3
        norm_num at this; linarith
      nlinarith
    linarith
  · -- 12 v⁹ ≤ 12·3⁹ u⁹ ≤ u²³
    have e1 : v ^ 9 ≤ (3 * u) ^ 9 := pow_le_pow_left₀ hv0 hvu 9
    have e2 : (3 * u) ^ 9 = 19683 * u ^ 9 := by ring
    have e3 : (268435456 : ℝ) ≤ u ^ 14 := by
      have := pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 4) hu 14
      norm_num at this; linarith
    have e4 : 12 * 19683 * u ^ 9 ≤ u ^ 23 := by
      have : u ^ 23 = u ^ 14 * u ^ 9 := by ring
      rw [this]
      have : 0 ≤ u ^ 9 := by positivity
      nlinarith
    have e5 : 12 * v ^ 9 ≤ u ^ 23 := by linarith
    have e6 : 12 * v ^ 9 * Y ≤ u ^ 23 * Y := by nlinarith
    linarith

/-- The final assembly. Given `r ≤ u⁴Y` generators, the exponent bound
`p^{i+4}·I·T` with `log T ≤ B log(i+2)`, and `log B ≤ u²³ Y`, one gets
`log |A| ≤ exp(u²⁴ Y)`. Here `B` is the real number bounding the number of simplices,
and `hBexp` is `log B ≤ u²³Y` in exponential form. -/
theorem assembly (u Y r i lp logI B logA : ℝ)
    (hu : 4 ≤ u) (hY : 1 / 2 ≤ Y)
    (hr0 : 0 ≤ r) (hr : r ≤ u ^ 4 * Y)
    (hi : i + 4 ≤ 2 * u) (hli : Real.log (i + 2) ≤ u)
    (hlp0 : 0 ≤ lp) (hlp : lp ≤ u)
    (hI : logI ≤ B) (hB1 : 1 ≤ B) (hBexp : B ≤ Real.exp (u ^ 23 * Y))
    (hA : logA ≤ r * ((i + 4) * lp + logI + B * Real.log (i + 2))) :
    logA ≤ Real.exp (u ^ 24 * Y) := by
  have hu0 : 0 ≤ u := by linarith
  have hY0 : 0 ≤ Y := by linarith
  have hB0 : 0 ≤ B := by linarith
  -- the parenthesis is at most B u³
  have hpar : (i + 4) * lp + logI + B * Real.log (i + 2) ≤ B * u ^ 3 := by
    have p1 : (i + 4) * lp ≤ 2 * u * u := by
      have := mul_le_mul hi hlp hlp0 (by linarith : (0 : ℝ) ≤ 2 * u)
      linarith
    have p2 : B * Real.log (i + 2) ≤ B * u := mul_le_mul_of_nonneg_left hli hB0
    have p3 : 2 * u * u + 1 + u ≤ u ^ 3 := by
      nlinarith [mul_nonneg (sub_nonneg.2 hu) (sq_nonneg u), mul_nonneg (sub_nonneg.2 hu) hu0]
    have p4 : 2 * u * u ≤ B * (2 * u * u) := by nlinarith
    nlinarith
  have hpar0 : 0 ≤ B * u ^ 3 := by positivity
  have h1 : logA ≤ u ^ 4 * Y * (B * u ^ 3) := by
    have a := mul_le_mul_of_nonneg_left hpar hr0
    have b := mul_le_mul_of_nonneg_right hr hpar0
    linarith
  have h2 : u ^ 4 * Y * (B * u ^ 3) = u ^ 7 * Y * B := by ring
  have hu7 : 0 ≤ u ^ 7 * Y := by positivity
  have h3 : u ^ 7 * Y * B ≤ u ^ 7 * Y * Real.exp (u ^ 23 * Y) :=
    mul_le_mul_of_nonneg_left hBexp hu7
  -- u⁷ Y ≤ exp(7u + Y)
  have h4 : u ^ 7 * Y ≤ Real.exp (7 * u + Y) := by
    have hue : u ≤ Real.exp u := by linarith [Real.add_one_le_exp u]
    have hYe : Y ≤ Real.exp Y := by linarith [Real.add_one_le_exp Y]
    have h7 : u ^ 7 ≤ Real.exp u ^ 7 := pow_le_pow_left₀ hu0 hue 7
    have h7' : Real.exp u ^ 7 = Real.exp (7 * u) := by
      rw [← Real.exp_nat_mul]; norm_num
    rw [Real.exp_add, ← h7']
    exact mul_le_mul h7 hYe hY0 (by positivity)
  have h5 : u ^ 7 * Y * Real.exp (u ^ 23 * Y) ≤ Real.exp (7 * u + Y) * Real.exp (u ^ 23 * Y) :=
    mul_le_mul_of_nonneg_right h4 (Real.exp_pos _).le
  have h6 : Real.exp (7 * u + Y) * Real.exp (u ^ 23 * Y) = Real.exp (7 * u + Y + u ^ 23 * Y) := by
    rw [← Real.exp_add]
  -- 7u + Y + u²³Y ≤ u²⁴Y
  have h7 : 7 * u + Y + u ^ 23 * Y ≤ u ^ 24 * Y := by
    have hu22 : (7 : ℝ) ≤ u ^ 22 := by
      have := pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 4) hu 22
      norm_num at this; linarith
    have hu23 : u ^ 23 = u ^ 22 * u := by ring
    have hu24 : u ^ 24 = u ^ 23 * u := by ring
    have k1 : 7 * u ≤ u ^ 23 := by rw [hu23]; nlinarith
    have k0 : 0 ≤ u ^ 23 := by positivity
    have k2 : u ^ 23 ≤ u ^ 23 * (2 * Y) := by nlinarith
    have k3 : (1 : ℝ) ≤ u ^ 23 := by nlinarith
    have k4 : Y ≤ u ^ 23 * Y := by nlinarith
    -- u²⁴Y = u²³·u·Y ≥ 4 u²³ Y
    have k5 : 4 * (u ^ 23 * Y) ≤ u ^ 24 * Y := by
      rw [hu24]
      have : 0 ≤ u ^ 23 * Y := by positivity
      nlinarith
    nlinarith
  have h8 : Real.exp (7 * u + Y + u ^ 23 * Y) ≤ Real.exp (u ^ 24 * Y) :=
    Real.exp_le_exp.mpr h7
  linarith

end K1
