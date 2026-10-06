/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import Mathlib.Data.Set.Defs
public import SE.Persistence.Relation.Equivalence

set_option autoImplicit false

/-!
# Invariance

SE.Persistence.Relation.Invariance

A property of states is a persistence invariant when every preserving step
leaves it unchanged.

Generic observational equivalence is agreement on a family of predicates.
Generated equivalence is its kernel for the family of all step invariants.
Preservation and completeness are separate relational inclusions; no carrier
or identity basis interpretation is supplied here.

Main result: invariance under the preserving steps is the same as respecting
the identity relation `~_P`. Invariants are exactly the properties that cannot
tell identity-related states apart.

This is a different notion from framework-invariance in the Neutral Substrate
theory, which concerns consistency across admissible frameworks.
-/

namespace SE.Persistence

@[expose] public section

variable {T C : Type}

-- RR.DEFINES: PS.DEF.RELATION_INVARIANTS
/-- All predicates constant along the steps of a relation. -/
def relationInvariants (r : C → C → Prop) : Set (C → Prop) :=
  {φ | ∀ x y, r x y → (φ x ↔ φ y)}

-- RR.DEFINES: PS.DEF.OBSERVATIONAL_EQUIVALENCE
/-- Agreement on every observable in a family; no basis semantics is assumed. -/
def observationalEquivalence (Φ : Set (C → Prop)) : C → C → Prop :=
  fun x y => ∀ φ ∈ Φ, φ x ↔ φ y

-- RR.DEFINES: PS.THM.OBSERVATIONAL_EQUIVALENCE_EQUIVALENCE
/-- Agreement on a family of observables is an equivalence relation. -/
theorem observationalEquivalence_equivalence (Φ : Set (C → Prop)) :
    Equivalence (observationalEquivalence Φ) :=
  ⟨fun _ _ _ => Iff.rfl, fun h φ hφ => (h φ hφ).symm,
    fun h₁ h₂ φ hφ => (h₁ φ hφ).trans (h₂ φ hφ)⟩

-- RR.DEFINES: PS.THM.STEPS_RESPECT_OBSERVABLES_IFF
/-- Steps respect the observational kernel exactly when all observables are invariant. -/
theorem steps_respect_observables_iff (r : C → C → Prop) (Φ : Set (C → Prop)) :
    (∀ x y, r x y → observationalEquivalence Φ x y) ↔
      Φ ⊆ relationInvariants r := by
  constructor
  · intro h φ hφ x y hxy
    exact h x y hxy φ hφ
  · intro h x y hxy φ hφ
    exact h hφ x y hxy

-- RR.DEFINES: PS.THM.RELATION_INVARIANTS_GENERATED
/-- Taking equivalence closure does not change the invariant predicates. -/
theorem relationInvariants_generated (r : C → C → Prop) :
    relationInvariants (Generated r) = relationInvariants r := by
  ext φ
  constructor
  · intro h x y hxy
    exact h x y (Generated.rel hxy)
  · intro h x y hxy
    exact Generated.le_of_equivalence
      (s := fun a b => (φ a ↔ φ b))
      ⟨fun _ => Iff.rfl, fun h => h.symm, fun h₁ h₂ => h₁.trans h₂⟩ h hxy

-- RR.DEFINES: PS.THM.GENERATED_EQ_OBSERVATIONAL_EQUIVALENCE
/-- Generated identity is exactly agreement on all step invariants. -/
theorem generated_eq_observationalEquivalence (r : C → C → Prop) :
    Generated r = observationalEquivalence (relationInvariants r) := by
  funext x y
  apply propext
  constructor
  · intro h φ hφ
    have hg : φ ∈ relationInvariants (Generated r) := by
      rw [relationInvariants_generated]
      exact hφ
    exact hg x y h
  · intro h
    have hinv : (fun z => Generated r x z) ∈ relationInvariants r := by
      intro a b hab
      exact ⟨fun hxa => Generated.trans hxa (Generated.rel hab),
        fun hxb => Generated.trans hxb (Generated.symm (Generated.rel hab))⟩
    exact (h _ hinv).mp (Generated.refl x)

-- RR.DEFINES: PS.THM.OBSERVABLES_INVARIANT_IFF_GENERATED_RESPECTS
/-- Preservation: all observables are invariant iff generated identity respects them. -/
theorem observables_invariant_iff_generated_respects
    (r : C → C → Prop) (Φ : Set (C → Prop)) :
    Φ ⊆ relationInvariants r ↔
      ∀ x y, Generated r x y → observationalEquivalence Φ x y := by
  constructor
  · intro h x y hxy
    exact Generated.le_of_equivalence (observationalEquivalence_equivalence Φ)
      ((steps_respect_observables_iff r Φ).2 h) hxy
  · intro h
    exact (steps_respect_observables_iff r Φ).1
      (fun x y hxy => h x y (Generated.rel hxy))

