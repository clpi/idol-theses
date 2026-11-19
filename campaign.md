# Campaign — the universal behavioral hypergraph, composed

The synthesis of the whole software family under the universal
behavioral hypergraph campaign, directed by Chris on
2026-11-19. This document restates every family claim in one
shared vocabulary, each with its statement, its implications,
its methodology, and its state with its evidence pointer.

Discipline, from this repository's two rules. A claim proved
at a family home is cited, never re-proved; the citations
landed by this pass stand in the cited file, at the pins named
there. A claim with no home and a fixed statement is proved
natively or stands as named future work with a closing
condition, in the future-work file. Four states are never
blurred: settled intent, proposed semantics, implemented
behavior, verified behavior — with proven, disproven, and
premise where the Lean record earns them. The bidirectional
program is still running: it appears here only as proposed
and in progress, citing its record, never as landed proof.

Pins read for this pass, through the GitHub route on
2026-11-19: the closed loop home at f2c3b6d6, the losses home
at 12ee66e9, the persistence home at eb01cf2e, the profiling
home at a53c4bf5, the quantifiable home at d88acbdc, the
optimality home at 95df5fb7, the composable home at 7b174646,
the safe home at 97e55d28, the certifiable home at 36901673,
the traceable home at 8f6a1280, the compilers home at
69358971, the frontier home at 22418d56, the solvable home at
3053b78d, the benchmarking home at a85286ac, the fuzzing home
at 6ed7a596, the testing home at 18feb7ab, the regression
home at 858a85e3, the review home at 1d504014. Full pins for
the cited claims stand in the cited file. This repository
stood at c443ebe1 when the pass began.

## Shared vocabulary

- Behavioral hypergraph: the one authoritative object for a
  named piece of software. Its atoms are admitted witnesses;
  its hyperedges are finite-premise transfer and composition
  certificates, each edge joining a premise set to a
  conclusion. Derivability is the least closure under the
  edges. Every other object in this document is a derived
  view of this one.
- Hyperlattice: the states of the hypergraph ordered by
  information — one state below another when every fact of
  the lesser is present in the greater — with join as append
  of the underlying lists. Join is the least upper bound up
  to membership equivalence, and the lattice laws hold for
  recorded fact states.
- Incidence matrix: the function of vertex and edge that
  records which vertices each hyperedge touches. It is a
  derived view, never a second source of truth: decoding it
  recovers a bounded hypergraph exactly, and accounting over
  it counts every derivation step's conclusion and premises.
- Contract: the derived, vanishingly small description of a
  system — in the losses form, two lists, capabilities from
  the record and designs from the steps — from which the
  quantifiable axes of a qualification are projected.
- Possible filter: membership in the presented set — what
  the finite presentation admits at all. Finiteness is
  derived from the presentation, never assumed.
- Observed filter: the screen of the possible by what was
  actually witnessed — boundary sensing plus lifting, under
  the coverage premise where that premise is in force.
- Qualified filter: the screen of the observed by the
  qualification itself — the four-valued coloring (lawful,
  unlawful, conflict, unknown) read from the least fixed
  point, with unknown never read as lawful, as a loss, or as
  zero.
- Frontier: the members of a finite candidate list that no
  member dominates on the witnessed bounds, under the stated
  dominance. Dominance is a statement about bounds, never
  about one execution; the per-execution form is disproven
  in two homes.
- Premise cone: the exact set of premises a derivation, a
  verdict, or a speculative result rests on. Revalidation is
  scoped to the cone; a verdict whose cone does not meet the
  changed set carries unchanged.

The glue among these notions that is fixed, small, and
provable in core Lean stands proved natively in this
repository, in the synthesis file: growth of membership
under join, monotonicity of a screen under append-only
joins, nesting of the filters, qualification of a join in
its concrete form, qualification of a join under the named
join-closure premise, and restriction of a qualified join to
its parts. State: verified behavior, by this repository's
gate at this pass.

## Net-new claims

Each claim below is flagged net-new: a finding, model,
analysis, or technique that is new industry-wide, with the
one-line reason it is new. States are stated per claim and
never raised by the flag.

### Net-new one — the hypergraph as the single source of truth

Statement: one behavioral hypergraph per system, from which
the dependency view, the closure, the coloring, the
incidence accounting, the resolution vector, and the
frontier are all derived views, with the hypergraph itself —
never a projection of it — as the object recomputation uses.
Reason new: existing practice keeps the graph, the build,
the test record, and the profile as separate artifacts that
are reconciled by hand; no standing system derives all of
them from one hypergraph with proved exactness of the
derivations. State: the derivation exactness results are
proven at their homes (the solvable, optimality, and
traceable homes); the universal form across libraries is
proposed, as a campaign claim below.

### Net-new two — exact redundancy criteria for testing and benchmarking

Statement: a test, a benchmark result, or an evidence plan
is redundant exactly when its obligations are already
derivable in the closure — an if-and-only-if criterion, with
the least closure itself as the countermodel for any missing
obligation — and a fully covered positive-cost plan is
dominated by omission when omission is admissible.
Reason new: redundancy of tests and measurements is
elsewhere a heuristic (coverage overlap, mutation scores);
an exact, necessary-and-sufficient closure criterion with
checked countermodels is not a standing technique.
State: proven, in the testing home at 18feb7ab and the
benchmarking home at a85286ac, each with the blanket form
disproven beside it.

### Net-new three — losses are compositional and localizing

Statement: gaps compose compoundingly from component gaps
and recorded interaction gaps, loss freeness is
compositional, and every loss in a whole localizes to a gap
at a named contract or composition site, where it is fixed —
not at the instance.
Reason new: performance and capability losses are elsewhere
treated as emergent properties of wholes, chased instance by
instance; a proved composition and localization model for
losses has no standing counterpart. State: proven as a
model, in the losses home at 12ee66e9; it flips no measured
cell, and that boundary is part of the claim.

### Net-new four — persistence minimality by construction

Statement: over the hypergraph of recorded interactions, a
minimum representation of persistent data exists in a finite
candidate space, is chosen minimal by construction, composes
from part minima, and stays readable across versions, with
redundant computation characterized by the same
derivability.
Reason new: compression and storage minimization are
elsewhere empirical codec contests; a machine-checked
minimum-by-construction over a derivation hypergraph,
including functional representation and semi-persistence, is
new. State: proven, in the persistence home at eb01cf2e,
with four standing controls; candidate completeness for a
concrete corpus is that corpus's premise.

### Net-new five — profiling as a synthesizable proof system

Statement: constructed runtime measures are established from
a vanishingly small, incrementally provable, independent set
of certified witness states, with no baseline for any
execution, and with venue and ordering parametric — discrete
finite ranges solved for under the qualification contract —
while ordering effects are accounted deterministically and
idempotently.
Reason new: profiling elsewhere measures against a chosen
baseline on a fixed venue in a fixed order; a baseline-free
constructed-measure system whose witness states compound
exponentially and whose venue and ordering are solved
parameters is new. State: the formal core is proven, in the
profiling home at a53c4bf5; the campaign bridge and the
visibility vector stand proposed there.

### Net-new six — bidirectional contracts

Statement: vanishingly small contracts bidirectionally
produce, equivalently or by an independent route, both the
engineering analysis of a system and the reengineering
analysis of its qualifications, with bounds over the
hyperlattice found incrementally and every bound either
certified tight at the Pareto optimum or carried as an owned
gap.
Reason new: contracts elsewhere are one-directional
specifications checked against an implementation; a proved
round trip in which analysis of a synthesized system returns
the contract exactly, and synthesis of an analyzed system
returns a qualification-equivalent system, is new.
State: proposed semantics, in progress. Evidence pointer:
the bidirectional record in the workspace research folder,
dated 2026-11-19, whose model lane landed gate-verified in
its scratch folder and whose census arm is campaign
evidence, never theorems. Nothing in this claim is cited as
landed proof.

### Net-new seven — provable returns from the hypergraph alone

Statement: every accounting entry resolves to its exact
premise set from the hypergraph alone, at symbol grain and,
where a return needs it, at derivation-step grain; the fold
behind the accounting is independent of event order and of
the time assignment, and retraction is exact.
Reason new: traceability elsewhere is logging plus search;
exact premise-cone returns derived from the witness
hypergraph, quantified over an arbitrary lifting, are new.
State: proven for the stream forms and verified by execution
over the real store, in the traceable home at 8f6a1280
(1,522 of 1,526 entries at symbol grain, 4 at step grain,
none failing).

### Net-new eight — solver dominance by construction, on contract axes

Statement: on a finite universe the coloring iteration
reaches its least fixed point within the universe size, that
fixed point is the least pre-fixed point, monotonicity alone
gives the collapsed continuity form, the fixed point is
exactly the set of facts with a finite derivation, and the
incidence accounting counts every step — so dominance over
named solver incumbents is claimable on the contract axes
(accounting, trace, and coloring completeness) by
construction, with measured speed and memory excluded and
decided only by same-contract measurement.
Reason new: solver comparisons elsewhere are benchmark
contests; a dominance statement assembled from proved
completeness of accounting, trace, and coloring, with the
measured axes honestly excluded, is a new form of claim.
State: proven in this repository, in the solver dominance
file; the measured axes stand unmeasured.

## Family claims in the shared vocabulary

One entry per home. Each entry gives the claim restated in
the shared vocabulary, what follows if it holds, how it is
used, and its state with its evidence pointer.

### Quantifiable — the qualification construction

Statement: a qualification — named software, named criteria,
the behavior intended under them — presents a finite
possible filter by construction; the witness join is a
semilattice, so the accounting fold over the hypergraph is
order- and duplication-free and exactly recomputable; the
coloring, as least fixed point over ground rules relative to
a snapshot, is sound and complete against derivability under
the stated universe condition; bounds derived per assignment
decide dominance with three outcomes, and the frontier at
bounds is exact and nonempty; the regression gate accepts
exactly the candidates that drop no qualified behavior.
Implications: every later family claim can assume a finite,
decidable qualification space and an exact accounting; per
execution dominance does not follow and is disproven here.
Methodology: enumerate the presented space, fold the witness
ledger, color by fixed point, derive bounds, read the
frontier, gate candidates against the prior qualified set.
State: proven, with coverage carried as a named premise —
home clpi/software-is-quantifiable at d88acbdc, and cited in
this repository at its earlier pins for the first tranche.

### Optimality — compounding, selection, and the frontier machinery

Statement: the closure over the hypergraph is extensive,
least, monotone, and idempotent; the closure of a join is
the closure over the closures, retaining cross-source
consequences the plain union misses; withdrawal adds no
support and unsupported cycles do not bootstrap; incremental
recomputation over premise cones equals full evaluation of
the new snapshot, and the maintained frontier is exact; the
executable closure is exact under its bounds, and at the pin
of this pass a worklist form computes the same closure, and
the strict schedule form (positive durations enforced,
acyclicity derived) is exact inside the model; scoped
evidence acceptance is an exact characterization; the
relevance profile assembles exactly with no scalar
aggregation manufactured.
Implications: the closed loop can run incrementally without
a batch mode underneath; the two dominated points this
repository carried against the executable closure and the
schedule form are closed by the worklist and strict
citations of this pass.
Methodology: saturate by closure or by the proved worklist,
re-derive only over premise cones, accept evidence only
through the scoped gate, select on the frontier of the
enumerated finite space.
State: proven — home clpi/software-optimality at 95df5fb7,
with the first-tranche citations at their earlier pins and
the worklist and strict citations added by this pass.

### Compilers lose info — the topological thesis

