/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SETest.Persistence.Survival
public import SE.Persistence.Relation.Breakage
public import SE.Persistence.Relation.NonCollapse

set_option autoImplicit false

/-!
# Breakage Checks

Checks, on the toy domain, that a breaking step and an identity-relating path
can coexist on one dynamics, and that on the free dynamics a breaking step
separates its endpoints.
-/

namespace SETest.Persistence

open SE.Persistence

-- P1 preserves `a` and breaks `b`; both steps exist on the single state.
example : P1.stepBrk loop () () := ⟨.b, by decide, trivial⟩
example : P1.identityRel loop () () :=
  Generated.rel ⟨.a, by decide, trivial⟩

-- So breakage does not imply separation in general.
example : ∃ x y, P1.stepBrk loop x y ∧ P1.identityRel loop x y :=
  ⟨(), (), ⟨.b, by decide, trivial⟩, Generated.rel ⟨.a, by decide, trivial⟩⟩

-- The same holds for some classification on `Bool`.
example := Classification.stepBrk_not_separating

-- On the free dynamics a breaking step does separate its endpoints.
example (x y : Toy × Bool) (h : P1.stepBrk (freeDynamics Toy) x y) :
    ¬ P1.identityRel (freeDynamics Toy) x y :=
  Classification.not_identityRel_of_stepBrk_free P1 h

end SETest.Persistence
