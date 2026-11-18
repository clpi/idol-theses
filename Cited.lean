/-
The cited tranche: theses whose strongest reachable form already
stands proved, disproven, or named as a premise in a family home.

Rule of this file. Where a family home proves a thesis at its
strongest form, this repository carries the statement, the
refutation condition, the evidence state, and the citation — never
a duplicate proof. The pins below are the live heads of the two
homes at the time of this tranche, read back through the GitHub
route on 2026-11-18:

- the quantifiable home: clpi/software-is-quantifiable at
  a21c7c56fa028f32014dd795b35b14f688e8fdf1
- the optimality home: clpi/software-optimality at
  97a5d7f3e68de47cd9eb26221b83e713121673fd

The registry at the end of this file is data: one row per cited
thesis, naming its home and its evidence state. The prose above
each group states the thesis and what would refute it.

Numbering note (reconciliation of 2026-11-18). The theses in
this file were first numbered in tranche order. The census of
the release (58 theses) numbers them as follows, and every
statement below now carries its census number: finiteness is
census 1, coverage is census 2, the fold is census 3, coloring
is census 4, pareto at bounds is census 5, per-execution
dominance is census 6, the regression gate is census 7, the
closure laws are census 48, the executable closure is census
49, finite frontier exactness is census 50, incremental
exactness is census 51, the general pareto obligations are
census 52, scoped evidence is census 53, the relevance profile
is census 54, finite schedules are census 55, and the
topological thesis is census 58.

Pin note. The census names the strongest homes at the pins its
sources were read at: the quantifiable home at 37917a41 and the
optimality home at 0ea4626b and 78b7b99b. The citations in the
first group below were read at the live heads of 2026-11-18,
a21c7c56 for the quantifiable home and 97a5d7f3 for the
optimality home; both are descendants of the census pins (the
quantifiable citation pin is nine commits ahead of its census
pin, the optimality citation pin is thirteen ahead of the
0ea4626b census pin), so no citation here rests on a pin older
than the census record. The second group is cited at the
census pins themselves, exactly as the census names them.

Thesis 1 — finiteness of qualification (register item F1).
Statement: a qualification — named software, named criteria, the
behavior intended under them — forms a finite problem space.
Finiteness is a consequence of what a qualification is, never a
hypothesis. Refutation: a constructive one only — produce a
qualification whose intended set cannot be finitely enumerated
even in principle. None has been produced. Evidence state:
proven in the quantifiable home, where an explicit finite list
enumerates every schedule and every valid ordering of a
qualification.

Thesis 2 — the fold laws at value level (register item F3).
Statement: the accounting is a pure fold over content-addressed
witnesses; its value projection is order- and duplication-free
and exactly recomputable. Refutation: two feeds of the same
witness set yielding different accounting values. Evidence
state: proven in the quantifiable home for the construction; the
full text form stands discharged on disk since the 2026-11-17
closing re-run recorded in the register. The three forms the
home does not carry are proved natively in this repository, in
the fold file.

Thesis 3 — coloring under its side condition (register item F4).
Statement: relative to a named snapshot, the coloring computed
as the least fixed point over ground rules is sound and complete
against derivability, and the iteration reaches its fixed point
within the length of the universe. Side condition, stated and
never silently dropped: the snapshot universe names every
conclusion the rules can produce. Refutation: one snapshot and
rule set where the computed coloring asserts a fact with no
derivation, or misses a derivable fact. Evidence state: proven
in the quantifiable home under that condition, and discharged on
the real snapshot, 180 of 180 pairs.

Thesis 4 — pareto at bounds (register item F5).
Statement: the computed frontier is exactly the set of
assignments no other assignment dominates at the witnessed
bounds; separation under interval bounds decides dominance for
every realization; the frontier is nonempty; refinement of the
bounds is monotone. Refutation: one schedule outside the
computed frontier that dominates a frontier member on witnessed
bounds, or one frontier member dominated by another candidate
under the same bounds. Evidence state: proven in the
quantifiable home at the level of bounds, and in the optimality
home in its general form — bounds soundness and attainment, the
three-outcome decision, frontier completeness. The register
records one firing of this falsifier, against a runner layer's
frontier extraction, since fixed and standing as a control; the
bounds-level claim for the solver itself stands.

Thesis 5 — per-execution dominance (register item F6).
Statement, as once hoped: a dominated schedule finishes worse on
every single execution. Evidence state: DISPROVEN, in both
homes, by the same counterexample — bounds [1, 100] against
[2, 3], where the dominated schedule can realize 1 against 3.
Dominance is a statement about bounds, never about one
execution. This row is carried as a disproof, at full strength:
it is the boundary the pareto thesis is stated inside.

Thesis 6 — coverage (register item F2).
Statement: every execution crosses the kernel boundary, so
boundary sensing plus lifting yields a witness for every
execution. Evidence state: PREMISE. The quantifiable home
carries it as a named platform premise, taken as an argument by
every coverage theorem there, never counted as proven; its
exact falsification condition is stated there as an equivalence.
Refutation: one execution of named software that produces a
qualified behavior and leaves no boundary trace and no lifted
state. The register records that the empirical half, for one
sensor on one host, stands refuted by an adversarial pass; the
premise itself, as a statement about the protection model,
stands untouched and is carried here exactly as the home
carries it.

Thesis 7 — incremental recomputation (the hypergraph results).
Statement: incremental results equal full evaluation of the new
snapshot, and the incrementally maintained frontier is exact;
retained-plus-added counts and boolean cells equal complete
regeneration; an alternate receipt support survives the
withdrawal of one support. Refutation: one snapshot pair where
the incremental result and the full evaluation differ on any
atom, or where the maintained frontier drops or adds one member
against the frontier of the full snapshot. Evidence state:
proven in the optimality home. Its scope is printed there: a
semantic refinement result, not a speed result.

Thesis 8 — closure, compounding, and withdrawal.
Statement: the closure operator is extensive, least, monotone,
and idempotent; two sources and any finite family compound,
keeping cross-source consequences the plain union of closures
misses; withdrawal adds no support; a surviving derivation
subsystem is preserved; unsupported cycles do not bootstrap.
Refutation: one closure that drops a root, one compound that
loses a cross-source consequence, one withdrawal that adds
support, one cycle that derives itself from nothing. Evidence
state: proven in the optimality home, in its derivation
semantics module, its executable closure module, and its
composition module.

Thesis 9 — the regression gate (register item F7).
Statement: the gate accepts exactly the candidates that drop no
qualified behavior. Refutation: construct one candidate ordering
that drops, renames, or venue-restricts a qualified behavior and
that the gate accepts. Evidence state: proven in the
quantifiable home as an exact characterization of acceptance,
and discharged in both lanes of the register record. One
adversarial shape stands outside the battery — a drop disguised
as a merge — and stands in the future-work file of this
repository with its closing condition.

Second group — the optimality tranche and the topological
thesis, cited at the census pins.

Thesis 10 — the closure laws (census 48).
Statement: the least closure under a base predicate and a
finite-premise rule relation is least, closed, monotone, and
idempotent; the closure of a union is the closure over the two
closures, retaining cross-source consequences; saturation is
order-independent; withdrawn support yields no new support; no
support arises from cycles alone when every rule needs a
premise. Refutation: one finite rule relation and base
predicate on which any one of these fails. Evidence state:
proven in the optimality home at 0ea4626b, free of axioms per that
home's own audit. This is the full form of the closure entry in
the first group, which cited the same laws at the later live
pin; both citations name the same home and the same module.

Thesis 11 — the executable closure (census 49).
Statement: the executable closure, the intersection of all
models within a finite universe, contains exactly the
derivable facts when roots and rule heads are bounded by that
universe, and the checked gate form returns a result exactly
in that case and refuses exactly when the bounds fail.
Refutation: one bounded input on which the executable closure
holds an underivable fact or misses a derivable one, or one
input on which the gate admits an unbounded case or refuses a
bounded one. Evidence state: proven in the optimality home at
0ea4626b. One dominated point stands against the
implementation, not the theorem: the reference form enumerates
the full powerset, and no efficient worklist form stands in
that file; that point is carried in the future-work file.

Thesis 12 — finite frontier exactness (census 50).
Statement: filtering a finite candidate list by a dominance
predicate yields exactly the frontier that predicate defines,
and for the concrete comparator over integer costs the
frontier is exactly the candidates no-worse on every axis and
strict on at least one against every dominator. Refutation:
one finite candidate list and one axis set on which a filtered
candidate is dominated under the stated comparator, or a
nondominated candidate is filtered out. Evidence state: proven
in the optimality home at 0ea4626b. The native frontier file
of this repository proves the three forms that home does not
carry. One dominated point stands in the same module: its
four-way coloring carries exactness theorems for two of its
four cases and none for the other two; that point is carried
in the future-work file.

Thesis 13 — the general pareto obligations (census 52).
Statement: derived interval bounds are sound and attained;
the maximum, minimum, and sum aggregations are
permutation-invariant; separation on bounds across any number
of axes implies realized strict dominance for the concrete
comparator, while overlap on any axis proves neither direction
separated; and the frontier is complete for that comparator.
Refutation: one workload set whose derived interval excludes a
collected value or attains an end no workload realizes; one
permutation that changes an aggregation; or one separated pair
whose realization escapes dominance. Evidence state: proven in
the optimality home at 78b7b99b, full gate green on the merged
tree at that pin, axioms only the standard three. The first
group's pareto entry states the bounds-level form; this entry
carries the general obligations the census names separately.

Thesis 14 — scoped evidence acceptance (census 53).
Statement: the scoped qualification gate accepts exactly the
evidence sets meeting its full contract — nonempty
requirements, unique obligation keys, every scope tied to the
named policy, equal counts, unique receipt identities, exactly
one matching receipt per obligation within its bound — and
extracts the matching receipt per obligation as its witness.
Refutation: one evidence set the gate accepts that violates
any clause of that contract, or one contract-satisfying set it
refuses. Evidence state: proven in the optimality home at
0ea4626b, with its boundary stated in that file: semantic
soundness is conditional on an explicit validation premise,
and three ingestion obligations are named there and proven
nowhere — authenticity, the binding of a digest to its
content policy, and observation instrumentation. Those
obligations stand as premises of every claim that consumes
scoped evidence.

Thesis 15 — the relevance profile (census 54).
Statement: a relevance profile of four exact coordinates per
intent part — direct contrast, composed-result change,
admissible indirect mutation sensitivity, observed outcome
variability — can be assembled exactly, as unreduced fractions
with positive denominators or as none on empty evidence, with
no scalar aggregation manufactured anywhere. Refutation: one
admitted evidence set on which any coordinate differs from its
stated exact characterization, or on which the
shared-dependency identity the module proves fails to hold
exactly. Evidence state: proven in the optimality home at
0ea4626b. This is a different object from the scalar relevance
thesis of the register (census 13), which stands proposed in
the future-work file exactly as its spec states.

Thesis 16 — finite schedules exactness (census 55).
Statement: filtering the full enumeration of venue and
start-tick assignments by the feasibility predicate returns
exactly the feasible schedules of the enumerated model, and a
certificate designating a feasible schedule with no strict
dominator among all schedules of that model is exact.
Refutation: one assignment within the horizon that the
enumeration misses or the feasibility filter misclassifies,
against the model's own definitions. Evidence state: proven in
the optimality home at 0ea4626b, within limits that file states
itself: durations are nonnegative and positive durations are
not enforced, acyclicity is likewise not enforced, venues are
homogeneous at capacity one, shared resources are unmodeled,
the horizon bounds starts and not completions, and a schedule
need not place every named job. Each limit is a named premise
of this thesis, and the strict form stands in the future-work
file.

Thesis 17 — the topological thesis (census 58).
Statement, quoted from the thesis document of its home: a
conventional compiler is a map from a program's derivation
structure to an artifact that forgets it; that forgetting is
provable information loss — two programs that differ on the
qualified quotient (behavior, the derivability pattern, and
topology, the reachability relation) compile to the same
artifact under the forgetting map, and no function of the
artifact recovers what was dropped — while the
derivation-carrying compiler, whose artifact is the quotient
pair itself, admits a recovery map that is a retraction on the
quotient, with premise cones exact from the artifact and joins
commuting at the level of the topology, and the carried
artifact determines the source up to exactly the qualified
quotient in both directions. Refutation: one recovery map for
the forgetting compiler, exhibited as a function of the
artifact alone that returns each program's own quotient; or
two programs with the same carried artifact that disagree on
the qualified quotient; or one premise cone read from a
carried artifact that differs from its source cone. Evidence
state: proven in Lean at a pin — the loss, preservation, and
completeness claims stand proved in the home named below at
e54db425, its gate green at landing, and an independent
re-check of that gate at that pin, run in this reconciliation
on 2026-11-18 with the family toolchain, exited zero with the
audit of axioms matching the home's recorded audit exactly (the
largest set is propext and Quot.sound; no Classical.choice, no
admitted proof). The home's remote head has since moved one
commit past that pin; the citation stands at the pin that was
re-checked. Scoping, stated in the home and carried here: the
behavior of a merge is not the join of the behaviors — merging
can derive more than either part — and the proven commutation
is at the level of the topology, exactly as stated.
-/

namespace Cited

/-- One cited thesis: its short name, its home, the pin the
citation was read at, and its evidence state. -/
structure Entry where
  name : String
  home : String
  pin : String
  state : String
  deriving DecidableEq, Repr

/-- The cited registry. One row per thesis stated above, in the
order stated. -/
def registry : List Entry :=
  [ { name := "finiteness",
      home := "clpi/software-is-quantifiable",
      pin := "a21c7c56fa028f32014dd795b35b14f688e8fdf1",
      state := "proven" },
    { name := "fold",
      home := "clpi/software-is-quantifiable",
      pin := "a21c7c56fa028f32014dd795b35b14f688e8fdf1",
      state := "proven at value level" },
    { name := "coloring",
      home := "clpi/software-is-quantifiable",
      pin := "a21c7c56fa028f32014dd795b35b14f688e8fdf1",
      state := "proven under one side condition" },
    { name := "pareto",
      home := "clpi/software-optimality",
      pin := "97a5d7f3e68de47cd9eb26221b83e713121673fd",
      state := "proven at bounds" },
    { name := "execution",
      home := "clpi/software-optimality",
      pin := "97a5d7f3e68de47cd9eb26221b83e713121673fd",
      state := "disproven" },
    { name := "coverage",
      home := "clpi/software-is-quantifiable",
      pin := "a21c7c56fa028f32014dd795b35b14f688e8fdf1",
      state := "premise" },
    { name := "incremental",
      home := "clpi/software-optimality",
      pin := "97a5d7f3e68de47cd9eb26221b83e713121673fd",
      state := "proven" },
    { name := "closure",
      home := "clpi/software-optimality",
      pin := "97a5d7f3e68de47cd9eb26221b83e713121673fd",
      state := "proven" },
    { name := "gate",
      home := "clpi/software-is-quantifiable",
      pin := "a21c7c56fa028f32014dd795b35b14f688e8fdf1",
      state := "proven" },
    { name := "laws",
      home := "clpi/software-optimality",
      pin := "0ea4626b7806e9c53e9e742fde6a7d542fb85ee3",
      state := "proven" },
    { name := "executable",
      home := "clpi/software-optimality",
      pin := "0ea4626b7806e9c53e9e742fde6a7d542fb85ee3",
      state := "proven" },
    { name := "frontier",
      home := "clpi/software-optimality",
      pin := "0ea4626b7806e9c53e9e742fde6a7d542fb85ee3",
      state := "proven" },
    { name := "attainment",
      home := "clpi/software-optimality",
      pin := "78b7b99b26ca241ac7a8964f2a4848489978c727",
      state := "proven" },
    { name := "evidence",
      home := "clpi/software-optimality",
      pin := "0ea4626b7806e9c53e9e742fde6a7d542fb85ee3",
      state := "proven" },
    { name := "profile",
      home := "clpi/software-optimality",
      pin := "0ea4626b7806e9c53e9e742fde6a7d542fb85ee3",
      state := "proven" },
    { name := "schedules",
      home := "clpi/software-optimality",
      pin := "0ea4626b7806e9c53e9e742fde6a7d542fb85ee3",
      state := "proven" },
    { name := "topological",
      home := "clpi/software-compilers-lose-info",
      pin := "e54db425ec890d2bf39e5f9fa6f2da18e3910cf7",
      state := "proven" } ]

/-- The registry carries exactly the seventeen theses stated above. -/
theorem count : registry.length = 17 := rfl

/-- Every cited row names one of the three family homes. -/
theorem homes : ∀ e ∈ registry,
    e.home = "clpi/software-is-quantifiable" ∨
      e.home = "clpi/software-optimality" ∨
        e.home = "clpi/software-compilers-lose-info" := by
  decide

end Cited
