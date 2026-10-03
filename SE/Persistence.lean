/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module -- shake: keep-all

public import SE.Persistence.Core
public import SE.Persistence.Registry
public import SE.Persistence.Reference.Lift
public import SE.Persistence.Conformance
public import SE.Persistence.Spec

/-!
# SE Theory: Persistence

Lean 4 formalization of foundational persistence theory for Structural
Explainability.

The theory classifies transformations as applicable-and-preserving,
applicable-and-breaking, applicable-and-ignoring, or inapplicable, and defines
what the classification induces on a carrier: directed survival, the identity
relation, breakage, and invariants.

Transformation vocabulary belongs upstream. Identity regimes and framework
admissibility belong downstream.

-/
