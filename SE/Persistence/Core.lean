/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
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

/-!
# Core

Core aggregator for the Persistence theory.

Imports the classification vocabulary, dynamics, survival, the identity
relation, breakage, invariance, and the non-collapse results.

This module does not import the Transformation theory, define identity
regimes or regime profiles, or define any admissibility notion. A regime's
persistence behavior is an inhabitant of `Classification` supplied downstream.
-/
