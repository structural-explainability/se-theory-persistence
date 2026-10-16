Neutral Substrate's output was large and got saved to a file. Reading it in full, since its accepted semantics are the upstream baseline.

Now the Neutral Substrate referential-regime interfaces, which are the accepted upstream statement of the individuation / co-reference / persistence split.

Neutral Substrate's `PersistenceAccount` is a stage/setting interface ("strict diachronic identity", explicitly not transformation, continuity, or succession). Now the full Persistence Lean source.

Checking how the `persist` field and `WellFormed` are actually used, and reading the tests, docs and reference artifacts.

Transformation already has relation-parametric "preserves P" / "breaks P" notions (`step_preserves`, `step_breaks`). That bears directly on Persistence's `prs`/`brk`, so reading that model in full.

Confirming what the identity-critical Transformation operators actually mean (SP, MG, BR, CP, RV, VS, PR) so the cross-theory points rest on the source's own descriptions.

Counterexamples reproduce under a scratch restatement (not a Lean check). Collecting exact line numbers for the cited locations before writing the report.

# Independent Theory Audit: Persistence

**Result:** Persistence v0.2.0 is coherent subject to specific corrections. Two of those corrections (F-01, F-02) are theory decisions that could reshape the Lean core types, so I would not declare a baseline before they are made. No contradiction was found, and nothing in the formal surface collapses individuation, co-reference and persistence.

**Provenance and protocol sources** (per `independent-review` §6)

- **Protocols:** `se-protocols-research` @ `e448eb7` (v0.1.0, 2026-10-08).
  - Read: `source-audit`, `independent-review`, `theory-construction`, README, `reference/upstream.toml`.
  - Not read: `theory-acceptance`, `referee-sim`. Neither applies to an audit-only task.
- **Candidate:** `se-theory-persistence` @ `819749091a53` (v0.2.0).
- **Upstream:**
  - `se-theory-neutral-substrate` @ `e823a41`, untagged HEAD. Its CHANGELOG says 0.11.0.
  - `se-theory-transformation` @ `350c7ff` (v0.5.1), which matches Persistence's Lake pin.
- **Reviewer:** Claude Sonnet 5.5, 2026-10-16. No prior reviews were visible. The NS C10–C24 review records were not supplied; I saw only what is inside the repos.
- **`.protocols/research.md`:** absent in Persistence. It is also absent in Transformation and present in NS. I reported it and did not create it (see P-3).
- **Limitations:**
  - Clones are shallow (depth 1), so history was not examined.
  - No Lean toolchain is installed here. Nothing was built or run, and no proof was mechanically re-checked.
  - Counterexamples were derived by hand from the definitions and cross-checked with a scratch Python restatement. That is not a Lean check.
  - `se-protocols-research/.accountability/surfaces.toml` is empty (observation only).

---

## A. Executive Assessment

**Coherent subject to specific corrections.**

- **What holds:**
  - The formal layer is small, well-defined and non-circular.
  - There is no `sorry`, `axiom`, `native_decide` or `opaque` in `SE/` or `SETest/`.
  - Every theorem I read is a generic fact about reachability and equivalence closure of a step relation filtered by a label.
  - I did not treat compilation, tests or docs as evidence of semantic validity.
- **What is not established:** four things the headline claims rest on.
  - What the relations are about (F-01).
  - Whether equivalence closure is an acceptable persistence structure (F-02).
  - Whether breakage has content (F-03).
  - Whether the Transformation dependency carries any obligation (F-04).
- **Individuation / co-reference / persistence:** no formal collapse was found. Persistence defines neither individuation nor co-reference, and nothing equates `identityRel` with `sameUnit` or `coReference`. The risk is vocabulary (F-08), not definitions.

**Disposition** (`independent-review` §5), for the candidate "Persistence v0.2.0 is the lineage's persistence theory (identity survival, breakage, invariance, equivalence under transformation)": **ACCEPT WITH NARROWING.** The smallest exact narrowing is this. Persistence is a generic closure theory over a supplied labelling of transformations. Identity is the least equivalence containing the preserving steps. It makes no claim to be strict diachronic identity, to give breakage separating force, or to instantiate NS's `PersistenceAccount`.

---

## B. Theory Inventory

