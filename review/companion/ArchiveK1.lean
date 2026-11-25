import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KFinal
import Development.AutomorphicArithmetic.CharacterBoxes.SupplyChi
import LayerCounts
import K1Assembly

noncomputable section
namespace Faithful.K1

open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual
open Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.ZK

/-- Specialize the checked composition to the original 21 proofs. -/
theorem assembledBound (hB : BOdd) (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) : ∃ C, LemmaK C :=
  assemble hB hP hF hT sChain sPrism sPrismMul sZc
    LateralTheory.Fin.SRel.intersectionNumber_baseChange sTrans sCoc sThetaOf
    sPhi sEta LateralTheory.Fin.SStein.intersectionNumber_baseChange sClassOf
    sUpperOf LateralTheory.Fin.SDetect.intersectionNumber_baseChange sCount
    LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
    PositivityTheory.QuaternionShaBounds.sSha LateralTheory.Fin.SLayer.intersectionNumber_baseChange
    sTors sNum sFinal

/-- §17.4.3. Keep a single constant outside all fields, twists and choices
    of local data. Expand the archive predicate to expose the interface. -/
theorem effectiveBound (hN : GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) :
    ∃ C : ℝ, ∀ (p : ℕ) [Fact p.Prime] (L Ω : Type) [Field L] [NumberField L]
      [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω p),
      IsTotallyComplex L → HasMuQ p L → ∀ e : ℕ, 1 ≤ e →
      Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤
        Real.exp ((2 * (e : ℝ) * Module.finrank ℚ L) ^ C *
          Real.log (2 * ((discr L).natAbs : ℝ))) := by
  exact assembledBound bOdd (UpperTheory.V.HV.U.pt_s hN) hN.coh.lfK hN.coh.ltK

/-- Instantiate the manuscript's cancellation with the layer parameters
    and the two original homology torsion factors. -/
theorem cancelForLayer (p ν k c : ℕ) [Fact p.Prime]
    (L' : Type) [Field L'] [NumberField L'] (hν : ℕ)
    (h : hν * (p ^ ν) ^ InfinitePlace.nrComplexPlaces L' ≤
      ((p ^ ν) ^ InfinitePlace.nrComplexPlaces L' *
        tc L' (4*k+10) (2*k+3) * tc L' (4*k+10) (2*k+2)) *
        p ^ ((2*k+2+(2*k+3)*(c+(2*k+3))+(k+1).factorization p)*gens L'+c+(k+1).factorization p)) :
    hν ≤ tc L' (4*k+10) (2*k+3) * tc L' (4*k+10) (2*k+2) *
      p ^ ((2*k+2+(2*k+3)*(c+(2*k+3))+(k+1).factorization p)*gens L'+c+(k+1).factorization p) :=
  cancelLayerFactor _ _ _ _ _ _ _ (Fact.out : p.Prime).pos h

end Faithful.K1

namespace Faithful.Host
open Formalism.BasicNotions Formalism.MainNotions Formalism.HC GlobalTheory.EX UpperTheory.Top

/-- The character-specific host actually supplied to the terminal reduction. -/
theorem forWindow : ∀ ψ : PChar, VWinAt ψ 401 → HostExW (3 / 2) (GChi ψ).req :=
  UpperTheory.Top.supplyChi
end Faithful.Host
