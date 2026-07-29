import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

structure ColorLieSuperAlgebraSpace where
  carrier : Type
  structure : Type

structure ColorLieSuperAlgebraAdmittedObject where
  space : ColorLieSuperAlgebraSpace
  colorLieSuperAlgebra : Prop
  gradedStructure : Prop
  representationTheory : Prop
  conclusion : representationTheory

def ColorLieSuperAlgebraWitnessClosed (O : ColorLieSuperAlgebraAdmittedObject) : Prop :=
  O.representationTheory

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse