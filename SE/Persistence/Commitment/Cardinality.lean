/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Commitment.Consistency

set_option autoImplicit false

/-!
# Commitment Cardinality

SE.Persistence.Commitment.Cardinality

The calculus of `SE.Persistence.Commitment.Status` places no limit on how many
individuals there are. Suppose instead that the number of identity classes is
independently known to be at most `k`. Then an admissible identity relation is
a map `f : C → Fin k` that gives equal values to asserted-same pairs and
different values to asserted-distinct pairs.

A limit can force identities that no chain of asserted-same pairs reaches. With
two classes allowed, two distinctions `a ≠ b` and `b ≠ c` force `a = c`.

Not proved here: for a fixed `k` of at least three, deciding whether such a map
exists for given finite `(P, D)` is graph `k`-colouring, which is NP-complete
in general. With `k = 2` it is a bipartiteness check.

A limit on the number of classes is a claim about the individuals, not about the
records or the audit. Where such a limit comes from is a question for the
individuation of the kind concerned; this module only derives consequences.
-/

namespace SE.Persistence

@[expose] public section

variable {C : Type}

-- RR.DEFINES: PS.DEF.ADMITS_CLASSES
/--
The commitments `(P, D)` admit an identity assignment into at most `k`
classes: a map into `Fin k` that agrees on `P` and differs on `D`.
-/
def AdmitsClasses (P D : C → C → Prop) (k : Nat) : Prop :=
  ∃ f : C → Fin k, (∀ x y, P x y → f x = f y) ∧ (∀ x y, D x y → f x ≠ f y)

/-- An assignment that agrees on `P` agrees on everything `P` generates. -/
theorem classAssignment_respects_generated {P : C → C → Prop} {k : Nat}
    {f : C → Fin k} (hP : ∀ x y, P x y → f x = f y) {x y : C}
    (h : Generated P x y) : f x = f y :=
  Generated.le_of_equivalence (s := fun a b => f a = f b)
    ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩ hP h

-- RR.DEFINES: PS.THM.CONSISTENT_OF_ADMITS_CLASSES
/-- A class limit that can be met makes the commitments consistent. -/
theorem consistent_of_admitsClasses {P D : C → C → Prop} {k : Nat}
    (h : AdmitsClasses P D k) : Consistent P D := by
  obtain ⟨f, hP, hD⟩ := h
  intro x y hd hg
  exact hD x y hd (classAssignment_respects_generated hP hg)

-- RR.DEFINES: PS.THM.ADMITS_CLASSES_MONO
/-- Allowing more classes keeps the commitments admissible. -/
theorem admitsClasses_mono {P D : C → C → Prop} {k m : Nat} (hkm : k ≤ m)
    (h : AdmitsClasses P D k) : AdmitsClasses P D m := by
  obtain ⟨f, hP, hD⟩ := h
  refine ⟨fun x => Fin.castLE hkm (f x), ?_, ?_⟩
  · intro x y hxy
    show Fin.castLE hkm (f x) = Fin.castLE hkm (f y)
    rw [hP x y hxy]
  · intro x y hxy heq
    have hv := congrArg Fin.val heq
    exact hD x y hxy (Fin.ext hv)

-- RR.DEFINES: PS.THM.NOT_ADMITS_TWO_CLASSES_OF_TRIANGLE
/--
Three individuals asserted pairwise distinct cannot fit into two classes.
Here the three are given as three distinct-commitments.
-/
theorem not_admitsClasses_two_of_triangle {P D : C → C → Prop} {a b c : C}
    (hab : D a b) (hbc : D b c) (hac : D a c) : ¬ AdmitsClasses P D 2 := by
  rintro ⟨f, _, hD⟩
  have h1 := hD a b hab
  have h2 := hD b c hbc
  have h3 := hD a c hac
  revert h1 h2 h3
  generalize f a = u
  generalize f b = v
  generalize f c = w
  revert u v w
  decide

-- RR.DEFINES: PS.DEF.SEP
/--
`y` and `z` are separated by a distinction: some member of the class of `y`
is asserted distinct from some member of the class of `z`.
-/
def Sep (P D : C → C → Prop) (y z : C) : Prop :=
  ∃ u v, Generated P y u ∧ D u v ∧ Generated P v z

-- RR.DEFINES: PS.TYPE.SEP_WALK
/--
A walk from `x` to `y` that begins inside one generated class and then crosses
distinctions `n` times, each crossing followed by a move within a generated
class.
-/
inductive SepWalk (P D : C → C → Prop) : Nat → C → C → Prop where
  | start {x y : C} : Generated P x y → SepWalk P D 0 x y
  | step {n : Nat} {x y z : C} :
      SepWalk P D n x y → Sep P D y z → SepWalk P D (n + 1) x z

/-- With two classes, a distinction between `y` and `z` makes them differ. -/
theorem sep_ne_of_assignment {P D : C → C → Prop} {f : C → Fin 2}
    (hP : ∀ x y, P x y → f x = f y) (hD : ∀ x y, D x y → f x ≠ f y)
    {y z : C} (h : Sep P D y z) : f y ≠ f z := by
  obtain ⟨u, v, hyu, hd, hvz⟩ := h
  have h1 := classAssignment_respects_generated hP hyu
  have h2 := classAssignment_respects_generated hP hvz
  rw [h1, ← h2]
  exact hD u v hd

-- RR.DEFINES: PS.THM.SEP_WALK_PARITY
/--
Parity law for two classes. Along a walk crossing `n` distinctions, an
assignment into two classes gives the endpoints the same class exactly when `n`
is even.
-/
theorem sepWalk_parity {P D : C → C → Prop} {f : C → Fin 2}
    (hP : ∀ x y, P x y → f x = f y) (hD : ∀ x y, D x y → f x ≠ f y)
    {n : Nat} {x y : C} (h : SepWalk P D n x y) :
    f x = f y ↔ n % 2 = 0 := by
  induction h with
  | start hg =>
    have := classAssignment_respects_generated hP hg
    simp [this]
  | @step n x y z _ hs ih =>
    have hne := sep_ne_of_assignment hP hD hs
    have key : ∀ a b c : Fin 2, b ≠ c → (a = c ↔ a ≠ b) := by decide
    rw [key (f x) (f y) (f z) hne, ne_eq, ih]
    omega

-- RR.DEFINES: PS.THM.TWO_CLASSES_EVEN_FORCES_SAME
/--
With at most two classes, a walk across an even number of distinctions forces
sameness.
-/
theorem two_classes_even_forces_same {P D : C → C → Prop} {n : Nat} {x y : C}
    (h : SepWalk P D n x y) (hn : n % 2 = 0) {f : C → Fin 2}
    (hP : ∀ x y, P x y → f x = f y) (hD : ∀ x y, D x y → f x ≠ f y) :
    f x = f y :=
  (sepWalk_parity hP hD h).2 hn

-- RR.DEFINES: PS.THM.TWO_CLASSES_ODD_FORCES_DISTINCT
/--
With at most two classes, a walk across an odd number of distinctions forces
distinctness.
-/
theorem two_classes_odd_forces_distinct {P D : C → C → Prop} {n : Nat}
    {x y : C} (h : SepWalk P D n x y) (hn : n % 2 = 1) {f : C → Fin 2}
    (hP : ∀ x y, P x y → f x = f y) (hD : ∀ x y, D x y → f x ≠ f y) :
    f x ≠ f y := by
  intro heq
  have := (sepWalk_parity hP hD h).1 heq
  omega

end

end SE.Persistence
