import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure UniversalEnvelopingColorPackage {A : ColorGradedAlgebra} (B : ColorGradedBracketPackage A) where
  tensorAlgebra : Type u
  quotientIdeal : Type u
  canonicalMap : A.carrier → tensorAlgebra
  universalProperty : ∀ (R : Type u) [Ring R] (f : A.carrier → R), (∀ x y : A.carrier, f (B.bracket x y) = f x * f y - (-1)^(color) * f y * f x) → (∃! φ : tensorAlgebra → R, φ ∘ canonicalMap = f)

structure UniversalEnvelopingColorEvidence {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} (U : UniversalEnvelopingColorPackage B) where
  universalPropertyClosed : U.universalProperty

def UniversalEnvelopingColorClosed {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} (U : UniversalEnvelopingColorPackage B) : Prop :=
  U.universalProperty

theorem universal_enveloping_color_closed_from_evidence {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} (U : UniversalEnvelopingColorPackage B) (E : UniversalEnvelopingColorEvidence U) : UniversalEnvelopingColorClosed U := by
  exact E.universalPropertyClosed

end HautevilleHouse
end ColorLieSuperAlgebrasTheoremCanonicalLaneLean