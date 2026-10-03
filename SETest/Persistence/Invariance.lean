/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SETest.Persistence.Survival
public import SE.Persistence.Relation.Invariance

set_option autoImplicit false

/-!
# Invariance Checks

Checks that invariants are exactly the properties respecting the identity
relation, that a classification preserving fewer transformations has more
invariants, and that invariants are closed under negation and conjunction.
-/

namespace SETest.Persistence

open SE.Persistence

example {C : Type} (d : Dynamics Toy C) (φ : C → Prop) :
    P1.Invariant d φ ↔ ∀ x y, P1.identityRel d x y → (φ x ↔ φ y) :=
  Classification.invariant_iff_respects_identityRel P1 d φ

-- Every property is invariant under a classification with no preserving
-- transformation.
example {C : Type} (d : Dynamics Toy C) (φ : C → Prop) : P2.Invariant d φ :=
  fun _ _ ⟨t, ht, _⟩ => by
    cases t <;> exact absurd ht (by decide)

-- Invariants of P1 are invariants of P2.
example {C : Type} (d : Dynamics Toy C) (φ : C → Prop)
    (h : P1.Invariant d φ) : P2.Invariant d φ :=
  Classification.invariant_of_prs_subset
    (fun t ht => by cases t <;> exact absurd ht (by decide)) h

-- Invariants do not change along survival.
example {C : Type} (d : Dynamics Toy C) (φ : C → Prop) (x y : C)
    (h : P1.Invariant d φ) (hs : P1.Survives d x y) : φ x ↔ φ y :=
  h.survives hs

-- Invariants are closed under negation and conjunction.
example {C : Type} (d : Dynamics Toy C) (φ ψ : C → Prop)
    (hφ : P1.Invariant d φ) (hψ : P1.Invariant d ψ) :
    P1.Invariant d (fun x => ¬ φ x ∧ ψ x) :=
  hφ.not.and hψ

end SETest.Persistence
