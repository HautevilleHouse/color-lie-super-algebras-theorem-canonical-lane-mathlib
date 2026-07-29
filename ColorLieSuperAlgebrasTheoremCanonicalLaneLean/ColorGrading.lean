import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

/-!
# Color Grading Package

This module defines the color grading structure for Color Lie superalgebras.
-/

structure ColorGrading where
  group : Type u
  addition : group → group → group
  zero : group
  bicharacter : group → group → ℤ₂
  colorBracket : group → group → group
  gradingConsistency : ∀ a b : group, bicharacter (addition a b) = bicharacter a + bicharacter b
  zeroBicharacter : ∀ a : group, bicharacter a zero = 0 ∧ bicharacter zero a = 0
  anticommutative : ∀ a b : group, colorBracket a b = -(group → group) (λ x => colorBracket b a)

structure ColorGradingEvidence (C : ColorGrading) where
  gradingConsistencyClosed : C.gradingConsistency
  zeroBicharacterClosed : C.zeroBicharacter
  anticommutativeClosed : C.anticommutative

def ColorGradingClosed (C : ColorGrading) : Prop :=
  C.gradingConsistency ∧ C.zeroBicharacter ∧ C.anticommutative

theorem color_grading_closed_from_evidence (C : ColorGrading) (E : ColorGradingEvidence C) : ColorGradingClosed C := by
  exact And.intro E.gradingConsistencyClosed (And.intro E.zeroBicharacterClosed E.anticommutativeClosed)

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse