import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorRepresentationPackage (A : ColorGradedAlgebra) where
  representationSpace : Type u
  action : A.carrier → representationSpace → representationSpace
  linearity : ∀ (a : A.carrier) (v w : representationSpace), action a (v + w) = action a v + action a w
  colorCompatibility : ∀ (a b : A.carrier), action (A.multiplication a b) = (action a) ∘ (action b)

structure ColorRepresentationEvidence {A : ColorGradedAlgebra} (R : ColorRepresentationPackage A) where
  linearityClosed : R.linearity
  colorCompatibilityClosed : R.colorCompatibility

def ColorRepresentationClosed {A : ColorGradedAlgebra} (R : ColorRepresentationPackage A) : Prop :=
  R.linearity ∧ R.colorCompatibility

theorem color_representation_closed_from_evidence {A : ColorGradedAlgebra} (R : ColorRepresentationPackage A) (E : ColorRepresentationEvidence R) : ColorRepresentationClosed R := by
  exact And.intro E.linearityClosed E.colorCompatibilityClosed

end HautevilleHouse
end ColorLieSuperAlgebrasTheoremCanonicalLaneLean