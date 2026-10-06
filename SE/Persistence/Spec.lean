/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

/-!
# Persistence Specification

Stable citation identifiers for the Persistence theory.

Each identifier names a public declaration that exists in this repository.
The identifiers are generated from the `RR.DEFINES` annotations in the Lean
source and listed here for downstream citation.
-/

namespace SE.Persistence.Spec

public section

-- ============================================================
-- TYPES
-- ============================================================

/-- Stable citation identifier for `Classification`. -/
def PS_TYPE_CLASSIFICATION : String :=
  "PS.TYPE.CLASSIFICATION"

/-- Stable citation identifier for `ClassificationValue`. -/
def PS_TYPE_CLASSIFICATION_VALUE : String :=
  "PS.TYPE.CLASSIFICATION_VALUE"

/-- Stable citation identifier for `Dynamics`. -/
def PS_TYPE_DYNAMICS : String :=
  "PS.TYPE.DYNAMICS"

/-- Stable citation identifier for `Reach`. -/
def PS_TYPE_REACH : String :=
  "PS.TYPE.REACH"

/-- Stable citation identifier for `Generated`. -/
def PS_TYPE_GENERATED : String :=
  "PS.TYPE.GENERATED"

-- ============================================================
-- DEFINITIONS
-- ============================================================

/-- Stable citation identifier for `Classification.Applicable`. -/
def PS_DEF_APPLICABLE : String :=
  "PS.DEF.APPLICABLE"

/-- Stable citation identifier for `Classification.IsPrs`. -/
def PS_DEF_IS_PRS : String :=
  "PS.DEF.IS_PRS"

/-- Stable citation identifier for `Classification.IsBrk`. -/
def PS_DEF_IS_BRK : String :=
  "PS.DEF.IS_BRK"

/-- Stable citation identifier for `Classification.WellFormed`. -/
def PS_DEF_WELL_FORMED : String :=
  "PS.DEF.WELL_FORMED"

/-- Stable citation identifier for `Classification.coarse`. -/
def PS_DEF_COARSE : String :=
  "PS.DEF.COARSE"

/-- Stable citation identifier for `Classification.liftFamily`. -/
def PS_DEF_LIFT_FAMILY : String :=
  "PS.DEF.LIFT_FAMILY"

/-- Stable citation identifier for `Classification.liftKind`. -/
def PS_DEF_LIFT_KIND : String :=
  "PS.DEF.LIFT_KIND"

/-- Stable citation identifier for `referenceClassificationValues`. -/
def PS_DEF_REFERENCE_CLASSIFICATION_VALUES : String :=
  "PS.DEF.REFERENCE_CLASSIFICATION_VALUES"

/-- Stable citation identifier for `Classification.stepBrk`. -/
def PS_DEF_STEP_BRK : String :=
  "PS.DEF.STEP_BRK"

/-- Stable citation identifier for `Classification.identityRel`. -/
def PS_DEF_IDENTITY_REL : String :=
  "PS.DEF.IDENTITY_REL"

/-- Stable citation identifier for `freeDynamics`. -/
def PS_DEF_FREE_DYNAMICS : String :=
  "PS.DEF.FREE_DYNAMICS"

/-- Stable citation identifier for `Classification.Invariant`. -/
def PS_DEF_INVARIANT : String :=
  "PS.DEF.INVARIANT"

/-- Stable citation identifier for `Classification.NonCollapsing`. -/
def PS_DEF_NON_COLLAPSING : String :=
  "PS.DEF.NON_COLLAPSING"

/-- Stable citation identifier for `Classification.stepRel`. -/
def PS_DEF_STEP_REL : String :=
  "PS.DEF.STEP_REL"

/-- Stable citation identifier for `Classification.Survives`. -/
def PS_DEF_SURVIVES : String :=
  "PS.DEF.SURVIVES"

-- ============================================================
-- THEOREMS
-- ============================================================

/-- Stable citation identifier for `Classification.applicable_iff`. -/
def PS_THM_APPLICABLE_IFF : String :=
  "PS.THM.APPLICABLE_IFF"

/-- Stable citation identifier for `Classification.not_isPrs_of_isBrk`. -/
def PS_THM_NOT_IS_PRS_OF_IS_BRK : String :=
  "PS.THM.NOT_IS_PRS_OF_IS_BRK"

/-- Stable citation identifier for `Classification.coarse_eq_prs_iff`. -/
def PS_THM_COARSE_EQ_PRS_IFF : String :=
  "PS.THM.COARSE_EQ_PRS_IFF"

/-- Stable citation identifier for `Classification.liftFamily_pattern_eq`. -/
def PS_THM_LIFT_FAMILY_PATTERN_EQ : String :=
  "PS.THM.LIFT_FAMILY_PATTERN_EQ"

/-- Stable citation identifier for `Classification.liftKind_pattern_eq`. -/
def PS_THM_LIFT_KIND_PATTERN_EQ : String :=
  "PS.THM.LIFT_KIND_PATTERN_EQ"

/-- Stable citation identifier for `Classification.not_identityRel_of_stepBrk_free`. -/
def PS_THM_NOT_IDENTITY_REL_OF_STEP_BRK_FREE : String :=
  "PS.THM.NOT_IDENTITY_REL_OF_STEP_BRK_FREE"

/-- Stable citation identifier for `Classification.identityRel_equivalence`. -/
def PS_THM_IDENTITY_REL_EQUIVALENCE : String :=
  "PS.THM.IDENTITY_REL_EQUIVALENCE"

/-- Stable citation identifier for `Classification.survives_identityRel`. -/
def PS_THM_SURVIVES_IDENTITY_REL : String :=
  "PS.THM.SURVIVES_IDENTITY_REL"

/-- Stable citation identifier for `Classification.identityRel_mono`. -/
def PS_THM_IDENTITY_REL_MONO : String :=
  "PS.THM.IDENTITY_REL_MONO"

/-- Stable citation identifier for `Classification.identityRel_eq_of_prs_iff`. -/
def PS_THM_IDENTITY_REL_EQ_OF_PRS_IFF : String :=
  "PS.THM.IDENTITY_REL_EQ_OF_PRS_IFF"

/-- Stable citation identifier for `Classification.identityRel_eq_of_coarse_eq`. -/
def PS_THM_IDENTITY_REL_EQ_OF_COARSE_EQ : String :=
  "PS.THM.IDENTITY_REL_EQ_OF_COARSE_EQ"

/-- Stable citation identifier for `Classification.identityRel_free_iff`. -/
def PS_THM_IDENTITY_REL_FREE_IFF : String :=
  "PS.THM.IDENTITY_REL_FREE_IFF"

/-- Stable citation identifier for `Classification.invariant_iff_respects_identityRel`. -/
def PS_THM_INVARIANT_IFF_RESPECTS_IDENTITY_REL : String :=
  "PS.THM.INVARIANT_IFF_RESPECTS_IDENTITY_REL"

/-- Stable citation identifier for `Classification.invariant_of_prs_subset`. -/
def PS_THM_INVARIANT_OF_PRS_SUBSET : String :=
  "PS.THM.INVARIANT_OF_PRS_SUBSET"

/-- Stable citation identifier for `Classification.prs_difference_of_nonCollapsing`. -/
def PS_THM_PRS_DIFFERENCE_OF_NON_COLLAPSING : String :=
  "PS.THM.PRS_DIFFERENCE_OF_NON_COLLAPSING"

/-- Stable citation identifier for `Classification.nonCollapsing_free_iff`. -/
def PS_THM_NON_COLLAPSING_FREE_IFF : String :=
  "PS.THM.NON_COLLAPSING_FREE_IFF"

/-- Stable citation identifier for `Classification.survives_ne_identityRel_free`. -/
def PS_THM_SURVIVES_NE_IDENTITY_REL_FREE : String :=
  "PS.THM.SURVIVES_NE_IDENTITY_REL_FREE"

/-- Stable citation identifier for `Classification.stepBrk_not_separating`. -/
def PS_THM_STEP_BRK_NOT_SEPARATING : String :=
  "PS.THM.STEP_BRK_NOT_SEPARATING"

/-- Stable citation identifier for `Classification.survives_mono`. -/
def PS_THM_SURVIVES_MONO : String :=
  "PS.THM.SURVIVES_MONO"

/-- Stable citation identifier for `relationInvariants`. -/
def PS_DEF_RELATION_INVARIANTS : String :=
  "PS.DEF.RELATION_INVARIANTS"

/-- Stable citation identifier for `observationalEquivalence`. -/
def PS_DEF_OBSERVATIONAL_EQUIVALENCE : String :=
  "PS.DEF.OBSERVATIONAL_EQUIVALENCE"

/-- Stable citation identifier for `observationalEquivalence_equivalence`. -/
def PS_THM_OBSERVATIONAL_EQUIVALENCE_EQUIVALENCE : String :=
  "PS.THM.OBSERVATIONAL_EQUIVALENCE_EQUIVALENCE"

/-- Stable citation identifier for `steps_respect_observables_iff`. -/
def PS_THM_STEPS_RESPECT_OBSERVABLES_IFF : String :=
  "PS.THM.STEPS_RESPECT_OBSERVABLES_IFF"

/-- Stable citation identifier for `relationInvariants_generated`. -/
def PS_THM_RELATION_INVARIANTS_GENERATED : String :=
  "PS.THM.RELATION_INVARIANTS_GENERATED"

/-- Stable citation identifier for `generated_eq_observationalEquivalence`. -/
def PS_THM_GENERATED_EQ_OBSERVATIONAL_EQUIVALENCE : String :=
  "PS.THM.GENERATED_EQ_OBSERVATIONAL_EQUIVALENCE"

/-- Stable citation identifier for `observables_invariant_iff_generated_respects`. -/
def PS_THM_OBSERVABLES_INVARIANT_IFF_GENERATED_RESPECTS : String :=
  "PS.THM.OBSERVABLES_INVARIANT_IFF_GENERATED_RESPECTS"

/-- Stable citation identifier for `observational_completeness_iff_invariant_saturation`. -/
def PS_THM_OBSERVATIONAL_COMPLETENESS_IFF_INVARIANT_SATURATION : String :=
  "PS.THM.OBSERVATIONAL_COMPLETENESS_IFF_INVARIANT_SATURATION"

/-- Stable citation identifier for `Classification.identityRel_iff_all_invariants_agree`. -/
def PS_THM_IDENTITY_REL_IFF_ALL_INVARIANTS_AGREE : String :=
  "PS.THM.IDENTITY_REL_IFF_ALL_INVARIANTS_AGREE"

end

end SE.Persistence.Spec
