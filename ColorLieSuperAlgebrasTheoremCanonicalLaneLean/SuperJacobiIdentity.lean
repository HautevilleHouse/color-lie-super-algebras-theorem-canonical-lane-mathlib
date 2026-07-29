import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ColorLieSuperAlgebrasTheoremCanonicalLaneLean

/-!
# Super Jacobi Identity Package

This module defines the super Jacobi identity for Color Lie superalgebras.
-/

structure SuperJacobiIdentity (G : ColorGrading) where
  bracket : G.group → G.group → G.group
  superJacobi : ∀ x y z : G.group, 
    bracket x (bracket y z) - bracket (bracket x y) z - (G.bicharacter x y) • bracket y (bracket x z) = 0
  colorSymmetry : ∀ x y : G.group, bracket x y = -(G.bicharacter x y) • bracket y x

structure SuperJacobiIdentityEvidence {G : ColorGrading} (S : SuperJacobiIdentity G) where
  superJacobiClosed : S.superJacobi
  colorSymmetryClosed : S.colorSymmetry

def SuperJacobiIdentityClosed {G : ColorGrading} (S : SuperJacobiIdentity G) : Prop :=
  S.superJacobi ∧ S.colorSymmetry

theorem super_jacobi_identity_closed_from_evidence {G : ColorGrading} (S : SuperJacobiIdentity G) (E : SuperJacobiIdentityEvidence S) : SuperJacobiIdentityClosed S := by
  exact And.intro E.superJacobiClosed E.colorSymmetryClosed

end ColorLieSuperAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse