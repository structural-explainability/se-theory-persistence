/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Commitment.Status

set_option autoImplicit false

/-!
# Branching

SE.Persistence.Commitment.Branching

Forks and merges under equivalence laws.

Identity is an equivalence relation, so two asserted-same pairs that share an
endpoint make the other two endpoints identical:

- fork: `a` continues as `b` and as `c`, so `b` and `c` are identical;
- merge: `a` continues into `c` and `b` continues into `c`, so `a` and `b` are
  identical.

If the kind of individual concerned keeps `b` and `c` (or `a` and `b`)
distinct, the fork (or merge) cannot be asserted as identity-preserving on both
branches. Which branch continues is then not decided by the equivalence laws.
Something outside them must choose: a designation, a locus, an authority; or
neither continues; or the two are related by derivation without identity,
which is a different relation (see `SE.Persistence.Relation.Survival`, where
survival is directed and the identity relation is its symmetric closure).

The two obstructions have the same logical shape. Whether splitting and merging
differ in how they are discovered or refuted is a matter of evidence, not of
these laws.
-/

namespace SE.Persistence

@[expose] public section

variable {C : Type}

-- RR.DEFINES: PS.THM.FORK_SIBLINGS_GENERATED
/-- Two successors of one state are generated-identical. -/
theorem fork_siblings_generated {P : C → C → Prop} {a b c : C}
    (hb : P a b) (hc : P a c) : Generated P b c :=
  Generated.trans (Generated.symm (Generated.rel hb)) (Generated.rel hc)

-- RR.DEFINES: PS.THM.MERGE_SIBLINGS_GENERATED
/-- Two predecessors of one state are generated-identical. -/
theorem merge_siblings_generated {P : C → C → Prop} {a b c : C}
    (ha : P a c) (hb : P b c) : Generated P a b :=
  Generated.trans (Generated.rel ha) (Generated.symm (Generated.rel hb))

-- RR.DEFINES: PS.THM.NOT_DISTINCT_OF_FORK
/--
Under consistent commitments, successors of a fork that are both asserted
identity-preserving are not asserted distinct.
-/
theorem not_distinct_of_fork {P D : C → C → Prop} (hc : Consistent P D)
    {a b c : C} (hb : P a b) (hc' : P a c) : ¬ D b c :=
  fun hd => hc b c hd (fork_siblings_generated hb hc')

-- RR.DEFINES: PS.THM.NOT_DISTINCT_OF_MERGE
/--
Under consistent commitments, predecessors of a merge that both continue into
the result are not asserted distinct.
-/
theorem not_distinct_of_merge {P D : C → C → Prop} (hc : Consistent P D)
    {a b c : C} (ha : P a c) (hb : P b c) : ¬ D a b :=
  fun hd => hc a b hd (merge_siblings_generated ha hb)

-- RR.DEFINES: PS.THM.FORK_BRANCH_FORBIDDEN
/--
Given a preserving step from `a` to `b` and a distinction between `b` and `c`,
asserting `a` to `c` as preserving is forbidden.
-/
theorem fork_branch_forbidden {P D : C → C → Prop} {a b c : C}
    (hb : P a b) (hd : D b c) : Forbidden P D a c :=
  ⟨b, c, hd,
    Generated.trans
      (Generated.symm (generated_extend_of_generated (Generated.rel hb)))
      (generated_extend_self P a c)⟩

end

end SE.Persistence
