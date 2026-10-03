/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Domain.Classification
public import SE.Transformation.Domain.Operator.Semantics

set_option autoImplicit false

/-!
# Lifting Classifications Along the Transformation Taxonomy

SE.Persistence.Reference.Lift

A classification stated at family or kind granularity induces a classification
over operator codes, by composing with `operatorFamily` and `operatorKind` from
the Transformation theory.

Operators in the same family (kind) receive the same pattern by construction.
This module does not choose a family-level classification; it only states how
one is consumed at operator granularity.

This is the only module of the Persistence theory that imports the
Transformation theory.
-/

namespace SE.Persistence

open SE.Transformation

@[expose] public section

-- RR.DEFINES: PS.DEF.LIFT_FAMILY
/-- The operator-level classification induced by a family-level one. -/
def Classification.liftFamily (c : Classification TransformationFamily) :
    Classification OperatorCode where
  pattern op := c.pattern (operatorFamily op)
  persist op := c.persist (operatorFamily op)

-- RR.DEFINES: PS.DEF.LIFT_KIND
/-- The operator-level classification induced by a kind-level one. -/
def Classification.liftKind (c : Classification TransformationKind) :
    Classification OperatorCode where
  pattern op := c.pattern (operatorKind op)
  persist op := c.persist (operatorKind op)

-- RR.DEFINES: PS.THM.LIFT_FAMILY_PATTERN_EQ
/-- Operators in the same family have the same pattern under a lifted classification. -/
theorem Classification.liftFamily_pattern_eq
    (c : Classification TransformationFamily) {a b : OperatorCode}
    (h : operatorFamily a = operatorFamily b) :
    c.liftFamily.pattern a = c.liftFamily.pattern b := by
  show c.pattern (operatorFamily a) = c.pattern (operatorFamily b)
  rw [h]

-- RR.DEFINES: PS.THM.LIFT_KIND_PATTERN_EQ
/-- Operators of the same kind have the same pattern under a lifted classification. -/
theorem Classification.liftKind_pattern_eq
    (c : Classification TransformationKind) {a b : OperatorCode}
    (h : operatorKind a = operatorKind b) :
    c.liftKind.pattern a = c.liftKind.pattern b := by
  show c.pattern (operatorKind a) = c.pattern (operatorKind b)
  rw [h]

/-- The coarse value at an operator is the coarse value at its family. -/
theorem Classification.liftFamily_coarse
    (c : Classification TransformationFamily) (op : OperatorCode) :
    c.liftFamily.coarse op = c.coarse (operatorFamily op) :=
  rfl

/-- The coarse value at an operator is the coarse value at its kind. -/
theorem Classification.liftKind_coarse
    (c : Classification TransformationKind) (op : OperatorCode) :
    c.liftKind.coarse op = c.coarse (operatorKind op) :=
  rfl

/-- An operator is preserving exactly when its family is. -/
theorem Classification.liftFamily_isPrs_iff
    (c : Classification TransformationFamily) (op : OperatorCode) :
    c.liftFamily.IsPrs op ↔ c.IsPrs (operatorFamily op) :=
  Iff.rfl

/-- An operator is preserving exactly when its kind is. -/
theorem Classification.liftKind_isPrs_iff
    (c : Classification TransformationKind) (op : OperatorCode) :
    c.liftKind.IsPrs op ↔ c.IsPrs (operatorKind op) :=
  Iff.rfl

/-- Lifting along families preserves well-formedness. -/
theorem Classification.liftFamily_wellFormed
    {c : Classification TransformationFamily} (h : c.WellFormed) :
    c.liftFamily.WellFormed :=
  fun op hop => h (operatorFamily op) hop

/-- Lifting along kinds preserves well-formedness. -/
theorem Classification.liftKind_wellFormed
    {c : Classification TransformationKind} (h : c.WellFormed) :
    c.liftKind.WellFormed :=
  fun op hop => h (operatorKind op) hop

end

end SE.Persistence
