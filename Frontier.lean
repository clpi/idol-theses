/-
Thesis: the frontier forms the family homes do not carry.

Statement. The frontier of a named finite candidate list, under a
named set of cost axes, is the set of its members that no member
strictly dominates. The homes cited in the registry prove the
frontier exact against its definition, the certified frontier and
its coverage, the completeness of the strict frontier, and the
bounds-level theory. Three forms stand outside that inventory:

- Coverage by the frontier: every member of the list is either on
  the frontier or strictly dominated by a frontier member. (The
  general-Pareto home proves this for its interval form; the plain
  list form over cost functions is proved here.)
- Stability: the frontier of the frontier is the frontier. A
  second pass changes nothing.
- Extension: a frontier member that no member of an added list
  strictly dominates stays on the frontier of the joined list.

Refutation condition. One named list and axis set with a member
neither on the frontier nor dominated by any frontier member; one
list whose frontier changes under a second pass; one frontier
member, undominated by every added member, that falls off the
frontier of the joined list.

Evidence state. Verified behavior: the theorems below, checked
by the gate in this repository.

Home. Native to this repository, for these three forms. The
remaining frontier theory is cited, not re-proved: see the
pareto entry of the cited registry.
-/

namespace Frontier

/-- The cost of a candidate, one value per axis; axes are named
by a finite list of axis names. -/
abbrev Cost := Nat → Nat

/-- Weak dominance on the named axes: no axis worse. -/
def weak (axes : List Nat) (a b : Cost) : Prop :=
  ∀ i ∈ axes, a i ≤ b i

/-- Strict dominance: weak, and strictly better on one named
axis. -/
def strict (axes : List Nat) (a b : Cost) : Prop :=
  weak axes a b ∧ ∃ i ∈ axes, a i < b i

/-- The total cost over the named axes. -/
def total (axes : List Nat) (a : Cost) : Nat :=
  axes.foldr (fun i s => a i + s) 0

theorem total.mono {axes : List Nat} {a b : Cost}
    (h : weak axes a b) : total axes a ≤ total axes b := by
  induction axes with
  | nil => exact Nat.le_refl 0
  | cons i axes ih =>
    show a i + total axes a ≤ b i + total axes b
    exact Nat.add_le_add (h i (List.mem_cons.mpr (Or.inl rfl)))
      (ih (fun j hj => h j (List.mem_cons_of_mem i hj)))

theorem total.lt {axes : List Nat} {a b : Cost}
    (h : strict axes a b) : total axes a < total axes b := by
  induction axes with
  | nil =>
    obtain ⟨_, j, hj, _⟩ := h
    nomatch hj
  | cons i axes ih =>
    obtain ⟨hw, j, hj, hlt⟩ := h
    show a i + total axes a < b i + total axes b
    cases List.mem_cons.mp hj with
    | inl hji =>
      have hlt' : a i < b i := hji ▸ hlt
      exact Nat.add_lt_add_of_lt_of_le hlt'
        (total.mono (fun k hk => hw k (List.mem_cons_of_mem i hk)))
    | inr hj =>
      exact Nat.add_lt_add_of_le_of_lt
        (hw i (List.mem_cons.mpr (Or.inl rfl)))
        (ih ⟨fun k hk => hw k (List.mem_cons_of_mem i hk), j, hj, hlt⟩)

theorem strict.trans {axes : List Nat} {a b c : Cost}
    (h1 : strict axes a b) (h2 : strict axes b c) :
    strict axes a c := by
  obtain ⟨hw1, i, hi, hlt⟩ := h1
  exact ⟨fun j hj => Nat.le_trans (hw1 j hj) (h2.1 j hj), i, hi,
    Nat.lt_of_lt_of_le hlt (h2.1 i hi)⟩

/-- Dominance as a decidable test, by the named axes. -/
def dominates (axes : List Nat) (a b : Cost) : Bool :=
  axes.all (fun i => a i ≤ b i) && axes.any (fun i => a i < b i)

theorem dominates.iff {axes : List Nat} {a b : Cost} :
    dominates axes a b = true ↔ strict axes a b := by
  constructor
  · intro h
    simp only [dominates, Bool.and_eq_true, List.all_eq_true,
      List.any_eq_true, decide_eq_true_eq] at h
    exact ⟨fun i hi => h.1 i hi, h.2⟩
  · intro h
    simp only [dominates, Bool.and_eq_true, List.all_eq_true,
      List.any_eq_true, decide_eq_true_eq]
    exact ⟨fun i hi => h.1 i hi, h.2⟩

/-- The frontier: the members of the list that no member of the
list strictly dominates. -/
def frontier (axes : List Nat) (l : List Cost) : List Cost :=
  l.filter (fun x => l.all (fun y => !(dominates axes y x)))

theorem mem.frontier {axes : List Nat} {l : List Cost} {x : Cost} :
    x ∈ frontier axes l ↔
      x ∈ l ∧ ∀ y ∈ l, ¬ strict axes y x := by
  constructor
  · intro h
    obtain ⟨h1, h2⟩ := List.mem_filter.mp h
    refine ⟨h1, fun y hy hs => ?_⟩
    have hall := (List.all_eq_true.mp h2) y hy
    have hd : dominates axes y x = true := dominates.iff.mpr hs
    simp [hd] at hall
  · intro h
    refine List.mem_filter.mpr
      ⟨h.1, List.all_eq_true.mpr (fun y hy => ?_)⟩
    by_cases hd : dominates axes y x = true
    · exact absurd hd (fun ht => h.2 y hy (dominates.iff.mp ht))
    · cases hdy : dominates axes y x with
      | false => rfl
      | true => exact absurd hdy hd

private theorem covered.step {axes : List Nat} {l : List Cost} :
    ∀ (n : Nat) (x : Cost), total axes x ≤ n → x ∈ l →
      x ∈ frontier axes l ∨
        ∃ y ∈ frontier axes l, strict axes y x := by
  intro n
  induction n with
  | zero =>
    intro x hn hx
    by_cases hd : ∃ y ∈ l, strict axes y x
    · obtain ⟨y, hy, hsy⟩ := hd
      have hlt := total.lt hsy
      omega
    · exact Or.inl (mem.frontier.mpr
        ⟨hx, fun y hy hs => hd ⟨y, hy, hs⟩⟩)
  | succ n ih =>
    intro x hn hx
    by_cases hd : ∃ y ∈ l, strict axes y x
    · obtain ⟨y, hy, hsy⟩ := hd
      have hlt : total axes y ≤ n := by
        have h1 := total.lt hsy
        omega
      cases ih y hlt hy with
      | inl h1 => exact Or.inr ⟨y, h1, hsy⟩
      | inr h2 =>
        obtain ⟨z, hz, hsz⟩ := h2
        exact Or.inr ⟨z, hz, strict.trans hsz hsy⟩
    · exact Or.inl (mem.frontier.mpr
        ⟨hx, fun y hy hs => hd ⟨y, hy, hs⟩⟩)

/-- Coverage: every member is on the frontier, or is strictly
dominated by a frontier member. -/
theorem covered {axes : List Nat} {l : List Cost} {x : Cost}
    (hx : x ∈ l) :
    x ∈ frontier axes l ∨
      ∃ y ∈ frontier axes l, strict axes y x :=
  covered.step (total axes x) x (Nat.le_refl _) hx

/-- Stability: a second pass over the frontier changes nothing. -/
theorem again {axes : List Nat} {l : List Cost} {x : Cost} :
    x ∈ frontier axes (frontier axes l) ↔ x ∈ frontier axes l := by
  constructor
  · intro h
    exact (mem.frontier.mp h).1
  · intro h
    rw [mem.frontier] at h ⊢
    exact ⟨mem.frontier.mpr h,
      fun y hy hs => h.2 y (mem.frontier.mp hy).1 hs⟩

/-- Extension: a frontier member that no added member strictly
dominates stays on the frontier of the joined list. -/
theorem kept {axes : List Nat} {l₁ l₂ : List Cost} {x : Cost}
    (h : x ∈ frontier axes l₁)
    (hnd : ∀ y ∈ l₂, ¬ strict axes y x) :
    x ∈ frontier axes (l₁ ++ l₂) := by
  rw [mem.frontier] at h ⊢
  refine ⟨List.mem_append_left l₂ h.1, fun y hy hs => ?_⟩
  cases List.mem_append.mp hy with
  | inl hy => exact h.2 y hy hs
  | inr hy => exact hnd y hy hs

end Frontier
