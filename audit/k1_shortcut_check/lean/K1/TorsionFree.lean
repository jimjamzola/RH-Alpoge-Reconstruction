import Mathlib

/-!
# The level-three congruence subgroup is torsion-free

§17.4.3 uses that the kernel of reduction modulo 3 in `GL_n(ℤ)` has no nontrivial
element of finite order. This file proves it for integer matrices: if `g ≡ 1 mod 3`
and `g ^ k = 1` with `k > 0`, then `g = 1`.
-/

namespace K1

open Matrix

variable {n : Type*} [Fintype n] [DecidableEq n]

omit [Fintype n] [DecidableEq n] in
/-- An integer matrix divisible by every power of 3 is zero. -/
theorem eq_zero_of_forall_three_pow_dvd (x : Matrix n n ℤ)
    (h : ∀ a : ℕ, ∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ a • B) : x = 0 := by
  ext i j
  have hall : ∀ a : ℕ, (3 : ℤ) ^ a ∣ x i j := by
    intro a
    obtain ⟨B, hB⟩ := h a
    exact ⟨B i j, by rw [hB]; rfl⟩
  by_contra hne
  have hne' : x i j ≠ 0 := hne
  have h1 : (3 : ℕ) ^ (x i j).natAbs ∣ (x i j).natAbs := by
    have := Int.natAbs_dvd_natAbs.mpr (hall (x i j).natAbs)
    simpa [Int.natAbs_pow] using this
  have hpos : 0 < (x i j).natAbs := Int.natAbs_pos.mpr hne'
  have h2 := Nat.le_of_dvd hpos h1
  have h3 : (x i j).natAbs < 3 ^ (x i j).natAbs := Nat.lt_pow_self (by norm_num)
  omega

omit [Fintype n] [DecidableEq n] in
/-- Cancelling a nonzero integer scalar from a matrix identity. -/
theorem smul_cancel {c : ℤ} (hc : c ≠ 0) {A A' : Matrix n n ℤ} (h : c • A = c • A') : A = A' := by
  ext i j
  have := congrFun (congrFun h i) j
  simp only [Matrix.smul_apply, smul_eq_mul] at this
  exact mul_left_cancel₀ hc this

/-- `(1 + x)^k = 1 + k x + x² P` for some `P`. -/
theorem exists_pow_expansion (x : Matrix n n ℤ) (k : ℕ) :
    ∃ P : Matrix n n ℤ, (1 + x) ^ k = 1 + (k : ℤ) • x + x * x * P := by
  induction k with
  | zero => exact ⟨0, by simp⟩
  | succ k ih =>
    obtain ⟨P, hP⟩ := ih
    refine ⟨(k : ℤ) • 1 + P + P * x, ?_⟩
    rw [pow_succ, hP]
    simp only [Nat.cast_succ, mul_add, add_mul, mul_one, one_mul, Matrix.smul_mul,
      Matrix.mul_smul, add_smul, one_smul, mul_assoc]
    abel

/-- `(1 + y)^3` expanded. -/
theorem one_add_cube (y : Matrix n n ℤ) :
    (1 + y) ^ 3 = 1 + (3 : ℤ) • y + (3 : ℤ) • (y * y) + y * y * y := by
  noncomm_ring

