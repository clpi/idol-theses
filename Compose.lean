/-
Thesis: the composer for provably safe rewrites, in the form
that is fixed, small, and provable in core Lean with no
dependency beyond the synthesis glue in this repository.

Statement. A rewrite is a function from behavioral states to
behavioral states, a state being a list of fact codes as in
the synthesis file. A rewrite keeps the qualified filter when
every qualified state it produces is still qualified: no
regression on the qualified filter. Each rewrite carries its
own contract, a predicate on states. The interaction of two
rewrites is itself a contract: the statement that each one
preserves the contract of the other. The composer theorem
says: for a finite list of rewrites, presented as a list —
finiteness is the presentation itself, as in the quantifiable
home at its pin — if every rewrite in the list keeps the
qualified filter, and every rewrite in the list preserves
every contract in a contract list that holds the own contract
of each rewrite and the interaction contract of each pair,
then the composed run preserves the qualified filter and
every contract in the list. The composed transformation is
therefore regression-free on the qualified filter.

Two working lemmas stand beside the composer, in the exact
forms the rewrite register uses. Repetition: a rewrite whose
second application is the identity on its own output composes
with itself to itself. Exchange: two rewrites that commute
compose in either order to the same state. One concrete
exchange is proved outright: two screens commute, since a
screen is a filter and filters commute.

The standing control is a proved negation on concrete data.
Appending the code one preserves the contract that zero is
absent; appending the code zero preserves the contract that
one is absent; both keep the trivial qualified filter. Their
composition breaks the conjunction of the two contracts on
the empty state. Individual safety without a recorded
interaction therefore does not compose, and any composer
statement without the interaction premise is false.

Refutation condition. One finite list of filter-keeping,
contract-preserving rewrites whose composed run loses
qualification or a listed contract; one repetition of a
self-identity rewrite that differs from a single application;
one commuting pair whose two orders differ; one pair of
screens whose two orders differ.

Evidence state. Verified behavior: the theorems below,
checked cold by the gate in this repository on the day this
file landed, with every result inside the standard three
assumptions and none admitted.

Home. Native to this repository, for the composer form. The
family claims the composer rests on are cited, not re-proved:
compression soundness and minimum representation in the
persistence home, ordering and frontier facts in the
optimality home, venue and ordering parametricity in the
profiling home, interaction recording in the losses home,
finiteness in the quantifiable home, and the hyperlattice
vocabulary in the bidirectional record — pins in the register
that this file serves.
-/

import Synthesis

namespace Compose

/-- A rewrite: a function from states to states. -/
def step (α : Type) : Type :=
  List α → List α

/-- The qualified filter, restated from the synthesis file:
every member of the state passes the test. -/
def qualified {α : Type} (p : α → Bool) (l : List α) : Prop :=
  Synthesis.qualified p l

/-- A rewrite keeps the qualified filter: qualified input,
qualified output. This is regression-freedom on the filter. -/
def keeps {α : Type} (p : α → Bool) (f : step α) : Prop :=
  ∀ l, qualified p l → qualified p (f l)

/-- A rewrite guards a contract on the qualified filter:
qualified input that meets the contract maps to output that
still meets it. The own contract of a rewrite and the
interaction contract of a pair both take this form. -/
def guards {α : Type} (p : α → Bool) (f : step α)
    (c : List α → Prop) : Prop :=
  ∀ l, qualified p l → c l → c (f l)

/-- The composed run of a finite list of rewrites, applied
in list order. -/
def run {α : Type} : List (step α) → List α → List α
  | [], l => l
  | f :: rest, l => run rest (f l)

/-- The composer theorem. Under the keeping premise and the
guarding premise — the guarding premise quantified over the
whole contract list is exactly the requirement that every
interaction is a recorded contract preserved by both sides —
the composed run keeps the qualified filter and preserves
every contract in the list. -/
theorem compose {α : Type} {p : α → Bool}
    {fs : List (step α)} {cs : List (List α → Prop)}
    (hk : ∀ f ∈ fs, keeps p f)
    (hg : ∀ f ∈ fs, ∀ c ∈ cs, guards p f c) :
    ∀ l, qualified p l → (∀ c ∈ cs, c l) →
      qualified p (run fs l) ∧ ∀ c ∈ cs, c (run fs l) := by
  induction fs with
  | nil =>
    intro l hq hc
    exact ⟨hq, hc⟩
  | cons f rest ih =>
    intro l hq hc
    have hkf : keeps p f := hk f List.mem_cons_self
    have hkr : ∀ g ∈ rest, keeps p g :=
      fun g hmem => hk g (List.mem_cons_of_mem f hmem)
    have hgf : ∀ c ∈ cs, guards p f c :=
      fun c hcm => hg f List.mem_cons_self c hcm
    have hgr : ∀ g ∈ rest, ∀ c ∈ cs, guards p g c :=
      fun g hmem c hcm => hg g (List.mem_cons_of_mem f hmem) c hcm
    have hq1 : qualified p (f l) := hkf l hq
    have hc1 : ∀ c ∈ cs, c (f l) :=
      fun c hcm => hgf c hcm l hq (hc c hcm)
    exact ih hkr hgr (f l) hq1 hc1