| Category                                  | Items                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Owned by Persistence**                  | `ClassificationValue {ign, prs, brk}`; `Classification {pattern : T → Option _, persist : T → Prop}`; `Applicable`, `IsPrs`, `IsBrk`, `WellFormed`, `coarse`; `Dynamics` (`step : T → C → C → Prop`); `freeDynamics`; generic `Reach` and `Generated`; `stepRel`, `Survives` (directed), `identityRel` (~\_P), `stepBrk`; `Invariant`, `relationInvariants`, `observationalEquivalence`; `NonCollapsing`; `liftFamily`, `liftKind`. `Registry`, `Conformance` and `Spec` are bookkeeping. |
| **Claims proved**                         | `identityRel` is an equivalence; survival ⊆ identity; invariance ⇔ respecting ~\_P; ~\_P ⇔ agreement on all step invariants; equal `prs` sets ⇒ equal relations (converse only on free dynamics); survival ≠ identity; a `brk` step can lie inside ~\_P.                                                                                                                                                                                                                                  |
| **Imported formally**                     | From Transformation only `OperatorCode`, `TransformationFamily`, `TransformationKind`, `operatorFamily`, `operatorKind` (`Reference/Lift.lean`). Nothing from NS.                                                                                                                                                                                                                                                                                                                         |
| **Related upstream, not formally linked** | NS `PersistenceAccount` (stage/setting, `eligibleStage`, strict `persists`). Transformation `StateModel`, frame/change laws, and "preserves/breaks P".                                                                                                                                                                                                                                                                                                                                    |
| **Declared downstream**                   | Identity regimes and regime profiles (classification + carrier + identity basis), admissibility, domain survival criteria.                                                                                                                                                                                                                                                                                                                                                                |

**Source-audit outcomes** (`source-audit` §6)

| Contract                                      | Outcome                                                                            |
| --------------------------------------------- | ---------------------------------------------------------------------------------- |
| Relation to NS `PersistenceAccount`           | NOT FOUND (search scope: all Lean, TOML, MD and CFF in the repo)                   |
| Identity bearer / carrier semantics           | UNDER-SPECIFIED (deliberate: `Classification.lean` docstring, docs "Dependencies") |
| Separating force of breakage                  | PARTIAL (label plus free-dynamics theorem only)                                    |
| Compatibility with Transformation state model | NOT FOUND (docs state it is not asserted)                                          |
| Handling of fission / fusion / strictness     | NOT FOUND                                                                          |
| Eligibility (NS `eligibleStage`)              | NOT FOUND                                                                          |
| Normative theory text independent of Lean     | NOT FOUND (by declared design, see P-1)                                            |

---

## C. Findings

Each finding gives location, evidence, issue, consequence, and a correction or question. The finding identifier and severity are in the header.

### Verified

**F-01 · MAJOR · Persistence has no stated relation to NS's persistence interface, and what `identityRel` relates is undefined**

- **Location:**
  - `SE_MANIFEST.toml` L36–38 (`[depends].required` lists only Transformation).
  - `SE/Persistence/Core.lean` L25–27.
  - `Relation/Generated.lean` L38–40 (`Dynamics (T C : Type)`).
  - NS `SE/Substrate/ReferentialRegime/Persistence.lean` L11–12, L57–93.
- **Evidence:**
  - A repo-wide search for NS terms in Persistence returns three hits, none semantic: the disclaimer at `Invariance.lean` L30, the manifest exclusion at L71, and the docs exclusion at L92.
  - NS defines `PersistenceAccount` per referent kind, with `Setting`, `Stage`, `eligibleStage`, and `persists : Setting → Setting → Stage → Stage → Prop` as "strict diachronic identity".
  - NS says substantive persistence theory is external (manifest `excludes`; CHANGELOG 0.11.0).
  - NS's `dependency-registry.toml` (`no_persistence_dependency`) calls persistence theory "downstream of the foundational substrate layer".
  - Persistence's relation lives on an unconstrained carrier `C`, with no settings, stages, referent kinds or eligibility.
- **Issue:** NS leaves a slot for substantive persistence theory, and Persistence is the only repo that could fill it. Neither names the other. Persistence does not say whether `identityRel` relates referents, stages or whole configurations, or how it would supply `persists`. Docs place "carrier and identity basis" downstream, so this may be intentional. If so, the owed bridge to NS is still not recorded as owed anywhere.
- **Consequence:** Ownership (Q1) cannot be closed. Persistence's "persistence" cannot be compared with NS's accepted semantics. A later bridge may need structure the core types lack, such as per-kind classification.
- **Correction / question:** Decide who owns the bridge to `PersistenceAccount` (Persistence, identity-regimes, or a bridge layer) and record it. Decide whether `C` is NS `Stage`, and whether `Setting` indexes anything.

**F-02 · MAJOR · `identityRel` collapses distinct results of preserving steps. Its status as a defect depends on decision D2.**

- **Location:** `Relation/Equivalence.lean` L35–37; `Relation/Generated.lean` L38–40 (`step` is a relation) and L76–80 (`symm`, `trans`, `refl`).
- **Evidence:** CE-A and CE-B in section D, checked by derivation and by scratch script. NS Persistence L29–32 imposes no equivalence-relation laws. The NS Referential Regime audit entry (`formalization/se100-lean-audit.md`, ≈L2690–2770) records that the paper does not state the components are equivalence relations or total.
- **Issue:** Identity is connectivity under the undirected closure of preserving steps. Three things become identical:
  - any two results of one preserving transformation (steps are relations, not functions);
  - any two predecessors of one state;
  - the endpoints of any chain of arbitrary length, because the label is state-independent and closure is transitive.

  The free-dynamics results hide this because each transformation gets one private pair of states. Directed `Survives` does not equate fission siblings, but `identityRel` carries the "identity" name and drives the invariance theorems.

- **Consequence:** If a regime classifies BR, SP, CP or MG as preserving, branches, copies and inputs are equated, and invariants must agree across them. If strict diachronic identity is intended, this is an unlicensed collapse. If "connected by identity-preserving change" is intended, the name and docs must say so.
- **Correction / question (D2):** Is ~\_P (a) strict identity, which would need a constraint such as functional or linear preserving steps or an admissibility predicate on (c, d)? Or (b) identity-connectedness, which should be renamed and documented, with NS strictness explicitly not instantiated? Or (c) directed only, which would make `Survives` primary?

**F-03 · MAJOR** · Breakage has no formal force, and the scope claims exceed what is proved

- **Location:**
  - `Relation/Breakage.lean` L33–35, L39–47.
  - `Relation/NonCollapse.lean` L110–116, and `Equivalence.lean` L62–68.
  - `Classification.lean` L56–57.
  - `SE_MANIFEST.toml` L25, L52, L61.
  - `CITATION.cff` abstract.
- **Evidence:**
  - `identityRel`, `Survives` and `Invariant` depend only on `IsPrs` (`identityRel_eq_of_prs_iff`). In 2,000 random scratch trials, swapping `brk`, `ign` and inapplicable (N/A) never changed either relation.
  - In production code `IsBrk` appears only in `stepBrk`, in `not_identityRel_of_stepBrk_free` (free dynamics only), and in `stepBrk_not_separating`.
  - That theorem's witness is a one-state self-loop. `SETest/Persistence/Breakage.lean` L26–33 presents this as intended.
  - `Applicable` is not related to `Dynamics.step`, so nothing prevents steps of an inapplicable transformation.
- **Issue:**
  - `prs` gives a lower bound on identity: the least equivalence containing the preserving steps.
  - `brk`, `ign` and N/A give no upper bound, so `¬identityRel x y` means "not established", not "distinct".
  - There is no coherence predicate saying that no `brk` step lies inside ~\_P, so contradictory (c, d) pairs are first-class models.
  - `stepBrk` is a label filter. "Identity breakage relations" is claimed but not delivered.
  - What `ign` asserts is undefined in the repo. It is operationally the same as `brk`.
- **Consequence:** Breakage claims have no content outside the synthetic free dynamics. Downstream, the choice between `ign` and `brk` changes no Persistence result.
- **Correction / question (D3):** Is breakage a separation constraint with a coherence predicate, or an informational label? If the latter, narrow the scope claims. What does `ign` assert?

**F-04 · MAJOR** · The Transformation dependency is taxonomic only, and Persistence's classifications are unconstrained by upstream effect laws

- **Location:** `SE_MANIFEST.toml` L36–38 (`kind = "semantic"`); `Reference/Lift.lean` L26–29, L39–49; `docs/en/index.md` L25–50; Transformation `Effect/Model.lean` L56–70, L87–110.
- **Evidence:**
  - The only Transformation import is the taxonomy maps.
  - The docs say state-model laws, footprints, required-change clauses, composition and orthogonality are not consumed, and that compatibility "is not asserted".
  - Upstream defines "step preserves P" as `P s t` for every step, and "step breaks P" as `¬P s t` for every step, derived from the frame and change laws.
- **Issue:**
  - **Nothing links the labels to the upstream laws.** A `Classification OperatorCode` is a free primitive. AT's footprint is `[evidence]`, so by `step_preserves` it preserves any relation sufficed by agreement on dimensions that avoid evidence. Persistence has no place to state such a relation, so it cannot reject AT ↦ `brk`. Likewise CL's required clause `[composition, arrangement]` makes every CL step break any relation requiring agreement on both (`step_breaks`), yet CL ↦ `prs` is accepted.
  - **The same word has two meanings.** Upstream "breaks P" constrains the endpoints (`¬P s t`). Persistence `brk` is a label that can coexist with identity (F-03).
- **Consequence:** The "semantic" dependency carries no obligation. Persistence labels can contradict proved Transformation theorems without detection. Downstream equivocation is likely.
- **Correction / question (D4):** Should `prs` and `brk` be derived relative to a (StateModel, relation P) via the upstream laws, or stay primitive with an explicit compatibility predicate? Either way, define the relationship and qualify the terms.

**P-1 · MAJOR (process)** · Declared authority makes the lineage's required order untestable\*\*

- **Location:** `README.md` L29–36; `docs/en/index.md` L101–116; `Spec.lean` L11–15; `ClassificationValue.lean` L31–32.
- **Evidence:**
  - Lean is the sole declared semantic authority, and docs "must not introduce formal semantics absent from Lean".
  - `PS.*` identifiers are generated from `RR.DEFINES` comments in Lean, not from any normative item. NS uses `se100.*` paper identifiers.
  - The only external reference is "IGN in the papers, and NEU in SE-200", which carries no stated authority status.
- **Issue:** "The accepted theory determines the Lean" cannot be tested, because Persistence has no theory statement outside Lean docstrings. Fidelity (Q4) reduces to comparing Lean with its own comments. The second reviewer faces the same limit.
- **Consequence:** Reconcile → Accept has nothing to anchor to.
- **Correction / question (D5):** Decide where the accepted Persistence theory statement lives and how its authority relates to Lean.

**P-2 · MAJOR (process) · `.accountability/surfaces.toml` is malformed, so the Lean theory surface is not declared**

- **Location:** `.accountability/surfaces.toml` L44–50. Headers appear at L26 and L70, but the `lean-public-surface` keys have none.
- **Evidence:** A Python `tomllib` parse gives 7 surfaces, and `lean-public-surface` is not among them. Its `id`, `object_kind`, `paths` and `description` attach as extra keys to the preceding `authority_manifest_surface` role. The roles `theory_surface`, `public_contract` and `validation_rule` (L52–68) become roles of `authority-manifest`. Transformation's file parses correctly.
- **Issue:** The files Persistence declares authoritative have no surface entry.
- **Consequence:** The theory-review requirement and the AI-authority limit are not attached to the Lean files as declared. I did not run a schema validator.
- **Correction:** A process fix after reconciliation, not made here.

**F-06 · MINOR · `persist` is undefined and untested**

- **Location:** `Classification.lean` L50, L69–72; `Lift.lean` L42–49; `SETest/Persistence/Basic.lean` L43, L51, L59, L67; `SETest/Persistence/Lift.lean` L30.
- **Evidence:** Nothing uses `persist` except `WellFormed` (`persist ⊆ IsPrs`) and its lift. Every test sets `persist _ := False`.
- **Issue:** "Declared persistence set" has no semantics. A preserving transformation outside the persistence set has no stated meaning. `WellFormed` is one-directional.
- **Consequence:** A public structure carries an unconstrained field that could hide a defect.
- **Correction / question:** Define it, derive it from `pattern`, or remove it.

**F-09 · MINOR** · The invariants characterization is generic, and its framing risks overclaiming

- **Location:** `Relation/Invariance.lean` L83–98 (witness at L94–96), L152–157; CHANGELOG 0.2.0.
- **Evidence:** The witness predicate `fun z => Generated r x z` is itself an invariant, and the theorem holds for any relation.
- **Issue:** "Identity iff all invariants agree" cannot be read as invariants grounding identity. The meaningful content is only for a restricted observable family Φ (`observational_completeness_iff_invariant_saturation`, L116–129), whose choice is deferred.
- **Correction:** Describe it as a generic closure result.

**F-10 · MINOR · All core types are fixed at `Type`**

- **Evidence:** `Classification (T : Type)`, `Dynamics (T C : Type)`, `Reach`, `Generated`. NS carriers are `Type u`.
- **Issue:** Instantiating with NS carriers at higher universes is impossible. This is an implementation convenience, not a theory claim.

**P-3 · MINOR (process) · No `.protocols/research.md`**

- It is absent in Persistence and in Transformation, and present in NS. Neither the manifest nor the README references `se-protocols-research`. Reported only.

### Plausible concerns

**F-05 · MAJOR (plausible; needs a decision)** · One label per operator, with no state or referent argument, against identity-critical operators

- **Location:** `Classification.lean` L46–50; `Reference/Lift.lean` L22–23; Transformation `Semantics.lean` (`operatorFamily`, `familyKind`) and `reference/transformation-operators.toml`.
- **Evidence:**
  - `pattern : T → …` takes the label only.
  - Transformation operators act on "a referent" with multiple inputs or outputs:
    - SP divides a referent into components.
    - MG combines referents into one.
    - BR creates a divergent continuation.
    - CP makes a faithful duplicate.
  - A Transformation state is a whole configuration (`Model.lean` L13–17).
  - Lifts force family-wide and kind-wide uniformity.
    - Kind `temporal` is {BR, RV, VS}; kind `observational` is {AT, PR, CP}.
    - Family `versioning` groups RV (footprint = all dimensions) with VS (lineage and populations). `SETest/Persistence/Lift.lean` L32–34 marks both preserving.
- **Issue:** One label cannot say which referent persists through SP, MG, BR or CP, nor distinguish states where an operator is identity-neutral from states where it is not. Whether this matters depends on D1. `T` is an arbitrary type, so state-indexed labels are expressible, but nothing says so and the lifts do not do it.
- **Consequence:** The shipped lifts cannot treat fission, fusion or copy in a non-trivial way.
- **Question:** What is the argument structure of a persistence judgment about an operator application?

**F-07 · MINOR (plausible)** · Reflexivity everywhere, with no eligibility

- `Reach.refl` and `Generated.refl` make every element of `C` identity-related to itself. NS separates `eligibleStage` from a positive persistence judgment and imposes no laws (Persistence.lean L74–79). Persistence has no eligibility notion, so ceasing to be an eligible stage is expressible only by choosing `C`. Resolve together with D1.

**F-08 · MINOR** · Vocabulary overlaps NS's separate accounts

- `identityRel`, "criterion of identity" and "identity-preserving" are unqualified (`Classification.lean` L28–29). NS keeps `sameUnit` ("dyadic identity judgment") and strict diachronic persistence as separate interfaces. No Persistence declaration defines or equates `sameUnit` or `coReference`. The unqualified wording leaves open which account is meant.
- "Non-collapse" in Persistence means distinct classifications give distinct generated relations (`NonCollapse.lean` L45–49). That differs from the cross-theory distinctness concern, and with F-03 it shows `ign`, `brk` and N/A collapse.

---

## D. Counterexamples and Open Questions

**Counterexamples.** All were checked by hand against `stepRel` and `Generated`, and by the scratch script. None was checked in Lean.

- **CE-A (fission).**
  - Setup: C = {w, x, y}, T = {sp}, `pattern sp = some prs`, `step sp w x ∧ step sp w y`.
  - Result: `Generated.rel` gives w~x and w~y, `symm` then `trans` gives `identityRel x y`. `Survives x y` and `Survives y x` both fail.
- **CE-B (fusion).** Two preserving steps x→w and y→w give `identityRel x y`.
- **CE-C (breaking inside identity).** Persistence's own `stepBrk_not_separating` gives a `brk` step with identity-related endpoints.
- **CE-D (not an artifact of the self-loop).** States p, q with `keep : p→q` as `prs` and `cut : p→q` as `brk`. The `brk` step exists and `identityRel p q` holds.
- **No-rejection cases.** AT ↦ `brk` and CL ↦ `prs` (F-04) are well-formed classifications that Persistence cannot reject. These are failures to reject, not counterexamples to a theorem.

**Open questions** (none is converted into a conclusion)

| Question                                                                                    | What would settle it                                                                                      |
| ------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| Is ~\_P meant as strict identity?                                                           | A theory decision on D2, and whether the lineage accepts non-equivalence structure, as NS does.           |
| What is the bearer, and how does it relate to NS `Stage`, `Setting` and `ReferentCarriers`? | A decision on D1 and a named owner for the bridge.                                                        |
| Does breakage have separating force?                                                        | A theory statement of breakage plus a coherence predicate, or a decision to keep it informational.        |
| Should `prs` and `brk` be derived from Transformation's effect laws?                        | A decision on D4, and evidence that a (StateModel, P) derivation reproduces the intended classifications. |
| What do `ign` and `persist` assert?                                                         | Definitions in the accepted theory text (D5).                                                             |
| Is state-independent labelling adequate?                                                    | Worked treatment of SP, MG, BR and CP under the chosen bearer.                                            |

### Source-audit separation

- _Justified from current sources:_ the closure and equivalence mathematics; that Persistence does not define or identify individuation or co-reference; that the Transformation link is taxonomic.
- _Would require new theory or interface:_ any bridge to `PersistenceAccount`; any separating semantics for breakage; any derivation of labels from effect laws; any treatment of fission, fusion or copy.

---

## E. Cross-Repository Implications

- **Persistence:** all findings. This includes narrowing the scope claims in the manifest (L52, L61), `CITATION.cff` and the README unless D3 delivers real breakage content. If D1 ties Persistence to NS, the manifest and Lake dependencies change, since NS's registry already treats Persistence as downstream.
- **Transformation:** no required change. Possible, only if D4 chooses derivation from effect laws: a relation-level API may be needed, which would be downstream-driven. Process note: `.protocols/research.md` is absent. Separately, NS's registry says Transformation consumes foundational SE concepts, while Transformation's manifest declares no NS dependency. That layering declaration belongs in the Transformation review, not here.
- **Neutral Substrate:** no required change, and no substantive reason found to reopen it. Candidate 25 is not initiated. The only conditional trigger is this: if D1 shows that `PersistenceAccount` cannot be instantiated from any adequate Persistence relation, for example because the omitted stage-to-referent membership is needed. Even then, first check whether the bridge can live outside NS. NS already defers bridges by design.
- **Downstream (identity regimes, regime profiles):** a possible consequence, not an upstream requirement. Persistence defers regime profiles downstream, so they will inherit the equivalence-closure semantics (F-02) and inert breakage (F-03) unless those change.

---

## F. Recommended Next Actions

### Decisions required before implementation\*\* (in this order)

1. **D5:** where the accepted Persistence theory statement lives, and its authority relative to Lean (P-1). Everything else anchors to it.
2. **D1:** the identity bearer and who owns the bridge to NS `PersistenceAccount` (F-01, F-07, F-10).
3. **D2:** whether `identityRel` is strict identity, identity-connectedness, or directed-only (F-02).
4. **D3:** what breakage and `ign` assert, and whether a coherence predicate is owed (F-03, F-06).
5. **D4:** how `prs` and `brk` relate to Transformation's effect laws, and the argument structure of a persistence judgment (F-04, F-05).

### Corrections appropriate after semantic reconciliation

- Narrow the scope and abstract claims (manifest, `CITATION.cff`, README) to what is proved, unless D3 delivers more.
- Repair `surfaces.toml` (P-2).
- Qualify or rename the identity vocabulary (F-08).
- Reframe the invariants theorem as generic (F-09).
- Decide whether Persistence adopts `.protocols/research.md` (P-3).

### Verification activities

- Compare against the second independent review before any correction is authorized.
- After decisions, mechanically check CE-A to CE-D in Lean as regression witnesses.
- Validate `surfaces.toml` against the accountable-surface schema.
- Re-run `lake build`, `lake test`, `lake lint` and the reference-kit validators as regression only, not as semantic evidence.

### Deferred

- Carrier-sensitive separation of classifications.
- Interaction with Transformation composition and orthogonality (already planned in the CHANGELOG).
- Denotation and co-reference lifting.
- Identity-regime and admissibility theories.
- Candidate 25.

**Single smallest next scientific question** (`source-audit` §8): what does `identityRel x y` assert about `x` and `y`, meaning which bearer and whether it is meant as strict identity?

**Repository and file changes:** none. The four repos were cloned read-only at `/home/claude/structural-explainability/{se-theory-persistence,se-theory-neutral-substrate,se-theory-transformation,se-protocols-research}`. One new scratch script sits outside every repo at `/tmp/claude-0/-home-claude/88c252fe-fec2-517d-b3f7-64073056f483/scratchpad/ce_check.py`.