-- RR.DEFINES: PS.THM.OBSERVATIONAL_COMPLETENESS_IFF_INVARIANT_SATURATION
/-- Completeness means every step invariant is constant on observational classes. -/
theorem observational_completeness_iff_invariant_saturation
    (r : C → C → Prop) (Φ : Set (C → Prop)) :
    (∀ x y, observationalEquivalence Φ x y → Generated r x y) ↔
      relationInvariants r ⊆ relationInvariants (observationalEquivalence Φ) := by
  constructor
  · intro h φ hφ x y hxy
    have hg : φ ∈ relationInvariants (Generated r) := by
      rw [relationInvariants_generated]
      exact hφ
    exact hg x y (h x y hxy)
  · intro h x y hxy
    rw [generated_eq_observationalEquivalence]
    intro φ hφ
    exact h hφ x y hxy

-- RR.DEFINES: PS.DEF.INVARIANT
/-- `φ` is unchanged by every preserving step of `c` on `d`. -/
def Classification.Invariant (c : Classification T) (d : Dynamics T C)
    (φ : C → Prop) : Prop :=
  ∀ x y, c.stepRel d x y → (φ x ↔ φ y)

-- RR.DEFINES: PS.THM.INVARIANT_IFF_RESPECTS_IDENTITY_REL
/-- Invariance under preserving steps is respect for `~_P`. -/
theorem Classification.invariant_iff_respects_identityRel
    (c : Classification T) (d : Dynamics T C) (φ : C → Prop) :
    c.Invariant d φ ↔ ∀ x y, c.identityRel d x y → (φ x ↔ φ y) := by
  constructor
  · intro h x y hg
    exact Generated.le_of_equivalence
      (s := fun a b => (φ a ↔ φ b))
      ⟨fun _ => Iff.rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩ h hg
  · intro h x y hxy
    exact h x y (Generated.rel hxy)

-- RR.DEFINES: PS.THM.IDENTITY_REL_IFF_ALL_INVARIANTS_AGREE
/-- Identity holds exactly when every persistence invariant agrees at the two states. -/
theorem Classification.identityRel_iff_all_invariants_agree
    (c : Classification T) (d : Dynamics T C) (x y : C) :
    c.identityRel d x y ↔ ∀ φ, c.Invariant d φ → (φ x ↔ φ y) := by
  change Generated (c.stepRel d) x y ↔ _
  rw [generated_eq_observationalEquivalence]
  rfl

/-- An invariant does not change along survival. -/
theorem Classification.Invariant.survives {c : Classification T}
    {d : Dynamics T C} {φ : C → Prop} (h : c.Invariant d φ) {x y : C}
    (hs : c.Survives d x y) : φ x ↔ φ y :=
  (Classification.invariant_iff_respects_identityRel c d φ).1 h x y
    (Classification.survives_identityRel hs)

/-- The negation of an invariant is an invariant. -/
theorem Classification.Invariant.not {c : Classification T} {d : Dynamics T C}
    {φ : C → Prop} (h : c.Invariant d φ) : c.Invariant d (fun x => ¬ φ x) :=
  fun x y hxy => not_congr (h x y hxy)

/-- The conjunction of two invariants is an invariant. -/
theorem Classification.Invariant.and {c : Classification T} {d : Dynamics T C}
    {φ ψ : C → Prop} (hφ : c.Invariant d φ) (hψ : c.Invariant d ψ) :
    c.Invariant d (fun x => φ x ∧ ψ x) :=
  fun x y hxy => and_congr (hφ x y hxy) (hψ x y hxy)

-- RR.DEFINES: PS.THM.INVARIANT_OF_PRS_SUBSET
/-- A classification that preserves fewer transformations has more invariants. -/
theorem Classification.invariant_of_prs_subset {c c' : Classification T}
    {d : Dynamics T C} (h : ∀ t, c.IsPrs t → c'.IsPrs t) {φ : C → Prop}
    (hφ : c'.Invariant d φ) : c.Invariant d φ :=
  fun x y ⟨t, ht, hs⟩ => hφ x y ⟨t, h t ht, hs⟩

end

end SE.Persistence
