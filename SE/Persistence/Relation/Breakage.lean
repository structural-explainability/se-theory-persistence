/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Relation.Equivalence

set_option autoImplicit false

/-!
# Breakage

SE.Persistence.Relation.Breakage

A breaking step is a step of a transformation classified as breaking.

Breakage is not the negation of survival. On an arbitrary dynamics a breaking
step can connect states that are identity-related by some other path (see
`SE.Persistence.Relation.NonCollapse`). Only when no other path exists, as on
the free dynamics, does a breaking step separate its endpoints.
-/

namespace SE.Persistence

@[expose] public section

variable {T C : Type}

-- RR.DEFINES: PS.DEF.STEP_BRK
/-- One step of a breaking transformation of `c`. -/
def Classification.stepBrk (c : Classification T) (d : Dynamics T C) :
    C → C → Prop :=
  fun x y => ∃ t, c.IsBrk t ∧ d.step t x y

-- RR.DEFINES: PS.THM.NOT_IDENTITY_REL_OF_STEP_BRK_FREE
/-- On the free dynamics, a breaking step separates its endpoints. -/
theorem Classification.not_identityRel_of_stepBrk_free (c : Classification T)
    {x y : T × Bool} (h : c.stepBrk (freeDynamics T) x y) :
    ¬ c.identityRel (freeDynamics T) x y := by
  obtain ⟨t, hb, hx, hy⟩ := h
  subst hx
  subst hy
  intro hid
  exact Classification.not_isPrs_of_isBrk hb
    ((Classification.identityRel_free_iff c t).1 hid)

end

end SE.Persistence
