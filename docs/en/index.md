# SE Theory: Persistence

Lean 4 formalization of foundational Persistence theory for
Structural Explainability.

Persistence asks when something should still count
as the same identity after it has been transformed.

This repository formalizes identity survival, breakage, invariance, and
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

Persistence pins Structural Explainability Transformation Theory `v0.5.1` in
`lakefile.toml`. `lake-manifest.json` resolves that tag to commit
`350c7ff01aa7bf9a7119f0a44ce652d7a6933154`; `SE_MANIFEST.toml` declares the
same semantic dependency. Transformation is a Lean dependency, not a Python
runtime dependency.

`SE.Persistence.Reference.Lift` directly imports
`SE.Transformation.Domain.Operator.Semantics` and consumes `OperatorCode`,
`TransformationFamily`, `TransformationKind`, `operatorFamily`, and
`operatorKind`. The family and kind lifts precompose both `pattern` and
`persist` with the authoritative upstream taxonomy maps. `Conformance` and
the lift tests consume that API through `Lift`; the public Persistence import
includes those modules. The versioning test uses `RV` and `VS` in the
`versioning` family and `BR` in the `branching` family.

The core classification and relation modules remain generic in the
transformation domain and carrier. `Dynamics.step` is an arbitrary supplied
relation. It does not carry the frame and required-change laws of upstream
`StateModel`. The free dynamics used in separation proofs is a generic witness;
no compatibility with a Transformation state model is asserted.

Transformation `v0.5.1` also defines atomic effect footprints, required-change
clauses, state models, sequences, and partial composition and orthogonality
lookups. Persistence does not consume those APIs or derive persistence
classifications from them. Its `Reach` and `Generated` closures use the supplied
preserving-step relation. They do not consult upstream composition or
orthogonality lookups. Interaction with those concepts remains planned work in
`CHANGELOG.md`.

Connecting these layers would require explicit choices of a state model,
identity criterion, applicability, and classification, plus proofs of the
relevant compatibility conditions. The current Persistence surface supplies
none of those connections. It exposes its existing structures and results for
downstream theory layers.

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
