/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Relation.Observability
public import SE.Persistence.Commitment.Status

set_option autoImplicit false

/-!
# Observation as Distinct-Commitments

SE.Persistence.Commitment.Observed

A presentation `π : C → O` separates two states when it gives them different
values. Treat those pairs as asserted distinct: `SeparatedBy π x y := π x ≠ π y`.

- A presentation is sound for a classification exactly when the preserving steps
  are consistent with `SeparatedBy π`.
- A presentation is complete exactly when every pair it does not separate is
  required to be identical.
- When a presentation separates two states, they are forbidden to be identical.

Soundness of a presentation is therefore an instance of consistency, in which
the distinct-commitments come from what an observer sees. Completeness is a
separate hypothesis about the presentation. It is not implied by having no
distinct-commitments: a presentation that separates nothing and a dynamics with
no preserving steps leave distinct states unrelated (`presentation_blind_example`).

Several observers give several sources of distinct-commitments, combined by
`consistent_union_iff`.

This module restates existing notions in the language of commitments. It adds no
hypothesis about how any presentation is warranted.
-/

namespace SE.Persistence

@[expose] public section

variable {T C O O' : Type}

-- RR.DEFINES: PS.DEF.SEPARATED_BY
/-- The pairs separated by a presentation, read as distinct-commitments. -/
def SeparatedBy (π : C → O) : C → C → Prop :=
  fun x y => π x ≠ π y

-- RR.DEFINES: PS.THM.PRESENTATION_SOUND_IFF_CONSISTENT
/-- Soundness of a presentation is consistency with the pairs it separates. -/
theorem Classification.presentationSound_iff_consistent (c : Classification T)
    (d : Dynamics T C) (π : C → O) :
    c.PresentationSound d π ↔ Consistent (c.stepRel d) (SeparatedBy π) := by
  constructor
  · intro h x y hne hg
    exact hne (h x y hg)
  · intro h x y hg
    exact Classical.byContradiction fun hne => h x y hne hg

-- RR.DEFINES: PS.THM.PRESENTATION_COMPLETE_IFF_REQUIRED
/--
Completeness of a presentation is: every pair it does not separate is required
to be identical.
-/
theorem Classification.presentationComplete_iff_required (c : Classification T)
    (d : Dynamics T C) (π : C → O) :
    c.PresentationComplete d π ↔
      ∀ x y, π x = π y → Required (c.stepRel d) x y :=
  Iff.rfl

-- RR.DEFINES: PS.THM.FORBIDDEN_OF_SEPARATED
/-- A pair a presentation separates is forbidden to be identical. -/
theorem Classification.forbidden_of_separated (c : Classification T)
    (d : Dynamics T C) {π : C → O} {x y : C} (h : π x ≠ π y) :
    Forbidden (c.stepRel d) (SeparatedBy π) x y :=
  forbidden_of_distinct h

-- RR.DEFINES: PS.THM.TWO_PRESENTATIONS_SOUND_IFF
/--
Two presentations are both sound exactly when the preserving steps are
consistent with the pairs that either one separates.
-/
theorem Classification.two_presentations_sound_iff (c : Classification T)
    (d : Dynamics T C) (π : C → O) (π' : C → O') :
    (c.PresentationSound d π ∧ c.PresentationSound d π') ↔
      Consistent (c.stepRel d)
        (fun x y => SeparatedBy π x y ∨ SeparatedBy π' x y) := by
  rw [consistent_union_iff, Classification.presentationSound_iff_consistent,
    Classification.presentationSound_iff_consistent]

end

end SE.Persistence
