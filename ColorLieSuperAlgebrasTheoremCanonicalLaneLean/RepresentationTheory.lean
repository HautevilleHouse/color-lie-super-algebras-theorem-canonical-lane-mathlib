import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure Representation (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (V : GradedVectorSpace G) where
  action : L.underlyingSpace.carrier → (V.carrier → V.carrier)
  linearInX : ∀ (a b : ℂ) (x y : L.underlyingSpace.carrier) (v : V.carrier), action (L.underlyingSpace.add (L.underlyingSpace.smul a x) (L.underlyingSpace.smul b y)) v = V.add (V.smul a (action x v)) (V.smul b (action y v))
  bracketAction : ∀ (x y : L.underlyingSpace.carrier) (v : V.carrier), action (L.bracket.bracket x y) v = action x (action y v) - V.smul (ε (L.underlyingSpace.grading x) (L.underlyingSpace.grading y)) (action y (action x v))
  gradingCompatibility : ∀ (x : L.underlyingSpace.carrier) (v : V.carrier), V.grading (action x v) = L.underlyingSpace.grading x + V.grading v

structure RepresentationEvidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (V : GradedVectorSpace G) (R : Representation G ε L V) where
  linearInXClosed : R.linearInX
  bracketActionClosed : R.bracketAction
  gradingCompatibilityClosed : R.gradingCompatibility

def RepresentationClosed (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (V : GradedVectorSpace G) (R : Representation G ε L V) : Prop :=
  R.linearInX ∧ R.bracketAction ∧ R.gradingCompatibility

theorem representation_closed_from_evidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (V : GradedVectorSpace G) (R : Representation G ε L V) (E : RepresentationEvidence G ε L V R) : RepresentationClosed G ε L V R := by
  exact And.intro E.linearInXClosed (And.intro E.bracketActionClosed E.gradingCompatibilityClosed)

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse