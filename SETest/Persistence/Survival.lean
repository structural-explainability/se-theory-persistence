/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SETest.Persistence.Basic
public import SE.Persistence.Relation.Survival

set_option autoImplicit false

/-!
# Survival Checks

Checks that survival is reflexive, transitive, monotone in the preserving set,
and that on the free dynamics nothing leaves a state of the form `(t, true)`.
-/

namespace SETest.Persistence

open SE.Persistence

/-- One state; every transformation steps it to itself. -/
@[expose] public def loop : Dynamics Toy Unit where
  step _ _ _ := True

example : P1.Survives loop () () := Classification.survives_refl P1 loop ()

example : P1.Survives loop () () :=
  Classification.survives_of_stepRel ⟨.a, by decide, trivial⟩

example (c : Classification Toy) (d : Dynamics Toy Unit) (x y z : Unit)
    (h1 : c.Survives d x y) (h2 : c.Survives d y z) : c.Survives d x z :=
  h1.trans h2

-- Preserving more survives more: P2 preserves nothing, so anything it
-- preserves, P1 preserves too.
example (d : Dynamics Toy Unit) (h : P2.Survives d () ()) : P1.Survives d () () :=
  Classification.survives_mono
    (fun t ht => by cases t <;> exact absurd ht (by decide)) h

-- From `(a, true)` on the free dynamics nothing else is reachable.
example (y : Toy × Bool) (h : P1.Survives (freeDynamics Toy) (.a, true) y) :
    y = (.a, true) :=
  Classification.survives_free_true P1 h

end SETest.Persistence
