# SE Theory: Persistence

> Lean 4 formalization of foundational Persistence theory
> for Structural Explainability.

This repository formalizes identity continuation and breakage
under transformation, together with identity commitments,
generated relations, invariance, and observation.

Lean source files under `SE/` are authoritative for formal definitions,
predicates, assumptions, theorems, and proof obligations.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-persistence/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-persistence)
- [Research Doubts and Open Questions](https://github.com/structural-explainability/se-theory-persistence/blob/main/DOUBTS.md)
- [Research Decisions](https://github.com/structural-explainability/se-theory-persistence/blob/main/DECISIONS.md)

## Persistence

Persistence investigates the conditions under which
states or stages are treated as maintaining identity
across transformations.

The theory provides formal constructions for persistence,
breakage, identity commitments, and observational relationships.

Its results depend on supplied classifications, dynamics,
identity commitments, and observation assumptions.

Generated identity relations are mathematical constructions.
Their interpretation as identity of intended real-world
referents requires independently justified identity criteria.

## Scope

Repository scope is defined in `SE_MANIFEST.toml`.

## Exclusions

Repository exclusions are defined in `SE_MANIFEST.toml`.

## Import

Downstream Lean projects should import the public surface:

`import SE.Persistence`
