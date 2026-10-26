/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Registry

/-!
# Conformance

SE.Persistence.Conformance

Finite regression guards for the Persistence public surface.

The statements below can fail when the vocabulary is edited:

- the reference list of classification values is duplicate-free and complete;
- `ign`, `prs` and `brk` are pairwise distinct;
- the coarse matrix agrees with the pattern at applicable transformations and
  sends inapplicable ones to `ign`.

Mathematical theorems about the relations are not restated here.
-/

namespace SE.Persistence

public section

/-- `referenceClassificationValues` has no duplicates. -/
theorem referenceClassificationValues_nodup :
    referenceClassificationValues.Nodup := by
  decide

/-- Every classification value occurs in `referenceClassificationValues`. -/
theorem referenceClassificationValues_complete (v : ClassificationValue) :
    v ∈ referenceClassificationValues := by
  cases v <;> decide

/-- There are exactly three classification values. -/
theorem referenceClassificationValues_length :
    referenceClassificationValues.length = 3 := by
  decide

/-- Preserving and breaking are different values. -/
theorem prs_ne_brk : ClassificationValue.prs ≠ ClassificationValue.brk := by
  decide

/-- Ignoring and preserving are different values. -/
theorem ign_ne_prs : ClassificationValue.ign ≠ ClassificationValue.prs := by
  decide

/-- Ignoring and breaking are different values. -/
theorem ign_ne_brk : ClassificationValue.ign ≠ ClassificationValue.brk := by
  decide

end

end SE.Persistence
