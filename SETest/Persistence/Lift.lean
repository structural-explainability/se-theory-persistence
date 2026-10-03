/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Reference.Lift
public import SE.Persistence.Conformance

set_option autoImplicit false

/-!
# Lift Checks

Checks that a family-level classification induces an operator-level
classification that is constant on families, and that lifting commutes with
the coarse matrix.
-/

namespace SETest.Persistence

open SE.Persistence SE.Transformation

/-- Preserves only the `versioning` family; everything else ignoring. -/
@[expose] public def versioningOnly : Classification TransformationFamily where
  pattern
    | .versioning => some .prs
    | _ => some .ign
  persist _ := False

-- `RV` and `VS` are both versioning operators, so both preserve.
example : versioningOnly.liftFamily.IsPrs OperatorCode.RV := by decide
example : versioningOnly.liftFamily.IsPrs OperatorCode.VS := by decide
example : ¬ versioningOnly.liftFamily.IsPrs OperatorCode.BR := by decide

example :
    versioningOnly.liftFamily.pattern OperatorCode.RV =
      versioningOnly.liftFamily.pattern OperatorCode.VS :=
  Classification.liftFamily_pattern_eq versioningOnly rfl

example : versioningOnly.WellFormed → versioningOnly.liftFamily.WellFormed :=
  Classification.liftFamily_wellFormed

example : versioningOnly.liftFamily.coarse OperatorCode.RV = .prs := by decide

example : ∀ op, versioningOnly.liftFamily.coarse op =
    versioningOnly.coarse (operatorFamily op) :=
  liftFamily_coarse_all versioningOnly

end SETest.Persistence
