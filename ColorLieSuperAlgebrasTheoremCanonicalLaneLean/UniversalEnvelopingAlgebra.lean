import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure UniversalEnvelopingAlgebra (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) where
  baseAlgebra : Type v
  algebraStruct : Ring baseAlgebra
  algebraStructModule : Module ℂ baseAlgebra
  map : L.underlyingSpace.carrier → baseAlgebra
  universalProperty : ∀ (A : Type v) [Ring A] [Module ℂ A] (f : L.underlyingSpace.carrier → A), (∀ x y : L.underlyingSpace.carrier, f (L.bracket.bracket x y) = (f x) * (f y) - (ε (L.underlyingSpace.grading x) (L.underlyingSpace.grading y)) * (f y) * (f x)) → ∃! φ : baseAlgebra → A, ∀ x : L.underlyingSpace.carrier, φ (map x) = f x

structure UniversalEnvelopingAlgebraEvidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (U : UniversalEnvelopingAlgebra G ε L) where
  baseAlgebraRing : IsRing U.baseAlgebra
  baseAlgebraModule : IsModule ℂ U.baseAlgebra
  mapLinear : ∀ (a : ℂ) (x y : L.underlyingSpace.carrier), U.map (L.underlyingSpace.add x y) = (U.map x) + (U.map y) ∧ U.map (L.underlyingSpace.smul a x) = a • (U.map x)
  universalPropertyClosed : U.universalProperty

def UniversalEnvelopingAlgebraClosed (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (U : UniversalEnvelopingAlgebra G ε L) : Prop :=
  IsRing U.baseAlgebra ∧ IsModule ℂ U.baseAlgebra ∧ (∀ (a : ℂ) (x y : L.underlyingSpace.carrier), U.map (L.underlyingSpace.add x y) = (U.map x) + (U.map y) ∧ U.map (L.underlyingSpace.smul a x) = a • (U.map x)) ∧ U.universalProperty

theorem universal_enveloping_algebra_closed_from_evidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (U : UniversalEnvelopingAlgebra G ε L) (E : UniversalEnvelopingAlgebraEvidence G ε L U) : UniversalEnvelopingAlgebraClosed G ε L U := by
  exact And.intro E.baseAlgebraRing (And.intro E.baseAlgebraModule (And.intro E.mapLinear E.universalPropertyClosed))

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse