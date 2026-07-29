import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorDeformationParameter where
  baseRing : Type u
  parameterSpace : Type v
  formalParameter : parameterSpace

structure ColorDeformationPackage {A : ColorGradedAlgebra} (B : ColorGradedBracketPackage A) where
  parameter : ColorDeformationParameter
  deformedBracket : parameter.parameterSpace → A.carrier → A.carrier → A.carrier
  initialCondition : deformedBracket parameter.formalParameter = B.bracket
  deformationEquation : ∀ (t : parameter.parameterSpace) (x y z : A.carrier), (deformedBracket t) x ((deformedBracket t) y z) + (deformedBracket t) y ((deformedBracket t) z x) + (deformedBracket t) z ((deformedBracket t) x y) = 0

structure ColorDeformationEvidence {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} (D : ColorDeformationPackage B) where
  initialConditionClosed : D.initialCondition
  deformationEquationClosed : ∀ t : D.parameter.parameterSpace, ∀ x y z : A.carrier, D.deformationEquation t x y z

def ColorDeformationClosed {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} (D : ColorDeformationPackage B) : Prop :=
  D.initialCondition ∧ (∀ t : D.parameter.parameterSpace, ∀ x y z : A.carrier, D.deformationEquation t x y z)

theorem color_deformation_closed_from_evidence {A : ColorGradedAlgebra} {B : ColorGradedBracketPackage A} (D : ColorDeformationPackage B) (E : ColorDeformationEvidence D) : ColorDeformationClosed D := by
  exact And.intro E.initialConditionClosed E.deformationEquationClosed

end HautevilleHouse
end ColorLieSuperAlgebrasTheoremCanonicalLaneLean