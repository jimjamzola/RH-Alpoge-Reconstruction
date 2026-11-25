import Init

namespace Faithful.Passages

/-- Degreewise prism cancellation at a single bar basis coordinate.
The integer identity can then be reduced modulo the layer modulus. -/
theorem prismCancellation (original conjugate prism : Int)
    (hboundary : prism = original - conjugate) :
    conjugate - original + prism = 0 := by omega

/-- The calculation using the section only requires it on the image
of the reduced rational space. The rational coordinates may be different
from the chosen analytic coordinates. -/
theorem periodOnImage {Q A E F V : Type}
    (includeQ : Q → A) (row : A → E) (sectionMap : E → A)
    (period : A → V) (column : E → V) (rational : Q → F) (embed : F → V)
    (hsec : ∀ q, sectionMap (row (includeQ q)) = includeQ q)
    (hcolumn : ∀ x, column x = period (sectionMap x))
    (honQ : ∀ q, period (includeQ q) = embed (rational q)) (q : Q) :
    column (row (includeQ q)) = embed (rational q) := by
  rw [hcolumn, hsec, honQ]

/-- Transfer an eigenvalue from the reduced source to its nonzero image.
Scalar cancellation at the image vector is the only cancellation used. -/
theorem imageScalar {S W K : Type} (lift : S → W) (adj : W → S)
    (actS : K → S → S) (actW : K → W → W) (z : S) (a b : K)
    (mapScalar : lift (actS a z) = actW a (lift z))
    (sourceEq : adj (lift z) = actS a z)
    (imageEq : lift (adj (lift z)) = actW b (lift z))
    (cancel : ∀ c d, actW c (lift z) = actW d (lift z) → c = d) : a = b :=
  cancel a b (mapScalar.symm.trans ((congrArg lift sourceEq).symm.trans imageEq))

/-- Form the common threshold before selecting the family. Every property
in the finite list is then certified at the very same selected family. -/
theorem oneFamily {F : Type} (bounds : List Nat) (size : F → Nat)
    (P : Nat → F → Prop) (design : ∀ n, ∃ f, n ≤ size f)
    (holds : ∀ n, n ∈ bounds → ∀ f, n ≤ size f → P n f) :
    ∃ f, ∀ n, n ∈ bounds → P n f := by
  have dominates (xs : List Nat) : ∀ n, n ∈ xs → n ≤ xs.foldr max 0 := by
    induction xs with
    | nil => simp
    | cons h t ih =>
      intro n hn
      rcases List.mem_cons.mp hn with eq | ht
      · subst n; exact Nat.le_max_left _ _
      · exact Nat.le_trans (ih n ht) (Nat.le_max_right _ _)
  obtain ⟨f, hf⟩ := design (bounds.foldr max 0)
  exact ⟨f, fun n hn => holds n hn f (Nat.le_trans (dominates bounds n hn) hf)⟩

/-- An additive change in a common height majorant cancels from
word differences and adds once to the one-sided accounting budget. -/
theorem heightShift (u v offset lhs bound : Int) (account : lhs + u ≤ bound) :
    (u + offset) - (v + offset) = u - v ∧
    lhs + (u + offset) ≤ bound + offset := by omega

theorem originalExponents :
    5 * (24 + 2) + 11 = 141 ∧ 141 + 9 = 150 ∧
    2 + 0 + 3 = 5 ∧ 2 + 0 + 7 = 9 := by decide

end Faithful.Passages
