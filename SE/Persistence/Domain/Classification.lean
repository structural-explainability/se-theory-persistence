/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Domain.ClassificationValue

set_option autoImplicit false

/-!
# Classification

SE.Persistence.Domain.Classification

A persistence classification over an abstract transformation domain `T`.

The domain is a parameter. This module does not decide which transformation
vocabulary is classified, and it does not define identity regimes or regime
profiles: a regime profile is a classification together with a carrier and an
identity basis, and belongs downstream.

Applicability and classification are encoded together as
`T → Option ClassificationValue`:

- `none` is inapplicable; no classification exists;
- `some v` is applicable with class `v`.

N/A is the absence of a value, and IGN is a value.
-/

namespace SE.Persistence

@[expose] public section

-- RR.DEFINES: PS.TYPE.CLASSIFICATION
/--
A persistence classification over the transformation domain `T`.

`pattern t` is the applicability-and-class pair for `t`.
`persist` is the declared persistence set. Its relation to the preserving
transformations is the predicate `Classification.WellFormed`, stated
separately rather than carried as a field.
-/
structure Classification (T : Type) where
  /-- Applicability and class: `none` is inapplicable, `some v` is applicable with class `v`. -/
  pattern : T → Option ClassificationValue
  /-- The declared persistence set. -/
  persist : T → Prop

variable {T : Type}

-- RR.DEFINES: PS.DEF.APPLICABLE
/-- `t` is applicable under `c`. -/
def Classification.Applicable (c : Classification T) (t : T) : Prop :=
  c.pattern t ≠ none

-- RR.DEFINES: PS.DEF.IS_PRS
/-- `t` is applicable and identity-preserving under `c`. -/
def Classification.IsPrs (c : Classification T) (t : T) : Prop :=
  c.pattern t = some ClassificationValue.prs

-- RR.DEFINES: PS.DEF.IS_BRK
/-- `t` is applicable and identity-breaking under `c`. -/
def Classification.IsBrk (c : Classification T) (t : T) : Prop :=
  c.pattern t = some ClassificationValue.brk

-- RR.DEFINES: PS.DEF.WELL_FORMED
/-- The declared persistence set contains only identity-preserving transformations. -/
def Classification.WellFormed (c : Classification T) : Prop :=
  ∀ t, c.persist t → c.IsPrs t

-- RR.DEFINES: PS.DEF.COARSE
/--
The total three-valued matrix obtained by sending inapplicable to `ign`.

This forgets applicability. `coarse_eq_prs_iff` shows it preserves the
preserving set.
-/
def Classification.coarse (c : Classification T) (t : T) : ClassificationValue :=
  (c.pattern t).getD ClassificationValue.ign

/-- Applicability is decidable, so finite statements can be checked with `decide`. -/
instance (c : Classification T) (t : T) : Decidable (c.Applicable t) :=
  inferInstanceAs (Decidable (c.pattern t ≠ none))

/-- Preservation is decidable, so finite statements can be checked with `decide`. -/
instance (c : Classification T) (t : T) : Decidable (c.IsPrs t) :=
  inferInstanceAs (Decidable (c.pattern t = some ClassificationValue.prs))

/-- Breakage is decidable, so finite statements can be checked with `decide`. -/
instance (c : Classification T) (t : T) : Decidable (c.IsBrk t) :=
  inferInstanceAs (Decidable (c.pattern t = some ClassificationValue.brk))

-- RR.DEFINES: PS.THM.APPLICABLE_IFF
/-- Applicable means some classification exists. -/
theorem Classification.applicable_iff (c : Classification T) (t : T) :
    c.Applicable t ↔ ∃ v, c.pattern t = some v := by
  unfold Classification.Applicable
  cases h : c.pattern t with
  | none => simp
  | some v => simp

/-- A preserving transformation is applicable. -/
theorem Classification.applicable_of_isPrs {c : Classification T} {t : T}
    (h : c.IsPrs t) : c.Applicable t := by
  unfold Classification.IsPrs at h
  unfold Classification.Applicable
  simp [h]

/-- A breaking transformation is applicable. -/
theorem Classification.applicable_of_isBrk {c : Classification T} {t : T}
    (h : c.IsBrk t) : c.Applicable t := by
  unfold Classification.IsBrk at h
  unfold Classification.Applicable
  simp [h]

-- RR.DEFINES: PS.THM.NOT_IS_PRS_OF_IS_BRK
/-- A transformation is not both preserving and breaking. -/
theorem Classification.not_isPrs_of_isBrk {c : Classification T} {t : T}
    (h : c.IsBrk t) : ¬ c.IsPrs t := by
  unfold Classification.IsBrk at h
  unfold Classification.IsPrs
  rw [h]
  simp

/-- An inapplicable transformation has coarse value `ign`. -/
theorem Classification.coarse_of_pattern_none {c : Classification T} {t : T}
    (h : c.pattern t = none) : c.coarse t = ClassificationValue.ign := by
  unfold Classification.coarse
  rw [h]
  rfl

/-- An applicable transformation keeps its value under the coarse matrix. -/
theorem Classification.coarse_of_pattern_some {c : Classification T} {t : T}
    {v : ClassificationValue} (h : c.pattern t = some v) : c.coarse t = v := by
  unfold Classification.coarse
  rw [h]
  rfl

-- RR.DEFINES: PS.THM.COARSE_EQ_PRS_IFF
/-- The coarse matrix preserves exactly the preserving set. -/
theorem Classification.coarse_eq_prs_iff (c : Classification T) (t : T) :
    c.coarse t = ClassificationValue.prs ↔ c.IsPrs t := by
  unfold Classification.coarse Classification.IsPrs
  cases h : c.pattern t with
  | none => simp
  | some v => cases v <;> simp

/-- The coarse matrix preserves exactly the breaking set. -/
theorem Classification.coarse_eq_brk_iff (c : Classification T) (t : T) :
    c.coarse t = ClassificationValue.brk ↔ c.IsBrk t := by
  unfold Classification.coarse Classification.IsBrk
  cases h : c.pattern t with
  | none => simp
  | some v => cases v <;> simp

/-- Equal patterns have equal coarse values. -/
theorem Classification.coarse_eq_of_pattern_eq {c c' : Classification T}
    (h : ∀ t, c.pattern t = c'.pattern t) (t : T) :
    c.coarse t = c'.coarse t := by
  unfold Classification.coarse
  rw [h t]

/-- Distinct coarse rows force distinct patterns. -/
theorem Classification.pattern_ne_of_coarse_ne {c c' : Classification T}
    (h : ∃ t, c.coarse t ≠ c'.coarse t) : ∃ t, c.pattern t ≠ c'.pattern t := by
  rcases h with ⟨t, ht⟩
  refine ⟨t, fun heq => ht ?_⟩
  unfold Classification.coarse
  rw [heq]

end

end SE.Persistence
