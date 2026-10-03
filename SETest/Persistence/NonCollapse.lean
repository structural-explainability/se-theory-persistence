/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SETest.Persistence.Basic
public import SE.Persistence.Relation.NonCollapse

set_option autoImplicit false

/-!
# Non-Collapse Checks

Checks the non-collapse results on the toy domain: between classifications
(P1 and P2 separate, P2 and P3 never do) and between relations (survival is
strictly weaker than the identity relation).
-/

namespace SETest.Persistence

open SE.Persistence

-- P1 and P2 have different preserving sets, so they separate on the free
-- dynamics.
example : Classification.NonCollapsing (freeDynamics Toy) P1 P2 :=
  (Classification.nonCollapsing_free_iff P1 P2).2 ⟨.a, by decide⟩

-- P2 and P3 have equal (empty) preserving sets, so they never separate.
example {C : Type} (d : Dynamics Toy C) :
    ¬ Classification.NonCollapsing d P2 P3 := fun h =>
  absurd (Classification.identityRel_eq_of_prs_iff d
    (fun t => by cases t <;> decide)) h

example : ¬ Classification.NonCollapsing (freeDynamics Toy) P2 P3 := fun h => by
  obtain ⟨t, ht⟩ := (Classification.nonCollapsing_free_iff P2 P3).1 h
  cases t <;> exact ht (by decide)

-- Survival of a private pair is exactly preservation.
example : P1.Survives (freeDynamics Toy) (.a, false) (.a, true) :=
  (Classification.survives_free_iff P1 .a).2 (by decide)

-- Survival is strictly weaker than the identity relation.
example :
    P1.Survives (freeDynamics Toy) (.a, false) (.a, true) ∧
      ¬ P1.Survives (freeDynamics Toy) (.a, true) (.a, false) ∧
      P1.identityRel (freeDynamics Toy) (.a, true) (.a, false) :=
  Classification.survives_ne_identityRel_free P1 (by decide)

end SETest.Persistence
