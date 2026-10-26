/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Commitment.Status
public import SE.Persistence.Commitment.Cardinality

set_option autoImplicit false

/-!
# Interpretations under Extra Constraints

SE.Persistence.Commitment.Interpretation

The generated identity of `P` is the least equivalence relation containing `P`.
It is what every admissible interpretation must identify. It is not the whole
identity relation of any one interpretation, and extra constraints can force
more than it.

Take a constraint `Γ` on identity relations, supplied independently of `P` and
`D`. For example, a limit on the number of classes. An interpretation is a
relation that is admissible for `(P, D)` and satisfies `Γ`. Then:

- `ForcedSame Γ`: every interpretation identifies the pair;
- `ForcedDistinct Γ`: every interpretation separates it;
- `OpenUnder Γ`: some interpretation identifies it and some separates it.

Adding constraints removes interpretations, so it can only turn open pairs into
forced ones. With no constraint, forced sameness is exactly `Required`. With a
class limit, forced sameness can be strictly larger, which is why a limit
produces identities that no chain of asserted-same pairs reaches.

This module does not say where `Γ` comes from. A constraint on the individuals
needs its own justification.
-/

namespace SE.Persistence

@[expose] public section

variable {C : Type}

-- RR.DEFINES: PS.DEF.AT_MOST_CLASSES
/--
`E` has at most `k` classes: it is equality of values of some map into `Fin k`.
-/
def AtMostClasses (k : Nat) (E : C → C → Prop) : Prop :=
  ∃ f : C → Fin k, ∀ x y, E x y ↔ f x = f y

-- RR.DEFINES: PS.DEF.ADMISSIBLE_UNDER
/-- An interpretation: admissible for `(P, D)` and satisfying the constraint `Γ`. -/
def AdmissibleUnder (Γ : (C → C → Prop) → Prop) (P D E : C → C → Prop) : Prop :=
  Admissible P D E ∧ Γ E

-- RR.DEFINES: PS.DEF.FORCED_SAME
/-- Every interpretation under `Γ` identifies `x` and `y`. -/
def ForcedSame (Γ : (C → C → Prop) → Prop) (P D : C → C → Prop) (x y : C) : Prop :=
  ∀ E, AdmissibleUnder Γ P D E → E x y

-- RR.DEFINES: PS.DEF.FORCED_DISTINCT
/-- Every interpretation under `Γ` separates `x` and `y`. -/
def ForcedDistinct (Γ : (C → C → Prop) → Prop) (P D : C → C → Prop) (x y : C) : Prop :=
  ∀ E, AdmissibleUnder Γ P D E → ¬ E x y

-- RR.DEFINES: PS.DEF.OPEN_UNDER
/-- Some interpretation under `Γ` identifies `x` and `y` and some separates them. -/
def OpenUnder (Γ : (C → C → Prop) → Prop) (P D : C → C → Prop) (x y : C) : Prop :=
  (∃ E, AdmissibleUnder Γ P D E ∧ E x y) ∧ (∃ E, AdmissibleUnder Γ P D E ∧ ¬ E x y)

-- RR.DEFINES: PS.THM.REQUIRED_IMP_FORCED_SAME
/-- What is required is forced under every constraint. -/
theorem required_imp_forcedSame (Γ : (C → C → Prop) → Prop) {P D : C → C → Prop}
    {x y : C} (h : Required P x y) : ForcedSame Γ P D x y :=
  fun _ hE => Generated.le_of_equivalence hE.1.1 hE.1.2.1 h

-- RR.DEFINES: PS.THM.FORBIDDEN_IMP_FORCED_DISTINCT
/-- What is forbidden is forced distinct under every constraint. -/
theorem forbidden_imp_forcedDistinct (Γ : (C → C → Prop) → Prop)
    {P D : C → C → Prop} {x y : C} (h : Forbidden P D x y) :
    ForcedDistinct Γ P D x y :=
  fun _ hE => forbidden_iff_forall_admissible.1 h _ hE.1