Statement: a conventional compiler is a map from a program's
derivation structure to an artifact that forgets it; that
forgetting is provable loss on the qualified quotient
(behavior, derivability pattern, topology), with no recovery
map from the artifact alone; the derivation-carrying
compiler, whose artifact is the quotient pair itself, admits
a recovery that is a retraction on the quotient, with
premise cones exact from the artifact and joins commuting at
the level of topology.
Implications: cone-exact revalidation and test selection at
the compiler level, and certification without reconstruction,
follow as corollaries proved there; a foreign toolchain that
forgets cannot recover what it dropped.
Methodology: carry the hypergraph in the artifact; read
cones, reachability, and topology from the artifact, never
reconstruct them.
State: proven (verified in its home's own table) — home
clpi/software-compilers-lose-info at 69358971 for this pass;
the citation in this repository stands at the re-checked pin
e54db425 named in the cited file. Scoping carried: the
behavior of a merge is not the join of the behaviors.

### Closed loop — the family as one running loop

Statement: named software and criteria enter the possible
filter; qualification colors it; executions append witnesses
to the append-only ledger; the fold accounts; bounds and the
frontier derive; candidates are generated, qualified under
the same criteria, and measured against the frontier; an
accepted improvement re-enters as the named software at a new
pin and is requalified by the same qualification.
Implications: the family is not a pile of results but one
loop whose every stage's output is the next stage's input,
and the estate itself can be censused under the same
coloring, with unexamined repos colored unknown.
Methodology: run the loop; keep the synthesis, the census,
the proof-strength ledger, and the ordered next steps current
by machinery, diffing live heads against the recorded pins.
State: implemented as the family's synthesis layer; its
eleven theorems at this pin are instances of the sibling
general forms, as its own record states — home
clpi/software-is-a-closed-loop at f2c3b6d6, cited by this
pass as instances, never raised above its parts.

### Losses — compositional loss fixing

Statement and state: net-new three above; proven as a model
in clpi/software-losses-are-compositional at 12ee66e9, cited
by this pass.
Implications: a loss is a work order at its contract or
composition site; the zero-loss ledger's rows inherit a
structural closing route instead of an instance-level chase.
Methodology: derive the contract from the record, compose
contracts with systems, project the composed contract onto
the solvable axes, read the compounded gap per site, fix at
the site, and flip a cell only on a same-contract re-measure.

### Persistence — minimal representation

Statement and state: net-new four above; proven in
clpi/software-persistence-is-minimal at eb01cf2e, cited by
this pass.
Implications: redundant computation and non-minimal
representation are the same derivability question read two
ways; a representation's minimality verdict is a certificate,
not a benchmark result.
Methodology: record interactions as hyperedges, check
certificates against the stored state, enumerate the finite
candidate space over the contract, choose by the proved
minimum procedure, compose part minima, and read versions
through the readability predicate.

### Profiling — synthesizable constructed measures

Statement and state: net-new five above; the formal core is
proven in clpi/software-profiling-is-synthesizable at
a53c4bf5, cited by this pass, with one premise (facts enter
only as certified witness states) and with the visibility
vector and the time-varying re-solve standing proposed.
Implications: a measurement campaign needs no baseline run;
a vanishing witness set establishes an exponential family of
constructed measures, each falsifiable by one witness.
Methodology: certify witness states at overlaps, compound
them, solve venue and ordering as contract parameters, and
account ordering effects idempotently over time.

### Composable — admission composes symbol by symbol

Statement: admission of a release step is the symbol-wise
behavior and bound check over per-symbol profiles; qualified
behaviors are kept on an admitted step, the keeping composes
along chains, cost bounds do not regress, and per-module
admission implies whole-release admission under the stated
interaction-closure condition; caller closure is exactly the
hypergraph affected set, and rechecking that set matches a
full recheck when profiles outside it are unchanged.
Implications: composition of releases is safe exactly where
the hypergraph says the interaction stays inside the checked
cone; the cross-module form without its condition, the
per-execution form, and seed-only rechecking are disproven
in the same home.
Methodology: admit symbol by symbol, compose along admitted
chains, recheck the affected set read from the hypergraph.
State: proven, with total coverage carried as a premise —
home clpi/software-is-composable at 7b174646, cited by this
pass.

### Incrementally safe — the checker is sound, the cone covers

Statement: acceptance by the release checker implies the
release is safe and taint free, over ordered prefix-closed
traces; the computed code cone covers the inductive cone and
is exactly the hypergraph affected set over the ordered
increment; submitter-supplied dependencies, labels, and
budgets do not change the check; an admitted cost does not
leave the previous cost point; an unguarded frontier alone
is not a release gate, and is disproven as one there.
Implications: safety certification is incremental by cone,
and the audit findings that a checker trusting submitter
inputs is unsound are answered by proved invariance.
Methodology: check the cone, not the whole; derive labels
and budgets from the spec authority, never from the
submitter; guard the frontier with the no-worse check.
State: proven, with external edges and spec authority as
named premises — home clpi/software-is-incrementally-safe at
97e55d28, cited by this pass with its boundary: no recorded
gate log stands in that tree at this pin.

### Incrementally certifiable — certification closure and its checker

Statement: the certification closure has the closure laws in
the same form as the optimality home; evidence cuts compound
by the power-of-two law under the independence premise, and
coverage collapses the consistent set to one under the
coverage premise; the checker's acceptance implies its
release predicate, empty behavior sets are refused, and the
check is invariant in the submitter's changed list.
Implications: a certificate can be maintained incrementally
with carried verdicts, and the count of consistent
candidates is an exact function of the evidence, not an
estimate.
Methodology: close under the certification rules, cut by
independent evidence, check acceptance against the release
predicate read from the prior qualification.
State: proven, under the five premises its readme names —
home clpi/software-is-incrementally-certifiable at 36901673,
cited by this pass.

### Traceable — returns from the hypergraph

Statement and state: net-new seven above; proven for the
stream forms and verified by execution over the real store
in clpi/software-is-more-traceable-than-you-think at
8f6a1280, cited by this pass.
Implications: audit, debugging, and certification read
derivations, not logs; retraction of a witness set is an
exact operation, so withdrawal and replacement are distinct
in the accounting, not a convention.
Methodology: append witnesses with exact time as carried,
fold order-free, resolve each entry to its premise cone in
the hypergraph, refine grain only where a return needs it.

### Frontier solvable — exact frontier search over the hypergraph

Statement: the incidence function of a bounded hypergraph
decodes back to that hypergraph exactly; raising the
environment dial never drops a visible incidence; the
four-color paint is total, and an unknown state is never
qualified and never counts as a dominating improvement; the
exhaustive solver over the finite feasible space emits
exactly the frontier, certifies it, and names a dominator
for any dominated point.
Implications: frontier search over hypergraph states is a
solved, certifiable operation at finite scope; heuristics
are admissible only when their output is checked against
this frontier on the instance.
Methodology: enumerate the feasible space the presentation
derives, solve by exhaustion, certify by the checker, and
carry the exponential cost honestly as the reference form's
stated limit.
State: proven — home clpi/software-frontier-is-solvable at
22418d56, cited by this pass; no fuzzing optimality
corollary is claimed there or here.

### Solvable — witness-compounding resolution

Statement: closure is preserved under appends of roots and
of rules; the closure of a join is the reclosure of the
saturated parts, so mixed-premise consequences are kept; the
resolution vector over named probe lists is nondecreasing
under append with exact marginal gain; merge of knowledge is
commutative, associative, and idempotent up to membership;
the executable gate selects exactly the catalogue entries
satisfying it; withdrawal by filtering creates no derivation
and unsupported cycles collapse.
Implications: search and resolution over the hypergraph
compound monotonically, and the before-and-after resolution
vector is an exact incremental accounting of every append.
Methodology: admit batches, saturate, count supported
probes per scope, select by the gate over the catalogue,
project withdrawals as filters on live roots and edges.
State: proven — home clpi/software-is-solvable at 3053b78d,
cited by this pass; admission and atom encoding are
prerequisites named there.

### Benchmarking — redundancy and dominance of plans

Statement and state: net-new two above, benchmarking half;
proven in clpi/software-benchmarking-is-redundant-and-suboptimal
at a85286ac, cited by this pass.
Implications: a benchmark plan is kept only for the atoms it
alone can derive; prospective removal requires coverage of
every possible outcome, so a flaky experiment is not made
redundant by one known pass.
Methodology: read plans as evidence over the hypergraph,
test redundancy by the exact criterion, replace covered
plans by their covering plan or by omission where omission
is admissible and its true cost is charged.

### Fuzzing — conditional suboptimality of plans

Statement: plan dominance is transitive and preserves budget
feasibility and required coverage; dominating replacement
composes additively; a certified replay already retained is
strictly dominated by omission at positive cost; the
certifier accepts exactly its stated relation; and, by
countermodel in the same home, adaptive policies beat every
fixed plan in the three-world oracle while a targeted plan
beats the adaptive policy once the target is justified — so
suboptimality is conditional, never universal.
Implications: evidence-generation budgets are spent by
dominance reasoning over the hypergraph, not by habit; fresh
independent samples are distinct goals and cannot be deleted
as duplicates.
Methodology: summarize plans by covered goals and declared
cost under one contract, certify strict dominance, compose
replacements, and keep stochastic readings outside the
theorem, where they belong.
State: proven — home clpi/software-fuzzing-is-suboptimal at
6ed7a596, cited by this pass.

### Testing — the exact redundancy criterion

Statement and state: net-new two above, testing half; proven
in clpi/software-testing-is-redundant at 18feb7ab, cited by
this pass, with the blanket form disproven there.
Implications: derived obligations need no hand-written
restatement, and every derived view — colors, incidence
views, gates that depend only on those atoms — is preserved
when a redundant suite is removed; obligations a gate reads
from counts, timing, or fresh runs are part of the obligation
and are not removed by the criterion.
Methodology: encode each test's complete scoped obligation
as atoms, test membership in the closure, remove exactly the
covered suites, and re-evaluate at the named snapshot after
any withdrawal.

### Regression — the guarded selector

Statement: under three named premises — the baseline stays
eligible, the axes are the authorized ones, the interval
measurements are valid — the selector returns the baseline
or the first guarded candidate whose upper bound on every
authorized axis is at most the baseline's; shipped releases
stay related by the no-regression relation along a stream,
and ascent ships an undominated improvement when the finite
universe contains one; context, data, configuration, and
deployment edges put unchanged dependents into the recheck
cone, where symbol-only cones miss them, proved on three
finite incident-shaped graphs.
Implications: no-regression is a property of the guarded
selection, not of frontier membership; the cone that decides
rechecking is the full hypergraph cone, never the symbol
projection.
Methodology: guard first, then filter by the frontier;
recheck the cone over all node kinds; keep the incumbent
when no guarded candidate qualifies.
State: proven from its premises — home
clpi/software-doesnt-have-to-regress at 858a85e3, cited by
this pass; the per-execution form is disproven there.

### Review — redundancy in the narrow form only

Statement: for a change inside a sound cone whose spec,
roots, and rules are unchanged, rechecking the machine
checked property is equivalent to re-reviewing it, and the
review bit is then the certifier's bit; the cone condition
holds for the context-aware call closure.
Implications: routine human review is eliminable exactly
inside that scope, and not one step outside it — review
given a wrong spec is disproven as redundant in the same
home, by two boundary counterexamples.
Methodology: certify the cone and the unchanged spec, roots,
and rules; let the certifier's bit stand for the review bit
inside the scope; route everything else to review.
State: proven in narrow form — home
clpi/software-doesnt-need-review at 1d504014, cited by this
pass. The program-scale form stands in the future-work file
as census 40.

## Composed claims

### The composed theorem, enlarged

Statement: over one named snapshot (2,509 witnesses, 8,482
join edges, 15 steps, 1,526 entries, standing accounting
named in its record), eleven parts hold together under ten
hypotheses: finiteness; coloring; coloring monotonicity,
compounding, and segregation; the four states, in partial
form; the fold at full text strength with timed
independence; the frontier at bounds in capacity-general
form with its complete receipt; incremental exactness;
retraction exactness; compilation cone exactness with joins
commuting at the proven strength; trace resolution; and the
engine saturation in its failed form, printed at measured
size inside the statement.
Implications: the family's parts are not merely separately
true; they were checked as one object over one snapshot, and
the composition claims its one failure (saturation past the
smallest subject) at full size rather than dropping it.
Methodology: one checker over one snapshot recomputing every
part and issuing the five-part receipt, with the saturation
part and the four-states part partial in the receipt, named.
State: verified at the strengths its lines state — evidence
pointer: section 27 of the decidability spec in the
workspace research folder, and its check record,
composed-theorem-full-check, dated 2026-11-18. Coverage
stays a premise; the linear cost shape and the relevance
measure stay proposed and outside the conclusions.

### Bidirectional — contracts both ways

Statement, implications, and methodology: net-new six above.
State: proposed semantics, in progress — never landed proof
in this document. Evidence pointer: the bidirectional
record in the workspace research folder, dated 2026-11-19,
including its gap register, in which contract fidelity
stands as a named premise, the safe home's gate stands
unrecorded, and the persistence corpus's floor stands open.
Its closing conditions stand in the future-work file of this
repository, in the synthesis section added by this pass.

### Solver dominance — the contract axes

Statement and state: net-new eight above; proven natively in
this repository. Methodology: decide dominance on the
contract axes from the proved completeness results; decide
speed and memory only by same-contract measurement, which
stands unmeasured and in the future-work file.

## Campaign claims

The four implications of the campaign directive, stated as
campaign claims in proposed state. None is proven. Each
names its falsification route: the campaign's empirical arm,
which builds one behavioral hypergraph per library —
beginning in the idol library and growing — joins them into
the universal hypergraph, and measures each claim against
that representation at a named pin.

### Campaign one — redundant in compute

Claim: any software, as represented in its behavioral
hyperlattice, is provably redundant in its compute: some
part of its recorded computation is derivable from the rest,
by the exact redundancy criterion of the testing and
benchmarking homes applied to its hypergraph.
Falsification route: one library hypergraph, built and
checked at a named pin, in which every recorded computation
step is a singleton witness — no step's obligations inside
the closure of the rest — exhibited with its closure
computation. That single irredundant hypergraph refutes the
universal claim and restates it at the strength that
survives.

### Campaign two — suboptimal in representation

Claim: any software, as represented in its behavioral
hyperlattice, is suboptimal in its representation: its
persistent form is not the minimum representation the
persistence model constructs over its contract.
Falsification route: one library whose stored representation
is certified equal to the constructed minimum over its full
contract at a named pin, with the candidate space enumerated
and the floor proved, not merely unbeaten in a search.

### Campaign three — suboptimal in performance

Claim: any software, as represented in its behavioral
hyperlattice, is suboptimal in its performance: some
assignment in its presented space dominates its incumbent
assignment at the witnessed bounds, or its frontier stands
uncomputed and its incumbent uncertified.
Falsification route: one library whose incumbent is
certified on its exact frontier over the whole presented
space at a named pin, with the complete frontier receipt —
an incumbent proved undominated everywhere, not merely
unbeaten in the runs attempted.

### Campaign four — suboptimal in architecture

Claim: any software, as represented in its behavioral
hyperlattice, is suboptimal in its architecture: the
anti-unification of its join hypergraph yields a base
contract set strictly smaller than the architecture's own
distinction set, with the same qualified behavior — its
structure carries distinctions its behavior does not use.
Falsification route: one library whose distilled base
contract set, computed over its join hypergraph at a named
pin, is exactly its own distinction set, with the equality
checked in both directions.

### Campaign machinery — the supporting claims, all proposed

One behavioral hypergraph per library, semi-persistent and
project-independent, joining optimistically into one
universal hypergraph: the joined hyperlattice of possible
states, with the observed filter and the qualified filter
applied over the join. A measurement overlapping any piece
of a system's hypergraph can be vanishingly small yet yield
compounding constructed measures over the whole. A bounded
structural technique searches the frontier of that space
parametrically and optimally. The no-architecture-change
base contract set is distilled by anti-unification across
the join, at bit and symbolic level. States: proposed
semantics, all four; their closing conditions stand in the
future-work file. The glue forms among the filters and the
join that these claims presuppose are the part already
proved natively in this repository, in the synthesis file.

### The safe rewrites — the register and the composer

Claim: a finite set of rewrites composes safely — the
composed transformation preserves the composed contract and
is regression-free on the qualified filter — when each
rewrite preserves its contract on the qualified filter and
every pairwise interaction is itself a recorded contract
preserved by both sides. State: the composer form of this
claim is proven natively in this repository, in the composer
file landed by the rewrites pass: the composer theorem and
its pair form, the repetition lemma, the exchange lemma,
the screen exchange and repetition lemmas, and a standing
control — a proved negation showing two individually safe
rewrites whose unrecorded interaction breaks the composed
contract on a concrete instance, so the interaction premise
is load-bearing. The per-system register the composer
serves — sixty-five candidates across the five rewrite
classes of the campaign directive (compressed, optimally
ordered, venue-selected, idempotent, keyed), over the
fourteen libraries at the campaign pin and the restart
records store, each with its transformation, its proof
obligations cited or proved, and its constructed economics
checked against measurement where a measurement exists —
stands in the research record as the safe rewrite register
of 2026-11-19. Every candidate in it stands proposed: none
carries a full before-and-after pair yet, and the register
says so per class. The one proof remainder — deriving
commutation from premise disjointness inside the proof
development rather than taking commutation as a premise —
stands in the future-work file with its closing condition.

## What this pass landed

Citations: seventeen new cited theses (theses 18 to 34 of
the cited file), covering every family home not previously
cited, and closing, by citation at the optimality pin of
this pass, the worklist dominated point against census 49
and the strict schedule form against census 55.
Native proof: the composition glue, in the synthesis file,
under this repository's gate. The rewrites pass added the
composer file to the same gate: the composer theorem, its
pair form, the repetition and exchange lemmas, the screen
lemmas, and the standing control, all green cold with every
result inside the standard three assumptions.
Future work: every composed claim not landed as citation or
proof stands in the future-work file, in the synthesis
section added by this pass, each with its closing condition.
