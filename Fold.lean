/-
Thesis: the fold laws, the forms the family homes do not carry.

Statement. The accounting of the qualification construction is a
fold over content-addressed witnesses: a pure fold whose value is
the class of exactly the witnesses presented. The home cited in
the registry proves the semilattice laws of its join and the
exactness, permutation, and duplication laws of the fold itself.
Three forms stand outside that inventory, and the falsification
register names all three as live counterfactual controls:

- Monotonicity (the removal direction of the register's witness
  counterfactuals): a feed drawn from a second feed accounts
  below it in the information order of the merge file.
- Removal exactness: removing one named witness from a feed
  removes exactly that witness from the accounting, and no other.
- Duplication through the deduplicated feed: folding the
  deduplicated feed gives the same class as folding the feed.

Refutation condition. One pair of feeds, the first drawn from the
second, whose fold values stand outside the information order;
one feed and one witness whose removal changes the accounting at
any other witness; one feed whose deduplicated fold differs from
its fold at any witness.

Evidence state. Verified behavior: the three theorems below,
checked by the gate in this repository. The fold at full text
strength, for the derivation on disk, stands as the register
records it: discharged on 2026-11-17 by the closing re-run over
the repaired store, all five feeds byte-identical.

Home. Native to this repository, for these three forms. The
remaining fold laws are cited, not re-proved: see the fold entry
of the cited registry.
-/

import Merge

namespace Fold

/-- The fold of a witness feed: the class of exactly the
witnesses the feed presents. -/
def fold [DecidableEq W] : List W → Merge.Class W
  | [] => fun _ => false
  | w :: ws => fun x => decide (x = w) || fold ws x

/-- The fold records exactly the presented set. -/
theorem mem [DecidableEq W] {l : List W} {x : W} :
    fold l x = true ↔ x ∈ l := by
  induction l with
  | nil => simp [fold]
  | cons w ws ih =>
    simp only [fold, List.mem_cons, Bool.or_eq_true, decide_eq_true_eq]
    exact Iff.intro
      (fun h => h.elim (fun h => Or.inl h) (fun h => Or.inr (ih.mp h)))
      (fun h => h.elim (fun h => Or.inl h) (fun h => Or.inr (ih.mpr h)))

/-- Monotonicity: a feed drawn from a second feed accounts below
it. -/
theorem mono [DecidableEq W] {l₁ l₂ : List W}
    (h : ∀ x, x ∈ l₁ → x ∈ l₂) :
    Merge.below (fold l₁) (fold l₂) :=
  fun x hx => mem.mpr (h x (mem.mp hx))

/-- The deduplicated feed: each witness kept at its first
presentation, later presentations dropped. -/
def dedup [DecidableEq W] : List W → List W
  | [] => []
  | w :: ws => w :: (dedup ws).filter (fun y => decide (y ≠ w))

theorem dedup.mem [DecidableEq W] {l : List W} {x : W} :
    x ∈ dedup l ↔ x ∈ l := by
  induction l with
  | nil => simp [dedup]
  | cons w ws ih =>
    simp only [dedup, List.mem_cons, List.mem_filter, decide_eq_true_eq]
    constructor
    · intro h
      cases h with
      | inl h => exact Or.inl h
      | inr h => exact Or.inr (ih.mp h.1)
    · intro h
      cases h with
      | inl h => exact Or.inl h
      | inr h =>
        by_cases hx : x = w
        · exact Or.inl hx
        · exact Or.inr ⟨ih.mpr h, hx⟩

/-- Duplication: the deduplicated feed folds to the same class. -/
theorem duplicates [DecidableEq W] (l : List W) :
    fold (dedup l) = fold l :=
  Merge.antisymm
    (mono (fun _ hx => dedup.mem.mp hx))
    (mono (fun _ hx => dedup.mem.mpr hx))

/-- Removal exactness: filtering one named witness out of a feed
removes exactly that witness from the accounting. -/
theorem drop [DecidableEq W] (l : List W) (w x : W) :
    fold (l.filter (fun y => decide (y ≠ w))) x = true ↔
      x ∈ l ∧ x ≠ w := by
  rw [mem]
  constructor
  · intro h
    simp only [List.mem_filter, decide_eq_true_eq] at h
    exact h
  · intro h
    simp only [List.mem_filter, decide_eq_true_eq]
    exact h

end Fold