-- RR.DEFINES: PS.THM.FORCED_SAME_OF_WEAKER
/--
A stronger constraint forces whatever a weaker one forces. Adding constraints
only turns open pairs into forced ones.
-/
theorem forcedSame_of_weaker {Γ Γ' : (C → C → Prop) → Prop}
    (hΓ : ∀ E, Γ E → Γ' E) {P D : C → C → Prop} {x y : C}
    (h : ForcedSame Γ' P D x y) : ForcedSame Γ P D x y :=
  fun E hE => h E ⟨hE.1, hΓ E hE.2⟩

/-- With no constraint, forced sameness is exactly what is required. -/
theorem forcedSame_trivial_iff_required {P D : C → C → Prop}
    (hc : Consistent P D) {x y : C} :
    ForcedSame (fun _ => True) P D x y ↔ Required P x y := by
  constructor
  · intro h
    exact h (Generated P) ⟨admissible_generated_of_consistent hc, trivial⟩
  · exact required_imp_forcedSame _

-- RR.DEFINES: PS.THM.FORCED_SAME_OF_EVEN_SEP_WALK
/--
With at most two classes, a walk across an even number of distinctions is
forced to identify its endpoints, in every interpretation.
-/
theorem forcedSame_of_even_sepWalk {P D : C → C → Prop} {n : Nat} {x y : C}
    (h : SepWalk P D n x y) (hn : n % 2 = 0) :
    ForcedSame (AtMostClasses 2) P D x y := by
  rintro E ⟨⟨_, hPE, hDE⟩, f, hf⟩
  have hP : ∀ a b, P a b → f a = f b := fun a b hab => (hf a b).1 (hPE a b hab)
  have hD : ∀ a b, D a b → f a ≠ f b := fun a b hab hfab => hDE a b hab ((hf a b).2 hfab)
  exact (hf x y).2 (two_classes_even_forces_same h hn hP hD)

-- RR.DEFINES: PS.THM.FORCED_DISTINCT_OF_ODD_SEP_WALK
/--
With at most two classes, a walk across an odd number of distinctions is forced
to separate its endpoints, in every interpretation.
-/
theorem forcedDistinct_of_odd_sepWalk {P D : C → C → Prop} {n : Nat} {x y : C}
    (h : SepWalk P D n x y) (hn : n % 2 = 1) :
    ForcedDistinct (AtMostClasses 2) P D x y := by
  rintro E ⟨⟨_, hPE, hDE⟩, f, hf⟩ hxy
  have hP : ∀ a b, P a b → f a = f b := fun a b hab => (hf a b).1 (hPE a b hab)
  have hD : ∀ a b, D a b → f a ≠ f b := fun a b hab hfab => hDE a b hab ((hf a b).2 hfab)
  exact two_classes_odd_forces_distinct h hn hP hD ((hf x y).1 hxy)

/-! ### A forced identity that nothing asserted

Three states with `0 ≠ 1` and `1 ≠ 2` asserted, and no asserted-same pairs. With
at most two classes, `0` and `2` are forced identical. Without the limit they
are open. -/

-- RR.DEFINES: PS.DEF.PATH_DISTINCT
/-- Distinct-commitments `0 ≠ 1` and `1 ≠ 2` on three states. -/
def pathDistinct : Fin 3 → Fin 3 → Prop :=
  fun x y => (x = 0 ∧ y = 1) ∨ (x = 1 ∧ y = 2)

-- RR.DEFINES: PS.DEF.NO_SAME
/-- No asserted-same pairs. -/
def noSame : Fin 3 → Fin 3 → Prop :=
  fun _ _ => False

-- RR.DEFINES: PS.THM.PATH_DISTINCT_FORCED_SAME
/-- With at most two classes, `0` and `2` are forced identical. -/
theorem pathDistinct_forcedSame :
    ForcedSame (AtMostClasses 2) noSame pathDistinct 0 2 := by
  rintro E ⟨⟨_, _, hDE⟩, f, hf⟩
  have h01 : f 0 ≠ f 1 := fun h => hDE 0 1 (Or.inl ⟨rfl, rfl⟩) ((hf 0 1).2 h)
  have h12 : f 1 ≠ f 2 := fun h => hDE 1 2 (Or.inr ⟨rfl, rfl⟩) ((hf 1 2).2 h)
  have key : ∀ u v w : Fin 2, u ≠ v → v ≠ w → u = w := by decide
  exact (hf 0 2).2 (key _ _ _ h01 h12)

-- RR.DEFINES: PS.THM.PATH_DISTINCT_NOT_REQUIRED
/-- Without the limit, `0` and `2` are not required identical. -/
theorem pathDistinct_not_required : ¬ Required noSame 0 2 := by
  intro h
  have := Generated.le_of_equivalence (s := fun a b : Fin 3 => a = b)
    ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
    (fun _ _ hf => hf.elim) h
  revert this
  decide

end

end SE.Persistence
