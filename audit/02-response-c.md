# Claude

I'll reconcile the two audits against the repositories themselves at the audited commits, verifying each disputed claim in the source before ruling on it. This is read-only, with scratch clones kept outside every repo.

Repos are cloned and checked out at the audited commits. I'm now reading the protocols, which are the reconciliation-relevant ones (theory-construction, independent-review, theory-acceptance, source-audit). Persistence and Transformation each have one commit newer than the audited ones; it only adds `.protocols/research.md`, which bears on the missing-file finding. Next I'll verify the disputed findings in the Lean source.

Still working. I've read the Persistence Lean core, docs, manifest and Lake file. Confirmed so far: the surfaces.toml defect (parsed it myself — 7 surfaces, `lean-public-surface` missing) and the `lakefile.lean` vs `lakefile.toml` mismatch. Next: Neutral Substrate's `PersistenceAccount` and Transformation's `StateModel`, so I can test the D1 and D4 claims against upstream source.

Checking upstream now. Neutral Substrate's `PersistenceAccount` text explicitly says persistence is not identified with transformation and that substantive persistence theory is external; that bears directly on D1/D2. I'm now reading Transformation's `StateModel` and its preserves/breaks theorems to test the D4 dispute (Claude's "unconstrained labels" concern versus ChatGPT's "taxonomy-only is fine").

Verification is mostly done. Confirmed in source or by my own scratch checks: the fork/fusion/zigzag cases, the symmetric-closure docstring error, label-swap invariance, surfaces.toml, `persist` used only by `WellFormed`, and no `sorry`/`axiom` in `SE/` or `SETest/`. No Lean toolchain here, so nothing was built. I also derived one result neither audit states, and it checked out exhaustively on small models: a breakage coherence condition can be stated using `identityRel` alone. Last pass is the reference TOML and vocabulary for D5, then I write the report.

# Persistence Theory Reconciliation

All evaluation is at the audited commits, with the repositories cloned read-only to a scratch directory. I did not build Lean (no toolchain here), so every "verified" below means verified by reading source, by `tomllib` parsing, or by a scratch finite-model restatement, not by a Lean check.

## Revisions used

- Protocols: `se-protocols-research` @ `e448eb7` (v0.1.0). I read `source-audit`, `theory-construction`, `independent-review` and `theory-acceptance`. I did not read `referee-sim`, which applies to outward-facing artifacts.
- Persistence @ `8197490` (v0.2.0), Neutral Substrate @ `e823a41` (HEAD, CHANGELOG 0.11.0), Transformation @ `350c7ff` (v0.5.1, matches Persistence's Lake pin and lock).
- **Material changes since the audits:**
  - Persistence HEAD is `5d06dcb` and Transformation HEAD is `7b0f10a`. Each adds exactly one file, `.protocols/research.md`, dated 2026-10-16 02:22 and 02:24.
  - Neutral Substrate and the protocols are unchanged.
  - The change resolves the missing-file finding (Claude P-3 / ChatGPT P-04) at HEAD only. Nothing else bears on reconciliation. I did not mix revisions.

---

## A. Executive Reconciliation

**Where the audits agree.** The Lean layer is a coherent, non-circular algebra over a supplied classification of transformations: directed reachability, equivalence closure, step invariants. Neither found `sorry` or `axiom`, and I confirmed none in `SE/` or `SETest/`. Both found no formal collapse of individuation, co-reference and persistence. Both found:

- No stated relation to Neutral Substrate's `PersistenceAccount`.
- Fission and fusion identifying branches under `identityRel`.
- Breaking labels with no separating force outside the free dynamics.
- `persist` unused by any relation.
- A malformed `surfaces.toml`.
- No required change to Neutral Substrate.

**Where they differ substantively.** Only on the Transformation dependency (D4) and on whether the missing independent theory statement is a defect (D5). Their headline dispositions (Claude: ACCEPT WITH NARROWING; ChatGPT: INSUFFICIENT BASIS) look like opposites but are not. They evaluate different candidates:

- Claude's narrowing says Persistence is a generic closure theory and makes no claim to strict diachronic identity or to instantiate `PersistenceAccount`.
- ChatGPT's insufficiency is for accepting it as strict persistence of eligible whole stages.

Both reach the same content: it is not that, and it is acceptable as generic infrastructure. I only have the audit outputs, not their prompts, so this is inferred from their texts.

**Established (verified).**

- The closure mathematics.
- Fork, fusion and zigzag identifications. In a fork, `identityRel` relates the siblings while neither survives into the other.
- The `Survival.lean` L21 docstring error. "Its symmetric closure is the identity relation" is false at a fork.
- Invariance of both relations under relabelling `ign`, `brk` and inapplicable. I ran 3,000 random models and found 0 mismatches. This follows from `identityRel_eq_of_prs_iff`.
- `persist` is read only by `WellFormed` and the lifts, and every test sets it to `False`.
- The `surfaces.toml` defect: 7 surfaces parse, `lean-public-surface` is absent, and its keys attach to the `authority_manifest_surface` role.
- `lakefile.lean` is named where the repository has `lakefile.toml`. The manifest, Lake pin and lock agree on v0.5.1 → `350c7ff`.

**Depends on theoretical interpretation.** Whether fission and fusion are defects, what `brk` and `ign` assert, what `persist` is, the bearer, and whether labels owe anything to Transformation's laws.

**Retainable as generic infrastructure?** Yes. The repository already declares this stance: relations are "defined independently of identity regimes" and connection to Transformation or an identity criterion "would require explicit choices… plus proofs". Persistence 0.1.1 already removed an unsupported admissibility qualifier from the manifest.

**What blocks acceptance of the intended baseline.** It depends on what the baseline claims. As generic infrastructure, the blockers are wording and authority repairs plus one decision (whether `brk` is meant to separate). As substantive strict persistence, it cannot be accepted. That would need bearer, eligibility, settings and admissibility data that exist nowhere in the audited surface.

---

## B. Reconciliation Matrix

Classes: **M** math, **S** semantic adequacy, **G** governance, **D** documentation. "Sev." compares the audits' labels and is not treated as disagreement where the conclusions match.

| ID (Claude / ChatGPT)             | Finding                                                                        | Claude                                                                  | ChatGPT                                                   | Agree: evidence / interp. / sev.         | Disposition                                                                                                       |
| --------------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------------- | --------------------------------------------------------- | ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **F-01 / P-01**                   | No relation to `PersistenceAccount`; bearer of `identityRel` undefined         | MAJOR; bridge owed, owner unrecorded                                    | BLOCKING; adequacy contract needed for strict persistence | yes / yes / label only                   | **S**: absence VERIFIED. Defect status CONDITIONAL on claim scope → D1                                            |
| **F-02 / pressure case 1, Q-1**   | Equivalence closure merges fission siblings, fusion inputs and chain endpoints | MAJOR; depends on D2                                                    | Legitimate graph result; persistence meaning unsettled    | yes / yes / label only                   | **M** VERIFIED. **S** CONDITIONAL → D2                                                                            |
| **— / P-03**                      | Docstring says symmetric closure of survival is the identity relation          | not reported (Claude describes the undirected closure correctly)        | MINOR                                                     | unique to ChatGPT                        | **D** VERIFIED (`Survival.lean` L21). Straight correction                                                         |
| **F-03 / P-02**                   | `brk` has no separating force; coexists with `prs` on endpoints                | MAJOR; also `ign`≡`brk` operationally, `Applicable` unrelated to `step` | MAJOR; concrete two-transformation example                | yes / yes / yes                          | **M** VERIFIED. **S** CONDITIONAL → D3                                                                            |
| **F-03 (scope part) / —**         | Manifest L52/L61 and CITATION abstract exceed what is proved                   | MAJOR                                                                   | not raised                                                | unique to Claude                         | **D**: mild. `Breakage.lean` L19–22 already states breakage is not the negation of survival                       |
| **F-04 / §E**                     | Taxonomy-only Transformation dependency; labels unconstrained by effect laws   | MAJOR; labels can contradict proved theorems undetected                 | No upstream defect; consistent with declared interface    | evidence yes / **interp. differs** / n/a | **DISPUTED** → resolved as different abstraction levels plus terminology (D4)                                     |
| **P-1 / —**                       | No independent normative theory statement                                      | MAJOR (process)                                                         | states hierarchy, raises no concern                       | unique to Claude                         | Facts VERIFIED; the "major concern" framing is not adopted (D5)                                                   |
| **P-2 / P-05**                    | `surfaces.toml` malformed                                                      | MAJOR                                                                   | MINOR                                                     | yes / yes / label only                   | **G** VERIFIED                                                                                                    |
| **— / P-05 (second part)**        | Build surface names `lakefile.lean`                                            | not reported                                                            | reported                                                  | unique to ChatGPT                        | **G** VERIFIED (`surfaces.toml` L73 vs `lakefile.toml`)                                                           |
| **P-3 / P-04**                    | No `.protocols/research.md`                                                    | MINOR                                                                   | MINOR                                                     | yes / yes / yes                          | **G** VERIFIED at audited commit. **Resolved at HEAD** in both repos                                              |
| **F-06 / Q-3**                    | `persist` undefined, unused                                                    | MINOR                                                                   | open question                                             | yes / yes                                | **UNRESOLVED**, needs source paper (R-1)                                                                          |
| **F-03 part / Q-2**               | What `ign`, inapplicable and unclassified assert                               | in F-03                                                                 | open question                                             | yes / yes                                | **UNRESOLVED**, needs paper wording (R-2)                                                                         |
| **F-09 / formalization fidelity** | All-invariants theorem is generic (witness is `Generated r x ·`)               | MINOR                                                                   | explicit caveat                                           | yes / yes                                | **D**: verified. The Lean docstring already says no identity basis is supplied                                    |
| **F-10 / —**                      | Core types fixed at `Type`                                                     | MINOR                                                                   | not raised                                                | unique to Claude                         | VERIFIED. **Deferred** until a bridge demands it                                                                  |
| **F-05 / Q-5**                    | One state-independent label per operator; lifts force uniformity               | MAJOR (plausible)                                                       | lifts are adapters; uniformity unjustified                | yes / compatible / differs               | **Optional / deferred downstream** (D3)                                                                           |
| **F-07 / pressure case 3**        | Reflexivity everywhere, no eligibility                                         | MINOR (plausible)                                                       | pressure case                                             | yes / yes                                | **Already addressed by layering**; a bridge conjoins eligibility (D1)                                             |
| **F-08 / §E**                     | Vocabulary overlaps NS accounts                                                | MINOR                                                                   | no collapse; substitution risk                            | yes / yes                                | **D**: no formal collapse. Qualifier wording                                                                      |
| **— / Q-4, Claude "Deferred"**    | Carrier-sensitive non-collapse                                                 | deferred                                                                | scope limitation                                          | yes / yes                                | **Already adequately addressed**: stated in `NonCollapse.lean` and Persistence CHANGELOG `[Unreleased]`           |
| **— / Q-1**                       | Alternative vs actual histories                                                | not raised                                                              | open question                                             | unique to ChatGPT                        | Resolved in D2: `step` relates possible results                                                                   |
| **CE-A…D / pressure table**       | Fork, fusion, brk-inside-identity                                              | reproduced                                                              | reproduced                                                | yes                                      | Reproduced by me. Per principle 7 these show the model permits an interpretation, not that a proved theorem fails |
| **Dispositions**                  | ACCEPT WITH NARROWING / INSUFFICIENT BASIS                                     |                                                                         |                                                           | candidate-relative                       | Not a substantive conflict (see A)                                                                                |

Claude's side note that NS's registry says Transformation consumes foundational concepts while Transformation's manifest has `required = []` is literally true. It belongs to a Transformation review, not this one.

---

## C. Theoretical Decision Register

None of these is accepted. Each is a recommendation.

### D1. Bearer and relationship to Neutral Substrate

**Question.** What do Persistence's relations relate, and who must establish compatibility with `PersistenceAccount`?

**Evidence.**

- `PersistenceAccount` (NS `Persistence.lean` L11–32, L57–93):
  - It models strict diachronic identity of eligible whole stages across settings.
  - It is explicitly not identified with transformation.
  - It imposes no equivalence laws and no stage-to-referent membership.
- The Paper 100 definition, per NS's own audit entry: "when a referent remains the same across change or time", with no stated equivalence-relation requirement.
- NS manifest and docs place substantive persistence theory and identity-regime classification outside NS. The NS registry forbids NS → Persistence dependency.
- Persistence's own docstrings (`Classification.lean`, `SE/Persistence.lean`):
  - A regime profile is classification + carrier + identity basis, and belongs downstream.
  - `C` in `Dynamics` is unconstrained.
- Transformation states are whole configurations (`Model.lean` L11–17).

**Competing interpretations.**

1. `C` is NS `Stage` and the relation is `persists`.
2. `C` is Transformation configurations, with a referent-selection map.
3. `C` is opaque, the relations are generators, and a downstream regime fixes the bearer.
4. Persistence imports NS and instantiates `PersistenceAccount` itself.

**Pressure.**

- A configuration-level step cannot say which referent persists through SP, MG, BR or CP, and NS supplies no membership relation to say it.
- Formal compatibility is nearly trivial, because NS imposes no laws. By my own reasoning from the structure definition (not Lean-checked), `persists s₁ s₂ x y := eligible s₁ x ∧ eligible s₂ y ∧ identityRel x y` instantiates it. So NS does not obstruct, and the open question is adequacy, not type-checking.
- Universe: `Stage : Type u` against Persistence's `C : Type` matters only if a bridge is built for non-small carriers.

**Recommended decision.** Interpretation 3. The relations are generators over a supplied carrier, and neither is itself `persists`. The bridge (bearer, settings, eligibility, instantiation) belongs to the Identity Regimes layer. Persistence needs no NS dependency. The obligation is to establish compatibility, not to introduce a Lean dependency.

**Justification.**

- It matches both repositories' declared scope and the dependency direction.
- NS's non-identification of persistence with transformation means Persistence cannot be `persists` directly, only a criterion's generator of it.
- It is the minimal commitment (principle 3).

**Consequences.**

- No definition changes.
- Persistence records, in one place, that its relations are not `persists` and that the bridge is owned downstream. This closes Claude's "owed but unrecorded" point.
- F-07: eligibility is restored by the bridge's conjunction.
- F-10: deferred.

**Responsible theory.** Identity Regimes for the bridge; Persistence for the boundary statement. I did not examine `se-theory-identity-regimes`, which is only named in NS's registry.

**Status:** RECOMMENDED. The designated owner's existence and scope need your confirmation.

### D2. Meaning of `identityRel` and `Survives`

**Question.** What does each relation establish, and do fission and fusion expose a defect?

**Evidence.**

- `Dynamics.step t x y` means "`y` is _a_ result of applying `t` to `x`" (`Generated.lean` L38 onward). It is a relation of possible results, not a record of an actual history.
- `Survives` is reflexive-transitive reachability of preserving steps (`Survival.lean`).
- `identityRel` is the least equivalence containing them (`Generated.le_of_equivalence`).
- `invariant_iff_respects_identityRel` holds because invariants, being biconditionals, cannot see direction.
- The `ClassificationValue` docstring says classification is "relative to one criterion of identity".

**Competing interpretations.**

- (a) `identityRel` is strict identity, which needs admissibility such as functional or linear steps.
- (b) It is identity-connectedness, which calls for a rename.
- (c) Directed `Survives` is primary.
- (d) It is the least same-identity equivalence implied by a criterion's preserving declarations, assuming sameness is an equivalence, with the criterion's adequacy a separate condition.

**Pressure.** Reproduced: fork (a→b, a→c) gives `identityRel b c` with no survival either way. Fusion (x→w, y→w) identifies x and y. A zigzag identifies chain endpoints that do not survive into each other.

**Recommended decision.**

- Retain both relations unchanged, read as follows:
  - `Survives` is existence of a finite preserving chain. It is existential over possible histories and assumption-free.
  - `identityRel` is the equivalence generated by those steps. It carries the assumption that sameness is an equivalence, and it equals strict identity only for criteria whose preserving declarations are admissible.
- Against your prompt's four options, the fission and fusion cases expose:
  - **(2)** a correct result of the construction, since no smaller equivalence exists;
  - **(3)** a need for an admissibility condition, which requires distinctness data the generic layer lacks, so it is downstream;
  - **(4)** a risk of an overly strong reading of the name and docs.
- They do not expose **(1)** a defect, because no stricter intended meaning is stated.
- Equivalence closure is neither necessary nor inappropriate in itself. It is exactly what the assumption "sameness is an equivalence" implies, and it is the invariance kernel regardless of interpretation.

**Consequences.**

- Correct the `Survival.lean` L21 sentence.
- Qualify the docs.
- Do not add functionality or linearity constraints.
- Do not make `Survives` primary.

**Responsible theory.** Persistence for wording. Identity Regimes for admissibility.

**Status:** RECOMMENDED. Whether `identityRel` should be renamed is a sub-decision for you. I recommend qualifying it, not renaming.

### D3. Classification and breakage semantics

**Question.** What do `prs`, `brk`, `ign`, N/A, `persist`, `WellFormed` and `stepBrk` assert, and is a coherence obligation owed?

**Evidence (verified).**

- Both relations depend only on `IsPrs`, and `coarse` collapses `ign` with N/A.
- `IsBrk` is read only by `stepBrk`, the free-dynamics theorem, and `stepBrk_not_separating` (a one-state self-loop witness).
- `Applicable` is unrelated to `step`.
- `persist` is read only by `WellFormed` (`persist ⊆ IsPrs`) and the lifts.
- `Breakage.lean` already says breakage is not the negation of survival.

**Layers, per your prompt.**

| Layer                      | Where it lives today                                         |
| -------------------------- | ------------------------------------------------------------ |
| Operator classification    | `pattern` (`T` is abstract, so applications are expressible) |
| Actual transition property | `stepRel`, `stepBrk` (a step of a labelled operator)         |
| Endpoint identity judgment | `identityRel` (a lower bound only)                           |
| History-relative judgment  | not represented                                              |

So `¬ identityRel x y` means "not established same", not "distinct".

**A derived result (my own, not in either audit; proposed, not recovered).**

- Define `Coherent c d := ∀ x y, stepBrk x y → ¬ identityRel x y`.
- Then `Coherent` holds iff some equivalence `P` contains all preserving steps and excludes all breaking steps.
- Forward: `identityRel ⊆ P`, because it is the least such equivalence. Reverse: take `P := identityRel`.
- Checked by exhaustive partition enumeration on 1,500 random models with 0 mismatches. This is the scratch restatement, not Lean.
- This is the endpoint reading of "breaks" relative to a criterion. Both CE-C/D and ChatGPT's two-transformation example violate it.

**Competing interpretations.**

- (i) `brk` is an informational operator label, with scope claims narrowed.
- (ii) `brk` is a separation claim, with `Coherent` as an adequacy obligation.
- (iii) `brk` means `¬ Survives`. I do not recommend this: it would be a new decision and contradicts `Breakage.lean`.

**Recommended decision.**

- Treat breakage as informational by default. Name `Coherent` as the available obligation, and add it only if you confirm separation intent.
- Leave `persist`, `ign` and N/A semantics untouched until their source is consulted. Removing `persist` would change the public surface and the lift theorems.
- Keep `WellFormed` as is.

**Consequences.**

- If informational, only wording changes.
- If separating, one definition, one lemma and tests are added.

**Responsible theory.** Persistence.

**Status:** RECOMMENDED for breakage. REQUIRES ADDITIONAL EVIDENCE for `persist` and `ign`, whose meaning lives in the papers (SE-200 / "the papers", cited only in a `ClassificationValue` docstring), which I do not have.

### D4. Relationship to Transformation semantics

**Question.** Does the taxonomy-only dependency leave a necessary obligation that labels respect Transformation's preservation and breakage laws?

**Evidence (`Model.lean` L87–110, `Dimension.lean`).**

- `step_preserves` requires a _supplied_ relation `P` that agreement on dimensions `D` suffices for, with `D` avoiding the operator's footprint. Then every step satisfies `P`.
- `step_breaks` requires a required-change clause `C` where `P` demands agreement on every dimension of `C`. Then every step falsifies `P`.
- Neither theorem designates identity, and only the sufficient directions follow from the laws.
- Persistence imports only the taxonomy (`Lift.lean`), and its docs disclaim compatibility.
- Spot checks: AT's footprint is `[evidence]`; CL's clause is `[composition, arrangement]`; SP's requirement is `[[composition]]`.

**Resolution of the disagreement.** Both reviewers' facts hold. The difference is **different abstraction levels plus terminological ambiguity**, with an **optional compatibility contract** available. It is not a genuine inconsistency, and not a necessary missing obligation.

- Claude's "no-rejection" cases (AT ↦ `brk`, CL ↦ `prs`) are contradictions only relative to a chosen model and criterion `P`. AT ↦ `brk` is consistent with any `P` that requires agreement on evidence.
- "Breaks" means two things. Upstream, an operator breaks a supplied `P` when every step falsifies `P`. In Persistence, it is an operator label.
- The contract exists generically: for a criterion `P` and dynamics, `IsPrs t → ∀ steps of t, P` and `IsBrk t → ∀ steps of t, ¬P`. For equivalence `P`, soundness implies `Coherent` from D3.

**Splitting, merging, branching and copying.** I do not assume uniform classification. `T` is abstract, and the lifts are adapters whose input is the coarser classification.

**`[Unreleased]` dependencies.** Persistence's closures use single steps only. Transformation's planned sequence-level net-change and composition-coherence work is not consumed, and Persistence's CHANGELOG lists that interaction as planned. Persistence therefore depends on no unestablished result.

**Recommended decision.**

- No Transformation change.
- Persistence stays taxonomy-only.
- Qualify "breaks" in the docs.
- Record criterion-soundness as an optional regime-level contract.

**Responsible theory.** Persistence for wording; Identity Regimes for any contract; Transformation none.

**Status:** RECOMMENDED.

### D5. Normative theory authority

**Question.** Is the missing independent theory statement a defect, and how should accepted theory be recorded and tied to Lean?

**Evidence.**

- The same authority declaration appears in the NS, Transformation and Persistence READMEs: Lean is authoritative, and docs and registries must not introduce semantics absent from Lean.
- NS additionally has an external normative source in Paper 100, whose identifiers are `se100.*`.
- The protocols' README says they govern process and do not define semantics.
  - `theory-construction` §9 records a converged definition.
  - `theory-acceptance` takes "proposed canonical wording" as an input.
  - Gate G requires human inspection of the canonical wording.
  - The post-acceptance stages list canonical prose before Lean formalization, with no prescribed location.
- `surfaces.toml` requires `theory_review` for the Lean surface, but P-2 shows that requirement is currently attached to the authority-manifest surface instead.

**Competing interpretations.**

- (i) A new standing normative document.
- (ii) Accepted wording lives in the Lean docstrings and reference descriptions, with the acceptance packet as a research record.
- (iii) An external paper is normative, as for NS.

**Recommended decision.**

- Claude's observation is accurate. There is no theory text outside Lean, so fidelity cannot be checked against an independent statement.
- The conclusion that this is a major process defect is not supported. The protocols do not require a standing statement, and the declared hierarchy is consistent across the lineage.
- Recommend (ii). No new document: it would duplicate Lean and violate single-source-of-truth.
- The real gaps are:
  1. The acceptance-record location is unspecified by the protocols.
  2. The docstrings for `identityRel`, `ign` and `persist` lack or misstate their meaning.
  3. The `theory_review` gate is not attached to the Lean files until P-2 is repaired.
- Correspondence is checked by Gate G human review of docstring against accepted wording, the repaired `theory_review` gate, and the existing reference-kit validators.
- A new artifact is justified only if a normative statement cannot be expressed in Lean docstrings. That is not demonstrated.

**Responsible theory.** Persistence for docstrings and surfaces. The protocols repository only if you want it to say where acceptance records live, which I do not recommend now.

**Status:** RECOMMENDED. Where acceptance packets are filed is a researcher decision.

---

## Interpretation Evaluation (Part 4)

|                            | A. Generic infrastructure                                          | B. Substantive persistence                                 | C. Layered (named obligations, downstream satisfaction) |
| -------------------------- | ------------------------------------------------------------------ | ---------------------------------------------------------- | ------------------------------------------------------- |
| Repository scope           | Matches declared scope                                             | Contradicts declared exclusions                            | Matches, if obligations stay predicates                 |
| Accepted upstream          | Consistent with NS (no laws, persistence ≠ transformation)         | Would need bearer, eligibility and settings NS leaves open | Consistent                                              |
| Counterexamples            | Fork and fusion are correct outputs, with admissibility downstream | Fork and fusion are unresolved without added constraints   | Obligations name what to check                          |
| Dependency direction       | No new dependencies                                                | Needs NS and regime data upward                            | No new dependencies                                     |
| Assumptions and minimality | Smallest                                                           | Largest                                                    | One or two predicates                                   |
| Defensibility              | High, with accurate wording                                        | Not currently defensible                                   | High                                                    |

My recommendation is **A with accurate wording**. The obligations from C (`Coherent`, criterion-soundness) are an optional addition. They are required only if you decide `brk` is meant to separate. B is rejected on current evidence.

Other interpretations I considered and rejected:

- Making `Survives` primary: no evidence of need, and the invariance theory is built on the closure.
- Deriving `prs`/`brk` from a `StateModel` inside Persistence: this enlarges the theory without demonstrated necessity.

---

## D. Minimal Correction Set

This applies only if the recommendations are accepted.

**Semantic changes.** None for A. Conditional on separation intent in D3: add the `Coherent` definition.

**Lean formalization changes (docstrings unless stated).**

- Correct `Survival.lean` L21.
- Qualify the `identityRel` docstring.
- State that `persist` and `ign` currently have no relation-level semantics.
- Conditional: `Coherent` plus its equivalence lemma and witnesses.
- Optional, deferred: generalize the universe.

**Research and authority declarations.**

- Repair `surfaces.toml`: add the missing `[[surface]]` header for `lean-public-surface`, and change `lakefile.lean` to `lakefile.toml`.
- `.protocols/research.md` is already added at HEAD in both repos.
- Decide where acceptance packets live.

**Documentation and terminology.**

- Qualify "identity breakage relations" and "identity survival" in the manifest scope, CITATION abstract and README as generated from a supplied classification.
- State in one place that the relations are not `persists` and that the bridge is owned downstream.
- Distinguish "breaks" in Persistence from "breaks" in Transformation.
- Describe the invariants theorem as a generic closure result.

**Regression tests and verification.**

- Add Lean witnesses for fork, fusion and zigzag as non-collapse cases. I found no theorem named for them in the files I read.
- After changes, run `lake build`, `lake test`, `lake lint` and the reference-kit validators as regression only.
- Schema-validate `surfaces.toml`.

**Would unnecessarily enlarge the theory:**

- A direct NS dependency, or instantiating `PersistenceAccount` in Persistence.
- Deriving classifications from `StateModel`.
- State-indexed or referent-indexed classification redesign.
- Functionality or linearity admissibility on steps.
- Renaming or removing `persist` before its source is read.
- A standing normative theory document.
- Candidate 25, or any Neutral Substrate or Transformation change.
- Universe generalization now.

---

## E. Remaining Research Obligations

| #   | Unknown                                                | Why unsettled                                                                               | Owner                                    | Sufficient resolution                        | Blocks baseline?                                            |
| --- | ------------------------------------------------------ | ------------------------------------------------------------------------------------------- | ---------------------------------------- | -------------------------------------------- | ----------------------------------------------------------- |
| R-1 | Meaning of `persist`                                   | No source text in the audited repos                                                         | Persistence, from the paper source       | One accepted sentence, or a removal decision | Only acceptance of `persist` as theory-bearing              |
| R-2 | `ign` versus N/A semantics                             | Docstring names but does not define                                                         | Persistence, from the paper source       | Accepted wording                             | Only the wording                                            |
| R-3 | Is `brk` meant to separate?                            | Docstring says "identity-breaking", while `Breakage.lean` says not the negation of survival | Persistence / you                        | A yes/no decision                            | Blocks the breakage scope wording, not the generic baseline |
| R-4 | Bearer, settings, eligibility, stage-membership bridge | Absent from every audited surface                                                           | Identity Regimes                         | A bridge with adequacy argument              | Blocks any claim of NS instantiation only                   |
| R-5 | Admissibility for fission, fusion and copy             | Needs distinctness data and history semantics                                               | Identity Regimes (with NS individuation) | Admissibility condition on a regime          | No                                                          |
| R-6 | Does Identity Regimes exist as the designated owner?   | Not among the audited repos                                                                 | You                                      | Confirmation                                 | No                                                          |

An optional criterion-soundness contract against `(StateModel, P)` is deferred to the Identity Regimes layer and blocks nothing.

---

## F. Acceptance Readiness

**READY SUBJECT TO SPECIFIED DECISIONS**, for the generic-infrastructure candidate (A). The decisions are:

- Confirm candidate A.
- Settle R-3.
- Decide the wording of `identityRel` (D2).
- Choose where acceptance records live (D5).
- Make the governance repairs.

Against the `theory-acceptance` gates:

- **Gate A (semantic precision):** OPEN today for `identityRel`, `ign` and `persist` wording.
- **Gate B (counterexamples):** no unresolved counterexample to a formal claim.
- **Gate C (source compatibility):** the existing interfaces are weaker than a substantive persistence account, and that has to be stated rather than called a recovery.
- **Gate D (independence):** two independent audits exist, and both state they did not cross-read. Whether they count as independent evidence is your call.
- **Gate E (boundary integrity):** I found no definition equating `identityRel` with same-unit or co-reference. Both audits agree.
- **Gate F:** the deferred ledger is R-1 through R-6.
- **Gate G:** your review.

As substantive strict persistence (B), the answer is not ready.

---

## G. Recommended Next Action

Answer one question: is `brk` meant to assert separation, meaning the endpoints of a breaking step are not the same identity under the criterion, or only to label the operator? Every remaining wording correction branches on it. If informational, what remains is documentation, governance repair and Lean regression witnesses. If separating, one definition (`Coherent`) is added first. No implementation is justified before that answer.

---

**Repo / path / file updates:** none to any repository. Scratch clones are in `/tmp/recon`, and the one scratch script is `/tmp/claude-0/-home-claude/890e3200-283b-5a33-896f-358b88078854/scratchpad/recon_check.py` (new, outside every repo).

**Sources:**

- [se-theory-persistence @ 8197490](https://github.com/structural-explainability/se-theory-persistence/tree/819749091a538e5b69450a24b7bc121be8331b2c)
- [se-theory-neutral-substrate @ e823a41](https://github.com/structural-explainability/se-theory-neutral-substrate/tree/e823a41ba354d81fd8d6d69a8ddaa7f9366c7259)
- [se-theory-transformation @ 350c7ff](https://github.com/structural-explainability/se-theory-transformation/tree/350c7ff01aa7bf9a7119f0a44ce652d7a6933154)
- [se-protocols-research @ e448eb7](https://github.com/structural-explainability/se-protocols-research/tree/e448eb7ff12800fa78be783260d61adaa9bb6c7b)
