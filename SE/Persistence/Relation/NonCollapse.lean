/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Relation.Breakage
public import SE.Persistence.Relation.Invariance

set_option autoImplicit false

/-!
# Non-Collapse

SE.Persistence.Relation.NonCollapse

Results that two notions do not coincide.

Between classifications: two classifications collapse on a dynamics when they
generate the same identity relation.

- on every dynamics, a difference in generated relations forces a difference
  in preserving sets (equal preserving sets never separate classifications);
- on the free dynamics, the converse holds.

Between relations:

- survival is strictly weaker than the identity relation: on the free dynamics
  a preserving step survives forward but not backward;
- breakage does not separate: a breaking step and an identity-relating path can
  coexist.

Scope: both classifications act on one shared carrier. A carrier that differs
per classification is not modeled here, so a pair separated only by carrier is
outside these results.
-/

namespace SE.Persistence

@[expose] public section

variable {T C : Type}

-- RR.DEFINES: PS.DEF.NON_COLLAPSING
/-- The classifications generate different identity relations on `d`. -/
def Classification.NonCollapsing (d : Dynamics T C) (c c' : Classification T) :
    Prop :=
  c.identityRel d ≠ c'.identityRel d

-- RR.DEFINES: PS.THM.PRS_DIFFERENCE_OF_NON_COLLAPSING
/-- Non-collapse on any dynamics forces a preserving-set difference. -/
theorem Classification.prs_difference_of_nonCollapsing {c c' : Classification T}
    {d : Dynamics T C} (h : Classification.NonCollapsing d c c') :
    ∃ t, ¬ (c.IsPrs t ↔ c'.IsPrs t) :=
  Classical.byContradiction fun hne =>
    h (Classification.identityRel_eq_of_prs_iff d fun t =>
      Classical.byContradiction fun hn => hne ⟨t, hn⟩)

-- RR.DEFINES: PS.THM.NON_COLLAPSING_FREE_IFF
/--
On the free dynamics, two classifications are non-collapsing exactly when their
preserving sets differ.
-/
theorem Classification.nonCollapsing_free_iff (c c' : Classification T) :
    Classification.NonCollapsing (freeDynamics T) c c' ↔
      ∃ t, ¬ (c.IsPrs t ↔ c'.IsPrs t) := by
  constructor
  · exact Classification.prs_difference_of_nonCollapsing
  · rintro ⟨t, ht⟩ heq
    apply ht
    rw [← Classification.identityRel_free_iff c t,
      ← Classification.identityRel_free_iff c' t, heq]

/-- On the free dynamics, survival of a private pair is exactly preservation. -/
theorem Classification.survives_free_iff (c : Classification T) (t : T) :
    c.Survives (freeDynamics T) (t, false) (t, true) ↔ c.IsPrs t := by
  constructor
  · intro h
    exact (Classification.identityRel_free_iff c t).1
      (Classification.survives_identityRel h)
  · intro h
    exact Classification.survives_of_stepRel ⟨t, h, rfl, rfl⟩

-- RR.DEFINES: PS.THM.SURVIVES_NE_IDENTITY_REL_FREE
/--
Survival is strictly weaker than the identity relation: for a preserving
transformation, its private pair survives forward, does not survive backward,
and is identity-related backward.
-/
theorem Classification.survives_ne_identityRel_free (c : Classification T)
    {t : T} (h : c.IsPrs t) :
    c.Survives (freeDynamics T) (t, false) (t, true) ∧
      ¬ c.Survives (freeDynamics T) (t, true) (t, false) ∧
      c.identityRel (freeDynamics T) (t, true) (t, false) := by
  have hf : c.Survives (freeDynamics T) (t, false) (t, true) :=
    (Classification.survives_free_iff c t).2 h
  refine ⟨hf, ?_, ?_⟩
  · intro hs
    have := Classification.survives_free_true c hs
    simp at this
  · exact (Classification.identityRel_equivalence c (freeDynamics T)).symm
      (Classification.survives_identityRel hf)

-- RR.DEFINES: PS.THM.STEP_BRK_NOT_SEPARATING
/--
Breakage does not separate in general: some classification and dynamics have a
breaking step between states that are also identity-related.
-/
theorem Classification.stepBrk_not_separating :
    ∃ (c : Classification Bool) (d : Dynamics Bool Unit) (x y : Unit),
      c.stepBrk d x y ∧ c.identityRel d x y := by
  refine ⟨⟨fun b => if b then some ClassificationValue.prs
      else some ClassificationValue.brk, fun _ => False⟩,
    ⟨fun _ _ _ => True⟩, (), (), ⟨false, rfl, trivial⟩, ?_⟩
  exact Generated.rel ⟨true, rfl, trivial⟩

end

end SE.Persistence
