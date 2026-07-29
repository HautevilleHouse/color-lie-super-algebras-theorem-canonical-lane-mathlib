import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ColorLieSuperAlgebrasTheoremCanonicalLaneLean.ColorLieSuperAlgebraStructure

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

def ColorLieSuperAlgebrasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem color_lie_super_algebras_endgame (A : AdmissibleClass) :
    ColorLieSuperAlgebrasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
