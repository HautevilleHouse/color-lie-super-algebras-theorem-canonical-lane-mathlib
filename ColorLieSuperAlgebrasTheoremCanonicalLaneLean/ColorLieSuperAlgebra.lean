import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorLieSuperAlgebra (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) where
  underlyingSpace : GradedVectorSpace G
  bracket : ColorLieBracket G ε underlyingSpace

structure ColorLieSuperAlgebraEvidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) where
  underlyingSpaceClosed : GradedVectorSpaceClosed G L.underlyingSpace
  bracketClosed : ColorLieBracketClosed G ε L.underlyingSpace L.bracket

def ColorLieSuperAlgebraClosed (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) : Prop :=
  GradedVectorSpaceClosed G L.underlyingSpace ∧ ColorLieBracketClosed G ε L.underlyingSpace L.bracket

theorem color_lie_super_algebra_closed_from_evidence (G : Type u) [AddCommMonoid G] (ε : G → G → ℂ) (L : ColorLieSuperAlgebra G ε) (E : ColorLieSuperAlgebraEvidence G ε L) : ColorLieSuperAlgebraClosed G ε L := by
  exact And.intro E.underlyingSpaceClosed E.bracketClosed

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse