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
Third group — the family tranche of the synthesis pass of
2026-11-19, cited at the heads the pass read back through the
GitHub route on that date. One representative claim per home
not previously cited; the full claim sets stand in the
synthesis document of this repository.

Thesis 18 — losses are compositional.
Statement: a contract is derived from recorded behavior;
recording is additive; contracts compose with systems; gaps
compose from component gaps and recorded interaction gaps;
loss freeness is compositional; every loss in a whole
localizes to a gap at a named contract or composition site.
Refutation: one whole whose loss localizes to no component
gap and no recorded interaction gap, or one composition of
loss-free parts that carries a loss with no interaction gap
recorded. Evidence state: proven in its home at the pin
below (thirteen theorems, three standing controls); the home
states the boundary itself — the model flips no measured
cell, and record fidelity for a concrete campaign is that
campaign's premise.

Thesis 19 — persistence is minimal.
Statement: over a hypergraph of recorded interactions,
derivability from persistent state, certificate checking,
finite candidate spaces, domination, minimum-by-construction
choice, composition of part minima, and version readability
hold as theorems, so a minimum representation exists and is
chosen by construction over the enumerated space.
Refutation: one representation in the enumerated space that
the choice procedure passes over and that dominates its
choice on the contract axes, or one version the readability
predicate accepts that is not derivable from the stored
state. Evidence state: proven in its home at the pin below,
gate log in tree; the candidate completeness of a concrete
corpus is that corpus's premise, named in the home's spec.

Thesis 20 — profiling is synthesizable, core form.
Statement: constructed measures are functions of the overlap
and the certified witnesses alone, invariant under any
external baseline; a contract's configuration count is the
product of its two finite set counts; independent witness
facts compound to exactly the power-of-two count of distinct
assignments; incremental accounting equals full accounting;
an inert step is removable with every measure preserved; a
least cost configuration exists under any cost assignment.
Refutation: one constructed measure that changes when only
the external baseline changes, or one contract whose
configuration count differs from the product. Evidence
state: proven in its home at the pin below (sixteen theorems
at that pin's completion record, three standing controls).
Premise carried: facts about a runtime enter only as
certified witness states. The visibility vector stands
proposed in that home and is not cited here.

Thesis 21 — release admission is composable.
Statement: admission is the symbol-wise behavior and bound
check; qualified behaviors are kept on an admitted step and
that inclusion composes along admitted chains; cost bounds
do not regress on an admitted step; per-module admission
implies whole-release admission when calls stay inside a
module. Refutation: one admitted chain that drops a qualified
behavior, or one module-closed pair of admitted modules whose
composition is refused. Evidence state: proven in its home
at the pin below; the same home disproves the per-execution
form and the cross-module form without its side condition,
and those disproofs are part of this citation's boundary.

Thesis 22 — incremental safety of the release checker.
Statement: acceptance by the checker implies the release is
safe and taint free; the computed code cone covers the
inductive cone; submitter-supplied dependencies, labels, and
budgets do not change the check; an admitted cost does not
leave the previous cost point. Refutation: one accepted
release that is not safe or carries a taint flow, or one check
whose outcome changes when only submitter inputs change.
Evidence state: proven in its home at the pin below, with
two premises named there (external edges, and the spec
writer's authority). Boundary: no recorded gate log stands
in that tree at this pin, a gap the bidirectional record
names; the citation rests on the tree's statements at the
pin, gate unrecorded.

Thesis 23 — incremental certification soundness.
Statement: the certification closure is extensive, monotone,
idempotent, and compounding in the same form as the closure
laws; the checker's acceptance implies its release predicate;
empty behavior sets are refused; submitter changes to the
changed list alone do not change the check. Refutation: one
accepted delta whose release predicate fails, or one closure
that drops a root. Evidence state: proven in its home at the
pin below, under the premises its readme names (required
nonempty, nothing outside, no coverage gaps, independence,
coverage), each carried as a premise of the claims that use
it, never counted as proven here.

Thesis 24 — traceability of the witness stream.
Statement: the accounting fold is independent of event order
and of the time assignment; retracting a set of events leaves
exactly the fold of the surviving events; every accounting
entry resolves to its derivation from the hypergraph alone.
Refutation: one permutation or retiming of a witness feed
whose fold differs, or one entry with no derivation in the
hypergraph that the accounting carries. Evidence state:
proven in its home at the pin below for the fold, retraction,
and return forms; the establishment over the real store at
that pin stands verified by execution there (1,522 of 1,526
entries at symbol grain, 4 at derivation-step grain, none
failing).

Thesis 25 — the frontier is solvable by exhaustion.
Statement: over a finite space of feasible schedules, the
exhaustive solver emits exactly the frontier under the stated
dominance; every emitted point is free of dominance, every
undominated point is emitted, and a dominated point is
returned with one feasible dominator named. Refutation: one
finite space whose emitted frontier contains a dominated
point or omits an undominated one. Evidence state: proven in
its home at the pin below, with its limits stated there:
exactness is over the enumerated finite space, the solver is
exponential in that space, and no fuzzing optimality
corollary is claimed.

Thesis 26 — resolution compounds over the hypergraph.
Statement: closure is preserved under appends, including
appends that add rules; the closure of a join is the
reclosure of the join of the saturated parts, not the plain
union of closures; the resolution vector over named probe
lists is nondecreasing under append, with exact marginal
gain; withdrawal by filtering creates no new derivation.
Refutation: one append that loses a derivation, one join
whose mixed-premise consequence the reclosure misses, or one
withdrawal that creates support. Evidence state: proven in
its home at the pin below; admission and encoding of atoms
are prerequisites named there, not proved there.

Thesis 27 — benchmarking redundancy is exact and conditional.
Statement: a result is redundant exactly when every atom it
contributes is already derivable, and adding it then leaves
the whole closure unchanged; a plan whose evidence is fully
covered by a no-more-costly plan is dominated and not Pareto
optimal among admitted plans; prospective removal requires
coverage of every possible outcome. Refutation: one redundant
result whose addition changes the closure, or one covered
positive-cost plan that remains Pareto optimal when omission
is admissible. Evidence state: proven in its home at the pin
below; no speedup or statistical claim is made there, and
the outcome catalogue's completeness is not derived there.

Thesis 28 — fuzzing dominance is exact and conditional.
Statement: plan dominance (goal coverage with no greater
cost) is transitive and preserves budget feasibility and
required coverage; replacement by a dominating subplan
preserves dominance in additive composition; a certified
replay whose coverage is already retained is strictly
dominated by omission at positive cost; the executable
certifier accepts exactly its stated relation. Refutation:
one dominating replacement that breaks a budget or drops a
required goal, or one certifier acceptance outside its
characterization. Evidence state: proven in its home at the
pin below; the same home proves by countermodel that fixed
plans can beat adaptive ones and adaptive ones can beat
fixed ones, so no universal inferiority is cited.

Thesis 29 — testing redundancy is an exact criterion.
Statement: a suite is redundant exactly when its obligations
are inside the closure of the live support, equivalently
when adding it leaves the closure unchanged; covered
obligations stay redundant under further appends; bases with
the same closure are interchangeable under future joins.
Refutation: one suite inside the closure whose addition
changes the closure, or one suite outside it whose addition
changes nothing. Evidence state: proven in its home at the
pin below; the blanket form (every hand-written test is
redundant) is disproven there by a finite counterexample and
is not cited.

Thesis 30 — the guarded selector never regresses.
Statement: under its three named premises (the baseline
stays eligible, the axes are the authorized ones, the
interval measurements are valid), the selector returns the
baseline or the first guarded candidate, and that result's
upper bound on every authorized axis is at most the
baseline's. Refutation: one selection under those premises
whose returned upper bound exceeds the baseline's on an
authorized axis. Evidence state: proven in its home at the
pin below, from exactly those premises; the per-execution
form is disproven in the same home and is not cited.

Thesis 31 — review is redundant only inside the narrow form.
Statement: for a change inside a sound cone whose spec,
roots, and rules are unchanged, rechecking the machine
checked property is equivalent to re-reviewing that
property, and the review bit is then the certifier's bit.
Refutation: one in-cone change with unchanged spec, roots,
and rules where recheck and re-review disagree. Evidence
state: proven in its home at the pin below; the wide form
(review redundant even when the spec is wrong) is disproven
in the same home and is not cited.

Thesis 32 — the closed loop, as instances.
Statement: named software and named criteria enter; the
finite space is colored; witnesses append; the fold
accounts; bounds and a frontier derive; candidates are
generated, qualified, and measured; an accepted improvement
re-enters as the named software at a new pin and is
requalified by the same qualification. Refutation: one stage
whose output is not the next stage's input as stated, or one
requalification that is not the same qualification applied
to the new pin. Evidence state: the loop's eleven theorems
at the pin below are instances of the sibling general forms,
as its own record states; this citation carries the loop as
the family's synthesis layer, not as a new proof home, and
no composed claim is raised above its parts' states.

Thesis 33 — the worklist form of the executable closure.
Statement: a worklist iteration computes the same closure as
the reference saturation of the executable closure thesis:
one step adds exactly the rule heads whose premises are all
present, the iteration is a membership fixed point after at
most the universe size plus one steps, and the checked
worklist returns exactly what the checked reference returns.
Refutation: one bounded input on which the worklist result
and the reference result differ. Evidence state: proven in
the optimality home at the pin below. This citation closes
the dominated point carried against census 49 in the
future-work file: the reference form's powerset enumeration
now stands beside a proved worklist form at this pin.

Thesis 34 — the strict schedule form.
Statement: in the schedule model with positivity enforced
inside it, feasibility conjoined with the positivity check
is exactly strict feasibility; every listed dependency of a
strictly feasible schedule is a strict precedence; and no
strictly feasible schedule carries a dependency cycle, so
acyclicity is derived, not assumed. Refutation: one strictly
feasible schedule with a nonpositive placed duration or a
dependency cycle. Evidence state: proven in the optimality
home at the pin below. This citation closes the strict form
carried against census 55 in the future-work file, within
the base model's stated limits (homogeneous venues, shared
resources unmodeled), which remain named there.

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
      state := "proven" },
    { name := "losses",
      home := "clpi/software-losses-are-compositional",
      pin := "12ee66e9c9cdaeec4bea5eb8fb1fd61e6df780fb",
      state := "proven" },
    { name := "persistence",
      home := "clpi/software-persistence-is-minimal",
      pin := "eb01cf2e33a20bfbda5a03aba7a48c70fbd10741",
      state := "proven" },
    { name := "profiling",
      home := "clpi/software-profiling-is-synthesizable",
      pin := "a53c4bf5aa83e8677ecb66571d61ed4c11e2d88d",
      state := "proven" },
    { name := "composable",
      home := "clpi/software-is-composable",
      pin := "7b1746467a410e9e5ae309f2a86bc4cd37700989",
      state := "proven" },
    { name := "safe",
      home := "clpi/software-is-incrementally-safe",
      pin := "97e55d28edc0d33f3466de3a3e4061e010c3b4d5",
      state := "proven, gate unrecorded" },
    { name := "certifiable",
      home := "clpi/software-is-incrementally-certifiable",
      pin := "3690167318cf4d41b51d0945f4fccc7f043e8412",
      state := "proven" },
    { name := "traceable",
      home := "clpi/software-is-more-traceable-than-you-think",
      pin := "8f6a128069d0e68e97c4a69d78689c84350b0d2f",
      state := "proven" },
    { name := "exhaustive",
      home := "clpi/software-frontier-is-solvable",
      pin := "22418d56604c96fdc1ba2875f3167e228b6ac6f3",
      state := "proven" },
    { name := "resolution",
      home := "clpi/software-is-solvable",
      pin := "3053b78d24bd81299e998bc253c755ab4a5e9b43",
      state := "proven" },
    { name := "benchmarking",
      home := "clpi/software-benchmarking-is-redundant-and-suboptimal",
      pin := "a85286acc1f62c12992aa3a0ac8dee529b62927d",
      state := "proven" },
    { name := "fuzzing",
      home := "clpi/software-fuzzing-is-suboptimal",
      pin := "6ed7a59651ae9dab006b7903a98d3d598cca19ea",
      state := "proven" },
    { name := "testing",
      home := "clpi/software-testing-is-redundant",
      pin := "18feb7ab60d542007124405fd8e1dc209c68361a",
      state := "proven" },
    { name := "guarded",
      home := "clpi/software-doesnt-have-to-regress",
      pin := "858a85e383fbecc9826186aee2cc0101aea5ea62",
      state := "proven under three premises" },
    { name := "review",
      home := "clpi/software-doesnt-need-review",
      pin := "1d504014be0c727b3f12e4d8e17f47dfceb118b6",
      state := "proven in narrow form" },
    { name := "loop",
      home := "clpi/software-is-a-closed-loop",
      pin := "f2c3b6d643bba02e90fb16381d20c9b891210e65",
      state := "proven as instances" },
    { name := "worklist",
      home := "clpi/software-optimality",
      pin := "95df5fb7e922e7316b0ebe90b7847fd45a208d88",
      state := "proven" },
    { name := "strict",
      home := "clpi/software-optimality",
      pin := "95df5fb7e922e7316b0ebe90b7847fd45a208d88",
      state := "proven" } ]

/-- The registry carries exactly the thirty-four theses stated above. -/
theorem count : registry.length = 34 := rfl

/-- Every cited row names one of the eighteen family homes. -/
theorem homes : ∀ e ∈ registry,
    e.home = "clpi/software-is-quantifiable" ∨
      e.home = "clpi/software-optimality" ∨
        e.home = "clpi/software-compilers-lose-info" ∨
          e.home = "clpi/software-losses-are-compositional" ∨
            e.home = "clpi/software-persistence-is-minimal" ∨
              e.home = "clpi/software-profiling-is-synthesizable" ∨
                e.home = "clpi/software-is-composable" ∨
                  e.home = "clpi/software-is-incrementally-safe" ∨
                    e.home = "clpi/software-is-incrementally-certifiable" ∨
                      e.home = "clpi/software-is-more-traceable-than-you-think" ∨
                        e.home = "clpi/software-frontier-is-solvable" ∨
                          e.home = "clpi/software-is-solvable" ∨
                            e.home = "clpi/software-benchmarking-is-redundant-and-suboptimal" ∨
                              e.home = "clpi/software-fuzzing-is-suboptimal" ∨
                                e.home = "clpi/software-testing-is-redundant" ∨
                                  e.home = "clpi/software-doesnt-have-to-regress" ∨
                                    e.home = "clpi/software-doesnt-need-review" ∨
                                      e.home = "clpi/software-is-a-closed-loop" := by
  decide

end Cited
