/-
The assumptions audit for the native tranche. The gate runs this
file and reads the printouts below: every native theorem must
depend on no axioms outside the standard three named in the
readme, and
none may depend on an admitted proof. The cited tranche carries
no proofs of its own, so nothing from it is printed here.
-/

import Merge
import Fold
import Frontier
import SolverDominance
import Synthesis

#print axioms Merge.antisymm
#print axioms Merge.Join.least
#print axioms Merge.Join.assoc
#print axioms Merge.Meet.greatest
#print axioms Merge.Absorb.left
#print axioms Merge.Absorb.right
#print axioms Fold.mem
#print axioms Fold.mono
#print axioms Fold.duplicates
#print axioms Fold.drop
#print axioms Frontier.total.lt
#print axioms Frontier.covered
#print axioms Frontier.again
#print axioms Frontier.kept

#print axioms SolverDominance.exists_fixed_within
#print axioms SolverDominance.lfp_is_kt
#print axioms SolverDominance.scott_directed
#print axioms SolverDominance.horn_lfp_iff_derives
#print axioms SolverDominance.coloring_lfp
#print axioms SolverDominance.contract_dominance
#print axioms SolverDominance.no_uniform_bound

#print axioms Synthesis.grows.left
#print axioms Synthesis.grows.right
#print axioms Synthesis.screen.grows
#print axioms Synthesis.screen.inside
#print axioms Synthesis.qualified.join
#print axioms Synthesis.qualified.left
#print axioms Synthesis.closed.join
