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
      state := "proven" } ]

/-- The registry carries exactly the nine theses stated above. -/
theorem count : registry.length = 9 := rfl

/-- Every cited row names one of the two family homes. -/
theorem homes : ∀ e ∈ registry,
    e.home = "clpi/software-is-quantifiable" ∨
      e.home = "clpi/software-optimality" := by
  decide

end Cited
