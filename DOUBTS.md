# Research Doubts and Open Questions

This document records the current research assessment,
known limitations, unresolved questions, and safeguards
against overclaiming for this theory.

For the three research criteria, doubt classifications,
status definitions, and procedures, see the
[SE Research Doubts Standard](https://raw.githubusercontent.com/structural-explainability/.github/refs/heads/main/docs/en/research/doubts.md).

## Repository Summary

This assessment is a summary of the present evidence.

| Criterion                | Current assessment                                                                                                                                                                                                                             |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Mathematical Correctness | Formal results are established under stated hypotheses. Presentation soundness and completeness are explicit hypotheses, not assumed. NP-completeness for fixed class limits above two is documented but not formalized.                       |
| Scientific Adequacy      | Open. Classifications and dynamics are supplied, not derived. Free dynamics provides mathematical witnesses, not empirical models of actual transformations. Referent-specific identity criteria are supplied downstream.                      |
| Theoretical Contribution | The proposed contribution is a general account of identity survival, breakage, and identity-commitment reasoning, independent of any transformation vocabulary or regime inventory. No related-work discussion is recorded in this repository. |

The doubts below identify specific issues affecting these assessments.

---

<!-- markdownlint-disable MD024 -->

## Register 1. Doubts About Assumptions (Undermining Doubts)

These questions concern the premises of an argument.
Even if a theorem is correctly proved, can we establish the assumptions necessary to apply it?

### UM-001. (OPEN) Supplied Classifications and Dynamics

#### Research criterion

Scientific Adequacy

#### Concern

The generated identity relation is only as justified as the classification and dynamics it is generated from.

Can a concrete application justify both?

#### Current Knowledge

A classification records whether a transformation is applicable and, if so, whether it is `ign`, `prs`, or `brk`.

A dynamics is supplied, not derived.
`freeDynamics` provides mathematical witnesses, not an empirical model of actual transformations.

#### Remaining Work

A concrete application must justify its classification, its dynamics, and the referent-specific identity criterion it relies on.

### UM-002. (OPEN) Presentation Soundness and Completeness

#### Research criterion

Scientific Adequacy

#### Concern

The observation results take presentation soundness and completeness as hypotheses.

Can a real-world presentation be shown to satisfy either?

#### Current Knowledge

`Classification.PresentationSound` and `Classification.PresentationComplete` are definitions.
`Classification.not_identityRel_of_sound_of_ne` and `Classification.identityRel_of_complete_of_eq` hold under those hypotheses.

`presentation_blind_example` exhibits a classification, dynamics, and presentation that fail to separate two states that are not identity-related.

#### Remaining Work

Each application must justify soundness or completeness for its own presentation.

### UM-003. (OPEN) History-Dependent Continuation Licensing

#### Research criterion

Scientific Adequacy

#### Concern

Whether a continuation preserves identity may depend on history, not only on the current state.

#### Current Knowledge

History-dependent licensing requires history to be represented in the state.
Contextual and history-dependent continuation licensing is listed as planned in `CHANGELOG.md`.

#### Remaining Work

Further investigation, as listed under Planned.

## Register 2. Doubts About Conclusions (Rebutting Doubts)

These questions concern whether a claimed conclusion is false.
For example, a counterexample satisfying all the premises
but violating the conclusion would challenge the claimed theorem or its formalization.
A model that violates a required assumption does not
necessarily refute a conditional theorem.
If a counterexample is found,
we must identify the exact claim it challenges and
whether its assumptions are satisfied.

**None currently identified.**

## Register 3. Doubts About What Our Results Mean (Undercutting Doubts)

These questions concern the connection
between a formal theorem and the scientific claim made about it.
A theorem may be correct while its informal interpretation is too strong.
Some of these doubts are addressed by permanent documentation
rules rather than additional proofs.

### UC-001. (STANDING RULES) Generated Identity Versus Referent Identity

#### Research criterion

Scientific Adequacy

#### Concern

A reader might take the generated identity relation as identity of the intended referents.

#### Current Knowledge

Preserving steps induce directed survival and a generated identity equivalence relation.
These are formal constructions.
The distinction between generated identity and scientifically justified referent identity remains an obligation for downstream interpretation.

#### Standing Rules

1. Describe the relation as generated by a stated classification and dynamics.
2. Do not present it as identity of intended referents without separate justification.

### UC-002. (STANDING RULES) Survival, Breakage, and Identity

#### Research criterion

Mathematical Correctness

#### Concern

A reader might equate survival with identity, or read a breaking step as separating its endpoints.

#### Current Knowledge

`Classification.survives_ne_identityRel_free` shows survival is strictly weaker than the identity relation: for a preserving transformation on the free dynamics, a pair survives forward, does not survive backward, and is identity-related backward.

`Classification.stepBrk_not_separating` shows that some classification and dynamics have a breaking step between states that are also identity-related.

#### Standing Rules

1. Do not equate survival with identity.
2. Do not read a breaking step as separating its endpoints without stating the classification and dynamics.

<!-- markdownlint-enable MD024 -->
