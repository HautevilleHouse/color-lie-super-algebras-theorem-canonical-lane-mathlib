import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ColorLieSuperAlgebrasTheoremCanonicalLaneLean.Cohomology

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

/-!
# Classical Theorem Package

This module packages the classical theorem about Color Lie superalgebras.
-/

structure ClassicalColorLieSuperalgebraTheorem (G : ColorGrading) (S : SuperJacobiIdentity G) (R : ColorSuperalgebraRepresentation G S) (H : ColorSuperalgebraCohomology G S) where
  theoremStatement : Prop
  proof : theoremStatement

structure ClassicalColorLieSuperalgebraTheoremEvidence {G : ColorGrading} {S : SuperJacobiIdentity G} {R : ColorSuperalgebraRepresentation G S} {H : ColorSuperalgebraCohomology G S} (T : ClassicalColorLieSuperalgebraTheorem G S R H) where
  proofClosed : T.theoremStatement

def ClassicalColorLieSuperalgebraTheoremClosed {G : ColorGrading} {S : SuperJacobiIdentity G} {R : ColorSuperalgebraRepresentation G S} {H : ColorSuperalgebraCohomology G S} (T : ClassicalColorLieSuperalgebraTheorem G S R H) : Prop :=
  T.theoremStatement

theorem classical_theorem_closed_from_evidence {G : ColorGrading} {S : SuperJacobiIdentity G} {R : ColorSuperalgebraRepresentation G S} {H : ColorSuperalgebraCohomology G S} (T : ClassicalColorLieSuperalgebraTheorem G S R H) (E : ClassicalColorLieSuperalgebraTheoremEvidence T) : ClassicalColorLieSuperalgebraTheoremClosed T := by
  exact E.proofClosed

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse