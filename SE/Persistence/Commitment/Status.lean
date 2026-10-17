module

public import SE.Persistence.Commitment.Consistency

set_option autoImplicit false

/-!
# Commitment Status

SE.Persistence.Commitment.Status

What consistent commitments `(P, D)` say about a further pair `(x, y)`:

- `Required`: `x` and `y` are identical in every admissible identity relation;
- `Forbidden`: `x` and `y` are distinct in every admissible identity relation;
- `Undetermined`: some admissible relation identifies them and some separates
  them.

The definitions are syntactic, and the theorems show they coincide with the
semantic readings above. A new distinction can therefore be forced although
nobody asserted it: if `a` and `b` are identical and `a` and `c` are distinct,
then `b` and `c` are forbidden to be identical.

This calculus uses equivalence laws only. It assumes no limit on the number of
individuals. `SE.Persistence.Commitment.Interpretation` adds extra constraints,
such as a class limit from `SE.Persistence.Commitment.Cardinality`.
-/

namespace SE.Persistence

@[expose] public section

variable {C : Type}

-- RR.DEFINES: PS.DEF.EXTEND
/-- `P` together with one further asserted pair `(a, b)`. -/
def Extend (P : C → C → Prop) (a b : C) : C → C → Prop :=
  fun x y => P x y ∨ (x = a ∧ y = b)

-- RR.DEFINES: PS.DEF.REQUIRED
/-- `x` and `y` are required to be identical: they are generated-identical. -/
def Required (P : C → C → Prop) (x y : C) : Prop :=
  Generated P x y

-- RR.DEFINES: PS.DEF.FORBIDDEN
/--
`x` and `y` are forbidden to be identical: asserting them identical would
generate identity between some pair asserted distinct.
-/
def Forbidden (P D : C → C → Prop) (x y : C) : Prop :=
  ∃ u v, D u v ∧ Generated (Extend P x y) u v

-- RR.DEFINES: PS.DEF.UNDETERMINED
/-- Neither required nor forbidden. -/
def Undetermined (P D : C → C → Prop) (x y : C) : Prop :=
  ¬ Required P x y ∧ ¬ Forbidden P D x y

/-- Extending by a pair makes that pair generated-identical. -/
theorem generated_extend_self (P : C → C → Prop) (a b : C) :
    Generated (Extend P a b) a b :=
  Generated.rel (Or.inr ⟨rfl, rfl⟩)

/-- Extending keeps every earlier asserted pair. -/
theorem generated_extend_of_generated {P : C → C → Prop} {a b x y : C}
    (h : Generated P x y) : Generated (Extend P a b) x y :=
  Generated.mono (fun _ _ hp => Or.inl hp) h

/-- An admissible relation that identifies `a` and `b` contains the extension. -/
theorem generated_extend_le {P D E : C → C → Prop} {a b : C}
    (hE : Admissible P D E) (hab : E a b) {x y : C}
    (h : Generated (Extend P a b) x y) : E x y := by
  refine Generated.le_of_equivalence hE.1 ?_ h
  intro u v huv
  rcases huv with hp | ⟨rfl, rfl⟩
  · exact hE.2.1 u v hp
  · exact hab

-- RR.DEFINES: PS.THM.REQUIRED_IFF_ALL_ADMISSIBLE
/--
Under consistent commitments, a pair is required exactly when every admissible
identity relation identifies it.
-/
theorem required_iff_forall_admissible {P D : C → C → Prop}
    (hc : Consistent P D) {x y : C} :
    Required P x y ↔ ∀ E, Admissible P D E → E x y := by
  constructor
  · intro h E hE
    exact Generated.le_of_equivalence hE.1 hE.2.1 h
  · intro h
    exact h (Generated P) (admissible_generated_of_consistent hc)

-- RR.DEFINES: PS.THM.FORBIDDEN_IFF_ALL_ADMISSIBLE
/--
A pair is forbidden exactly when every admissible identity relation separates
it. This holds without assuming the commitments are consistent: if none is, both
sides are true.
-/
theorem forbidden_iff_forall_admissible {P D : C → C → Prop} {x y : C} :
    Forbidden P D x y ↔ ∀ E, Admissible P D E → ¬ E x y := by
  constructor
  · rintro ⟨u, v, hD, hg⟩ E hE hxy
    exact hE.2.2 u v hD (generated_extend_le hE hxy hg)
  · intro h
    refine Classical.byContradiction fun hnf => ?_
    have hcons : Consistent (Extend P x y) D := fun u v hD hg => hnf ⟨u, v, hD, hg⟩
    exact h (Generated (Extend P x y))
      ⟨Generated.equivalence _,
        fun a b hp => Generated.rel (Or.inl hp), hcons⟩
      (generated_extend_self P x y)

-- RR.DEFINES: PS.THM.UNDETERMINED_IFF
/--
Under consistent commitments, a pair is undetermined exactly when one
admissible relation identifies it and another separates it.
-/
theorem undetermined_iff {P D : C → C → Prop} (hc : Consistent P D) {x y : C} :
    Undetermined P D x y ↔
      (∃ E, Admissible P D E ∧ E x y) ∧ (∃ E, Admissible P D E ∧ ¬ E x y) := by
  unfold Undetermined
  rw [required_iff_forall_admissible hc, forbidden_iff_forall_admissible]
  constructor
  · rintro ⟨hr, hf⟩
    constructor
    · refine Classical.byContradiction fun hno => hf ?_
      intro E hE hxy
      exact hno ⟨E, hE, hxy⟩
    · refine Classical.byContradiction fun hno => hr ?_
      intro E hE
      refine Classical.byContradiction fun hn => hno ⟨E, hE, hn⟩
  · rintro ⟨⟨E₁, hE₁, h₁⟩, ⟨E₂, hE₂, h₂⟩⟩
    exact ⟨fun h => h₂ (h E₂ hE₂), fun h => h E₁ hE₁ h₁⟩

-- RR.DEFINES: PS.THM.NOT_REQUIRED_AND_FORBIDDEN
/-- Under consistent commitments, no pair is both required and forbidden. -/
theorem not_required_and_forbidden {P D : C → C → Prop} (hc : Consistent P D)
    {x y : C} : ¬ (Required P x y ∧ Forbidden P D x y) := by
  rintro ⟨hr, hf⟩
  exact (forbidden_iff_forall_admissible.1 hf) (Generated P)
    (admissible_generated_of_consistent hc) hr

-- RR.DEFINES: PS.THM.REQUIRED_MONO
/-- Adding same-commitments keeps every requirement. -/
theorem required_mono {P P' : C → C → Prop} (h : ∀ x y, P x y → P' x y)
    {x y : C} (hr : Required P x y) : Required P' x y :=
  Generated.mono h hr

-- RR.DEFINES: PS.THM.FORBIDDEN_MONO
/--
Adding same-commitments or distinct-commitments keeps every prohibition.
Statuses only resolve as commitments grow, until the commitments become
inconsistent.
-/
theorem forbidden_mono {P P' D D' : C → C → Prop}
    (hP : ∀ x y, P x y → P' x y) (hD : ∀ x y, D x y → D' x y) {x y : C}
    (hf : Forbidden P D x y) : Forbidden P' D' x y := by
  obtain ⟨u, v, hd, hg⟩ := hf
  refine ⟨u, v, hD u v hd, Generated.mono ?_ hg⟩
  intro a b hab
  rcases hab with hp | hq
  · exact Or.inl (hP a b hp)
  · exact Or.inr hq

-- RR.DEFINES: PS.THM.FORBIDDEN_OF_DISTINCT
/-- A pair asserted distinct is forbidden to be identical. -/
theorem forbidden_of_distinct {P D : C → C → Prop} {x y : C} (h : D x y) :
    Forbidden P D x y :=
  ⟨x, y, h, generated_extend_self P x y⟩

-- RR.DEFINES: PS.THM.FORBIDDEN_OF_REQUIRED_OF_DISTINCT
/--
A forced distinction. If `a` and `b` are required identical and `a` and `c`
are asserted distinct, then `b` and `c` are forbidden to be identical, though
no one asserted it.
-/
theorem forbidden_of_required_of_distinct {P D : C → C → Prop} {a b c : C}
    (hab : Required P a b) (hac : D a c) : Forbidden P D b c :=
  ⟨a, c, hac,
    Generated.trans (generated_extend_of_generated hab)
      (generated_extend_self P b c)⟩

end

end SE.Persistence
