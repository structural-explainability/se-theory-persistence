/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Domain.Classification

set_option autoImplicit false

/-!
# Basic Checks

Defines a three-transformation toy domain and four classifications used by the
other Persistence tests, and checks that:

- one transformation can be preserving, breaking and ignoring under different
  classifications (relativity to the criterion of identity);
- inapplicable and ignoring are different patterns;
- forgetting applicability (`coarse`) merges them without changing the
  preserving set.
-/

namespace SETest.Persistence

open SE.Persistence

@[expose] public section

inductive Toy where
  | a
  | b
  | c
deriving DecidableEq, Repr

/-- Preserves `a`, breaks `b`, ignores `c`. -/
def P1 : Classification Toy where
  pattern
    | .a => some .prs
    | .b => some .brk
    | .c => some .ign
  persist _ := False

/-- Breaks `a`, ignores `b`, `c` inapplicable. -/
def P2 : Classification Toy where
  pattern
    | .a => some .brk
    | .b => some .ign
    | .c => none
  persist _ := False

/-- Same as `P2` except `c` is applicable and ignoring. -/
def P2' : Classification Toy where
  pattern
    | .a => some .brk
    | .b => some .ign
    | .c => some .ign
  persist _ := False

/-- Ignores `a`; `b` and `c` inapplicable. -/
def P3 : Classification Toy where
  pattern
    | .a => some .ign
    | .b => none
    | .c => none
  persist _ := False

end

-- Relativity: `a` is preserving, breaking and ignoring.
example : P1.pattern .a = some .prs := rfl
example : P2.pattern .a = some .brk := rfl
example : P3.pattern .a = some .ign := rfl

-- Inapplicable and ignoring are distinct patterns.
example : P2.pattern .c ≠ P2'.pattern .c := by decide
example : ¬ P2.Applicable .c := by decide
example : P2'.Applicable .c := by decide

-- Forgetting applicability merges them, and it is strictly lossy.
example : ∀ t, P2.coarse t = P2'.coarse t := by
  intro t; cases t <;> rfl
example : ∃ t, P2.pattern t ≠ P2'.pattern t := ⟨.c, by decide⟩
example : P2.coarse .c = .ign := Classification.coarse_of_pattern_none rfl
example : P1.coarse .b = .brk := Classification.coarse_of_pattern_some rfl

-- Distinct coarse rows force distinct patterns.
example : ∃ t, P1.pattern t ≠ P2.pattern t :=
  Classification.pattern_ne_of_coarse_ne ⟨.a, by decide⟩

-- The preserving and breaking sets are read off the coarse matrix.
example : P1.IsPrs .a := by decide
example : P1.IsBrk .b := by decide
example : ¬ P2.IsPrs .a := by decide
example : P1.coarse .a = .prs := rfl
example : (P1.coarse .b = .brk) ↔ P1.IsBrk .b := Classification.coarse_eq_brk_iff P1 .b

-- A transformation is not both preserving and breaking.
example : ¬ (P1.IsPrs .a ∧ P1.IsBrk .a) := fun ⟨h1, h2⟩ =>
  Classification.not_isPrs_of_isBrk h2 h1

-- Preserving and breaking transformations are applicable.
example : P1.Applicable .a := Classification.applicable_of_isPrs (by decide)
example : P1.Applicable .b := Classification.applicable_of_isBrk (by decide)

-- A classification whose declared persistence set is empty is well formed.
example : P1.WellFormed := fun _ h => h.elim

end SETest.Persistence
