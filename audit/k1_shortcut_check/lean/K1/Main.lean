import K1.Arithmetic
import K1.TorsionFree

/-!
# §17.4.3 as one conditional statement

`effective_bound` is the conclusion of §17.4.3 of Adriazola's reconstruction,
`log |A| ≤ exp(u²⁴ · log(2D))`, derived from five hypotheses. Each hypothesis is a
numerical statement that the manuscript obtains from mathematics which is **not**
formalized here:

* `hgen`  – the number of generators of `A` (Kummer theory, the Brauer group, the class group);
* `hclass`– the class number bound `h ≤ 2^{3d} D` (Minkowski; see `classNumber_arith`);
* `hindex`– the index of the level-three subgroup, `I ≤ 3^{dN²}`;
* `hBFEH` – the bound of Bayer-Fluckiger–Emery–Houriet on the set `Φ`, in the form `log(1+M)`;
* `hexp`  – the exponent of `A` divides `p^{i+4}·I·T` with `log T ≤ B log(i+2)`
            (Quillen–Lichtenbaum, homological stability, the well-rounded retract,
            the transfer, Hadamard's inequality and the Hurewicz kernel).

All quantities are real numbers; `d`, `i`, `p` are the degree, `2e` and the prime.
-/

namespace K1

open Real

theorem effective_bound_aux (d i D p r logh logI logM logA N v u Y logB : ℝ)
    (hN : N = 2 * i + 1) (hv : v = d * N) (hu : u = i * d) (hY : Y = Real.log (2 * D))
    (hlogB : logB = logI + (d / 2 * N ^ 2 + 1) ^ 2 * logM)
    (hd : 2 ≤ d) (hi : 2 ≤ i) (hD : 1 ≤ D) (hp2 : 2 ≤ p) (hpd : p ≤ d + 1)
    (hgen : r * Real.log p ≤ logh + d * Real.log p) (hr0 : 0 ≤ r)
    (hclass : logh ≤ 3 * d * Real.log 2 + Real.log D)
    (hI0 : 0 ≤ logI)
    (hindex : logI ≤ d * N ^ 2 * Real.log 3)
    (hM0 : 0 ≤ logM)
    (hBFEH : logM ≤ 3 * N ^ 2 * d ^ 2 * Real.log N
        + 5 * N ^ 3 * d ^ 4 * Real.log d
        + 9 * N ^ 3 * d ^ 3 * Real.log D + Real.log 2)
    (hexp : logA ≤ r * ((i + 4) * Real.log p + logI + Real.exp logB * Real.log (i + 2))) :
    logA ≤ Real.exp (u ^ 24 * Y) := by
  have hl2 := half_le_log_two
  have hN5 : 5 ≤ N := by rw [hN]; linarith
  have hd0 : 0 ≤ d := by linarith
  have hN0 : 0 ≤ N := by linarith
  have hv10 : 10 ≤ v := by
    rw [hv]; nlinarith only [mul_nonneg (sub_nonneg.2 hd) (sub_nonneg.2 hN5), hd, hN5]
  have hv0 : 0 ≤ v := by linarith
  have hu4 : 4 ≤ u := by rw [hu]; nlinarith only [mul_nonneg (sub_nonneg.2 hi) (sub_nonneg.2 hd), hd, hi]
  have hvu : v ≤ 3 * u := by
    rw [hv, hu, hN]; nlinarith only [mul_nonneg (sub_nonneg.2 (by linarith : (1 : ℝ) ≤ i)) hd0]
  have hYeq : Y = Real.log 2 + Real.log D := by
    rw [hY, Real.log_mul (by norm_num) (by linarith)]
  have hlD : 0 ≤ Real.log D := Real.log_nonneg hD
  have hYhalf : 1 / 2 ≤ Y := by linarith
  have hlogle : ∀ x : ℝ, 0 < x → Real.log x ≤ x := fun x hx => by
    have := Real.log_le_sub_one_of_pos hx; linarith
  -- the index
  have hl3 : Real.log 3 ≤ 2 := by
    have := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 3); linarith
  have hdN2 : 0 ≤ d * N ^ 2 := by positivity
  have hv2 : v ^ 2 = d ^ 2 * N ^ 2 := by rw [hv]; ring
  have hI : logI ≤ 2 * v ^ 2 := by
    have a1 : d * N ^ 2 * Real.log 3 ≤ d * N ^ 2 * 2 := mul_le_mul_of_nonneg_left hl3 hdN2
    have a2 : d * N ^ 2 * 2 ≤ v ^ 2 := by
      rw [hv2]; nlinarith only [mul_nonneg hdN2 (sub_nonneg.2 hd)]
    have a3 : 0 ≤ v ^ 2 := by positivity
    linarith
  -- the Bayer-Fluckiger–Emery–Houriet bound in terms of v
  have hNv : N ≤ v := by
    rw [hv]; nlinarith only [mul_nonneg (sub_nonneg.2 (by linarith : (1 : ℝ) ≤ d)) hN0]
  have hdv : d ≤ v := by
    rw [hv]; nlinarith only [mul_nonneg hd0 (sub_nonneg.2 (by linarith : (1 : ℝ) ≤ N))]
  have hlN : Real.log N ≤ v := (hlogle N (by linarith)).trans hNv
  have hld : Real.log d ≤ d := hlogle d (by linarith)
  have hld0 : 0 ≤ Real.log d := Real.log_nonneg (by linarith)
  have hM : logM ≤ 3 * v ^ 3 + 5 * v ^ 5 + 9 * v ^ 3 * Y + Y := by
    have t1 : 3 * N ^ 2 * d ^ 2 * Real.log N ≤ 3 * v ^ 3 := by
      have e : 3 * v ^ 3 = 3 * N ^ 2 * d ^ 2 * v := by rw [hv]; ring
      rw [e]
      exact mul_le_mul_of_nonneg_left hlN (by positivity)
    have t2 : 5 * N ^ 3 * d ^ 4 * Real.log d ≤ 5 * v ^ 5 := by
      have e1 : 5 * N ^ 3 * d ^ 4 * Real.log d ≤ 5 * N ^ 3 * d ^ 4 * d :=
        mul_le_mul_of_nonneg_left hld (by positivity)
      have e2 : 5 * N ^ 3 * d ^ 4 * d ≤ 5 * v ^ 5 := by
        have e3 : 5 * v ^ 5 = 5 * N ^ 3 * d ^ 4 * d * N ^ 2 := by rw [hv]; ring
        rw [e3]
        have hN2 : 1 ≤ N ^ 2 := by nlinarith only [hN5]
        have hpos : 0 ≤ 5 * N ^ 3 * d ^ 4 * d := by positivity
        exact le_mul_of_one_le_right hpos hN2
      linarith
    have t3 : 9 * N ^ 3 * d ^ 3 * Real.log D ≤ 9 * v ^ 3 * Y := by
      have e : 9 * v ^ 3 = 9 * N ^ 3 * d ^ 3 := by rw [hv]; ring
      rw [e]
      exact mul_le_mul_of_nonneg_left (by linarith) (by positivity)
    linarith
  -- the count
  have hs : (d / 2 * N ^ 2 + 1) ^ 2 ≤ (v ^ 2) ^ 2 := by
    have s0 : 0 ≤ d / 2 * N ^ 2 + 1 := by positivity
    have s1 : d / 2 * N ^ 2 + 1 ≤ v ^ 2 := by
      rw [hv2]
      have h25 : (25 : ℝ) ≤ N ^ 2 := by nlinarith only [hN5]
      nlinarith only [mul_nonneg hdN2 (sub_nonneg.2 hd),
        mul_nonneg (sub_nonneg.2 hd) (sub_nonneg.2 h25), hd, h25]
    exact pow_le_pow_left₀ s0 s1 2
  have hB : logB ≤ logI + (v ^ 2) ^ 2 * logM := by
    rw [hlogB]
    have := mul_le_mul_of_nonneg_right hs hM0
    linarith
  obtain ⟨hI5, hB23⟩ := count_le u v Y logI logM logB hu4 hv10 hvu hYhalf hI hM hB
  -- generators
  have hdu : 2 * d ≤ u := by rw [hu]; nlinarith only [mul_nonneg (sub_nonneg.2 hi) hd0]
  have hlp : Real.log 2 ≤ Real.log p := Real.log_le_log (by norm_num) hp2
  have hr : r ≤ u ^ 4 * Y :=
    rank_le r d D (Real.log p) logh u Y hd0 hdu hu4 hD hY hlp hclass hgen
  -- the remaining hypotheses of the assembly
  have hlogB0 : logI ≤ logB := by
    rw [hlogB]
    have : 0 ≤ (d / 2 * N ^ 2 + 1) ^ 2 * logM := by positivity
    linarith
  have hBge : logB + 1 ≤ Real.exp logB := Real.add_one_le_exp logB
  have hi4 : i + 4 ≤ 2 * u := by rw [hu]; nlinarith only [mul_nonneg (sub_nonneg.2 hi) (sub_nonneg.2 hd), hd, hi]
  have hli : Real.log (i + 2) ≤ u := by
    have := hlogle (i + 2) (by linarith)
    have : i + 2 ≤ u := by rw [hu]; nlinarith only [mul_nonneg (sub_nonneg.2 hi) (sub_nonneg.2 hd), hd, hi]
    linarith
  have hlpu : Real.log p ≤ u := by
    have := hlogle p (by linarith)
    have : d + 1 ≤ u := by rw [hu]; nlinarith only [mul_nonneg (sub_nonneg.2 hi) (sub_nonneg.2 hd), hd, hi]
    linarith
  exact assembly u Y r i (Real.log p) logI (Real.exp logB) logA hu4 hYhalf hr0 hr hi4 hli
    (by linarith) hlpu (by linarith) (by linarith) (Real.exp_le_exp.mpr hB23) hexp


theorem effective_bound (d i D p r logh logI logM logA : ℝ)
    (hd : 2 ≤ d) (hi : 2 ≤ i) (hD : 1 ≤ D) (hp2 : 2 ≤ p) (hpd : p ≤ d + 1)
    (hgen : r * Real.log p ≤ logh + d * Real.log p) (hr0 : 0 ≤ r)
    (hclass : logh ≤ 3 * d * Real.log 2 + Real.log D)
    (hI0 : 0 ≤ logI)
    (hindex : logI ≤ d * (2 * i + 1) ^ 2 * Real.log 3)
    (hM0 : 0 ≤ logM)
    (hBFEH : logM ≤ 3 * (2 * i + 1) ^ 2 * d ^ 2 * Real.log (2 * i + 1)
        + 5 * (2 * i + 1) ^ 3 * d ^ 4 * Real.log d
        + 9 * (2 * i + 1) ^ 3 * d ^ 3 * Real.log D + Real.log 2)
    (hexp : logA ≤ r * ((i + 4) * Real.log p + logI
        + Real.exp (logI + (d / 2 * (2 * i + 1) ^ 2 + 1) ^ 2 * logM) * Real.log (i + 2))) :
    logA ≤ Real.exp ((i * d) ^ 24 * Real.log (2 * D)) :=
  effective_bound_aux d i D p r logh logI logM logA (2 * i + 1) (d * (2 * i + 1)) (i * d)
    (Real.log (2 * D)) (logI + (d / 2 * (2 * i + 1) ^ 2 + 1) ^ 2 * logM)
    rfl rfl rfl rfl rfl hd hi hD hp2 hpd hgen hr0 hclass hI0 hindex hM0 hBFEH hexp

end K1
