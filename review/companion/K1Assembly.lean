/- Logical composition at the end of LemmaKOfSteps.lean. Every input is a
   proposition parameter. The names describe the archive interfaces only.
   A check of this file verifies the composition, assuming its inputs. -/
namespace Faithful.K1
theorem assemble
    {chain prism prismMul cycle relation transfer cocycle primitive rank
     eta steinitz detect count sha layer torsion pt localFinite localDual
     theta classCycles upper few shaBound orderBound : Prop}
    (hB : rank) (hP : pt) (hF : localFinite) (hT : localDual)
    (h1 : chain) (h2 : prism) (h3 : prismMul) (h4 : cycle)
    (h5 : relation) (h6 : transfer) (h7 : cocycle)
    (h8 : chain → prism → prismMul → cycle → transfer → cocycle → theta)
    (h9 : primitive) (h10 : eta) (h11 : steinitz)
    (h12 : chain → prism → prismMul → cycle → relation → eta → steinitz → classCycles)
    (h13 : chain → rank → upper) (h14 : detect) (h15 : count)
    (h16 : theta → primitive → classCycles → upper → detect → few)
    (h17 : sha) (h18 : layer) (h19 : torsion)
    (h20 : few → count → sha → layer → torsion → shaBound)
    (h21 : pt → localFinite → localDual → shaBound → orderBound) : orderBound :=
  h21 hP hF hT (h20 (h16 (h8 h1 h2 h3 h4 h6 h7) h9 (h12 h1 h2 h3 h4 h5 h10 h11) (h13 h1 hB) h14) h15 h17 h18 h19)
end Faithful.K1
