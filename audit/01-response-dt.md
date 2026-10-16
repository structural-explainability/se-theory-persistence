## A. Executive Assessment

**Assessment: blocked by unresolved foundational issues in Persistence’s semantic interpretation.** The retrieved sources support a coherent theory of classified transition relations. They do not yet establish that its generated relations constitute **strict persistence of eligible whole stages across settings**, as understood by the accepted Neutral Substrate interface.

**Independent-review disposition: INSUFFICIENT BASIS** for accepting the repository as that substantive persistence theory.

This is not a finding that the Lean theory is inconsistent. The central distinction is:

- The graph constructions and their stated mathematical properties are well-defined.
- Calling their results identity survival, identity equivalence, and identity breakage requires semantic commitments that the current sources do not supply.
- Some missing connections are expressly deferred. That makes the limitations transparent, but does not establish the missing semantics.

The strongest obstacle is the relationship between preservation labels and strict identity. Arbitrary dynamics permit a preserving step and a breaking step between the same distinct endpoints. Equivalence closure also identifies branches that cannot survive into one another. These are legitimate graph-theoretic outcomes; whether they are legitimate persistence judgments remains unsettled.

### Review provenance and authority

Review date: **October 16, 2026**. Reviewer: **Codex, GPT-6-based agent**. The review used the supplied audit request and repository sources, without another reviewer’s report or the author’s reasoning transcript.

The reviewed revisions were:

| Repository | Exact commit |
|---|---|
| Persistence | `819749091a538e5b69450a24b7bc121be8331b2c` |
| Neutral Substrate | `e823a41ba354d81fd8d6d69a8ddaa7f9366c7259` |
| Transformation | `350c7ff01aa7bf9a7119f0a44ce652d7a6933154` |
| Research protocols | `e448eb7ff12800fa78be783260d61adaa9bb6c7b` |

Persistence’s Lake lock resolves its declared Transformation `v0.5.1` dependency to the Transformation commit above.

I applied the canonical [source-audit protocol](https://github.com/structural-explainability/se-protocols-research/blob/e448eb7ff12800fa78be783260d61adaa9bb6c7b/protocols/source-audit/SKILL.md) and [independent-review protocol](https://github.com/structural-explainability/se-protocols-research/blob/e448eb7ff12800fa78be783260d61adaa9bb6c7b/protocols/independent-review/SKILL.md). I also read the construction and acceptance protocols to identify the boundary beyond this audit. No acceptance decision or candidate creation was undertaken.

The authority hierarchy recovered from the repositories is:

1. **Manifests:** repository scope and dependency declarations.
2. **Lean sources:** current formal definitions, predicates, requirements, and theorems.
3. **Reference TOML:** public-surface classification, traceability, and export declarations; Persistence explicitly treats these as mirrors of Lean.
4. **Generated data:** derivative artifacts.
5. **Documentation:** explanatory orientation.
6. **Tests and historical material:** examples and historical evidence, not independent semantic authority.

This hierarchy determines what the repositories currently assert. It does not make those assertions scientifically valid merely because Lean is authoritative. See the [Persistence authority declaration](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/README.md).

**Coverage:** all Persistence production modules under `SE/`, its test modules, reference TOML files, generated catalog, documentation, dependency declarations, and authority manifest; Neutral Substrate’s relevant carrier, individuation, co-reference, persistence, referential-fixing, and framework-invariance interfaces; Transformation’s taxonomy, effect dimensions, state model, sequence semantics, and composition/orthogonality interfaces.

This was not a complete re-audit of either upstream repository. Prior audit reports, papers, and historical SE-300 artifacts were not used as normative evidence. Relevant remote sources were accessible. No files were created or modified, and no builds or repository tests were run.

## B. Theory Inventory

### Locally owned definitions and claims

Let \(c\) be a classification and \(d\) its supplied dynamics. The implemented core is:

\[
R_c(x,y)\iff \exists t,\;c.\mathrm{IsPrs}(t)\land d.\mathrm{step}(t,x,y).
\]

| Concept | Current meaning | Status |
|---|---|---|
| `ClassificationValue` | `ign`, `prs`, or `brk` | Defined vocabulary |
| `Classification.pattern` | A total assignment of inapplicable or one classification to each transformation | Supplied data |
| `Classification.persist` | A separately declared subset of transformations | Supplied data |
| `WellFormed` | `persist ⊆ IsPrs` | Optional predicate |
| `Dynamics.step` | Arbitrary transformation-indexed relation on one carrier | Supplied data |
| `Survives` | Reflexive-transitive closure of \(R_c\) | Defined directed relation |
| `identityRel` | Equivalence closure of \(R_c\) | Defined equivalence relation |
| `stepBrk` | An actual step bearing a `brk` label | Defined labeled-step relation |
| `Invariant` | A predicate constant across every preserving step | Defined property |
| `observationalEquivalence Φ` | Agreement on every predicate in \(Φ\) | Defined equivalence relation |
| `NonCollapsing` | Inequality of two generated identity relations on the **same dynamics** | Defined comparison |
| Family/kind lifts | Precomposition with Transformation’s taxonomy maps | Defined adapters |

The definitions appear in [Classification](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Domain/Classification.lean), [Generated](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Generated.lean), and the relation modules discussed below.

The principal mathematical claims are supported by the inspected definitions and proofs:

- Survival is reflexive and transitive.
- Survival implies generated equivalence.
- Equal preserving sets produce equal generated relations on shared dynamics.
- On `freeDynamics`, distinct preserving sets produce distinct generated relations.
- Step invariants are precisely predicates respecting generated equivalence.
- Agreement on **all** step invariants characterizes generated equivalence.
- A breaking step need not separate endpoints on arbitrary dynamics.

No additional semantic axioms or `sorry` placeholders were found in the inspected Persistence production sources. That is a source observation, not a compilation claim.

### Imported concepts and obligations

**Neutral Substrate supplies the semantic boundary:** separate accounts of individuation, co-reference, and persistence. Its persistence interface concerns eligible whole stages across two settings and expressly avoids identifying persistence with transformation, succession, provenance, or carrier equality. It does not impose a particular route semantics or equivalence laws. See [PersistenceAccount](https://github.com/structural-explainability/se-theory-neutral-substrate/blob/e823a41ba354d81fd8d6d69a8ddaa7f9366c7259/SE/Substrate/ReferentialRegime/Persistence.lean).

Persistence does not presently import that interface or define an interpretation into it. Absence of a package dependency is not itself a semantic defect; absence of an established semantic relationship is material to this audit.

**Transformation supplies taxonomy and optional effect-model obligations.** Persistence directly consumes the taxonomy only. If its dynamics are later presented as a Transformation `StateModel`, they must satisfy that model’s frame and required-change laws. Generic Persistence dynamics are not currently claimed to satisfy those laws. This limitation is explicit in [the dependency documentation](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/docs/en/index.md#L45).

**Downstream ownership:** concrete identity criteria, regime profiles, domain-specific classifications, operational judgments, and policies can appropriately remain downstream. Persistence still needs to specify the generic conditions under which such supplied data warrant its identity terminology.

## C. Findings

The first two findings concern verified limitations whose substantive resolution remains open. They are not allegations of false Lean theorems.

### P-01 — BLOCKING: No established interpretation from generated relations to strict persistence

**Location:** Persistence `SE/Persistence/Relation/Generated.lean:38`, `Survival.lean:34–46`, and `Equivalence.lean:35–43`; compared with Neutral Substrate `SE/Substrate/ReferentialRegime/Persistence.lean:57–93`.

**Evidence:** `Dynamics` supplies only `T → C → C → Prop`. `Survives` and `identityRel` use this relation and preservation labels. They contain no settings, eligibility conditions, whole-stage interpretation, history selection, or relationship to `PersistenceAccount`.

The entire inspected Persistence production surface contains no adapter or adequacy condition connecting these constructions to the upstream account. Its documentation explicitly leaves carrier and identity-criterion connections unspecified. See [Survival](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Survival.lean#L34) and [Identity Equivalence](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Equivalence.lean#L35).

**Semantic issue:** generated connectivity does not independently establish that endpoints are eligible stages of the same continuing unit. The structure permits such an interpretation, but does not justify it.

The issue is not that `C` cannot encode settings or eligible stages—it can. The missing element is a contract specifying which encodings and judgments are legitimate.

**Consequence:** the existing results cannot establish substantive compatibility with Neutral Substrate’s persistence semantics. Directly identifying either graph relation with strict persistence would add unstated commitments.

**Recommended conceptual action:** determine the intended interpretation and its necessary conditions before implementation. Either narrow the present theory to generic relational infrastructure or establish the conditions under which its relations express strict persistence. Do not impose new laws on Neutral Substrate merely to accommodate the current representation.

### P-02 — MAJOR: “Breaking” labels do not establish identity breakage

**Location:** `SE/Persistence/Relation/Breakage.lean:33–35`; `NonCollapse.lean:110` (`stepBrk_not_separating`); `Domain/Classification.lean:71–72`.

**Evidence:** `stepBrk` requires a `brk` label and a dynamics step. It does not require failure of survival or generated identity. The repository explicitly proves coexistence of a breaking step and identity-related endpoints. `WellFormed` does not constrain this: it only checks `persist ⊆ IsPrs`. See [Breakage](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Breakage.lean#L33) and [the coexistence theorem](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/NonCollapse.lean#L110).

**Concrete evidence beyond the singleton test:** take distinct states \(x,y\), transformations \(p,b\), classify \(p\) as preserving and \(b\) as breaking, and give both transformations the step \(x\to y\). Then:

\[
\mathrm{stepBrk}(x,y),\quad
\mathrm{Survives}(x,y),\quad
\mathrm{identityRel}(x,y)
\]

all hold. Set `persist` empty; `WellFormed` also holds.

**Semantic issue:** this is coherent if `stepBrk` means a classified event, or if preservation concerns one route while breakage concerns another. It is inadequate if `brk` means that the endpoints fail the same strict-identity criterion expressed by `identityRel`.

The current representation does not resolve this distinction. The existing caveat correctly reports the mathematics, but leaves the intended meaning of identity breakage unsettled.

**Consequence:** downstream users could mistake classification membership for an established negative persistence judgment.

**Recommended conceptual action:** settle whether breakage is endpoint-relative, event-relative, or history-relative, and specify its relationship to positive persistence. A rule declaring breakage simply the negation of survival would be a new theoretical decision, not a recovered correction.

### P-03 — MINOR: The “symmetric closure” explanation is mathematically inaccurate

**Location:** `SE/Persistence/Relation/Survival.lean:21`.

**Claim:** “Its symmetric closure is the identity relation.”

**Counterexample:** let the only preserving steps be \(a\to b\) and \(a\to c\). Generated equivalence relates \(b\) and \(c\). Neither `Survives b c` nor `Survives c b` holds. Consequently, the ordinary symmetric closure of survival does not relate them.

**Semantic issue:** symmetric closure alone need not be transitive. The implementation uses **equivalence closure**, which allows arbitrary finite zigzags.

**Consequence:** readers can underestimate the identifications produced by `identityRel`, particularly at branching and merging points.

**Recommended correction:** describe `identityRel` as the equivalence closure of survival, or the reflexive-transitive closure of the symmetrized preserving-step relation. The current implementation need not change to correct this statement. [Exact source](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Survival.lean#L21).

### P-04 — MINOR: Persistence lacks the research-protocol adoption declaration

**Location:** repository root; absent `.protocols/research.md` in the retrieved complete tree.

**Evidence:** Neutral Substrate has the declaration and points to the canonical protocol repository. Persistence does not. The protocols’ README identifies this file as the adoption mechanism. The protocols themselves were accessible and read. [Adoption convention](https://github.com/structural-explainability/se-protocols-research/blob/e448eb7ff12800fa78be783260d61adaa9bb6c7b/README.md).

**Issue:** the repository does not locally declare the research process requested for this review.

**Consequence:** later researchers cannot recover protocol adoption from Persistence alone.

**Recommended action:** after reconciliation and authorization, record adoption through the prescribed declaration. This audit followed the protocols under the user’s explicit instruction; no file was created.

### P-05 — MINOR: The authority manifest does not structurally declare its intended Lean surface

**Location:** `.accountability/surfaces.toml:38–68`; build-configuration paths at line 73.

**Evidence:** `id = "lean-public-surface"` appears without a preceding `[[surface]]`. Under TOML table scoping, those keys remain in the preceding `surface.role` table; they do not create a distinct surface. Subsequent role entries remain associated with the earlier surface. The build surface also names `lakefile.lean`, whereas this repository uses `lakefile.toml`. [Exact manifest](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/.accountability/surfaces.toml#L38).

**Issue:** the machine-readable authority structure differs from its apparent intended organization.

**Consequence:** a consumer cannot reliably recover the intended Lean and build-surface declarations from this manifest. This does not erase the README’s explicit semantic authority declaration.

**Recommended action:** correct the declaration structure and actual build path through the repository’s human-governed process after the audit. No governance edits were made.

## D. Counterexamples and Open Questions

### Confirmed pressure cases

| Case | Result under current definitions | What it establishes |
|---|---|---|
| Preserving fork \(a\to b,\ a\to c\) | `identityRel b c`, but neither direction of survival | Equivalence closure merges branches; disproves the symmetric-closure gloss |
| Preserving and breaking transformations both connect distinct \(x,y\) | Breakage, survival, and identity coexist | Labels lack endpoint-identity consistency conditions |
| No preserving steps | Survival and generated identity reduce to carrier equality | Reflexivity requires no transformation or eligibility evidence |
| Different preserving sets, but empty dynamics | Generated identity relations coincide | Preserving-set difference is insufficient for separation on arbitrary dynamics |
| Empty observables on a two-state empty dynamics | Observational equivalence is universal; generated equivalence is equality | Preservation of chosen observables does not establish completeness |
| Same pattern, different declared `persist` subsets | All generated relations remain unchanged | `persist` does not control survival or identity |

The fork and distinct-endpoint examples were checked with an in-memory finite relation calculation. I also exhaustively checked the all-invariants characterization for all **512 binary relations on three states**, with no mismatches. This corroborates the finite mathematics; it does not validate its interpretation as strict identity.

### Unresolved questions, not established defects

**Q-1 — Which paths are semantically admissible?**

`Survives` establishes the existence of a preserving path. It does not inspect a designated actual history or require every possible path to preserve identity.

For example, an actual breaking route and an alternative preserving route can share endpoints. The present relation reports survival because the latter exists. This is not an error if existential reachability is intended; it cannot establish survival along the actual breaking route.

**What settles it:** an explicit decision about whether dynamics represent actual histories, permissible alternatives, or both, and the scope of the persistence judgment.

**Q-2 — What distinguishes `ign`, inapplicability, and unresolved classification?**

`none` explicitly means inapplicable. `some ign` explicitly means applicable and identity-ignoring. Neither represents an unknown classification. The function assigns exactly one of these four outcomes to every transformation.

That is a deliberate representational commitment, not automatically a defect. However, the inspected sources do not establish whether these outcomes exhaust scientifically warranted classifications, or what identity-ignoring means operationally for a step.

An ignoring step between distinct states contributes neither survival nor breakage. It must not silently be interpreted as preservation.

**What settles it:** precise semantic conditions for these statuses and an explicit limit on which classification tasks the total representation covers.

**Q-3 — What is the independent role of `persist`?**

`WellFormed` permits any subset of the preserving transformations, including the empty set. Every relation uses `IsPrs`, not `persist`. The tests deliberately use empty persistence sets alongside positive preservation labels.

**What settles it:** whether `persist` denotes a selected commitment subset, the full survival-generating set, or metadata. Current sources support only the subset condition. Equality with `IsPrs` would be a new requirement.

**Q-4 — What does carrier-sensitive non-collapse compare?**

The current theorem fixes both the carrier and dynamics. It expressly excludes classifications separated only by carrier. A difference in labels outside the preserving set also need not affect generated identity. These are accurate scope limitations, not failures of the theorem. [Non-collapse scope](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/NonCollapse.lean#L18).

**What settles it:** a comparison contract between differently interpreted carriers or dynamics, including which correspondences preserve semantic identity. Raw inequality of carrier types would not itself establish scientific separation.

**Q-5 — When may classifications be lifted uniformly over a family or kind?**

The lift correctly makes operators in a family or kind share a classification. Transformation taxonomy alone does not establish that they should share persistence behavior. The lift module explicitly takes the coarser classification as input.

**What settles it:** evidence that the selected identity criterion is uniform over the relevant taxonomy fiber. No change to Transformation’s taxonomy follows merely from the need for such evidence.

### Formalization fidelity

The closure, monotonicity, free-dynamics, and invariant results faithfully express the graph definitions inspected.

The all-invariants theorem is particularly important to delimit. Its reverse direction uses a predicate of the form:

\[
z\mapsto \mathrm{Generated}(R,x,z).
\]

That is a valid mathematical separating predicate. It does **not** provide an independently selected, observable, or computable identity basis. Using the theorem to validate a substantive identity criterion would require additional evidence. The source itself distinguishes preservation from completeness, and the tests include the empty-observable counterexample. [Invariant characterization](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Invariance.lean#L83).

Likewise, free-dynamics separation demonstrates a property of the specially constructed witness. It does not establish separation for every scientifically admissible Transformation model.

The existing tests mostly exercise toy classifications, singleton dynamics, free dynamics, and generic closure facts. They support those properties. They cannot settle eligibility, strict identity, or historical adequacy because those semantics are not represented.

## E. Cross-Repository Implications

| Repository or layer | Implication |
|---|---|
| **Persistence** | Must settle its interpretation of generated identity, survival, and breakage before substantive acceptance. Correct the closure explanation and identified process declarations afterward. |
| **Transformation** | No required upstream semantic change was established. Its taxonomy is consumed faithfully. Its state-model laws remain available for a future explicit compatibility contract. |
| **Neutral Substrate** | No substantive reason to reopen the accepted interface was established. Its abstraction intentionally leaves substantive persistence to another layer. |
| **Downstream theories** | May eventually need explicit obligations for stage eligibility, classification soundness, history interpretation, carrier comparison, and taxonomy uniformity. These are possible consequences, not audited downstream defects. |

There is **no implemented identification** of Persistence’s `identityRel` with Neutral Substrate’s `sameUnit` or co-reference relation. Accordingly, an actual code-level collapse among those three responsibilities was not found. The risk arises if generated equivalence is later substituted for one of those judgments without an interpretation contract.

Persistence invariance is also explicitly distinguished from Neutral Substrate’s framework-invariance. The former concerns predicates constant along transitions; the latter concerns consistency when adjoining a proposition to admissible substrate-framework commitments. No conflation was found.

Transformation’s preservation and breakage theorems concern a **supplied relation** under explicit agreement assumptions. They do not choose that relation as strict identity. Its partial composition lookup also does not prohibit unspecified operator pairs. Persistence’s failure to consult that lookup is therefore not, by itself, a composition violation. See [Transformation StateModel](https://github.com/structural-explainability/se-theory-transformation/blob/350c7ff01aa7bf9a7119f0a44ce652d7a6933154/SE/Transformation/Effect/Model.lean).

**Candidate 25 was not initiated.** The evidence supports addressing the unresolved semantics in Persistence rather than changing Neutral Substrate to fit the present implementation.

## F. Recommended Next Actions

1. **Reconcile the independent audits.** Compare the counterexamples, intended meanings, and differing assumptions before authorizing corrections.

2. **Resolve one primary scientific question before implementation:**

   **Under what explicit conditions does the generated relation denote strict persistence of eligible whole stages across settings?**

   Its answer must account for branching, competing paths, eligibility, and the relationship between preserving and breaking classifications.

3. **Establish the accepted boundary.** Decide which current results remain generic mathematical infrastructure and which acquire a substantive persistence interpretation. Record the role of `persist` and the meaning and scope of classification statuses.

4. **After semantic reconciliation, authorize targeted corrections.** Align definitions and explanations with the accepted theory; correct the symmetric-closure statement and the protocol/authority declarations. Do not mechanically change Lean to preserve the current theorem inventory.

5. **Verify the accepted formulation.** Reassess the concrete pressure cases, prove the required interpretation obligations, and then run the relevant Lean and traceability checks. Compilation should verify the selected formulation, not select it.

6. **Keep deferred:** downstream regime implementation, carrier-sensitive cross-model comparison, broader composition/orthogonality integration, papers, releases, and unrelated maintenance.

### JUSTIFIED FROM CURRENT SOURCES

Persistence supplies a coherent generic algebra of labeled steps, directed reachability, generated equivalence, and invariants. Its non-collapse results are accurately limited to shared dynamics and, for the converse, free dynamics. Its Transformation dependency is explicitly taxonomy-only. A precise closure-description error and process-declaration gaps are verified.

### WOULD REQUIRE NEW THEORY OR INTERFACE

An adequacy contract connecting those constructions to strict diachronic identity; meaningful consistency conditions for breaking classifications; eligibility and history interpretation; and any broader carrier-sensitive separation claim.

**The audit is complete. No corrections, research artifacts, candidates, branches, commits, or downstream work were created.**