/-- One step of the descent when `k` is prime to 3. -/
theorem step_coprime (x : Matrix n n ℤ) (k : ℕ) (hk : IsCoprime (k : ℤ) 3)
    (hx : (1 + x) ^ k = 1) (a : ℕ) (ha : 1 ≤ a)
    (h : ∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ a • B) :
    ∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ (a + 1) • B := by
  obtain ⟨B, rfl⟩ := h
  obtain ⟨a', rfl⟩ : ∃ a', a = a' + 1 := ⟨a - 1, by omega⟩
  obtain ⟨c, hc⟩ : ∃ c : ℤ, c = (3 : ℤ) ^ a' := ⟨_, rfl⟩
  have hc0 : c ≠ 0 := by rw [hc]; positivity
  have h3 : (3 : ℤ) ^ (a' + 1) = c * 3 := by rw [hc, pow_succ]
  have h33 : (3 : ℤ) ^ (a' + 1 + 1) = c * 3 * 3 := by rw [pow_succ, h3]
  rw [h3] at hx
  rw [h3, h33]
  obtain ⟨P, hP⟩ := exists_pow_expansion ((c * 3) • B) k
  rw [hx] at hP
  have h1 : (c * 3) • B * ((c * 3) • B) * P = ((c * 3) * (c * 3)) • (B * B * P) := by
    simp only [Matrix.smul_mul, Matrix.mul_smul, smul_smul]
  rw [h1] at hP
  have h0 : (k : ℤ) • ((c * 3) • B) + ((c * 3) * (c * 3)) • (B * B * P) = 0 := by
    linear_combination (norm := module) -hP
  have key : (k : ℤ) • B = (3 : ℤ) • (-(c • (B * B * P))) := by
    apply smul_cancel (c := c * 3) (mul_ne_zero hc0 (by norm_num))
    linear_combination (norm := module) h0
  obtain ⟨s, t, hst⟩ := hk
  have hB : B = (3 : ℤ) • (s • (-(c • (B * B * P))) + t • B) := by
    have e : B = (s * (k : ℤ) + t * 3) • B := by rw [hst, one_smul]
    calc B = (s * (k : ℤ) + t * 3) • B := e
      _ = (3 : ℤ) • (s • (-(c • (B * B * P))) + t • B) := by
        linear_combination (norm := module) s • key
  exact ⟨s • (-(c • (B * B * P))) + t • B, by linear_combination (norm := module) (c * 3) • hB⟩

/-- One step of the descent for `k = 3`. -/
theorem step_three (x : Matrix n n ℤ) (hx : (1 + x) ^ 3 = 1) (a : ℕ) (ha : 1 ≤ a)
    (h : ∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ a • B) :
    ∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ (a + 1) • B := by
  obtain ⟨B, rfl⟩ := h
  obtain ⟨a', rfl⟩ : ∃ a', a = a' + 1 := ⟨a - 1, by omega⟩
  obtain ⟨c, hc⟩ : ∃ c : ℤ, c = (3 : ℤ) ^ a' := ⟨_, rfl⟩
  have hc0 : c ≠ 0 := by rw [hc]; positivity
  have h3 : (3 : ℤ) ^ (a' + 1) = c * 3 := by rw [hc, pow_succ]
  have h33 : (3 : ℤ) ^ (a' + 1 + 1) = c * 3 * 3 := by rw [pow_succ, h3]
  rw [h3] at hx
  rw [h3, h33]
  have hy2 : (c * 3) • B * ((c * 3) • B) = ((c * 3) * (c * 3)) • (B * B) := by
    rw [Matrix.smul_mul, Matrix.mul_smul, smul_smul]
  have hy3 : (c * 3) • B * ((c * 3) • B) * ((c * 3) • B)
      = ((c * 3) * (c * 3) * (c * 3)) • (B * B * B) := by
    rw [hy2, Matrix.smul_mul, Matrix.mul_smul, smul_smul]
  rw [one_add_cube, hy3, hy2] at hx
  have h0 : (3 : ℤ) • ((c * 3) • B) + (3 : ℤ) • (((c * 3) * (c * 3)) • (B * B))
      + ((c * 3) * (c * 3) * (c * 3)) • (B * B * B) = 0 := by
    linear_combination (norm := module) hx
  have hB : B = (3 : ℤ) • (-(c • (B * B)) - (c * c) • (B * B * B)) := by
    apply smul_cancel (c := 3 * (c * 3)) (mul_ne_zero (by norm_num) (mul_ne_zero hc0 (by norm_num)))
    linear_combination (norm := module) h0
  exact ⟨-(c • (B * B)) - (c * c) • (B * B * B), by linear_combination (norm := module) (c * 3) • hB⟩

omit [Fintype n] [DecidableEq n] in
/-- Descent: if every step goes through, `x = 0`. -/
theorem eq_zero_of_steps (x : Matrix n n ℤ) (h1 : ∃ B : Matrix n n ℤ, x = (3 : ℤ) • B)
    (hstep : ∀ a : ℕ, 1 ≤ a → (∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ a • B) →
      ∃ B : Matrix n n ℤ, x = (3 : ℤ) ^ (a + 1) • B) : x = 0 := by
  apply eq_zero_of_forall_three_pow_dvd
  intro a
  induction a with
  | zero => exact ⟨x, by simp⟩
  | succ a ih =>
    rcases Nat.eq_zero_or_pos a with rfl | hpos
    · simpa using h1
    · exact hstep a hpos ih

/-- **The level-three congruence subgroup is torsion-free.** An integer matrix congruent
to the identity modulo 3 and of finite multiplicative order is the identity. -/
theorem eq_one_of_pow_eq_one_of_three_dvd_sub (k : ℕ) :
    ∀ g : Matrix n n ℤ, (∃ B : Matrix n n ℤ, g = 1 + (3 : ℤ) • B) → 0 < k → g ^ k = 1 → g = 1 := by
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    intro g hg hk hgk
    obtain ⟨B, rfl⟩ := hg
    by_cases h3 : 3 ∣ k
    · -- k = 3 m: first g^m = 1 by the case k = 3, then induct
      obtain ⟨m, rfl⟩ := h3
      have hm : 0 < m := by omega
      obtain ⟨P, hP⟩ := exists_pow_expansion ((3 : ℤ) • B) m
      have hcong : (1 + (3 : ℤ) • B) ^ m = 1 + (3 : ℤ) • ((m : ℤ) • B + (3 : ℤ) • (B * B * P)) := by
        rw [hP]
        simp only [Matrix.smul_mul, Matrix.mul_smul, smul_smul]
        module
      have h3' : (1 + (3 : ℤ) • ((m : ℤ) • B + (3 : ℤ) • (B * B * P))) ^ 3 = 1 := by
        rw [← hcong, ← pow_mul, mul_comm]; exact hgk
      have hzero : (3 : ℤ) • ((m : ℤ) • B + (3 : ℤ) • (B * B * P)) = 0 :=
        eq_zero_of_steps _ ⟨_, rfl⟩ (fun a ha h => step_three _ h3' a ha h)
      have hgm : (1 + (3 : ℤ) • B) ^ m = 1 := by rw [hcong, hzero, add_zero]
      exact ih m (by omega) _ ⟨B, rfl⟩ hm hgm
    · have hcop : IsCoprime (k : ℤ) 3 := by
        have : Nat.Coprime k 3 := by
          rw [Nat.coprime_comm]
          exact (Nat.Prime.coprime_iff_not_dvd Nat.prime_three).mpr h3
        exact_mod_cast Nat.isCoprime_iff_coprime.mpr this
      have hzero : (3 : ℤ) • B = 0 :=
        eq_zero_of_steps _ ⟨B, rfl⟩ (fun a ha h => step_coprime _ k hcop hgk a ha h)
      rw [hzero, add_zero]

end K1
