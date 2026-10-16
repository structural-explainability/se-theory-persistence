# Independent Theory Audit: Persistence

## Objective

Conduct an independent, rigorous, **read-only semantic audit** of the Structural Explainability Persistence theory.

**Primary repository:** `se-theory-persistence`

**Upstream repositories:**

- `se-theory-neutral-substrate`
- `se-theory-transformation`

This is the next stage of a systematic review of the foundational Structural Explainability theory repositories.

The Neutral Substrate review has been completed.
Its accepted semantics provide the upstream foundation for this review.

The immediate objective is to determine whether Persistence is
conceptually sound, correctly scoped, and consistent
with its upstream theories **before any corrections or formal implementation are undertaken**.

## Authority and Scope

Inspect the actual repository contents rather than relying on previous conversations, summaries, or remembered implementations.

Begin by identifying each repository's authoritative surfaces,
including applicable manifests, research protocols, formal definitions, and reference artifacts.

Follow `.protocols/research.md` wherever it exists and applies.
If it is missing from Persistence, report that as a process gap; do not create it.

Respect the repository's own declared authority hierarchy.

Distinguish normative theory from examples, implementations, explanatory documentation, and historical material.

Older SE-300 artifacts are not normative authority for the current theory lineage.

Do not infer semantic validity from successful Lean compilation,
passing tests, existing documentation, or published papers.

## Review Questions

### 1. Theory Ownership

Determine precisely what Persistence owns.

Identify:

- Concepts and definitions that properly belong to Persistence.
- Concepts inherited from Neutral Substrate.
- Relationships and obligations inherited from Transformation.
- Concepts that should remain in downstream theories.

Look for duplicated definitions, inappropriate assumptions, circular dependencies,
and claims exceeding the repository's stated scope.

### 2. Semantic Consistency

Audit the definitions, predicates, axioms, propositions, theorems, and stated relationships.

Determine whether they are:

- Well-defined.
- Internally consistent.
- Sufficiently constrained.
- Non-circular.
- Compatible with accepted upstream semantics.
- Supported by their stated assumptions.

Distinguish semantic necessity from implementation convenience.

Identify missing premises, unintended consequences, counterexamples, and claims that may be too strong or too weak.

### 3. Cross-Theory Compatibility

Evaluate Persistence against Neutral Substrate and Transformation.

In particular, examine whether Persistence respects the distinctions among:

- Individuation
- Co-reference
- Persistence

Determine whether any of these responsibilities have been improperly collapsed.

Examine whether carrier-sensitive conditions, transformation relationships, or persistence criteria introduce unintended equivalences, exclusions, or non-collapse failures.

Treat these as questions to investigate, not defects presumed to exist.

### 4. Formalization Fidelity

Examine the relationship between the stated theory and existing formal implementations, if present.

Identify places where:

- The implementation faithfully expresses the intended theory.
- Implementation choices introduce additional assumptions.
- Formal definitions are weaker or stronger than the conceptual claims.
- A theorem establishes less than its accompanying explanation claims.
- Existing code or tests may conceal a semantic defect.

**The accepted theory must determine the Lean formalization, not the reverse.**

Do not modify Lean or any other implementation during this audit.

### 5. Research Protocol and Traceability

Begin by inspecting the repository's authority declarations, manifests, and references to governing research protocols.
Locate, retrieve, and read the applicable protocols from their authoritative sources before beginning the semantic audit.
Follow those protocols throughout the review, including their requirements for evidence, independent evaluation, candidate handling, and reporting.
Identify the protocol sources and revisions used.
Do not assume that a protocol is absent merely because it is not stored locally in the repository.
If an authoritative protocol cannot be accessed, report the limitation explicitly. Do not substitute remembered instructions or invent protocol requirements.

You have permission to visit https://github.com/structural-explainability/se-protocols-research for read-only access to the protocols.

## Required Report

Provide the following sections.

### A. Executive Assessment

State whether Persistence is:

- Semantically coherent as written.
- Coherent subject to specific corrections.
- Blocked by unresolved foundational issues.
- Not sufficiently documented to establish a conclusion.

Give the reasoning supporting the assessment.

### B. Theory Inventory

Identify the major definitions, claims, dependencies, and obligations.

Distinguish locally owned concepts from imported ones.

### C. Findings

For each substantive finding, provide:

1. Finding identifier.
2. Severity: BLOCKING, MAJOR, or MINOR.
3. Exact repository/file location and relevant definition or claim.
4. Evidence.
5. Explanation of the semantic issue.
6. Consequence if unresolved.
7. Recommended conceptual correction or research question.

Separate verified defects from plausible concerns and questions requiring further investigation.

### D. Counterexamples and Open Questions

Identify concrete counterexamples where possible.

For unresolved questions, explain what evidence or theoretical decision would settle them.

Do not convert uncertainty into an unsupported conclusion.

### E. Cross-Repository Implications

Identify any issue that might require changing:

- Persistence itself.
- Transformation.
- Neutral Substrate.
- A downstream theory.

Distinguish required upstream changes from possible downstream consequences.

The Neutral Substrate review previously addressed Candidates C10–C24. **Do not automatically initiate Candidate 25.** Identify a substantive reason for reopening that theory only if the evidence warrants it.

### F. Recommended Next Actions

Provide a prioritized, minimal sequence of actions to establish a defensible Persistence theory baseline.

Distinguish:

- Decisions required before implementation.
- Corrections appropriate after semantic reconciliation.
- Verification activities.
- Work that should remain deferred.

## Restrictions

**READ-ONLY REVIEW.**

- Do not edit files.
- Do not create or modify research artifacts.
- Do not implement proposed corrections.
- Do not change Lean definitions or proofs.
- Do not create branches, commits, or pull requests.
- Do not update repository versions.
- Do not modify papers, including Paper 100.
- Do not begin work on downstream theory repositories.
- Do not expand the scope into unrelated maintenance.

If a source cannot be accessed, explicitly state the limitation rather than assuming its contents.

Do not prioritize agreement with previous reviewers, existing code, or the apparent intent of the author.

An independent assessment is more valuable than a reassuring one.

## Completion Condition

Stop after delivering the audit report.

The report will be compared with a second independent review. Disagreements will be reconciled before any corrections are authorized.

The intended sequence remains:

**Audit --> Reconcile --> Establish accepted theory --> Implement --> Verify.**

The current task is **Audit only**.
