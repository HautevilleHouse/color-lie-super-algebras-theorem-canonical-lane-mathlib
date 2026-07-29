import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ColorLieSuperAlgebrasTheoremCanonicalLaneLean.ColorLieSuperAlgebraStructure
import HautevilleHouse.ColorLieSuperAlgebrasTheoremCanonicalLaneLean.GradingRepresentations

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure FiniteDimensionalClassificationPackage {A : ColorLieSuperAlgebra}
    {G : GradingRepresentationPackage A} where
  classificationList : List (String × String)
  rootSystemDecomposition : Prop
  weightLattice : Type u
  weylGroup : Type v
  classificationComplete : Prop
  chevalleyRestriction : Prop
  classificationCompleteTerm : classificationComplete
  chevalleyRestrictionTerm : chevalleyRestriction

structure FiniteDimensionalClassificationEvidence {A : ColorLieSuperAlgebra}
    {G : GradingRepresentationPackage A}
    (F : FiniteDimensionalClassificationPackage A G) where
  classificationCompleteClosed : F.classificationComplete
  chevalleyRestrictionClosed : F.chevalleyRestriction

def FiniteDimensionalClassificationClosed {A : ColorLieSuperAlgebra}
    {G : GradingRepresentationPackage A}
    (F : FiniteDimensionalClassificationPackage A G) : Prop :=
  F.classificationComplete ∧ F.chevalleyRestriction

theorem finite_dimensional_classification_closed_from_evidence
    {A : ColorLieSuperAlgebra} {G : GradingRepresentationPackage A}
    (F : FiniteDimensionalClassificationPackage A G)
    (E : FiniteDimensionalClassificationEvidence F) :
    FiniteDimensionalClassificationClosed F := by
  exact And.intro E.classificationCompleteClosed E.chevalleyRestrictionClosed

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
