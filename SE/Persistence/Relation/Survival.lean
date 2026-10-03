/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Domain.Classification
public import SE.Persistence.Relation.Generated

set_option autoImplicit false

/-!
# Survival

SE.Persistence.Relation.Survival

Identity survives from `x` to `y` when `y` is reachable from `x` by a finite
sequence of preserving steps.

Survival is directed. Its symmetric closure is the identity relation of
`SE.Persistence.Relation.Equivalence`, and the two differ: on the free
dynamics a preserving step survives forward but not backward.
-/

namespace SE.Persistence

@[expose] public section

variable {T C : Type}

-- RR.DEFINES: PS.DEF.STEP_REL
/-- One step of a preserving transformation of `c`. -/
def Classification.stepRel (c : Classification T) (d : Dynamics T C) : C → C → Prop :=
  fun x y => ∃ t, c.IsPrs t ∧ d.step t x y

-- RR.DEFINES: PS.DEF.SURVIVES
/-- Identity survives from `x` to `y`: a finite chain of preserving steps. -/
def Classification.Survives (c : Classification T) (d : Dynamics T C) :
    C → C → Prop :=
  fun x y => Reach (c.stepRel d) x y

/-- Survival is reflexive. -/
theorem Classification.survives_refl (c : Classification T) (d : Dynamics T C)
    (x : C) : c.Survives d x x :=
  Reach.refl

/-- A preserving step is a survival. -/
theorem Classification.survives_of_stepRel {c : Classification T}
    {d : Dynamics T C} {x y : C} (h : c.stepRel d x y) : c.Survives d x y :=
  Reach.single h

/-- Survival is transitive. -/
theorem Classification.Survives.trans {c : Classification T} {d : Dynamics T C}
    {x y z : C} (h1 : c.Survives d x y) (h2 : c.Survives d y z) :
    c.Survives d x z :=
  Reach.trans h1 h2

-- RR.DEFINES: PS.THM.SURVIVES_MONO
/-- Preserving more transformations survives more. -/
theorem Classification.survives_mono {c c' : Classification T}
    {d : Dynamics T C} (h : ∀ t, c.IsPrs t → c'.IsPrs t) {x y : C}
    (hs : c.Survives d x y) : c'.Survives d x y :=
  Reach.mono (fun _ _ ⟨t, ht, hst⟩ => ⟨t, h t ht, hst⟩) hs

/-- On the free dynamics nothing leaves a state of the form `(t, true)`. -/
theorem Classification.survives_free_true (c : Classification T) {t : T}
    {y : T × Bool} (h : c.Survives (freeDynamics T) (t, true) y) :
    y = (t, true) := by
  unfold Classification.Survives at h
  induction h with
  | refl => rfl
  | tail _ hr ih =>
    obtain ⟨s, _, hx, _⟩ := hr
    rw [ih] at hx
    simp at hx

end

end SE.Persistence
