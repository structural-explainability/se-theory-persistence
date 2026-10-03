/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Relation.Equivalence

set_option autoImplicit false

/-!
# Invariance

SE.Persistence.Relation.Invariance

A property of states is a persistence invariant when every preserving step
leaves it unchanged.

Main result: invariance under the preserving steps is the same as respecting
the identity relation `~_P`. Invariants are exactly the properties that cannot
tell identity-related states apart.

This is a different notion from framework-invariance in the Neutral Substrate
theory, which concerns consistency across admissible frameworks.
-/

namespace SE.Persistence

@[expose] public section

variable {T C : Type}

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
