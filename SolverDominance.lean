/- Solver dominance on the contract axes, proven.

   The setting is the solver contract of the qualification
   design: a named finite snapshot, ground Horn rules, a seed,
   and the least fixed point of the closure step. States are
   characteristic functions into Bool over a finite universe
   carried as a list. Everything in this file is proved from
   the definitions. The stronger external fact about the
   infinite setting — that the general constrained Horn clause
   problem is undecidable — is established mathematics, cited
   in the record and never reproven here; the separation this
   file itself proves is the elementary one it needs: over an
   infinite universe no uniform finite step bound exists,
   while over a finite universe the bound is the universe
   size. The incremental exactness the re-derivation axis
   rests on is cited to HypergraphIncremental in the sibling
   repository software-optimality at its pin; it is not
   reproven here. The Pareto definition the assembly
   instantiates is the topology program's: a point is
   dominated when a stronger state is reachable at no worse
   cost on the other axes. -/

namespace SolverDominance

variable {α : Type}

/-- Pointwise order on states: the knowledge order. -/
def Le (s t : α → Bool) : Prop := ∀ x, s x = true → t x = true

theorem le_refl (s : α → Bool) : Le s s := fun _ hx => hx

theorem le_trans {s t u : α → Bool} (h₁ : Le s t) (h₂ : Le t u) :
    Le s u := fun x hx => h₂ x (h₁ x hx)

/-- A state is supported on a universe list when it is false
    outside the list. -/
def Supported (U : List α) (s : α → Bool) : Prop :=
  ∀ x, x ∉ U → s x = false

/-- The count of true points inside the universe list. -/
def countTrue : List α → (α → Bool) → Nat
  | [], _ => 0
  | a :: U, s => (if s a then 1 else 0) + countTrue U s

theorem countTrue_le_length : ∀ (U : List α) (s : α → Bool),
    countTrue U s ≤ U.length := by
  intro U
  induction U with
  | nil => intro s; exact Nat.zero_le _
  | cons a U ih =>
    intro s
    simp only [countTrue, List.length_cons]
    have h := ih s
    by_cases ha : s a = true
    · rw [if_pos ha]; omega
    · rw [if_neg ha]; omega

theorem countTrue_mono {s t : α → Bool} (h : Le s t) :
    ∀ (U : List α), countTrue U s ≤ countTrue U t := by
  intro U
  induction U with
  | nil => exact Nat.zero_le _
  | cons a U ih =>
    simp only [countTrue]
    by_cases ha : s a = true
    · rw [if_pos ha, if_pos (h a ha)]; omega
    · rw [if_neg ha]
      by_cases hb : t a = true
      · rw [if_pos hb]; omega
      · rw [if_neg hb]; omega

theorem countTrue_strict {s t : α → Bool} (h : Le s t) {x : α}
    (hs : s x = false) (ht : t x = true) :
    ∀ (U : List α), x ∈ U → countTrue U s < countTrue U t := by
  intro U
  induction U with
  | nil => intro hx; simp at hx
  | cons a U ih =>
    intro hx
    simp only [countTrue]
    have hmono := countTrue_mono h U
    obtain rfl | hx' := List.mem_cons.mp hx
    · rw [if_neg (by simp [hs]), if_pos ht]; omega
    · have ih' := ih hx'
      by_cases ha : s a = true
      · rw [if_pos ha, if_pos (h a ha)]; omega
      · rw [if_neg ha]
        by_cases hb : t a = true
        · rw [if_pos hb]; omega
        · rw [if_neg hb]; omega

/-- The Kleene chain of an operator from the bottom state. -/
def chain (F : (α → Bool) → (α → Bool)) : Nat → (α → Bool)
  | 0 => fun _ => false
  | n + 1 => F (chain F n)

theorem chain_succ (F : (α → Bool) → (α → Bool)) (n : Nat) :
    chain F (n + 1) = F (chain F n) := rfl

/-- Monotonicity of an operator, in the knowledge order. -/
def Mono (F : (α → Bool) → (α → Bool)) : Prop :=
  ∀ s t, Le s t → Le (F s) (F t)

/-- The operator stays inside the universe: supported inputs
    give supported outputs. -/
def Confined (U : List α) (F : (α → Bool) → (α → Bool)) : Prop :=
  ∀ s, Supported U s → Supported U (F s)

theorem chain_supported {U : List α} {F : (α → Bool) → (α → Bool)}
    (hF : Confined U F) : ∀ n, Supported U (chain F n) := by
  intro n
  induction n with
  | zero => intro x _; rfl
  | succ n ih => exact hF _ ih

theorem chain_mono_step {F : (α → Bool) → (α → Bool)} (hF : Mono F) :
    ∀ n, Le (chain F n) (chain F (n + 1)) := by
  intro n
  induction n with
  | zero => intro x hx; simp [chain] at hx
  | succ n ih =>
    rw [chain_succ, chain_succ]
    exact hF _ _ ih

theorem chain_le_prefix {F : (α → Bool) → (α → Bool)} (hF : Mono F) :
    ∀ (n : Nat) (s : α → Bool), Le (F s) s → Le (chain F n) s := by
  intro n
  induction n with
  | zero => intro s _ x hx; simp [chain] at hx
  | succ n ih =>
    intro s hs
    rw [chain_succ]
    exact fun x hx => hs x (hF _ _ (ih s hs) x hx)

theorem ne_point {s t : α → Bool} (h : Le s t) (hne : s ≠ t) :
    ∃ x, s x = false ∧ t x = true := by
  apply Classical.byContradiction
  intro hc
  have hc' : ∀ x, s x = false → t x ≠ true :=
    fun x hs htx => hc ⟨x, hs, htx⟩
  apply hne
  funext x
  by_cases hx : s x = true
  · have ht := h x hx
    simp [hx, ht]
  · have hs : s x = false := by
      cases h2 : s x with
      | false => rfl
      | true => exact absurd h2 hx
    have ht : t x = false := by
      have hnt := hc' x hs
      cases h2 : t x with
      | false => rfl
      | true => exact absurd h2 hnt
    simp [hs, ht]

/-- The bounded fixed point theorem. On a finite universe the
    chain from bottom reaches a fixed point within as many
    steps as the universe has elements: each step that is not
    a fixed point strictly raises the count of true points,
    and the count is bounded by the universe. This is the
    finite collapse of the Knaster-Tarski and Kleene contrast:
    no transfinite iteration and no continuity side condition
    is needed, because directed suprema in a finite lattice
    are attained (proved below as directed_attains). -/
theorem exists_fixed_within {U : List α} {F : (α → Bool) → (α → Bool)}
    (hFm : Mono F) (hFc : Confined U F) :
    ∃ k ≤ U.length, F (chain F k) = chain F k := by
  apply Classical.byContradiction
  intro hcon
  have hcon' : ∀ k, k ≤ U.length → F (chain F k) ≠ chain F k :=
    fun k hk he => hcon ⟨k, hk, he⟩
  have hwit : ∀ k, k ≤ U.length → ∃ x ∈ U, (chain F k) x = false ∧
      (chain F (k + 1)) x = true := by
    intro k hk
    have hne : chain F k ≠ chain F (k + 1) := by
      have h := hcon' k hk
      rw [chain_succ]
      exact fun he => h he.symm
    obtain ⟨x, hs, ht⟩ := ne_point (chain_mono_step hFm k) hne
    have hxU : x ∈ U := by
      apply Classical.byContradiction
      intro hnot
      have h2 := chain_supported hFc (k + 1) x hnot
      rw [h2] at ht
      simp at ht
    exact ⟨x, hxU, hs, ht⟩
  have hgrow : ∀ k, k ≤ U.length + 1 → k ≤ countTrue U (chain F k) := by
    intro k
    induction k with
    | zero => intro _; exact Nat.zero_le _
    | succ k ih =>
      intro hk
      have ih' := ih (by omega)
      obtain ⟨x, hxU, hs, ht⟩ := hwit k (by omega)
      have hlt := countTrue_strict (chain_mono_step hFm k) hs ht U hxU
      omega
  have hfin := hgrow (U.length + 1) (Nat.le_refl _)
  have hle := countTrue_le_length U (chain F (U.length + 1))
  omega

/-- The fixed point the chain reaches is the least pre-fixed
    point: the Knaster-Tarski characterization, as a membership
    equivalence at every point. -/
theorem lfp_is_kt {F : (α → Bool) → (α → Bool)} (hFm : Mono F)
    {k : Nat} (hk : F (chain F k) = chain F k) (x : α) :
    (chain F k) x = true ↔ ∀ s, Le (F s) s → s x = true := by
  constructor
  · intro hx s hs
    exact chain_le_prefix hFm k s hs x hx
  · intro h
    apply h
    intro y hy
    rw [hk] at hy
    exact hy

/-- A finite list of states has a member of maximum count. -/
theorem exists_max_count : ∀ (𝒮 : List (α → Bool)),
    (∃ s, s ∈ 𝒮) →
    ∀ (U : List α), ∃ g ∈ 𝒮, ∀ s ∈ 𝒮, countTrue U s ≤ countTrue U g := by
  intro 𝒮
  induction 𝒮 with
  | nil => intro hne; obtain ⟨s, hs⟩ := hne; simp at hs
  | cons a 𝒮 ih =>
    intro _ U
    by_cases h𝒮 : 𝒮 = []
    · subst h𝒮
      exact ⟨a, by simp, fun s hs => by
        simp at hs; subst hs; exact Nat.le_refl _⟩
    · have hne' : ∃ s, s ∈ 𝒮 := by
        cases h𝒮' : 𝒮 with
        | nil => exact (h𝒮 h𝒮').elim
        | cons b 𝒮' => exact ⟨b, by simp⟩
      obtain ⟨g, hg, hmax⟩ := ih hne' U
      by_cases hcmp : countTrue U a ≤ countTrue U g
      · refine ⟨g, by simp [hg], fun s hs => ?_⟩
        obtain rfl | hs' := List.mem_cons.mp hs
        · exact hcmp
        · exact hmax s hs'
      · refine ⟨a, by simp, fun s hs => ?_⟩
        obtain rfl | hs' := List.mem_cons.mp hs
        · exact Nat.le_refl _
        · exact Nat.le_trans (hmax s hs') (Nat.le_of_not_ge hcmp)

/-- A family of states is directed when any two members have
    a common upper bound in the family. -/
def Directed (𝒮 : List (α → Bool)) : Prop :=
  ∀ s ∈ 𝒮, ∀ t ∈ 𝒮, ∃ u ∈ 𝒮, Le s u ∧ Le t u

/-- Every directed family of states over a finite universe
    attains its supremum: some member is above every member.
    The proof is the counting argument: a member of maximum
    count is above any member, since a common upper bound of
    the two with a strictly larger count would contradict
    maximality, and equal count with the order forces
    agreement on the universe. -/
theorem directed_attains {U : List α} (𝒮 : List (α → Bool))
    (hne : ∃ s, s ∈ 𝒮) (hdir : Directed 𝒮)
    (hsup : ∀ s ∈ 𝒮, Supported U s) :
    ∃ g ∈ 𝒮, ∀ s ∈ 𝒮, Le s g := by
  obtain ⟨g, hg, hmax⟩ := exists_max_count 𝒮 hne U
  refine ⟨g, hg, fun s hs x hx => ?_⟩
  obtain ⟨u, hu, hsu, hgu⟩ := hdir s hs g hg
  by_cases hxU : x ∈ U
  · by_cases hgx : g x = true
    · exact hgx
    · exfalso
      have hgxf : g x = false := by
        cases h2 : g x with
        | false => rfl
        | true => exact absurd h2 hgx
      have hux : u x = true := hsu x hx
      have hlt := countTrue_strict hgu hgxf hux U hxU
      have hle := hmax u hu
      omega
  · have hfalse := hsup s hs x hxU
    rw [hfalse] at hx
    simp at hx

/-- The pointwise supremum of a list of states. -/
def supList (𝒮 : List (α → Bool)) : α → Bool :=
  fun x => 𝒮.any (fun s => s x)

theorem any_true {p : (α → Bool) → Bool} :
    ∀ (𝒮 : List (α → Bool)),
    (𝒮.any p = true) ↔ ∃ s ∈ 𝒮, p s = true := by
  intro 𝒮
  induction 𝒮 with
  | nil => simp
  | cons a 𝒮 ih =>
    simp only [List.any_cons, Bool.or_eq_true, ih]
    constructor
    · intro h
      cases h with
      | inl h => exact ⟨a, by simp, h⟩
      | inr h => obtain ⟨s, hs, hp⟩ := h; exact ⟨s, by simp [hs], hp⟩
    · intro h
      obtain ⟨s, hs, hp⟩ := h
      cases List.mem_cons.mp hs with
      | inl h1 => subst h1; exact Or.inl hp
      | inr hs' => exact Or.inr ⟨s, hs', hp⟩

/-- Scott continuity, collapsed form. A monotone operator on
    states over a finite universe preserves every directed
    supremum, because the supremum is attained at a member:
    continuity is a theorem here, not a hypothesis. This is
    the precise point of separation from the infinite-domain
    setting, where directed suprema need not be attained and
    continuity is a real side condition. -/
theorem scott_directed {U : List α} {F : (α → Bool) → (α → Bool)}
    (hFm : Mono F) (𝒮 : List (α → Bool)) (hne : ∃ s, s ∈ 𝒮)
    (hdir : Directed 𝒮) (hsup : ∀ s ∈ 𝒮, Supported U s) :
    F (supList 𝒮) = supList (𝒮.map F) := by
  obtain ⟨g, hg, hle⟩ := directed_attains 𝒮 hne hdir hsup
  have hσg : supList 𝒮 = g := by
    funext x
    by_cases hxU : x ∈ U
    · by_cases hgx : g x = true
      · have hσ : supList 𝒮 x = true := by
          show 𝒮.any (fun s => s x) = true
          rw [any_true]
          exact ⟨g, hg, hgx⟩
        simp [hσ, hgx]
      · have hgxf : g x = false := by
          cases h2 : g x with
          | false => rfl
          | true => exact absurd h2 hgx
        have hσ : supList 𝒮 x = false := by
          by_cases hc : supList 𝒮 x = true
          · have hc'' : 𝒮.any (fun s => s x) = true := hc
            rw [any_true] at hc''
            obtain ⟨s, hs, hsx⟩ := hc''
            have hgx' := hle s hs x hsx
            rw [hgxf] at hgx'
            simp at hgx'
          · cases h2 : supList 𝒮 x with
            | false => rfl
            | true => exact absurd h2 hc
        simp [hσ, hgxf]
    · have hσ : supList 𝒮 x = false := by
        by_cases hc : supList 𝒮 x = true
        · have hc'' : 𝒮.any (fun s => s x) = true := hc
          rw [any_true] at hc''
          obtain ⟨s, hs, hsx⟩ := hc''
          have hfalse := hsup s hs x hxU
          rw [hfalse] at hsx
          simp at hsx
        · cases h2 : supList 𝒮 x with
          | false => rfl
          | true => exact absurd h2 hc
      have hgxf := hsup g hg x hxU
      simp [hσ, hgxf]
  rw [hσg]
  funext x
  by_cases h : supList (𝒮.map F) x = true
  · rw [h]
    have h' : (𝒮.map F).any (fun s => s x) = true := h
    rw [any_true] at h'
    obtain ⟨s, hs, hsx⟩ := h'
    rw [List.mem_map] at hs
    obtain ⟨s₀, hs₀, rfl⟩ := hs
    exact hFm s₀ g (hle s₀ hs₀) x hsx
  · have hfalse : supList (𝒮.map F) x = false := by
      cases h2 : supList (𝒮.map F) x with
      | false => rfl
      | true => exact absurd h2 h
    rw [hfalse]
    by_cases hc : (F g) x = true
    · have htrue : supList (𝒮.map F) x = true := by
        show (𝒮.map F).any (fun s => s x) = true
        rw [any_true]
        exact ⟨F g, by rw [List.mem_map]; exact ⟨g, hg, rfl⟩, hc⟩
      rw [hfalse] at htrue
      simp at htrue
    · cases h2 : (F g) x with
      | false => rfl
      | true => exact absurd h2 hc

/-- A derivation step: the rule fired, the premises it
    consumed, and the conclusion it produced. An execution
    event is exactly a step; there is no other kind. -/
structure Step (α : Type) where
  rule : Nat
  premises : List α
  conclusion : α

/-- The conclusion incidences of a trace: one per step, read
    off the trace itself. -/
def conclusionIncidences (t : List (Step α)) : List α :=
  t.map Step.conclusion

/-- The premise incidences of a trace: one pair (step,
    premise) per premise of per step. -/
def premiseIncidences (t : List (Step α)) : List (Step α × α) :=
  t.flatMap (fun s => s.premises.map (fun p => (s, p)))

/-- The premise touches of a trace: the total premises
    consumed, counted off the trace. -/
def premiseTouches (t : List (Step α)) : Nat :=
  (t.map (fun s => s.premises.length)).sum

/-- Accounting completeness, conclusion face: every step of
    the trace has its conclusion incidence in the derived
    incidence structure. No step is skipped, because the
    incidences are the trace mapped, not a counter placed in
    an evaluator. -/
theorem conclusion_counted (t : List (Step α)) (s : Step α)
    (hs : s ∈ t) : s.conclusion ∈ conclusionIncidences t :=
  List.mem_map_of_mem hs

/-- Accounting completeness, premise face: every premise of
    every step has its premise incidence in the derived
    structure. -/
theorem premise_counted (t : List (Step α)) (s : Step α)
    (hs : s ∈ t) {p : α} (hp : p ∈ s.premises) :
    (s, p) ∈ premiseIncidences t := by
  simp only [premiseIncidences, List.mem_flatMap]
  exact ⟨s, hs, List.mem_map.mpr ⟨p, hp, rfl⟩⟩

/-- The touch count is the incidence count: nothing is
    touched without an incidence recording it, and every
    incidence is a touch. -/
theorem touches_eq_incidences (t : List (Step α)) :
    premiseTouches t = (premiseIncidences t).length := by
  induction t with
  | nil => rfl
  | cons s t ih =>
    simp [premiseTouches, premiseIncidences, ih, List.length_map]

/-- The one-step closure operator of a ground Horn rule set
    over a seed: a fact holds after the step when the seed
    holds it, it already held, or a rule concluding it has
    every premise holding. -/
def hornStep [DecidableEq α] (rules : List (List α × α))
    (seed : α → Bool) (s : α → Bool) : α → Bool :=
  fun x => seed x || s x ||
    rules.any (fun r => (r.2 == x) && r.1.all s)

theorem all_mono {l : List α} {p q : α → Bool}
    (h : ∀ y ∈ l, p y = true → q y = true) :
    l.all p = true → l.all q = true := by
  intro hp
  rw [List.all_eq_true] at hp ⊢
  exact fun y hy => h y hy (hp y hy)

theorem any_mono {l : List (List α × α)} {p q : List α × α → Bool}
    (h : ∀ r ∈ l, p r = true → q r = true) :
    l.any p = true → l.any q = true := by
  intro hp
  rw [List.any_eq_true] at hp ⊢
  obtain ⟨r, hr, hpr⟩ := hp
  exact ⟨r, hr, h r hr hpr⟩

theorem hornStep_mono [DecidableEq α] (rules : List (List α × α))
    (seed : α → Bool) : Mono (hornStep rules seed) := by
  intro s t h x hx
  simp only [hornStep] at hx ⊢
  rw [Bool.or_eq_true] at hx
  cases hx with
  | inl hsx =>
    rw [Bool.or_eq_true] at hsx
    cases hsx with
    | inl hseed =>
      rw [Bool.or_eq_true]
      left
      rw [Bool.or_eq_true]
      exact Or.inl hseed
    | inr hst =>
      rw [Bool.or_eq_true]
      left
      rw [Bool.or_eq_true]
      exact Or.inr (h x hst)
  | inr hrx =>
    rw [Bool.or_eq_true]
    right
    exact any_mono (fun r _ hr => by
      rw [Bool.and_eq_true] at hr ⊢
      exact ⟨hr.1, all_mono (fun y _ hy => h y hy) hr.2⟩) hrx

/-- Derivations: the finite support of a fact. A fact derives
    when the seed holds it, or a rule concluding it has every
    premise deriving. This is the premise cone of the fact,
    as an inductive family. -/
inductive Derives (rules : List (List α × α)) (seed : α → Bool) :
    α → Prop where
  | base {x : α} : seed x = true → Derives rules seed x
  | step {ps : List α} {x : α} : (ps, x) ∈ rules →
      (∀ p ∈ ps, Derives rules seed p) → Derives rules seed x

/-- The chain is monotone in its index: the state at an
    earlier point is below the state at any later point. This
    is the by-time face of the trace: the prefix at a point
    determines the state at that point, and prefixes grow. -/
theorem chain_le_of_le {F : (α → Bool) → (α → Bool)} (hF : Mono F) :
    ∀ {m n : Nat}, m ≤ n → Le (chain F m) (chain F n) := by
  intro m n hmn
  induction hmn with
  | refl => exact le_refl _
  | step hmn ih => exact le_trans ih (chain_mono_step hF _)

/-- A finite premise list whose members each hold at some
    chain point holds together at one chain point. -/
theorem uniform_point {F : (α → Bool) → (α → Bool)} (hF : Mono F)
    (ps : List α) :
    (∀ p ∈ ps, ∃ k, (chain F k) p = true) →
    ∃ k, ∀ p ∈ ps, (chain F k) p = true := by
  induction ps with
  | nil => intro _; exact ⟨0, fun p hp => by simp at hp⟩
  | cons p ps ih =>
    intro h
    obtain ⟨kp, hkp⟩ := h p (by simp)
    obtain ⟨kps, hkps⟩ := ih (fun q hq => h q (by simp [hq]))
    refine ⟨max kp kps, fun q hq => ?_⟩
    obtain rfl | hq' := List.mem_cons.mp hq
    · exact chain_le_of_le hF (Nat.le_max_left kp kps) q hkp
    · exact chain_le_of_le hF (Nat.le_max_right kp kps) q (hkps q hq')

/-- Every derivation is realized at some chain point. -/
theorem derives_chain [DecidableEq α] {rules : List (List α × α)}
    {seed : α → Bool} {x : α} (h : Derives rules seed x) :
    ∃ k, (chain (hornStep rules seed) k) x = true := by
  induction h with
  | base hseed =>
    refine ⟨1, ?_⟩
    rw [chain_succ]
    simp [hornStep, hseed]
  | step hr hps ih =>
    obtain ⟨k, hk⟩ := uniform_point (hornStep_mono rules seed) _ ih
    refine ⟨k + 1, ?_⟩
    rw [chain_succ]
    simp only [hornStep]
    rw [Bool.or_eq_true]
    right
    rw [List.any_eq_true]
    refine ⟨_, hr, ?_⟩
    rw [Bool.and_eq_true]
    refine ⟨by simp, ?_⟩
    rw [List.all_eq_true]
    exact fun p hp => hk p hp

/-- Every fact the chain derives has a derivation: the
    by-fact and by-premise-cone faces of trace completeness.
    The derivation is finite, its leaves are seed facts, and
    its internal steps are rule firings whose premises derive
    strictly earlier — the cone is exactly the support. -/
theorem chain_derives [DecidableEq α] {rules : List (List α × α)}
    {seed : α → Bool} :
    ∀ (k : Nat) (x : α),
    (chain (hornStep rules seed) k) x = true →
    Derives rules seed x := by
  intro k
  induction k with
  | zero => intro x hx; simp [chain] at hx
  | succ k ih =>
    intro x hx
    rw [chain_succ] at hx
    simp only [hornStep] at hx
    rw [Bool.or_eq_true] at hx
    cases hx with
    | inl hsx =>
      rw [Bool.or_eq_true] at hsx
      cases hsx with
      | inl hseed => exact Derives.base hseed
      | inr hprev => exact ih x hprev
    | inr hrx =>
      rw [List.any_eq_true] at hrx
      obtain ⟨⟨ps, cx⟩, hr, hbool⟩ := hrx
      rw [Bool.and_eq_true] at hbool
      have hcx : cx = x := by
        have h := hbool.1
        simp at h
        exact h
      subst hcx
      rw [List.all_eq_true] at hbool
      exact Derives.step hr (fun p hp => ih p (hbool.2 p hp))

/-- The Horn operator is confined to a universe holding the
    seed's support and every rule's conclusion. -/
theorem hornStep_confined [DecidableEq α] {U : List α}
    {rules : List (List α × α)} {seed : α → Bool}
    (hseed : Supported U seed)
    (hrules : ∀ r ∈ rules, r.2 ∈ U) :
    Confined U (hornStep rules seed) := by
  intro s hs x hxU
  simp only [hornStep]
  rw [hseed x hxU, hs x hxU]
  simp only [Bool.false_or]
  rw [List.any_eq_false]
  intro r hr hcon
  rw [Bool.and_eq_true] at hcon
  have h2 : r.2 = x := by
    have h1 := hcon.1
    simp at h1
    exact h1
  have hmem := hrules r hr
  rw [h2] at hmem
  exact hxU hmem

/-- The fixed point of the Horn chain is exactly the set of
    facts with a finite derivation: soundness and completeness
    of provenance at the least fixed point, at the bound the
    finite theorem gives. -/
theorem horn_lfp_iff_derives [DecidableEq α]
    {rules : List (List α × α)} {seed : α → Bool}
    {k : Nat} (hk : hornStep rules seed (chain (hornStep rules seed) k)
      = chain (hornStep rules seed) k) (x : α) :
    (chain (hornStep rules seed) k) x = true ↔
    Derives rules seed x := by
  constructor
  · intro hx; exact chain_derives k x hx
  · intro h
    obtain ⟨j, hj⟩ := derives_chain h
    exact chain_le_prefix (hornStep_mono rules seed) j _
      (by
        show Le (hornStep rules seed (chain (hornStep rules seed) k))
          (chain (hornStep rules seed) k)
        rw [hk]
        exact le_refl _) x hj

/-- The four values of the coloring: unknown, yes, no, and
    conflict — neither, true, false, and both, in the
    four-valued reading. -/
inductive Val4 where
  | unknown | yes | no | conflict
deriving DecidableEq

/-- The knowledge order on values: unknown below everything,
    yes and no below conflict, yes and no incomparable. -/
def le4 : Val4 → Val4 → Bool
  | .unknown, _ => true
  | .yes, .yes => true
  | .yes, .conflict => true
  | .no, .no => true
  | .no, .conflict => true
  | .conflict, .conflict => true
  | _, _ => false

/-- The join in the knowledge order: the least value above
    both. -/
def join4 : Val4 → Val4 → Val4
  | .unknown, b => b
  | a, .unknown => a
  | .yes, .yes => .yes
  | .no, .no => .no
  | _, _ => .conflict

/-- Height in the knowledge order: the counting measure for
    coloring states. -/
def height4 : Val4 → Nat
  | .unknown => 0
  | .yes => 1
  | .no => 1
  | .conflict => 2

theorem le4_refl (a : Val4) : le4 a a = true := by cases a <;> rfl

theorem le4_trans {a b c : Val4} :
    le4 a b = true → le4 b c = true → le4 a c = true := by
  cases a <;> cases b <;> cases c <;> decide

theorem le4_height {a b : Val4} :
    le4 a b = true → height4 a ≤ height4 b := by
  cases a <;> cases b <;> decide

theorem le4_height_strict {a b : Val4} :
    le4 a b = true → a ≠ b → height4 a < height4 b := by
  cases a <;> cases b <;> decide

theorem height4_le (a : Val4) : height4 a ≤ 2 := by cases a <;> decide

theorem le4_join_left {a b c : Val4} :
    le4 a b = true → le4 (join4 a c) (join4 b c) = true := by
  cases a <;> cases b <;> cases c <;> decide

theorem le4_join_right {a b c : Val4} :
    le4 a b = true → le4 (join4 c a) (join4 c b) = true := by
  cases a <;> cases b <;> cases c <;> decide

/-- The knowledge order on coloring states, pointwise. -/
def LeK (s t : α → Val4) : Prop := ∀ x, le4 (s x) (t x) = true

/-- The total height of a coloring state over the universe. -/
def sumHeight : List α → (α → Val4) → Nat
  | [], _ => 0
  | a :: U, s => height4 (s a) + sumHeight U s

theorem sumHeight_le : ∀ (U : List α) (s : α → Val4),
    sumHeight U s ≤ 2 * U.length := by
  intro U
  induction U with
  | nil => intro s; exact Nat.zero_le _
  | cons a U ih =>
    intro s
    simp only [sumHeight, List.length_cons]
    have h1 := height4_le (s a)
    have h2 := ih s
    omega

theorem sumHeight_mono {s t : α → Val4} (h : LeK s t) :
    ∀ (U : List α), sumHeight U s ≤ sumHeight U t := by
  intro U
  induction U with
  | nil => exact Nat.zero_le _
  | cons a U ih =>
    simp only [sumHeight]
    have h1 := le4_height (h a)
    omega

theorem sumHeight_strict {s t : α → Val4} (h : LeK s t) {x : α}
    (hx : s x ≠ t x) :
    ∀ (U : List α), x ∈ U → sumHeight U s < sumHeight U t := by
  intro U
  induction U with
  | nil => intro hxU; simp at hxU
  | cons a U ih =>
    intro hxU
    simp only [sumHeight]
    have hmono := sumHeight_mono h U
    obtain rfl | hx' := List.mem_cons.mp hxU
    · have h1 := le4_height_strict (h x) hx
      omega
    · have ih' := ih hx'
      have h1 := le4_height (h a)
      omega

/-- A coloring state is supported on the universe when it is
    unknown outside it. -/
def SupportedK (U : List α) (s : α → Val4) : Prop :=
  ∀ x, x ∉ U → s x = .unknown

/-- Knowledge monotonicity of an operator on coloring
    states. -/
def MonoK (G : (α → Val4) → (α → Val4)) : Prop :=
  ∀ s t, LeK s t → LeK (G s) (G t)

/-- The operator stays inside the universe. -/
def ConfinedK (U : List α) (G : (α → Val4) → (α → Val4)) : Prop :=
  ∀ s, SupportedK U s → SupportedK U (G s)

/-- The Kleene chain of a coloring operator, from the
    all-unknown state. -/
def chain4 (G : (α → Val4) → (α → Val4)) : Nat → (α → Val4)
  | 0 => fun _ => .unknown
  | n + 1 => G (chain4 G n)

theorem chain4_succ (G : (α → Val4) → (α → Val4)) (n : Nat) :
    chain4 G (n + 1) = G (chain4 G n) := rfl

theorem chain4_supported {U : List α} {G : (α → Val4) → (α → Val4)}
    (hG : ConfinedK U G) : ∀ n, SupportedK U (chain4 G n) := by
  intro n
  induction n with
  | zero => intro x _; rfl
  | succ n ih => exact hG _ ih

theorem chain4_mono_step {G : (α → Val4) → (α → Val4)} (hG : MonoK G) :
    ∀ n, LeK (chain4 G n) (chain4 G (n + 1)) := by
  intro n
  induction n with
  | zero =>
    intro x
    show le4 .unknown _ = true
    cases (chain4 G 1) x <;> rfl
  | succ n ih =>
    rw [chain4_succ, chain4_succ]
    exact hG _ _ ih

theorem chain4_le_prefix {G : (α → Val4) → (α → Val4)} (hG : MonoK G) :
    ∀ (n : Nat) (s : α → Val4), LeK (G s) s → LeK (chain4 G n) s := by
  intro n
  induction n with
  | zero => intro s _ x; cases s x <;> rfl
  | succ n ih =>
    intro s hs
    rw [chain4_succ]
    exact fun x => le4_trans (hG _ _ (ih s hs) x) (hs x)

theorem ne_point4 {s t : α → Val4} (hne : s ≠ t) :
    ∃ x, s x ≠ t x := by
  apply Classical.byContradiction
  intro hc
  apply hne
  funext x
  by_cases hxt : s x = t x
  · exact hxt
  · exact (hc ⟨x, hxt⟩).elim

/-- The bounded fixed point theorem for colorings: the chain
    of a knowledge-monotone confined operator reaches a fixed
    point within twice the universe size — each non-fixed
    step strictly raises the total height, and the height is
    bounded by two per point. -/
theorem exists_fixed_within4 {U : List α}
    {G : (α → Val4) → (α → Val4)} (hGm : MonoK G) (hGc : ConfinedK U G) :
    ∃ k ≤ 2 * U.length, G (chain4 G k) = chain4 G k := by
  apply Classical.byContradiction
  intro hcon
  have hcon' : ∀ k, k ≤ 2 * U.length → G (chain4 G k) ≠ chain4 G k :=
    fun k hk he => hcon ⟨k, hk, he⟩
  have hwit : ∀ k, k ≤ 2 * U.length → ∃ x ∈ U,
      (chain4 G k) x ≠ (chain4 G (k + 1)) x := by
    intro k hk
    have hne : chain4 G k ≠ chain4 G (k + 1) := by
      have h := hcon' k hk
      rw [chain4_succ]
      exact fun he => h he.symm
    obtain ⟨x, hx⟩ := ne_point4 hne
    have hxU : x ∈ U := by
      apply Classical.byContradiction
      intro hnot
      have h1 := chain4_supported hGc k x hnot
      have h2 := chain4_supported hGc (k + 1) x hnot
      rw [h1, h2] at hx
      exact hx rfl
    exact ⟨x, hxU, hx⟩
  have hgrow : ∀ k, k ≤ 2 * U.length + 1 →
      k ≤ sumHeight U (chain4 G k) := by
    intro k
    induction k with
    | zero => intro _; exact Nat.zero_le _
    | succ k ih =>
      intro hk
      have ih' := ih (by omega)
      obtain ⟨x, hxU, hx⟩ := hwit k (by omega)
      have hlt := sumHeight_strict (chain4_mono_step hGm k) hx U hxU
      omega
  have hfin := hgrow (2 * U.length + 1) (Nat.le_refl _)
  have hle := sumHeight_le U (chain4 G (2 * U.length + 1))
  omega

/-- Whether a rule set fires at a fact under a coloring: a
    rule concluding the fact whose premises all carry
    yes-evidence — yes or conflict — in the coloring. Evidence
    only accumulates under the knowledge order, so firing is
    monotone in the coloring. -/
def fires [DecidableEq α] (rules : List (List α × α))
    (s : α → Val4) (x : α) : Bool :=
  rules.any (fun r => (r.2 == x) && r.1.all (fun p => le4 .yes (s p)))

theorem fires_mono [DecidableEq α] {rules : List (List α × α)}
    {s t : α → Val4} (h : LeK s t) (x : α) :
    fires rules s x = true → fires rules t x = true := by
  intro hf
  simp only [fires] at hf ⊢
  exact any_mono (fun r _ hr => by
    rw [Bool.and_eq_true] at hr ⊢
    exact ⟨hr.1, all_mono (fun y _ hy => le4_trans hy (h y)) hr.2⟩) hf

/-- The coloring operator of the qualification design: the
    seed's colors, the state's colors, and the colors forced
    by the yes-rules and the no-rules, joined in the knowledge
    order. -/
def colorStep [DecidableEq α] (rulesYes rulesNo : List (List α × α))
    (seed : α → Val4) (s : α → Val4) : α → Val4 :=
  fun x => join4 (join4 (seed x) (s x))
    (join4 (if fires rulesYes s x then .yes else .unknown)
      (if fires rulesNo s x then .no else .unknown))

theorem colorStep_mono [DecidableEq α]
    (rulesYes rulesNo : List (List α × α)) (seed : α → Val4) :
    MonoK (colorStep rulesYes rulesNo seed) := by
  intro s t h x
  simp only [colorStep]
  have hfY : le4 (if fires rulesYes s x then Val4.yes else .unknown)
      (if fires rulesYes t x then .yes else .unknown) = true := by
    by_cases hst : fires rulesYes s x = true
    · rw [if_pos hst, if_pos (fires_mono h x hst)]; exact le4_refl _
    · rw [if_neg hst]
      cases (if fires rulesYes t x then Val4.yes else .unknown) <;> rfl
  have hfN : le4 (if fires rulesNo s x then Val4.no else .unknown)
      (if fires rulesNo t x then .no else .unknown) = true := by
    by_cases hst : fires rulesNo s x = true
    · rw [if_pos hst, if_pos (fires_mono h x hst)]; exact le4_refl _
    · rw [if_neg hst]
      cases (if fires rulesNo t x then Val4.no else .unknown) <;> rfl
  exact le4_trans (le4_join_left (le4_join_right (h x)))
    (le4_join_right (le4_trans (le4_join_left hfY) (le4_join_right hfN)))

theorem colorStep_confined [DecidableEq α] {U : List α}
    {rulesYes rulesNo : List (List α × α)} {seed : α → Val4}
    (hseed : SupportedK U seed)
    (hrulesY : ∀ r ∈ rulesYes, r.2 ∈ U)
    (hrulesN : ∀ r ∈ rulesNo, r.2 ∈ U) :
    ConfinedK U (colorStep rulesYes rulesNo seed) := by
  intro s hs x hxU
  have hfire : ∀ (rules : List (List α × α)),
      (∀ r ∈ rules, r.2 ∈ U) → fires rules s x = false := by
    intro rules hrules
    simp only [fires]
    rw [List.any_eq_false]
    intro r hr hcon
    rw [Bool.and_eq_true] at hcon
    have h2 : r.2 = x := by
      have h1 := hcon.1
      simp at h1
      exact h1
    have hmem := hrules r hr
    rw [h2] at hmem
    exact hxU hmem
  simp only [colorStep, hseed x hxU, hs x hxU,
    hfire rulesYes hrulesY, hfire rulesNo hrulesN]
  rfl

/-- The coloring theorem: the computed coloring of a finite
    snapshot is the least fixed point of the coloring
    operator, reached by the chain within twice the universe
    size, and it is below every pre-fixed coloring — the
    Knaster-Tarski characterization, for the four-valued
    coloring under the knowledge order. -/
theorem coloring_lfp [DecidableEq α] {U : List α}
    {rulesYes rulesNo : List (List α × α)} {seed : α → Val4}
    (hseed : SupportedK U seed)
    (hrulesY : ∀ r ∈ rulesYes, r.2 ∈ U)
    (hrulesN : ∀ r ∈ rulesNo, r.2 ∈ U) :
    ∃ k ≤ 2 * U.length,
      colorStep rulesYes rulesNo seed
          (chain4 (colorStep rulesYes rulesNo seed) k)
        = chain4 (colorStep rulesYes rulesNo seed) k
      ∧ ∀ s, LeK (colorStep rulesYes rulesNo seed s) s →
          LeK (chain4 (colorStep rulesYes rulesNo seed) k) s := by
  obtain ⟨k, hkbound, hk⟩ := exists_fixed_within4
    (colorStep_mono rulesYes rulesNo seed)
    (colorStep_confined hseed hrulesY hrulesN)
  exact ⟨k, hkbound, hk, fun s hs =>
    chain4_le_prefix (colorStep_mono rulesYes rulesNo seed) k s hs⟩

/-- The successor operator on states over the natural
    numbers: zero holds after one step, and a successor holds
    when it already held or its predecessor held. Its chain
    from bottom is the ever-growing initial segment — the
    elementary witness that the infinite setting defeats
    every uniform finite step bound. -/
def succOp (s : Nat → Bool) : Nat → Bool
  | 0 => true
  | n + 1 => s (n + 1) || s n

theorem succOp_mono : Mono succOp := by
  intro s t h x hx
  cases x with
  | zero => rfl
  | succ n =>
    simp only [succOp] at hx ⊢
    rw [Bool.or_eq_true] at hx ⊢
    cases hx with
    | inl hs => exact Or.inl (h (n + 1) hs)
    | inr hs => exact Or.inr (h n hs)

theorem succOp_chain (k x : Nat) :
    (chain succOp k) x = true ↔ x < k := by
  induction k generalizing x with
  | zero => simp [chain]
  | succ k ih =>
    rw [chain_succ]
    cases x with
    | zero => simp [succOp]
    | succ n =>
      simp only [succOp, Bool.or_eq_true, ih (n + 1), ih n]
      omega

/-- No uniform finite bound: for every candidate bound B,
    the successor operator's chain has not reached a fixed
    point at B. The finite theorem's bound is the universe
    size; where there is no finite universe, no bound of the
    kind exists at all. This is the separation the dominance
    assembly rests on, proved here in its elementary form;
    the undecidability of the general constrained Horn clause
    problem is the stronger external fact, cited in the
    record and not reproven. -/
theorem no_uniform_bound (B : Nat) :
    succOp (chain succOp B) ≠ chain succOp B := by
  intro he
  have h1 : (succOp (chain succOp B)) B = true := by
    cases B with
    | zero => simp [succOp]
    | succ n =>
      have hn : (chain succOp (n + 1)) n = true :=
        (succOp_chain (n + 1) n).mpr (Nat.lt_succ_self n)
      simp [succOp, hn]
  have h2 : ¬ (chain succOp B) B = true :=
    fun h => Nat.lt_irrefl B ((succOp_chain B B).mp h)
  exact h2 ((congrFun he B) ▸ h1)

/-- The assembled dominance statement on the contract axes,
    for a named finite snapshot: the Horn solver reaches its
    least fixed point within the universe size and that fixed
    point is exactly the set of facts with a finite
    derivation; the incidence accounting counts every step's
    conclusion and every premise of every step; the coloring
    reaches its least fixed point within twice the universe
    size; and no uniform bound of the finite kind exists on
    the infinite side. The measured axes — evaluation speed
    and memory — are not in this statement; they are decided
    by the cells, at pins, and this theorem claims no
    benchmark. -/
def ContractDominance [DecidableEq α] (U : List α)
    (rules : List (List α × α)) (seed : α → Bool)
    (rulesYes rulesNo : List (List α × α)) (seedK : α → Val4) :
    Prop :=
  (∃ k ≤ U.length,
    hornStep rules seed (chain (hornStep rules seed) k)
      = chain (hornStep rules seed) k
    ∧ ∀ x, (chain (hornStep rules seed) k) x = true ↔
        Derives rules seed x)
  ∧ (∀ (t : List (Step α)) (s : Step α), s ∈ t →
      s.conclusion ∈ conclusionIncidences t
      ∧ ∀ p ∈ s.premises, (s, p) ∈ premiseIncidences t)
  ∧ (∃ k ≤ 2 * U.length,
      colorStep rulesYes rulesNo seedK
          (chain4 (colorStep rulesYes rulesNo seedK) k)
        = chain4 (colorStep rulesYes rulesNo seedK) k)
  ∧ (∀ B : Nat, succOp (chain succOp B) ≠ chain succOp B)

theorem contract_dominance [DecidableEq α] {U : List α}
    {rules rulesYes rulesNo : List (List α × α)}
    {seed : α → Bool} {seedK : α → Val4}
    (hseed : Supported U seed)
    (hrules : ∀ r ∈ rules, r.2 ∈ U)
    (hseedK : SupportedK U seedK)
    (hrulesY : ∀ r ∈ rulesYes, r.2 ∈ U)
    (hrulesN : ∀ r ∈ rulesNo, r.2 ∈ U) :
    ContractDominance U rules seed rulesYes rulesNo seedK := by
  obtain ⟨k, hkbound, hk⟩ := exists_fixed_within
    (hornStep_mono rules seed) (hornStep_confined hseed hrules)
  obtain ⟨k4, hk4bound, hk4, _⟩ := coloring_lfp hseedK hrulesY hrulesN
  exact ⟨⟨k, hkbound, hk, fun x => horn_lfp_iff_derives hk x⟩,
    fun t s hs => ⟨conclusion_counted t s hs,
      fun p hp => premise_counted t s hs hp⟩,
    ⟨k4, hk4bound, hk4⟩,
    no_uniform_bound⟩

end SolverDominance
