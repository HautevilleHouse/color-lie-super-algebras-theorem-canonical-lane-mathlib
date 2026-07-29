import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorLieSuperAlgebra where
  groundRing : Type u
  abelianGroup : Type v
  gradingGroup : Type w
  bilinearProduct : abelianGroup → abelianGroup → abelianGroup
  bracket : abelianGroup → abelianGroup → abelianGroup
  grading : abelianGroup → gradingGroup
  colorMap : gradingGroup → gradingGroup → Type x
  bilinearColorHomogeneous : Prop
  bracketColorSkewSymmetry : Prop
  bracketColorJacobiIdentity : Prop
  bilinearColorHomogeneousTerm : bilinearColorHomogeneous
  bracketColorSkewSymmetryTerm : bracketColorSkewSymmetry
  bracketColorJacobiIdentityTerm : bracketColorJacobiIdentity

structure ColorAdmittedObject where
  lieSuperAlgebra : ColorLieSuperAlgebra
  gradingGroupIsFiniteAbelian : Prop
  colorMapsNonDegenerate : Prop
  conclusion : gradingGroupIsFiniteAbelian ∧ colorMapsNonDegenerate

def ColorWitnessClosed (O : ColorAdmittedObject) : Prop :=
  O.conclusion

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
