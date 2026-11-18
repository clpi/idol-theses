# idol-theses

The falsifiable theses of the Idol program, in Lean.

Every claim the Idol program makes that an observation could
refute is a thesis, and this repository is its native Lean
equivalent: each thesis at its strongest reachable form, each
stated with the observation that would refute it, each carrying
its evidence state in one of four forms — settled intent,
proposed semantics, implemented behavior, verified behavior —
with proven, disproven, and premise used where the Lean record
earns them.

Two rules govern what stands here.

- A thesis whose strongest form already stands proved in a
  family home is cited here, never re-proved. The citation names
  the home and the pin the citation was read at, and carries the
  statement, the refutation condition, and the evidence state.
  A duplicate proof would be a second, weaker home for the same
  claim, and this repository does not make those.
- A thesis with no home yet, whose statement is already fixed,
  is proved here natively, at the strongest form within reach.
  What is not within reach stands as named future work with its
  closing condition, in the future-work file — never as a
  silently weakened theorem.

## Build and gate

Lean 4.19.0, pinned by the toolchain file. No Mathlib and no
other dependency: this is a core development, in the layout of
the family home clpi/software-optimality — a lakefile, a
toolchain pin, and a check gate.

```sh
./check.sh
```

The gate covers every Lean file in the repository — a file
outside its compile list fails the gate — and requires: zero
admitted proofs, zero custom axioms, an escape scan over every
file (the admitted-proof words, the custom-axiom word, and the
compiler escape hatches, each named in the script), warnings as
errors, and an audit whose printed axiom sets stay inside the
standard three: propext, Classical.choice, Quot.sound. Exit
status zero is the verdict. `lake build` also builds the
library, with warnings as errors set in the lakefile.

## The first tranche

Native proofs — proved in this repository:

| Thesis | File | Form proved here |
|---|---|---|
| The monotonicity foundation claim, algebraic half | Merge.lean | Merge over classes of terms is the least upper bound in the information order; merge and the shared part form a lattice, with both absorption laws. The provision the living spec names as missing, proved for the characteristic-function representation the machinery itself uses. |
| The fold laws, uncovered forms | Fold.lean | The fold records exactly the presented set; a feed drawn from a second feed accounts below it; removal of one named witness is exact; the deduplicated feed folds to the same class. |
| The frontier forms, uncovered forms | Frontier.lean | Every member of a named list is on its frontier or strictly dominated by a frontier member; the frontier of the frontier is the frontier; a frontier member undominated by every added member survives the joined list. |

Cited — statement, refutation condition, and citation carried in
Cited.lean, proofs at their homes:

| Thesis | Home | State |
|---|---|---|
| Finiteness of qualification | clpi/software-is-quantifiable | proven |
| The fold laws at value level | clpi/software-is-quantifiable | proven |
| Coloring under its side condition | clpi/software-is-quantifiable | proven under one stated side condition |
| Pareto at bounds | clpi/software-optimality, with clpi/software-is-quantifiable | proven at bounds |
| Per-execution dominance | both homes | disproven, by counterexample, in both |
| Coverage | clpi/software-is-quantifiable | premise, carried as a named premise |
| Incremental recomputation equals full evaluation | clpi/software-optimality | proven |
| Closure, compounding, withdrawal | clpi/software-optimality | proven |
| The regression gate | clpi/software-is-quantifiable | proven |

Pins read on 2026-11-18: the quantifiable home at
a21c7c56fa028f32014dd795b35b14f688e8fdf1, the optimality home at
97a5d7f3e68de47cd9eb26221b83e713121673fd.

The remainder of the census — every thesis not in this tranche,
each with its closing condition — stands in `future-work.md`.

## Reading the files

- `Merge.lean` — the foundation claim's algebraic half.
- `Fold.lean` — the fold forms the family homes do not carry.
- `Frontier.lean` — the frontier forms the family homes do not
  carry.
- `Cited.lean` — the cited tranche: nine theses, each stated
  with its refutation condition, its evidence state, and its
  home, plus the registry as data.
- `Audit.lean` — the printed axiom sets of the native theorems,
  read by the gate.
- `IdolTheses.lean` — the root module; it imports the rest.
