import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorLieBracket (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (V : GradedVectorSpace G) where
  bracket : V.carrier → V.carrier → V.carrier
  bilinear : ∀ (a b : ℂ) (x y z : V.carrier), bracket (V.smul a x) (V.smul b y) = V.smul (a * b) (bracket x y) ∧ bracket (V.add x y) z = V.add (bracket x z) (bracket y z) ∧ bracket x (V.add y z) = V.add (bracket x y) (bracket x z)
  gradedSymmetry : ∀ (x y : V.carrier), bracket y x = V.smul (ε (V.grading x) (V.grading y)) (bracket x y)
  jacobiIdentity : ∀ (x y z : V.carrier), bracket (bracket x y) z = V.add (bracket x (bracket y z)) (V.smul (ε (V.grading x) (V.grading y)) (bracket y (bracket x z)))

structure ColorLieBracketEvidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (V : GradedVectorSpace G) (B : ColorLieBracket G ε V) where
  bilinearClosed : B.bilinear
  gradedSymmetryClosed : B.gradedSymmetry
  jacobiIdentityClosed : B.jacobiIdentity

def ColorLieBracketClosed (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (V : GradedVectorSpace G) (B : ColorLieBracket G ε V) : Prop :=
  B.bilinear ∧ B.gradedSymmetry ∧ B.jacobiIdentity

theorem color_lie_bracket_closed_from_evidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (V : GradedVectorSpace G) (B : ColorLieBracket G ε V) (E : ColorLieBracketEvidence G ε V B) : ColorLieBracketClosed G ε V B := by
  exact And.intro E.bilinearClosed (And.intro E.gradedSymmetryClosed E.jacobiIdentityClosed)

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse