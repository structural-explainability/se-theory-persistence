/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Domain.ClassificationValue

/-!
# Registry

Canonical finite enumeration for the Persistence theory.

The list enumerates the finite classification vocabulary in canonical
reference order. Guards that it is duplicate-free and complete are in
`SE.Persistence.Conformance`.
-/

namespace SE.Persistence

@[expose] public section

-- RR.DEFINES: PS.DEF.REFERENCE_CLASSIFICATION_VALUES
/-- All classification values in canonical reference order. -/
def referenceClassificationValues : List ClassificationValue :=
  [
    ClassificationValue.ign,
    ClassificationValue.prs,
    ClassificationValue.brk
  ]

end

end SE.Persistence
