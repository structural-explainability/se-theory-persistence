/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Relation.Invariance

set_option autoImplicit false

/-!
# Observability

SE.Persistence.Relation.Observability

A presentation is a function `π : C → O` from states to what an observer
receives.
The predicates it can express are exactly those that depend on a
state only through `π`.

This module relates a presentation to the identity relation `~_P` using
`observationalEquivalence` and `relationInvariants` from the Invariance module.

- Sound: identity-related states have equal presentations.
- Complete: states with equal presentations are identity-related.

Soundness and completeness are hypotheses.
This module does not say how either is warranted.
A sound presentation can certify non-identity.
Certifying identity needs completeness.
A presentation that is not complete is blind:
some states it cannot separate are not identity-related, and
`presentation_blind_example` shows this can happen.
-/

namespace SE.Persistence

open MathlibMini

@[expose] public section

variable {T C O O' : Type}

-- RR.DEFINES: PS.DEF.PRESENTABLE
/-- The predicates a presentation can express: those of the form `P (π x)`. -/
def presentable (π : C → O) : Set (C → Prop) :=
  {φ | ∃ P : O → Prop, ∀ x, φ x ↔ P (π x)}

-- RR.DEFINES: PS.THM.OBSERVATIONAL_EQUIVALENCE_PRESENTABLE_IFF
/-- Observational equivalence over the presentable predicates is equality of
presentations. -/
theorem observationalEquivalence_presentable_iff (π : C → O) (x y : C) :
    observationalEquivalence (presentable π) x y ↔ π x = π y := by
  constructor
  · intro h
    have hmem : (fun z => π z = π x) ∈ presentable π := by
      change ∃ P : O → Prop, ∀ z, (π z = π x) ↔ P (π z)
      exact ⟨fun o => o = π x, fun z => Iff.rfl⟩
    have h1 : π y = π x := (h _ hmem).mp rfl
    exact h1.symm
  · intro h φ hφ
    obtain ⟨P, hP⟩ := hφ
    exact (hP x).trans ((iff_of_eq (congrArg P h)).trans (hP y).symm)

-- RR.DEFINES: PS.DEF.PRESENTATION_SOUND
/-- Identity-related states have equal presentations. -/
def Classification.PresentationSound (c : Classification T) (d : Dynamics T C)
    (π : C → O) : Prop :=
  ∀ x y, c.identityRel d x y → π x = π y

-- RR.DEFINES: PS.DEF.PRESENTATION_COMPLETE
/-- States with equal presentations are identity-related. -/
def Classification.PresentationComplete (c : Classification T) (d : Dynamics T C)
    (π : C → O) : Prop :=
  ∀ x y, π x = π y → c.identityRel d x y

-- RR.DEFINES: PS.THM.PRESENTATION_SOUND_IFF
/-- Soundness means every presentable predicate is a step invariant. -/
theorem Classification.presentationSound_iff (c : Classification T)
    (d : Dynamics T C) (π : C → O) :
    c.PresentationSound d π ↔ presentable π ⊆ relationInvariants (c.stepRel d) := by
  have key : c.PresentationSound d π ↔
      ∀ x y, Generated (c.stepRel d) x y →
        observationalEquivalence (presentable π) x y := by
    constructor
    · intro h x y hxy
      exact (observationalEquivalence_presentable_iff π x y).2 (h x y hxy)
    · intro h x y hxy
      exact (observationalEquivalence_presentable_iff π x y).1 (h x y hxy)
  exact key.trans
    (observables_invariant_iff_generated_respects (c.stepRel d) (presentable π)).symm

-- RR.DEFINES: PS.THM.PRESENTATION_COMPLETE_IFF
/-- Completeness means every step invariant is constant on presentation
classes. -/
theorem Classification.presentationComplete_iff (c : Classification T)
    (d : Dynamics T C) (π : C → O) :
    c.PresentationComplete d π ↔
      relationInvariants (c.stepRel d) ⊆
        relationInvariants (observationalEquivalence (presentable π)) := by
  have key : c.PresentationComplete d π ↔
      ∀ x y, observationalEquivalence (presentable π) x y →
        Generated (c.stepRel d) x y := by
    constructor
    · intro h x y hxy
      exact h x y ((observationalEquivalence_presentable_iff π x y).1 hxy)
    · intro h x y hxy
      exact h x y ((observationalEquivalence_presentable_iff π x y).2 hxy)
  exact key.trans
    (observational_completeness_iff_invariant_saturation (c.stepRel d)
      (presentable π))

-- RR.DEFINES: PS.THM.PRESENTATION_COMPLETE_IFF_INVARIANTS_DETERMINED
/-- Completeness means every identity invariant is determined by the
presentation. -/
theorem Classification.presentationComplete_iff_invariants_determined
    (c : Classification T) (d : Dynamics T C) (π : C → O) :
    c.PresentationComplete d π ↔
      ∀ φ : C → Prop, c.Invariant d φ → ∀ x y, π x = π y → (φ x ↔ φ y) := by
  refine (c.presentationComplete_iff d π).trans ?_
  constructor
  · intro h φ hφ x y hxy
    have hmem : φ ∈ relationInvariants (c.stepRel d) := hφ
    exact (h hmem) x y ((observationalEquivalence_presentable_iff π x y).2 hxy)
  · intro h φ hφ x y hxy
    exact h φ hφ x y ((observationalEquivalence_presentable_iff π x y).1 hxy)

-- RR.DEFINES: PS.THM.NOT_IDENTITY_REL_OF_SOUND_OF_NE
/-- Separation: a sound presentation that distinguishes two states certifies
that they are not identity-related. -/
theorem Classification.not_identityRel_of_sound_of_ne {c : Classification T}
    {d : Dynamics T C} {π : C → O} (hs : c.PresentationSound d π) {x y : C}
    (hne : π x ≠ π y) : ¬ c.identityRel d x y :=
  fun h => hne (hs x y h)

-- RR.DEFINES: PS.THM.IDENTITY_REL_OF_COMPLETE_OF_EQ
/-- Identification: a complete presentation that does not distinguish two states
certifies that they are identity-related. -/
theorem Classification.identityRel_of_complete_of_eq {c : Classification T}
    {d : Dynamics T C} {π : C → O} (hc : c.PresentationComplete d π) {x y : C}
    (h : π x = π y) : c.identityRel d x y :=
  hc x y h

-- RR.DEFINES: PS.THM.NOT_COMPLETE_IFF_BLIND
/-- A presentation is not complete exactly when it is blind: it fails to
separate some states that are not identity-related. -/
theorem Classification.not_presentationComplete_iff_blind (c : Classification T)
    (d : Dynamics T C) (π : C → O) :
    ¬ c.PresentationComplete d π ↔
      ∃ x y, π x = π y ∧ ¬ c.identityRel d x y := by
  constructor
  · intro h
    exact Classical.byContradiction fun hno =>
      h (fun x y hxy =>
        Classical.byContradiction fun hn => hno ⟨x, y, hxy, hn⟩)
  · rintro ⟨x, y, hxy, hn⟩ hc
    exact hn (hc x y hxy)

-- RR.DEFINES: PS.THM.PRESENTATION_SOUND_OF_FACTOR
/-- A coarser presentation of a sound presentation is sound. -/
theorem Classification.presentationSound_of_factor {c : Classification T}
    {d : Dynamics T C} {π : C → O} (g : O → O')
    (hs : c.PresentationSound d π) :
    c.PresentationSound d (fun x => g (π x)) :=
  fun x y h => congrArg g (hs x y h)

-- RR.DEFINES: PS.THM.PRESENTATION_COMPLETE_OF_FACTOR
/-- If a coarser presentation is complete, so is the finer one. -/
theorem Classification.presentationComplete_of_factor {c : Classification T}
    {d : Dynamics T C} {π : C → O} (g : O → O')
    (hc : c.PresentationComplete d (fun x => g (π x))) :
    c.PresentationComplete d π :=
  fun x y h => hc x y (congrArg g h)

-- RR.DEFINES: PS.THM.PRESENTATION_BLIND_EXAMPLE
/-- Blindness occurs: some classification, dynamics and presentation fail to
separate two states that are not identity-related. -/
theorem presentation_blind_example :
    ∃ (c : Classification Unit) (d : Dynamics Unit Bool) (π : Bool → Unit)
      (x y : Bool), π x = π y ∧ ¬ c.identityRel d x y := by
  refine ⟨⟨fun _ => none, fun _ => False⟩, ⟨fun _ _ _ => False⟩,
    fun _ => (), false, true, rfl, ?_⟩
  intro h
  have heq : false = true :=
    Generated.le_of_equivalence (s := fun a b : Bool => a = b)
      ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
      (fun a b hab => by
        obtain ⟨t, _, hs⟩ := hab
        exact False.elim hs) h
  exact absurd heq (by decide)

end

end SE.Persistence
