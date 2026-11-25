/- §17.4.3, finite-layer count. Arithmetic interface with explicit hypotheses.
   Compare NumThree.lean, sNum, the proof of hB before the call to hSha. -/
namespace Faithful.K1

/-- SelmerOrderCounts.lean, last comparison. vE and vC are valuations
    of the finite unit and class quotients. All hypotheses come from the
    unit, divisor and kernel estimates before the final calculation. -/
theorem equivariantCount (p ν r hν vE vC c f b g B : Nat) (hp : 0 < p)
    (characters : hν ≤ p ^ vC)
    (unitVal : vE + (c + f) = r * (ν + f))
    (kernelRange : p ^ (vE + vC) ≤ B * p ^ ((b + f) * g)) :
    hν * (p ^ ν) ^ r ≤ B * p ^ ((b + f) * g + c + f) := by
  have rankTerm : (p ^ ν) ^ r ≤ p ^ (vE + (c + f)) := by
    rw [← Nat.pow_mul, unitVal, Nat.mul_comm ν r]
    exact Nat.pow_le_pow_right hp (Nat.mul_le_mul_left _ (Nat.le_add_right _ _))
  calc
    _ ≤ p ^ vC * p ^ (vE + (c + f)) := Nat.mul_le_mul characters rankTerm
    _ = p ^ (vE + vC) * p ^ (c + f) := by
      rw [← Nat.pow_add, ← Nat.pow_add]
      simp only [Nat.add_left_comm, Nat.add_comm]
    _ ≤ (B * p ^ ((b + f) * g)) * p ^ (c + f) :=
      Nat.mul_le_mul_right _ kernelRange
    _ = _ := by rw [Nat.mul_assoc, ← Nat.pow_add, Nat.add_assoc ((b + f) * g)]

theorem cancelLayerFactor (p ν r₂ hν T₁ T₂ X : Nat) (hp : 0 < p)
    (count : hν * (p ^ ν) ^ r₂ ≤
      ((p ^ ν) ^ r₂ * T₁ * T₂) * p ^ X) :
    hν ≤ T₁ * T₂ * p ^ X := by
  apply Nat.le_of_mul_le_mul_left (c := (p ^ ν) ^ r₂)
  · simpa only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] using count
  · exact Nat.pow_pos (Nat.pow_pos hp)

/- The finite-length step, isolated at the level of the numerical
   identities. The archive proves the identities from its cohomology data. -/
theorem orderFromLength (p card t s d e floorLog : Nat) (hp : 0 < p)
    (hcard : card = p ^ t)
    (hbound : t ≤ s + d * (2 + floorLog + e)) :
    card ≤ p ^ (s + d * (2 + floorLog + e)) := by
  rw [hcard]
  exact Nat.pow_le_pow_right hp hbound

end Faithful.K1