/-- The pair form of the composer, stated with the four
guarding facts named one by one: each rewrite guards its own
contract, and each guards the contract of the other — the
second pair of facts is the recorded interaction. -/
theorem pair {α : Type} {p : α → Bool} {f g : step α}
    {cf cg : List α → Prop}
    (hkf : keeps p f) (hkg : keeps p g)
    (hff : guards p f cf) (hfg : guards p f cg)
    (hgf : guards p g cf) (hgg : guards p g cg) :
    ∀ l, qualified p l → cf l → cg l →
      qualified p (run [f, g] l) ∧ cf (run [f, g] l) ∧
        cg (run [f, g] l) := by
  intro l hq hcf hcg
  have hq1 : qualified p (f l) := hkf l hq
  have hc1 : cf (f l) := hff l hq hcf
  have hd1 : cg (f l) := hfg l hq hcg
  exact ⟨hkg (f l) hq1, hgf (f l) hq1 hc1, hgg (f l) hq1 hd1⟩

/-- Repetition, as a predicate: the second application of a
rewrite is the identity on its own output. -/
def idem {α : Type} (f : step α) : Prop :=
  ∀ l, f (f l) = f l

/-- The repetition lemma: composing a rewrite of that form
with itself is the single application. -/
theorem idem.run {α : Type} {f : step α} (h : idem f) (l : List α) :
    run [f, f] l = f l :=
  h l

/-- Exchange, as a predicate: two rewrites commute. -/
def comm {α : Type} (f g : step α) : Prop :=
  ∀ l, f (g l) = g (f l)

/-- The exchange lemma: a commuting pair composes in either
order to the same state, so premise-disjoint derivations may
be reordered freely. -/
theorem comm.run {α : Type} {f g : step α} (h : comm f g)
    (l : List α) : run [f, g] l = run [g, f] l :=
  (h l).symm

/-- Screens commute: filtering by one test and then another
gives the same state in either order. -/
theorem screen.comm {α : Type} {p q : α → Bool} (l : List α) :
    Synthesis.screen p (Synthesis.screen q l) =
      Synthesis.screen q (Synthesis.screen p l) := by
  show List.filter p (List.filter q l) =
    List.filter q (List.filter p l)
  rw [List.filter_filter, List.filter_filter]
  congr 1
  funext a
  cases p a <;> cases q a <;> rfl

/-- Screens are repetition-safe: screening twice by the same
test is screening once. -/
theorem screen.idem {α : Type} {p : α → Bool} (l : List α) :
    Synthesis.screen p (Synthesis.screen p l) =
      Synthesis.screen p l := by
  show List.filter p (List.filter p l) = List.filter p l
  rw [List.filter_filter]
  congr 1
  funext a
  cases p a <;> rfl

/- The control witnesses, as projections of one home: the
first appends the code one, the second appends the code
zero. -/
namespace push

/-- Control witness, first rewrite: append the code one. -/
def one (l : List Nat) : List Nat :=
  l ++ [1]

/-- Control witness, second rewrite: append the code zero. -/
def zero (l : List Nat) : List Nat :=
  l ++ [0]

end push

/- The control contracts, as projections of one home: the
first says the code zero is absent, the second says the
code one is absent. -/
namespace absent

/-- Control contract of the first rewrite: zero is absent. -/
def zero (l : List Nat) : Prop :=
  0 ∉ l

/-- Control contract of the second rewrite: one is absent. -/
def one (l : List Nat) : Prop :=
  1 ∉ l

end absent

/-- The trivial test: every code passes, so every state is
qualified and every rewrite keeps this filter. -/
def all : Nat → Bool :=
  fun _ => true

/-- The standing control. Each control rewrite keeps the
trivial qualified filter and guards its own contract, yet
the composition breaks the conjunction of the two contracts
on the empty state. The interaction premise of the composer
is therefore load-bearing: without it, the composed contract
does not follow. -/
theorem control :
    keeps all push.one ∧ keeps all push.zero ∧
    guards all push.one absent.zero ∧
    guards all push.zero absent.one ∧
    ¬ (absent.zero (run [push.one, push.zero] []) ∧
      absent.one (run [push.one, push.zero] [])) := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · intro l _ x _
    rfl
  · intro l _ x _
    rfl
  · intro l _ h hmem
    cases List.mem_append.mp hmem with
    | inl h1 => exact h h1
    | inr h1 =>
      simp at h1
  · intro l _ h hmem
    cases List.mem_append.mp hmem with
    | inl h1 => exact h h1
    | inr h1 =>
      simp at h1
  · intro h
    exact h.2 (by decide)

end Compose
