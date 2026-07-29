import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure GradedVectorSpace (G : Type u) [AddMonoid G] where
  carrier : Type v
  grading : carrier → G
  zeroGraded : carrier
  add : carrier → carrier → carrier
  smul : ℂ → carrier → carrier
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y : carrier, add x y = add y x
  addZero : ∀ x : carrier, add x zeroGraded = x
  zeroAdd : ∀ x : carrier, add zeroGraded x = x
  addLeftNeg : ∀ x : carrier, ∃ y : carrier, add x y = zeroGraded
  smulOne : ∀ x : carrier, smul 1 x = x
  smulAssoc : ∀ (a b : ℂ) (x : carrier), smul (a * b) x = smul a (smul b x)
  smulAdd : ∀ (a : ℂ) (x y : carrier), smul a (add x y) = add (smul a x) (smul a y)
  addSmul : ∀ (a b : ℂ) (x : carrier), smul (a + b) x = add (smul a x) (smul b x)

structure GradedVectorSpaceEvidence (G : Type u) [AddMonoid G] (V : GradedVectorSpace G) where
  addAssocClosed : V.addAssoc
  addCommClosed : V.addComm
  addZeroClosed : V.addZero
  zeroAddClosed : V.zeroAdd
  addLeftNegClosed : V.addLeftNeg
  smulOneClosed : V.smulOne
  smulAssocClosed : V.smulAssoc
  smulAddClosed : V.smulAdd
  addSmulClosed : V.addSmul

def GradedVectorSpaceClosed (G : Type u) [AddMonoid G] (V : GradedVectorSpace G) : Prop :=
  V.addAssoc ∧ V.addComm ∧ V.addZero ∧ V.zeroAdd ∧ V.addLeftNeg ∧ V.smulOne ∧ V.smulAssoc ∧ V.smulAdd ∧ V.addSmul

theorem graded_vector_space_closed_from_evidence (G : Type u) [AddMonoid G] (V : GradedVectorSpace G) (E : GradedVectorSpaceEvidence G V) : GradedVectorSpaceClosed G V := by
  exact And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.addZeroClosed (And.intro E.zeroAddClosed (And.intro E.addLeftNegClosed (And.intro E.smulOneClosed (And.intro E.smulAssocClosed (And.intro E.smulAddClosed E.addSmulClosed)))))))

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse