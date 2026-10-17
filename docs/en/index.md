# SE Theory: Persistence

Lean 4 formalization of foundational
Persistence theory for Structural Explainability.

Persistence asks under what formal conditions
states or stages of a referent are treated as
preserving the same identity across transformation.

This repository formalizes persistence classifications,
survival, generated identity relations, breakage,
invariance, observational equivalence, and the limits of presentations.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-persistence/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-persistence)

## Persistence

Persistence relations are defined independently
of particular transformation vocabularies and identity regimes.

A classification specifies whether a transformation is applicable and,
if applicable, whether it is identity-ignoring (`ign`),
identity-preserving (`prs`), or identity-breaking (`brk`).
Inapplicability is represented separately by `none`.

A supplied dynamics determines how transformations relate states.
Preserving steps induce directed survival and
a generated identity equivalence relation.

These relations are formal constructions.
Their scientific interpretation depends on justified classifications,
dynamics, and referent-specific identity criteria supplied downstream.

## Dependencies

This repository is a foundational theory-layer repository
for Structural Explainability.

It depends on Mathlib but has no dependency on another
Structural Explainability theory repository.

The classification and relation modules are generic
in the transformation domain and carrier.
`Dynamics.step` is an arbitrary supplied relation.
The free dynamics used in separation proofs is a mathematical witness,
not an empirical model of actual transformations.

Persistence does not import Transformation's
operator taxonomy, effect dimensions, footprints,
required-change clauses, or state models.

## Covers

This repository covers:

- persistence classification types, values, and applicability
- directed survival relations
- generated identity equivalence relations
- breakage predicates
- persistence invariants and observational equivalence
- presentation soundness and completeness conditions
- presentation blindness and separation results
- persistence non-collapse results
- Lean-side reference vocabulary
- machine-readable public-surface registries
- public Lean import surface

## Observability

A presentation maps states to information available to an observer.

The theory formalizes:

- which predicates can be expressed through a presentation
- observational equivalence induced by a presentation
- soundness: identity-related states have equal presentations
- completeness: states with equal presentations are identity-related
- conditions under which observations distinguish nonidentity
- cases where a presentation cannot distinguish non-identity-related states

Soundness and completeness are explicit hypotheses.
This repository characterizes their mathematical consequences
but does not establish that a particular real-world presentation satisfies them.

The distinction between generated identity and
scientifically justified referent identity
remains an obligation for downstream interpretation.

## Owns

This repository owns:

- the public import surface `SE/Persistence.lean`
- the repository-level aggregator `SE.lean`
- reference artifacts under `reference/`
- generated persistence artifacts under `data/persistence/`

## Out of Scope

This repository does not own:

- neutral substrate primitives
- transformation operator, family, or kind definitions
- transformation taxonomy lifts
- transformation effect dimensions or state models
- dimension-specific observational bridges
- identity regime definitions or profiles
- domain-specific identity criteria or their scientific justification
- validation and export tooling for artifacts
- domain mappings
- runtime systems
- operational policy

## Design Constraints

Lean source files are authoritative for formal theory semantics and proofs.

Reference registries describe the registered public surface
and must correspond to that Lean surface.

Python and generated data may mirror, validate, export,
or document the Lean surface.
They must not define theory semantics independently of Lean.

See the Lean source files and reference registries for current values.

## Documentation Constraints

Documentation is descriptive only.
It may provide orientation, summaries, and navigation.

It must not introduce formal semantics absent from Lean.

Machine-readable artifacts mirror the Lean surface
and reference registries under `data/persistence/`.

## Import

Downstream Lean projects should import the public surface:

`import SE.Persistence`

## Tooling

Python and other tooling may be used for:

- documentation generation
- formatting and linting
- repository automation
- reference artifact validation
- generated contract export checks

They must not:

- define correctness
- validate theory semantics independently of Lean
- replace Lean definitions or proofs
- introduce downstream theory dependencies
