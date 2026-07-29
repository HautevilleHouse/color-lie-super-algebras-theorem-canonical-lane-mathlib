import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ColorLieSuperAlgebrasTheoremCanonicalLaneLean.ColorLieSuperAlgebraStructure

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure GradingRepresentationPackage {A : ColorLieSuperAlgebra} where
  representationModule : Type u
  action : A.abelianGroup → representationModule → representationModule
  gradingCompatible : Prop
  weightDecomposition : Prop
  gradedIrreducibility : Prop
  gradingCompatibleTerm : gradingCompatible
  weightDecompositionTerm : weightDecomposition
  gradedIrreducibilityTerm : gradedIrreducibility

structure GradingRepresentationEvidence {A : ColorLieSuperAlgebra}
    (G : GradingRepresentationPackage A) where
  gradingCompatibleClosed : G.gradingCompatible
  weightDecompositionClosed : G.weightDecomposition
  gradedIrreducibilityClosed : G.gradedIrreducibility

def GradingRepresentationClosed {A : ColorLieSuperAlgebra}
    (G : GradingRepresentationPackage A) : Prop :=
  G.gradingCompatible ∧ G.weightDecomposition ∧ G.gradedIrreducibility

theorem grading_representation_closed_from_evidence
    {A : ColorLieSuperAlgebra} (G : GradingRepresentationPackage A)
    (E : GradingRepresentationEvidence G) : GradingRepresentationClosed G := by
  exact And.intro E.gradingCompatibleClosed
    (And.intro E.weightDecompositionClosed E.gradedIrreducibilityClosed)

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
