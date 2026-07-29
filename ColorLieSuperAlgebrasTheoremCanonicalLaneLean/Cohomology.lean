import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

/-!
# Cohomology Package

This module defines the cohomology theory for Color Lie superalgebras.
-/

structure ColorSuperalgebraCohomology (G : ColorGrading) (S : SuperJacobiIdentity G) where
  cochains : ℕ → Type u
  coboundary : ∀ n : ℕ, cochains n → cochains (n+1)
  cohomologyGroup : ℕ → Type u
  cocycleCondition : ∀ n : ℕ, ∀ ω : cochains n, coboundary (n+1) (coboundary n ω) = 0
  cohomologyDefined : ∀ n : ℕ, cohomologyGroup n = (ker (coboundary n)) / (im (coboundary (n-1)))

structure ColorSuperalgebraCohomologyEvidence {G : ColorGrading} {S : SuperJacobiIdentity G} (H : ColorSuperalgebraCohomology G S) where
  cocycleConditionClosed : H.cocycleCondition
  cohomologyDefinedClosed : H.cohomologyDefined

def ColorSuperalgebraCohomologyClosed {G : ColorGrading} {S : SuperJacobiIdentity G} (H : ColorSuperalgebraCohomology G S) : Prop :=
  H.cocycleCondition ∧ H.cohomologyDefined

theorem cohomology_closed_from_evidence {G : ColorGrading} {S : SuperJacobiIdentity G} (H : ColorSuperalgebraCohomology G S) (E : ColorSuperalgebraCohomologyEvidence H) : ColorSuperalgebraCohomologyClosed H := by
  exact And.intro E.cocycleConditionClosed E.cohomologyDefinedClosed

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse