# Persistence Theory Reconciliation (Desktop ChatGPT)

**Recommendation:** retain Persistence’s generic relational constructions, explicitly narrow their scientific claims, and assign responsibility for any future strict-persistence interpretation. Neither audit establishes a need to change Neutral Substrate or Transformation.

**Readiness: READY SUBJECT TO SPECIFIED DECISIONS.** This applies to a deliberately bounded infrastructure baseline. A baseline claiming to establish strict diachronic persistence still requires additional theory.

No files were created or modified. No acceptance decision, implementation, candidate, commit, or downstream work was undertaken.

## A. Executive reconciliation

### Evidence and revision control

I read both supplied reports completely, treating **c as Claude** and **dt as desktop ChatGPT**. Their recommendations were evaluated as review evidence, not as instructions or theoretical authority.

The reconciliation uses these audited revisions:

| Repository | Audited revision | Local revision inspected | Relevant difference |
|---|---|---|---|
| Persistence | `819749091a538e5b69450a24b7bc121be8331b2c` | `5d06dcb241e4078a29e7006fb16b5fb68aa061f5` | Adds `.protocols/research.md`; no committed semantic changes |
| Neutral Substrate | `e823a41ba354d81fd8d6d69a8ddaa7f9366c7259` | Same | None |
| Transformation | `350c7ff01aa7bf9a7119f0a44ce652d7a6933154` | `7b0f10a3283ea57c11b9c98b254ca6d4b99bdf8a` | Adds `.protocols/research.md`; no committed semantic changes |
| Research protocols | `e448eb7ff12800fa78be783260d61adaa9bb6c7b` | Same | None |

Persistence and Transformation also have local automation/configuration edits involving `prek.toml`, the previous pre-commit configuration, CI, and the automation paths in their authority manifests. These do not change the inspected Lean semantics. Persistence’s missing Lean-surface table header and incorrect Lake path remain.

Consequently, the missing-protocol-declaration findings were correct **at the audited commits** but are **resolved at the inspected HEADs**.

I applied the canonical protocols at `e448eb7`: source-audit; independent-review §7 for reconciliation after independent completion; theory-construction for distinguishing proposals from recovered semantics; and theory-acceptance for readiness boundaries. There is no separate reconciliation protocol in that revision. Referee-sim was read but not performed. The protocols explicitly govern research process without defining theory semantics or replacing repository authority. [Protocol repository](https://github.com/structural-explainability/se-protocols-research/tree/e448eb7ff12800fa78be783260d61adaa9bb6c7b)

Coverage included Persistence’s production Lean modules, tests, scope and authority declarations, reference configuration, dependency lock and documentation; Neutral Substrate’s relevant persistence, individuation and co-reference interfaces and dependency declarations; and Transformation’s state model, relevant footprints and required changes, sequence/coherence results and planned investigations.

I independently parsed the authority manifest and reproduced the fork/merge calculations. An in-memory enumeration also confirmed the all-invariants characterization for all 512 binary relations on three states. **No Lean builds, schema validation, or mechanical proof rechecking were performed.** This is not a complete upstream re-audit. Historical acceptance records and papers were not treated as independently verified evidence.

### What the audits establish

Both reviews support the same formal inventory. Writing \(R\) for the supplied preserving-step relation:

\[
R(x,y)\iff\exists t,\;\mathrm{IsPrs}(t)\land\mathrm{step}(t,x,y),
\]

- `Survives` is \(R^*\), directed reflexive-transitive closure.
- `identityRel` is \(\operatorname{EqCl}(R)\), equivalence closure.
- `stepBrk` is the relation consisting of steps bearing a breaking label.
- Neither closure establishes stage eligibility, actual-history selection, or strict identity independently.
- Breaking steps can connect endpoints related by either positive relation.
- No implemented identification with individuation or co-reference was found.

These are supported by the actual definitions, not reviewer agreement. [Generated relations](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Generated.lean), [Survival](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Survival.lean), [Breakage](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Breakage.lean)

Their overall verdicts largely concern **different acceptance targets**:

- Claude’s **ACCEPT WITH NARROWING** concerns a generic closure theory.
- Desktop ChatGPT’s **INSUFFICIENT BASIS** concerns substantive strict persistence.

Those conclusions are compatible. Their substantive disagreements concern the alleged conflict with Transformation and whether a separate normative theory text is necessary.

### Corrections to the reviewers’ interpretations

Several stronger claims require narrowing:

1. **An unspecified interpretation is not an undefined mathematical carrier.** `C` is formally precise; its scientific interpretation is unspecified.
2. **Breaking labels are not wholly inert.** Changing `brk` to `ign` can change `stepBrk`, `IsBrk`, and the coarse classification, although it leaves the positive closures unchanged.
3. **Coexisting breakage and generated equivalence is not a contradiction in the current theory.** It becomes one only under an additional interpretation giving both judgments incompatible endpoint meanings.
4. **Negated generated equivalence is a definite mathematical negation.** It establishes absence of a preserving zigzag. Its translation into substantive nonidentity requires an adequacy claim.
5. **Neutral Substrate does not prohibit equivalence laws.** It does not impose them. Particular accounts may justify stronger laws.
6. **A conceptual relationship to Neutral Substrate does not automatically require a direct Lean dependency.**
7. **Lean authority does not make independent semantic assessment impossible.** It does make a separately stated, reviewable scientific contract necessary before claiming correspondence to intended semantics.

## B. Reconciliation matrix

“Evidence agreement” concerns the source observations. “Interpretation agreement” concerns their scientific consequences. A dash means the other report has no separately identified finding.

| Issue and category | Desktop ChatGPT | Claude | Evidence / interpretation agreement | Severity reconciliation and disposition |
|---|---|---|---|---|
| Bearer and upstream interpretation — semantics | **P-01**, blocking: no established strict-persistence interpretation | **F-01**, major: bearer and bridge unresolved | Yes / substantially yes | Same substantive concern. **Verified absence; conditional blocker.** D1 must select scope and ownership. |
| Equivalence closure, fission and fusion — semantics | **P-01**, pressure cases: branches become equivalent | **F-02**, major conditional defect; **CE-A/B** | Yes / yes when conditional | **Verified behavior, not a false theorem.** Defect only if intended identity rejects it. D2 settles interpretation. |
| Actual versus alternative histories — semantics | **Q-1**, unresolved | **F-02**, discussion of paths | Yes / broadly yes | **Unresolved for substantive use.** No designated history is represented. |
| Breakage versus endpoint separation — semantics | **P-02**, major; distinct-endpoint example | **F-03**, major; **CE-C/D** | Yes / partial | Missing separating implication is **verified**. Claude’s “contradictory pairs” overstates current semantics. D3 settles polarity. |
| `brk` versus `ign` — semantics | **Q-2** distinguishes statuses and their effects | **F-03/F-08** sometimes describes them as operationally equivalent | Partial / no on blanket equivalence | **Claude claim narrowed:** equal positive closures do not imply equal full classifications or `stepBrk`. |
| Inapplicability versus step existence — semantics | **Q-2** addresses classification scope | **F-03** explicitly notes steps need not imply applicability | Compatible / unresolved | **Verified independence.** A defect only if classification applicability is supposed to govern physical execution. |
| Unknown classification — representation | **Q-2**: neither `none` nor `ign` means unknown | No separate finding | Not contested | **Verified representational limit.** No new “unknown” constructor justified for this baseline. |
| Transformation compatibility — semantics | Cross-repository assessment: no demonstrated defect | **F-04**, major: labels unconstrained by effect laws | Yes / substantive disagreement | **No present inconsistency demonstrated.** Compatibility becomes necessary when a common model and criterion are asserted. D4. |
| State-independent classification — expressiveness | **Q-5**, conditional uniformity | **F-05**, major plausible concern | Yes / partial | **Conditional limitation.** Generic `T` may encode applications; `OperatorCode` labels are coarse. No forced redesign. |
| Taxonomy lifts — mathematics/semantics | **Q-5**: correct precomposition, uniformity supplied | **F-05**: lifts cannot resolve referent/application distinctions | Yes / compatible after narrowing | Mathematics **adequately addressed**; scientific uniformity **deferred to the classifier’s owner**. |
| Eligibility and reflexivity — semantics | **P-01**, empty-step pressure case | **F-07**, minor plausible concern | Yes / yes | **Conditional interpretation obligation**, not a generic closure defect. D1–D2. |
| `persist` — semantics/API | **Q-3**, unresolved role | **F-06**, minor: undefined/untested | Yes on non-use / partial | Auxiliary predicate exists and is tested vacuously. **Distinct scientific purpose unestablished**; D3 must bound its role. |
| Invariant characterization — mathematics/framing | Formalization section: valid, not an independent identity basis | **F-09**, minor framing concern | Yes / yes | **Mathematically supported; already qualified in module and changelog.** Keep limits visible in headline claims. |
| Carrier-sensitive non-collapse — scope | **Q-4**, explicitly deferred | Deferred list; related **F-08** | Yes / yes | **Already scoped correctly.** Cross-carrier comparison is optional downstream work. |
| Identity vocabulary and conceptual separation — framing | **P-01**, cross-repository assessment | **F-08**, minor | Yes / yes | **Terminology correction needed.** No formal collapse of individuation, co-reference and persistence found. |
| Type universes — implementation | — | **F-10**, minor | Unique to Claude | **Verified limitation.** Optional generalization unless an accepted interpretation needs larger carriers. |
| Symmetric versus equivalence closure — documentation | **P-03**, minor | **F-02** supplies relevant mathematics but no separate correction | Compatible | **Verified documentation defect.** Correct wording; retain definitions. |
| Independent normative statement — governance | Authority/fidelity discussion, no separate finding | **P-1**, major process concern | Yes on authority / partial on consequence | **Reviewable meaning is necessary; duplicate canonical document is not established as necessary.** D5. |
| Missing adoption declaration — governance | **P-04**, minor | **P-3**, minor | Yes / yes | **Verified historically; resolved at current HEAD** in both affected repositories. |
| Malformed authority structure — governance | **P-05**, minor | **P-2**, major | Yes / yes | Severity difference is not scientific disagreement. **Verified structural defect remains.** README authority still exists. |
| Wrong Lake path — governance/documentation | **P-05**, explicit | No separate finding | Not contested | **Verified:** authority manifest says `lakefile.lean`; package uses `lakefile.toml`. |
| README/manifest/citation scope — framing | **P-01/P-02**, executive assessment | **F-03/F-08**, correction list | Yes / yes | **Necessary narrowing if generic baseline chosen.** Artifact names alone are not false mathematical claims. |
| Composition/net-change investigations — upstream boundary | No current dependence demonstrated | Deferred; **F-04** related | Yes / largely yes | **No blocking upstream obligation established.** Planned results remain unestablished. |
| Empty protocols authority manifest — process | — | Provenance observation | Unique observation | Does not erase README’s canonical-protocol declaration; **no reconciliation blocker demonstrated**. |

The source evidence resolves the mathematical and structural rows. The remaining semantic disagreements require explicit decisions, not further votes from reviewers.

## C. Theoretical decision register

### D1 — Bearer, eligibility, and ownership of interpretation

**Question.** What do Persistence’s relations relate, and who must justify their use as Neutral Substrate persistence judgments?

**Evidence.** Persistence deliberately leaves `C` abstract and assigns regime profiles, carriers and identity bases downstream. Neutral Substrate supplies `Setting`, `Stage`, `eligibleStage`, and `persists`, while deliberately omitting route semantics, stage membership and equivalence laws. Its structure contains no proof field enforcing that positive judgments imply eligibility. The semantic boundary nevertheless describes judgments about eligible whole stages. [Classification](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Domain/Classification.lean), [PersistenceAccount](https://github.com/structural-explainability/se-theory-neutral-substrate/blob/e823a41ba354d81fd8d6d69a8ddaa7f9366c7259/SE/Substrate/ReferentialRegime/Persistence.lean)

**Alternatives.**

- Identify `C` directly with `Stage`.
- Represent setting-indexed stage occurrences, possibly restricted to eligible occurrences.
- Interpret `C` as configurations and supply an additional account of which whole stages are compared.
- Keep the carrier generic and defer concrete interpretations.

**Pressure cases.** A configuration can contain several referents. Equality of configurations does not automatically answer which referent persists. A raw candidate stage can also be ineligible at a selected setting, while both closures remain reflexive on every carrier element.

**Recommended decision.** Keep `C` generic. Persistence owns the declaration of what its constructions establish and the conditions under which stronger interpretations may be claimed. The downstream theory supplying a regime profile—provisionally Identity Regimes—owns its concrete carrier, eligibility, history interpretation and bridge to `PersistenceAccount`.

This is an ownership recommendation, not a finding that Identity Regimes already implements or accepts that responsibility.

**Justification.** The existing division supports downstream profiles. Neither direct equality `C = Stage` nor a new bridge repository is necessary. A conceptual compatibility obligation can be stated without adding a package dependency.

**Consequences.** No immediate Lean carrier change. Do not equate Transformation configurations, referent carriers and stages by naming convention. Any future bridge must explain settings, eligibility and the selected whole-stage bearer. Constructing a syntactically valid `PersistenceAccount` alone would not establish scientific adequacy.

**Responsible repositories.** Persistence for the generic boundary; the concrete profile-owning repository for realization. Neutral Substrate remains unchanged.

**Status: RECOMMENDED.**

### D2 — Meaning of `identityRel` and `Survives`

**Question.** Are these generated graph relations strict persistence, sufficient evidence for it, or infrastructure awaiting interpretation?

**Evidence.** `Generated` includes reflexivity, symmetry and transitivity explicitly. Its least-equivalence theorem determines exactly what can be concluded from preserving steps. `Survives` existentially quantifies over finite directed preserving paths, including the zero-length path. [Generated](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Relation/Generated.lean)

**Alternatives.** Generic connectivity; substantive strict identity; conditional interpretation; or a directed relation as the primary substantive judgment.

**Pressure cases.**

- **Fork:** \(a\to b,\;a\to c\) gives generated equivalence of \(b,c\), without survival in either direction.
- **Merge:** \(b\to a,\;c\to a\) similarly relates the predecessors.
- **Alternative histories:** existence of a preserving route does not establish preservation along a designated breaking route.
- **Empty dynamics:** both closures reduce to carrier equality, without independent eligibility evidence.

These are counterexamples to stronger interpretations or descriptions, not to the actual closure theorems. They also do not automatically model actual SP/MG applications: Transformation states are configurations, so an additional interpretation is needed before graph vertices can stand for split outputs or merged inputs.

**Recommended decision.** Retain both constructions as generic relations. Describe `identityRel` as **generated equivalence under preserving-labelled steps** and `Survives` as **preserving reachability**. Neither automatically denotes strict persistence.

For any future strict interpretation, distinguish:

- **Soundness:** a generated judgment warrants the intended persistence judgment.
- **Completeness:** every intended persistence judgment is represented by the generated relation.

Only the first is needed for a sufficient-condition claim. Equality of the relations requires both.

**Justification.** Suppose an independently justified relation \(I\) on the interpreted carrier is an equivalence and every preserving step satisfies \(I\). The existing least-equivalence theorem yields:

\[
\operatorname{EqCl}(R)\subseteq I.
\]

This is a valid conditional route to soundness. It does not establish the scientific legitimacy of \(I\), or completeness. A directed account can instead use appropriately justified reflexivity and transitivity. Neither set of laws should be imposed on all Neutral Substrate accounts.

**Consequences.** Correct the symmetric-closure description. Qualify public terminology; a breaking API rename is not necessary to settle the science. Do not impose functionality, linearity or injectivity as a universal repair: functionality alone permits merging, and graph restrictions alone do not establish identity.

**Responsible repository.** Persistence for construction meanings; concrete interpretation owner for soundness, completeness and history claims.

**Status: RECOMMENDED.**

### D3 — Classification, breakage, applicability, and `persist`

**Question.** What scientific force do the classification labels carry beyond filtering supplied transitions?

**Evidence.** The exact current behavior is:

| Item | Established behavior |
|---|---|
| `prs` | Selects steps generating positive closures |
| `brk` | Selects steps included in `stepBrk` |
| `ign` | Applicable classification contributing to neither step filter |
| `none` | Inapplicable under the classification |
| `persist` | Separately supplied predicate on transformations |
| `WellFormed` | `persist ⊆ IsPrs`; not required by the closure definitions |
| `stepBrk` | Existence of a breaking-labelled step, without endpoint separation |

`coarse` deliberately merges `none` with `ign`; it preserves both preserving and breaking sets. [Classification definitions](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/SE/Persistence/Domain/Classification.lean)

**Alternatives.** Labels may classify operator types, individual applications, or transitions relative to a criterion. Breakage may concern endpoints or a particular history. Those interpretations require different obligations.

**Pressure case.** Distinct endpoints \(x,y\) connected by both a preserving-labelled and breaking-labelled transformation satisfy survival, generated equivalence and `stepBrk` simultaneously, even with `WellFormed`.

**Recommended decision.** At the generic baseline, labels are supplied classifications; the construction does not certify their scientific correctness. `stepBrk` reports a classified step. It does not establish endpoint nonidentity.

For a future endpoint interpretation against an independently justified relation \(I\), the relevant soundness obligations would have the form:

\[
\mathrm{IsPrs}(t)\land\mathrm{step}(t,x,y)\Rightarrow I(x,y),
\]
\[
\mathrm{IsBrk}(t)\land\mathrm{step}(t,x,y)\Rightarrow\neg I(x,y).
\]

These are **proposed conditional obligations**, not existing laws. If \(I\) is equated with generated equivalence, breaking steps must be excluded from every generated equivalence class—not merely excluded from the preserving label set.

A history-relative negative judgment instead needs an identified history or occurrence context. The current existential endpoint relation loses that information.

**Applicability and ignoring.** Do not reinterpret `none` as uncertainty or infer that `ign` preserves identity. Classification-relative inapplicability need not forbid a transition in generic dynamics. If applicability is intended to mean execution feasibility, an additional compatibility condition is necessary.

**Role of `persist`.** It is not definitionally duplicate data: different predicates can share one pattern. But it has no demonstrated independent persistence function. The smallest recommendation is to retain it only as an explicitly auxiliary supplied declaration, with the existing subset condition when `WellFormed` is asserted. This is a proposed restriction of its claimed role, not a recovered explanation of its scientific purpose.

Do not make it equal to `IsPrs`, use it to generate survival, or invent a “commitment subset” interpretation without evidence. Removing it is a reasonable later simplification, but is not required for correctness of the bounded construction.

**Consequences.** Narrow breakage terminology, state the label/transition distinction, and bound `persist`’s role. No new global coherence axiom is required for generic infrastructure.

**Responsible repository.** Persistence for label meanings and API scope; profile owner for classification soundness and historical judgments.

**Status: RECOMMENDED.** A stronger scientific purpose for `persist` remains unestablished.

### D4 — Relationship to Transformation

**Question.** Does free classification contradict Transformation, or merely leave a compatibility contract unasserted?

**Evidence.** Transformation’s `StateModel` supplies configuration states, agreement equivalences, and atomic transitions satisfying:

- **Frame:** dimensions outside an operator’s footprint agree.
- **Required change:** every required clause contains a changed dimension.

Its preservation and breakage theorems concern a supplied relation \(P\), under explicit sufficient-agreement or required-agreement hypotheses. Persistence imports taxonomy maps only and expressly disclaims state-model compatibility. [Transformation model](https://github.com/structural-explainability/se-theory-transformation/blob/350c7ff01aa7bf9a7119f0a44ce652d7a6933154/SE/Transformation/Effect/Model.lean), [Persistence dependency boundary](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/docs/en/index.md)

**Competing interpretations.**

- Every Persistence label must already implement Transformation’s relation-level laws.
- Taxonomy consumption is independent of effect-model interpretation.
- An explicit common-model interpretation activates compatibility obligations.

**Pressure cases.**

- AT changes evidence. It preserves a relation for which agreement on appropriate unaffected dimensions suffices; it can break evidence agreement.
- CL must change composition or arrangement. It breaks a relation requiring agreement on both, but this does not determine every possible identity criterion.
- SP, MG, BR and CP affect different configuration dimensions. Their effects do not alone select which whole referent persists.

Thus AT→`brk` and CL→`prs` are not unconditional counterexamples. A conflict requires the **same model, transitions, relation and satisfied theorem hypotheses**, together with a soundness interpretation for the labels.

**Recommended decision.** Accept the taxonomy-only boundary as legitimate. Require compatibility whenever an application claims to interpret Persistence through a Transformation `StateModel`. Permit either derivation from upstream theorems or separate proofs satisfying the same obligations.

**Justification.** Desktop ChatGPT’s “no demonstrated upstream defect” is supported. Claude correctly identifies a risk of terminological equivocation and a missing contract for a stronger integration claim, but not an existing contradiction.

A generic `T` can encode applications and contextual information. Classifications over `OperatorCode`, families or kinds are deliberately coarser and require evidence of uniformity when interpreted scientifically.

**Consequences.** No required Transformation change, new relation-level API, or automatic classification scheme. The dependency’s “semantic” designation can describe authoritative taxonomy consumption; it does not assert consumption of every upstream semantic layer.

Transformation’s planned sequence net-change and absorption/redundancy investigations are not used by the present closure proofs. Generic transitive closure does not depend on those results. Nor does an absent partial-composition lookup prohibit a transition sequence.

**Responsible repository.** Persistence or the downstream adapter owner for compatibility; Transformation retains ownership of effect laws.

**Status: RECOMMENDED.**

### D5 — Scientific authority and formalization correspondence

**Question.** How can theory precede implementation while Lean remains the canonical formal source?

**Evidence.** Persistence declares Lean authoritative, reference artifacts as mirrors, and documentation descriptive. The protocols require explicit candidate meaning, assumptions, exclusions, adversarial evidence, proposed canonical wording and human inspection. They do **not** require an independently maintained normative theory document. [Persistence authority](https://github.com/structural-explainability/se-theory-persistence/blob/819749091a538e5b69450a24b7bc121be8331b2c/README.md), [Acceptance protocol](https://github.com/structural-explainability/se-protocols-research/blob/e448eb7ff12800fa78be783260d61adaa9bb6c7b/protocols/theory-acceptance/SKILL.md)

**Alternatives.** A second canonical theory document; relying only on existing Lean and comments; or a reviewable decision record governing subsequent canonical formalization.

**Pressure case.** Exporting identifiers from Lean and checking that generated documentation repeats them verifies traceability. It cannot establish that “generated equivalence” warrants “strict persistence.”

**Recommended decision.** Use the prescribed acceptance packet and decision/human-review records to fix conceptual meaning before implementation. After acceptance, retain a single canonical formal surface and trace each approved commitment to its corresponding definition, theorem, condition or explicit exclusion.

**Justification.** Claude’s underlying fidelity concern is valid. The stronger conclusion that Lean authority makes the required order untestable is not. A reviewable specification of intended meaning can exist as acceptance evidence without becoming a competing, continuously maintained theory source.

The existing protocols and evidence mechanisms are sufficient in principle. Their existence does not prove that the required record has already been supplied for this baseline.

**Consequences.** No duplicate normative document is recommended. Correspondence review must check domains, quantifiers, polarity, assumptions and exclusions—not just matching names. Documentation may explain accepted meaning but cannot introduce stronger unformalized claims.

**Responsible repository.** Persistence, under researcher-controlled review.

**Status: RECOMMENDED.**

## D. Competing interpretations and minimal correction set

### Interpretation comparison

| Criterion | A. Generic infrastructure | B. Substantive persistence theory | C. Layered adequacy theory |
|---|---|---|---|
| Existing scope | Matches explicit generic core and downstream deferrals; headlines need narrowing | Matches strongest headline reading, but lacks supporting commitments | Fits generic core while extending its interface |
| Upstream compatibility | Preserves abstract boundaries | Must justify stages, eligibility and strictness | Makes compatibility conditional |
| Counterexamples | Forks and mixed routes are legitimate behavior | Must explain or exclude them | Must state when interpretations admit them |
| Expressiveness | Broad arbitrary carriers/dynamics | Depends on newly selected semantics | Broad, with conditional specialization |
| Dependencies | Existing taxonomy dependency sufficient | May need interpretation interfaces; direct imports not automatic | Can initially remain conceptual |
| Assumptions | Existing graph definitions | Additional substantive identity/history assumptions | Explicit adequacy assumptions |
| Downstream consequences | Consumers bear interpretation responsibility | Consumers inherit stronger commitments | Consumers discharge stated obligations |
| Minimality | Smallest scientific commitment | Largest unresolved commitment | Minimal only if restricted to necessary conditional obligations |
| Defensibility now | Supported with clear limits | Not established | Supported as a boundary recommendation; full new adequacy framework not yet established |

**Recommended smallest interpretation:** **A with explicit interpretation responsibilities**, including the conditional obligations described in D1–D4.

This can be described organizationally as a minimal layered approach, but it does not justify immediately building a new adequacy framework. If the researcher requires Persistence itself to establish strict identity, B or a substantive version of C must undergo further construction and review.

### Changes needed only if the recommendations are accepted

| Area | Minimal necessary action |
|---|---|
| Semantic commitments | Approve the generic interpretation; distinguish generated relations from strict persistence; state classification and `persist` limits; assign concrete interpretation ownership. |
| Lean formalization | No closure-definition or proof change is presently justified. Any approved auxiliary-role change or future interpretation condition must be reflected precisely. Universe generalization remains conditional on actual need. |
| Research/authority | Record decisions and later human review through the existing process. Repair the missing `[[surface]]` before `lean-public-surface` and change the build path to `lakefile.toml`. |
| Protocol adoption | No new correction at inspected HEAD: the declarations already exist. Preserve this revision distinction in later review records. |
| Documentation | Replace “symmetric closure” with “equivalence closure”; qualify identity, survival and breakage claims consistently in Lean commentary, README, manifest and citation abstract. |
| Verification | After authorized correction, run Lean build/test/lint, authority-schema and reference validation, and generated-artifact consistency checks. These verify implementation correspondence, not scientific acceptance. |

Useful regression witnesses would cover forks, merges, distinct-endpoint mixed labels, empty dynamics, and the independence of generated relations from `persist`. Existing tests already cover several related properties. Add only missing witnesses relevant to the accepted contract.

The invariant theorem needs no new proof or reinterpretation. Its module already separates preservation from completeness, and its reverse implication validly uses a predicate defined by the generated class itself. It is not an independently selected observational identity basis.

The authority manifest is **syntactically parseable TOML with incorrect structure**, not necessarily a TOML syntax failure. Parsing yields seven surfaces; the intended Lean-surface keys occur inside an authority-manifest role. This undermines machine-readable declaration of the intended boundary but does not erase the README’s authority statement.

Unnecessary expansions would include:

- Reopening Neutral Substrate or initiating Candidate 25.
- Adding a direct Neutral Substrate import solely because compatibility matters.
- Imposing universal functional or linear histories.
- Deriving every classification from effect dimensions.
- Requiring Transformation’s planned net-change results.
- Developing cross-carrier non-collapse before a comparison question exists.
- Creating a second normative document or implementing Identity Regimes now.

## E. Remaining research obligations

| Obligation | What remains unknown and why | Owner | Sufficient resolution | Baseline impact |
|---|---|---|---|---|
| **R1 — Intended baseline claim** | Sources support generic mathematics and stronger scientific vocabulary; they do not choose the final acceptance target unambiguously. | Persistence researcher | Explicit decision that the baseline supplies infrastructure, sufficient conditions, or substantive strict persistence. | **Blocks every acceptance target until stated.** |
| **R2 — Concrete strict-persistence interpretation** | No interpretation establishes bearer, settings, eligibility and scientific identity meaning. | Concrete profile owner; Persistence owns boundary statement | An independently justified criterion and carrier interpretation, with soundness and any claimed completeness. | Does not block a bounded generic baseline; blocks substantive strict-persistence claims. |
| **R3 — History and branching semantics** | Existential graph reachability does not select actuality or distinguish incompatible histories. | Concrete interpretation owner | Explicit judgment scope and worked fork, merge, copy and competing-route cases. | Conditional blocker for actual-history or strict-identity claims. |
| **R4 — Classification polarity and `persist`** | Formal behavior is known; a stronger scientific meaning for ignoring, breaking, applicability and the auxiliary set is not established. | Persistence for vocabulary; downstream owner for classified applications | Accept D3’s bounded meanings, or supply a falsifiable stronger contract. | Bounded meanings must be decided; stronger semantics may be deferred. |
| **R5 — Transformation compatibility** | No shared state-model/criterion interpretation is presently asserted. | Adapter/profile owner | Identify the common model and relation, then prove classification soundness, including any uniform taxonomy claims. | Does not block taxonomy-only infrastructure. |
| **R6 — Acceptance evidence and correspondence** | The two audits do not constitute acceptance of this newly reconciled narrowing. | Persistence researcher | Reviewable wording, assumptions, exclusions, pressure cases, traceability and later human inspection. | Blocks canonical adoption; does not require a new theory repository. |

Carrier-sensitive comparison, larger universes, additional composition laws and downstream implementations remain optional extensions. Their absence is not an unresolved dependency of the recommended generic baseline.

## F. Acceptance readiness

### READY SUBJECT TO SPECIFIED DECISIONS

The present evidence supports presenting a **narrowed infrastructure baseline** for a separate acceptance review once D1–D5’s scope, ownership and terminology decisions are explicit.

This disposition does not certify strict persistence. If the intended baseline must itself determine which eligible whole stages are the same continuing unit, further theory must establish a defensible interpretation and address eligibility, branching, histories and classification soundness before implementation.

### JUSTIFIED FROM CURRENT SOURCES

The generic closure mathematics; distinction between directed reachability and equivalence closure; label-filtered breakage; invariant characterization; limited non-collapse results; taxonomy-only integration; the documentation error; and the authority-manifest defects.

### WOULD REQUIRE NEW THEORY OR INTERFACE

A substantive bridge to strict persistence; scientifically grounded endpoint or history-relative breakage; concrete classification soundness; and any claim that selected observables completely determine substantive identity.

Neither reviewer consensus nor the finite calculations close the acceptance gate.

## G. Recommended next action

**Have the researcher decide the exact scientific assertion made by this Persistence baseline.**

The smallest proposed wording is:

> Persistence supplies generic relations generated from classified transformations. Preserving reachability and generated equivalence do not, by themselves, establish strict diachronic persistence. Breaking-labelled steps do not, by themselves, establish endpoint nonidentity. A concrete interpretation must justify its bearer, eligibility, history scope and classification soundness before making those stronger claims.

That single scope decision determines whether the next work is targeted documentation, governance and verification, or additional substantive theory construction.
