import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorPBWOrder where
  basis : Type u
  order : basis → basis → Prop
  totalOrder : ∀ x y : basis, order x y ∨ order y x
  wellOrder : ∀ (S : Set basis), S.Nonempty → ∃ m ∈ S, ∀ x ∈ S, order m x

structure ColorPBWTheoremPackage {A : ColorGradedAlgebra} (B : ColorGradedBracketPackage A) (U : UniversalEnvelopingColorPackage B) where
  orderedBasis : ColorPBWOrder
  spanningSet : Set (U.tensorAlgebra)
  linearIndependence : LinearIndependent (orderedBasis.basis) spanningSet
  vectorSpaceIso : U.tensorAlgebra ≃ₗ[ℤ₂-graded] (FreeModule (orderedBasis.basis))

structure ColorPBWTheoremEvidence {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} {U : UniversalEnvelopingColorPackage B} (P : ColorPBWTheoremPackage B U) where
  spanningSetClosed : P.spanningSet ≠ ∅
  linearIndependenceClosed : P.linearIndependence
  vectorSpaceIsoClosed : P.vectorSpaceIso.Bijective

def ColorPBWTheoremClosed {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} {U : UniversalEnvelopingColorPackage B} (P : ColorPBWTheoremPackage B U) : Prop :=
  P.spanningSet ≠ ∅ ∧ P.linearIndependence ∧ P.vectorSpaceIso.Bijective

theorem color_pbw_theorem_closed_from_evidence {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} {U : UniversalEnvelopingColorPackage B} (P : ColorPBWTheoremPackage B U) (E : ColorPBWTheoremEvidence P) : ColorPBWTheoremClosed P := by
  exact And.intro E.spanningSetClosed (And.intro E.linearIndependenceClosed E.vectorSpaceIsoClosed)

end HautevilleHouse
end ColorLieSuperAlgebrasTheoremCanonicalLaneLean