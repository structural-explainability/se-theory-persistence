/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Domain.ClassificationValue
public import SE.Persistence.Domain.Classification
public import SE.Persistence.Relation.Generated
public import SE.Persistence.Relation.Survival
public import SE.Persistence.Relation.Equivalence
public import SE.Persistence.Relation.Breakage
public import SE.Persistence.Relation.Invariance
public import SE.Persistence.Relation.NonCollapse
public import SE.Persistence.Relation.Observability
public import SE.Persistence.Relation.Licence
public import SE.Persistence.Commitment.Consistency
public import SE.Persistence.Commitment.Status
public import SE.Persistence.Commitment.Cardinality
public import SE.Persistence.Commitment.Branching
public import SE.Persistence.Commitment.Compare
public import SE.Persistence.Commitment.Interpretation
public import SE.Persistence.Commitment.Observed

/-!
# Core

Core aggregator for the Persistence theory.

Imports the classification vocabulary, dynamics, survival, the identity
relation, breakage, invariance, the non-collapse results, and observability
(presentations, soundness and completeness).

This module does not import the Transformation theory, define identity
regimes or regime profiles, or define any admissibility notion. A regime's
persistence behavior is an inhabitant of `Classification` supplied downstream.
-/
