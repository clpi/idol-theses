# Future work — the census remainder

Every falsifiable thesis of the Idol program that is not in the
first tranche stands here, named, with its evidence state and
its closing condition. A thesis leaves this file only by landing
in this repository as a native proof, or by gaining a family
home strong enough to cite. Nothing here is counted as proved,
and no entry is silently dropped: an entry that is refuted keeps
its refutation as its state.

States use the four forms of the program: settled intent,
proposed semantics, implemented behavior, verified behavior —
with proven, disproven, open, and premise where the Lean record
earns them. Sources: the falsification register of 2026-11-17
(items F1 to F13 and the whole-construction items), the
decidability-engine spec (its section 24 and its neighboring
sections), the monotonicity record, and the release record of
2026-11-18.

## From the falsification register

### F2, empirical half — the sensor claim

Thesis: the boundary sensor on a named host yields a witness
for every execution. State: disproven for the sensor and host
on record — an adversarial pass on 2026-11-17 produced
executions with effects on disk and no witness, and one whose
witness fails independent verification. The premise form of F2
is unaffected and is carried in the cited tranche. Closing
condition: the named repairs land (records streamed as they
arrive, caps stated on the qualification, a tracer check treated
as a sensed event) and the adversarial battery re-runs at a
named pin with every shape witnessed and verified.

### F4, remainder — the engine saturation battery

Thesis: the decidability engine's saturation reaches its fixed
point and its merge condition holds as written, on subjects past
the smallest probe. State: implemented behavior, measured
failing — the battery executed on 2026-11-17 shows a fixed point
only on the smallest subject, a depth condition that deadlocks,
a node cap that truncates silently, and one required merge
blocked by the merge condition as written. The coloring thesis
itself stands proven and discharged, in the cited tranche.
Closing condition: the named repairs land in the engine spec
and its implementation, and the battery re-runs at a named pin
with its final round empty on subjects past the smallest probe.

### F7, remainder — the merge-disguised drop

Thesis: the regression gate refuses a drop disguised as a
merge — two behaviors folded into one name carrying the union
of costs. State: proposed semantics; the gate thesis stands
proven in the cited tranche, and this one adversarial shape
stands outside its battery. Closing condition: the shape enters
the battery and the gate refuses it by name, or accepts it and
the gate thesis is restated at the strength that survives.

### F8, remainder — the adversarial shapes

Thesis: the computed frontier equals the exhaustive frontier on
every instance, including the adversarial shapes: ties
everywhere, one dominant behavior, zero-cost tests. State:
verified behavior on the shapes run (a thirteen-instance
ladder, a seeded sweep of forty, the real instance); the
adversarial shapes are the named next rung, unrun. Closing
condition: the three shapes execute and match set for set, or
one separates the two frontiers and the thesis falls.

### F9 — sensor completeness over the foreign battery

Thesis: every foreign program's execution produces a witness
that verifies. State: disproven on this host — of four
adversarial programs, three evade, as the F2 entry records; the
original twelve-case battery still passes as executed and no
longer supports a completeness reading. Closing condition: the
same repairs as the F2 entry, and the enlarged battery — the
twelve cases plus the adversarial shapes — passing at a named
pin.

### F10, remainder — the splice shape

Thesis: a corrupted witness, a stale snapshot, or a
cross-snapshot ordering is caught. State: verified behavior for
the three named shapes; untested on the splice — two snapshots,
each internally clean, halves joined. Closing condition: the
splice executes and is refused, or is accepted and the thesis
falls.

### F12 — the resolution claim

Thesis: the representation of the execution environment is the
most robust and highest-resolution one the platform affords.
State: settled intent, asserted as a requirement, never
verified; open since the design was dictated. Its falsification
surface is the census at section 18.17 of the decidability
spec, and one live candidate refutation stands named there:
per-event content — call arguments and return values a tracer
stop affords and the carried representation does not record.
Closing condition: the census is decided item by item — each
distinction the platform affords is shown expressible in the
representation, or the claim is restated at the resolution that
survives.

### F13 — relevance of a metric to an intent composition

Thesis: the counted influence of a metric on an intent
composition, discounted by indirect pressure, computed exactly
over the step graph of a named snapshot, in reduced rationals
with no tolerance. State: proposed semantics, defined at
section 26 of the decidability spec on 2026-11-17. One family
home carries a formalization of the measure's exactness
properties over its own model — the relevance module of the
optimality home, at the pin named in the cited file — which
proves the profile arithmetic exact and does not yet discharge
the register's closing condition. Closing condition, as section
26.10 names it: the hand-computed example of section 26.9
reproduced exactly, one witnessed instance computed, and an
independent recomputation agreeing digit for digit on all six
reported quantities.

### The whole-construction items

W1: one qualification decision the machinery gets wrong on
witnessed data refutes the program's claim to decide
qualification. W2: one real regression the gate accepts. W3:
one execution class provably unwitnessable by any boundary
sensor on a named platform — this bounds the coverage premise
per platform rather than ending the construction, and its
honest outcome is the premise printed on the qualification
itself. W4: one case where the recommended ordering measures
worse than the incumbent under its own discharge. State: these
are standing refutation conditions over the whole construction,
not single theorems; each closes only in the sense that it
fires or the construction is retired. They are carried here so
the census is complete.

## From the spec, section 24 and its neighbors

### The composed theorem as one object

Thesis: the four parts of section 24.2 — finiteness, coloring,
fold invariance at value level, the frontier at bounds — hold
together over one named snapshot under the eight hypotheses of
section 24.3. State: proposed semantics. Every part stands
proven or discharged on its own, in the cited tranche; no
single run has yet checked the composed statement as one
object over one snapshot, and section 24.5 names that gap.
Closing condition: one run, one snapshot, the composed
statement checked as one object, at a named pin.

### The coloring in rule form, joined to the closure

Thesis: the rule form of sections 24.6 to 24.10 is the same
closure the homes prove. State: proposed semantics in part —
the optimality home proves the equivalence of Horn derivability
and its closure operator, and the snapshot computation's
agreement under the universe premise; the joined statement over
the spec's own rule form is not yet carried. Closing condition:
the rule form is stated in Lean over the spec's snapshot shape
and the equivalence is proved against the cited closure, or a
counterexample separates them.

### The capacity generalization, section 25

Thesis: no claim of the construction relies on capacity one; a
venue carries a capacity, and time is the longest path over the
combined graph at any capacity vector. State: implemented
behavior — the solver on disk takes capacity as a per-venue
table and its battery ran capacities above one; no Lean form
stands in any home. Closing condition: the schedule model of a
family home is restated with capacity as a parameter and its
exactness theorems are re-proved at that generality, or a
capacity-above-one counterexample separates the forms.

## The monotonicity foundation claim, remainder

Thesis: all software is a finite state machine over a
join-semilattice of equivalent terms. State: settled intent as
a directive, posed by its author as a question; the readings of
it are interpretation, and the developed answer is proposed
semantics. The algebraic half is proved natively in this
repository, in the merge file. Two parts remain. The
identification premise: that the states of a given piece of
software, under the equivalence the machinery checks, are
faithfully represented by the classes of the merge file.
Closing condition: the representation is constructed for one
named subject at a named pin and the faithfulness is proved, or
a state is exhibited that the representation cannot carry. The
state-machine half: that the nodes and transitions of a subject
map to the configurations of that semilattice. Closing
condition: the map is constructed for the same named subject
and its preservation of transitions is proved, or one
transition is exhibited with no image.

## The topological thesis

Thesis: improvement across the whole topology the two family
homes imply — every proof point at its strongest reachable
state, no dominated point left standing. State: proposed
semantics, in flight under a directive of 2026-11-18. Closing
condition: a census of the topology's proof points at named
pins, each point labeled proven at its strongest form, premise,
disproven, or open with an owner — and every dominated point
either strengthened or named as the standing remainder.

## The self-hosting claims

Thesis: the Idol compiler compiles itself end to end with no
foreign intermediary in the release path — no foreign host
language, no foreign runtime, no bridge without an elimination
order. Refutation: one build step at the release pin that
invokes a foreign compiler or runtime in the path the release
ships. State: implemented behavior in part — the self-hosting
battery stands green on its home venue and the Linux
native-route blocker stands closed, both at their pins in the
release record; the macOS oracle legs are still owed, and the
compiler's Rank 1 fact stands: the production compiler is still
written in a foreign host language. Closing condition: the full
self-build executes at the release pin on every release venue,
with the foreign-intermediary census at zero in the shipped
path, and the claim is then stated in Lean over the build graph
as a named snapshot.

## The PPC expectation

Thesis: among semantically equivalent forms, the least-chars
form yields at least equivalent performance, power, and
composability — the standing expectation of the program,
verified never assumed. State: proposed semantics as a general
claim; measured per application, at the same contract, wherever
it has been applied, with each regression treated as a
machinery defect. It is an empirical thesis, and no Lean proof
can discharge it; its Lean form, when it lands, is the
statement over a named measured set. Closing condition: the
measured set at the release pin — every application of the
program's idioms measured before and after at the same
contract, the set stated here with its pins — stands complete,
and every measured loss in it carries its closing work or the
thesis is restated at the strength the measurements survive.
