# SE Theory: Persistence

Lean 4 formalization of foundational Persistence theory for Structural
Explainability.

This repository defines identity survival, breakage, invariance, and
equivalence under transformation.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-persistence/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-persistence)

## Persistence

```text
Persistence relations are defined independently of identity regimes.
Persistence is evaluated regime-specifically downstream.
```

This repository treats persistence as a formal theory layer to be
imported by downstream Structural Explainability repositories.

## Dependencies

This repository is a foundation theory-layer repository
for Structural Explainability.

Persistence depends on Structural Explainability Transformation Theory
for transformation kinds, families, and operators.
It exposes persistence structures and results for downstream theory layers.

## Covers

This repository covers:

- persistence classification types and values
- survival and generated identity relations
- breakage predicates
- persistence invariance
- persistence equivalence and non-collapse results
- transformation taxonomy lifts
- Lean-side reference vocabulary
- machine-readable public-surface registries
- public Lean import surface

## Owns

This repository owns:

- the public import surface `SE/Persistence.lean`
- the repository-level aggregator `SE.lean`
- reference artifacts under `reference/`
- generated persistence artifacts under `data/persistence/`

## Out of Scope

This repository does not own:

- neutral substrate primitives
- transformation operator definitions
- transformation family definitions
- transformation kind definitions
- validation and export tooling for artifacts
- domain mappings
- runtime systems
- operational policy

## Design Constraints

Lean source files are authoritative for formal theory semantics and proofs.
Reference registries describe the registered public surface and must correspond to that Lean surface.

Python and generated data may mirror, validate, export,
or document the Lean surface.
They must not define theory semantics independently of Lean.

See the Lean source files and reference registries for current values.

## Documentation Constraints

Documentation is descriptive only.
It may provide orientation, summaries, and navigation.
It must not introduce formal semantics absent from Lean.

Machine-readable artifacts mirror the Lean surface and reference registries:

```text
data/persistence/
```

## Import

Downstream Lean projects should import the public surface:

```text
import SE.Persistence
```

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
