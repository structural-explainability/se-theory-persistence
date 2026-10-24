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

The dynamics relation is supplied rather than derived.
Free dynamics provides mathematical witnesses, not empirical models
of actual transformations

## Identity Commitments

Persistence also formalizes an identity-commitment calculus over
asserted-same and asserted-distinct pairs.

The calculus establishes consistency conditions, required, forbidden,
and undetermined identity judgments, and consequences for comparison,
branching, cardinality, and observation.

These results constrain the supplied commitments.
They do not independently establish whether those commitments are
scientifically warranted for an intended referent kind.

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

## Scope

Repository scope is defined in `SE_MANIFEST.toml`.

## Exclusions

Repository exclusions are defined in `SE_MANIFEST.toml`.

## Import

Downstream Lean projects should import the public surface:

`import SE.Persistence`
