/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SETest.Persistence.Survival
public import SE.Persistence.Relation.Equivalence

set_option autoImplicit false

/-!
# Equivalence Checks

Checks that the identity relation is an equivalence, contains survival,
depends only on the preserving set, and is characterized on the free dynamics.
-/

namespace SETest.Persistence

open SE.Persistence

example {C : Type} (d : Dynamics Toy C) : Equivalence (P1.identityRel d) :=
  Classification.identityRel_equivalence P1 d

example : P1.identityRel loop () () :=
  Classification.survives_identityRel (Classification.survives_refl P1 loop ())

-- Forgetting applicability does not change the identity relation.
example {C : Type} (d : Dynamics Toy C) : P2.identityRel d = P2'.identityRel d :=
  Classification.identityRel_eq_of_coarse_eq d fun t => by cases t <;> rfl

-- Equal preserving sets give equal identity relations.
example {C : Type} (d : Dynamics Toy C) : P2.identityRel d = P3.identityRel d :=
  Classification.identityRel_eq_of_prs_iff d fun t => by cases t <;> decide

-- On the free dynamics the private pair of `a` is identity-related under P1
-- (which preserves `a`) and not under P2 (which breaks it).
example : P1.identityRel (freeDynamics Toy) (.a, false) (.a, true) :=
  (Classification.identityRel_free_iff P1 .a).2 (by decide)

example : ¬ P2.identityRel (freeDynamics Toy) (.a, false) (.a, true) := fun h =>
  absurd ((Classification.identityRel_free_iff P2 .a).1 h) (by decide)

end SETest.Persistence
