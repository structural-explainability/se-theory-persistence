module

public import SE.Persistence.Commitment.Branching
public import SE.Persistence.Commitment.Interpretation
public import SE.Persistence.Commitment.Observed
public import SE.Persistence.Commitment.Compare
public import SE.Persistence.Relation.Licence

set_option autoImplicit false

/-!
# Commitment Checks

Concrete checks for the commitment calculus on small finite carriers:

- a fork is consistent with one branch continuing and inconsistent with both
  continuing when the branches are asserted distinct;
- three pairwise-distinct individuals do not fit in two classes;
- a forced distinction follows from one identity and one distinction;
- a pair can be undetermined;
- the difference between two generated identities is pinned to one commitment.
-/

namespace SETest.Persistence

open SE.Persistence

@[expose] public section

/-- Fork `0 → 1`, `0 → 2`, with `1` and `2` asserted distinct. -/
def forkDistinct : Fin 3 → Fin 3 → Prop :=
  fun x y => x = 1 ∧ y = 2

/-- Only the first branch continues. -/
def firstBranch : Fin 3 → Fin 3 → Prop :=
  fun x y => x = 0 ∧ y = 1

/-- Only the second branch continues. -/
def secondBranch : Fin 3 → Fin 3 → Prop :=
  fun x y => x = 0 ∧ y = 2

/-- Both branches continue. -/
def bothBranches : Fin 3 → Fin 3 → Prop :=
  fun x y => (x = 0 ∧ y = 1) ∨ (x = 0 ∧ y = 2)

example : Consistent firstBranch forkDistinct :=
  consistent_of_admitsClasses
    (k := 2)
    ⟨fun i => if i.val = 2 then 1 else 0,
      by rintro x y ⟨rfl, rfl⟩; decide,
      by rintro x y ⟨rfl, rfl⟩; decide⟩

example : Consistent secondBranch forkDistinct :=
  consistent_of_admitsClasses
    (k := 2)
    ⟨fun i => if i.val = 1 then 1 else 0,
      by rintro x y ⟨rfl, rfl⟩; decide,
      by rintro x y ⟨rfl, rfl⟩; decide⟩

example : ¬ Consistent bothBranches forkDistinct := fun h =>
  not_distinct_of_fork h (a := 0) (b := 1) (c := 2)
    (Or.inl ⟨rfl, rfl⟩) (Or.inr ⟨rfl, rfl⟩) ⟨rfl, rfl⟩

example : ¬ AdmitsClasses (fun _ _ : Fin 3 => False) (fun x y : Fin 3 => x ≠ y) 2 :=
  not_admitsClasses_two_of_triangle (a := 0) (b := 1) (c := 2)
    (by decide) (by decide) (by decide)

/-- One identity `0 ~ 1` and one distinction `1 ≠ 2` on four states. -/
def sameZeroOne : Fin 4 → Fin 4 → Prop :=
  fun x y => x = 0 ∧ y = 1

def distinctOneTwo : Fin 4 → Fin 4 → Prop :=
  fun x y => x = 1 ∧ y = 2

-- `0 ≠ 2` is forced, though nobody asserted it.
example : Forbidden sameZeroOne distinctOneTwo 0 2 :=
  forbidden_of_required_of_distinct (a := 1) (b := 0) (c := 2)
    (Generated.symm (Generated.rel ⟨rfl, rfl⟩)) ⟨rfl, rfl⟩

/-- Identifies `0` with `1` and `2` with `3`. -/
def joinTwoThree (i : Fin 4) : Nat :=
  if i.val ≤ 1 then 0 else 2

/-- Identifies `0` with `1` and keeps `2` and `3` apart. -/
def keepTwoThreeApart (i : Fin 4) : Nat :=
  if i.val ≤ 1 then 0 else i.val

-- `2` and `3` are not required identical.
example : ¬ Required sameZeroOne 2 3 := by
  intro h
  have := Generated.le_of_equivalence
    (s := fun a b : Fin 4 => keepTwoThreeApart a = keepTwoThreeApart b)
    ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
    (by rintro x y ⟨rfl, rfl⟩; decide) h
  revert this
  decide

-- `2` and `3` are not forbidden: identifying them creates no clash.
example : ¬ Forbidden sameZeroOne distinctOneTwo 2 3 := by
  rintro ⟨u, v, ⟨rfl, rfl⟩, hg⟩
  have := Generated.le_of_equivalence
    (s := fun a b : Fin 4 => joinTwoThree a = joinTwoThree b)
    ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
    (by
      rintro x y (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩)
      · decide
      · decide)
    hg
  revert this
  decide

-- Hence `2` and `3` are undetermined.
example : Undetermined sameZeroOne distinctOneTwo 2 3 :=
  ⟨by
    intro h
    have := Generated.le_of_equivalence
      (s := fun a b : Fin 4 => keepTwoThreeApart a = keepTwoThreeApart b)
      ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
      (by rintro x y ⟨rfl, rfl⟩; decide) h
    revert this
    decide,
   by
    rintro ⟨u, v, ⟨rfl, rfl⟩, hg⟩
    have := Generated.le_of_equivalence
      (s := fun a b : Fin 4 => joinTwoThree a = joinTwoThree b)
      ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
      (by
        rintro x y (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩)
        · decide
        · decide)
      hg
    revert this
    decide⟩

-- Generated identities are compared on generators.
example : GeneratedLE firstBranch bothBranches :=
  generatedLE_iff.2 fun _ _ h => Generated.rel (Or.inl h)

/-- The first branch alone does not identify `0` and `2`. -/
theorem not_generated_firstBranch_zero_two : ¬ Generated firstBranch 0 2 := by
  intro hg
  have := Generated.le_of_equivalence
    (s := fun a b : Fin 3 => (if a.val = 2 then 1 else 0 : Nat) =
      (if b.val = 2 then 1 else 0))
    ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
    (by rintro u v ⟨rfl, rfl⟩; decide) hg
  revert this
  decide

example : ¬ GeneratedLE bothBranches firstBranch := fun h =>
  not_generated_firstBranch_zero_two (h 0 2 (Generated.rel (Or.inr ⟨rfl, rfl⟩)))

-- The difference is pinned to one commitment of the larger side.
example : ∃ x y, bothBranches x y ∧ ¬ Generated firstBranch x y :=
  exists_generator_witness (fun h =>
    not_generated_firstBranch_zero_two (h 0 2 (Generated.rel (Or.inr ⟨rfl, rfl⟩))))

end

end SETest.Persistence
