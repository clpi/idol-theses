/-
Thesis: the composition glue of the behavioral hypergraph
campaign, in the forms that are fixed, small, and provable in
core Lean with no dependency.

Statement. A behavioral state is a list of fact codes; the join
of two states is their append, and the hyperlattice order is
membership inclusion. Three filters act on states and on the
lists that present them: the possible filter (membership in the
presented list), the observed filter (a screen by a boolean
test), and the qualified filter (every member passes the test).
The glue forms are:

- Growth: a member of either part of a join is a member of the
  join. Append only grows a state; nothing already present is
  lost by joining.
- Screen growth: a member that passes a screen over one part
  still passes the same screen over the joined list. Filtering
  is monotone under append-only joins.
- Nesting: a member that passes two screens in sequence passes
  the second screen alone. The qualified filter sits inside the
  observed filter, which sits inside the possible filter.
- Qualification of a join, concrete form: when every member of
  each part passes the test, every member of the join passes.
- Qualification of a join, premise form: for any state
  predicate that is closed under joins — the premise named, not
  hidden — the join of two qualified states is qualified.
- Restriction: a state all of whose joined members pass the
  test already passes on each part alone.

Refutation condition. One join that drops a member of a part;
one screened member lost by appending a second list; one
doubly screened member that fails the second screen alone; one
pair of fully passing lists whose join has a failing member;
one join-closed predicate with two qualified states whose join
is unqualified; one fully passing join with a failing part.

Evidence state. Verified behavior: the theorems below, checked
by the gate in this repository.

Home. Native to this repository, for these glue forms. The
family claims these forms compose are cited, not re-proved:
see the cited registry.
-/

namespace Synthesis

/-- Growth, left part: a member of the first state is a member
of the join. -/
theorem grows.left {α : Type} {a b : List α} {x : α}
    (h : x ∈ a) : x ∈ a ++ b :=
  List.mem_append_left b h

/-- Growth, right part: a member of the second state is a
member of the join. -/
theorem grows.right {α : Type} {a b : List α} {x : α}
    (h : x ∈ b) : x ∈ a ++ b :=
  List.mem_append_right a h

/-- The observed filter: the members of a list that pass a
boolean test. -/
def screen {α : Type} (p : α → Bool) (l : List α) : List α :=
  l.filter p

/-- Screen growth: filtering is monotone under append-only
joins. -/
theorem screen.grows {α : Type} {p : α → Bool} {a b : List α}
    {x : α} (h : x ∈ screen p a) : x ∈ screen p (a ++ b) := by
  obtain ⟨h1, h2⟩ := List.mem_filter.mp h
  exact List.mem_filter.mpr ⟨List.mem_append_left b h1, h2⟩

/-- Nesting: a member passing two screens in sequence passes
the second screen alone. -/
theorem screen.inside {α : Type} {p q : α → Bool} {l : List α}
    {x : α} (h : x ∈ screen p (screen q l)) : x ∈ screen q l := by
  obtain ⟨h1, -⟩ := List.mem_filter.mp h
  exact h1

/-- The qualified filter, as a predicate on states: every
member passes the test. -/
def qualified {α : Type} (p : α → Bool) (l : List α) : Prop :=
  ∀ x ∈ l, p x = true

/-- Qualification of a join, concrete form: the join of two
qualified states is qualified. -/
theorem qualified.join {α : Type} {p : α → Bool} {a b : List α}
    (ha : qualified p a) (hb : qualified p b) :
    qualified p (a ++ b) := by
  intro x hx
  cases List.mem_append.mp hx with
  | inl hx => exact ha x hx
  | inr hx => exact hb x hx

/-- Restriction: a qualified join restricts to a qualified
first part. -/
theorem qualified.left {α : Type} {p : α → Bool} {a b : List α}
    (h : qualified p (a ++ b)) : qualified p a :=
  fun x hx => h x (List.mem_append_left b hx)

/-- Join closure, as a named premise on a state predicate. -/
def closed {α : Type} (q : List α → Prop) : Prop :=
  ∀ a b, q a → q b → q (a ++ b)

/-- Qualification of a join, premise form: under the named
join-closure premise, the join of two qualified states is
qualified. -/
theorem closed.join {α : Type} {q : List α → Prop} {a b : List α}
    (h : closed q) (ha : q a) (hb : q b) : q (a ++ b) :=
  h a b ha hb

end Synthesis
