/-
Thesis: the monotonicity foundation claim, algebraic half.

Statement. All software is a finite state machine over a
join-semilattice of equivalent terms: the states, taken up to
equivalence of terms and ordered by information content, form a
join-semilattice whose join is the merge construction. The living
spec carries one open point against this claim, stated plainly in
the program record: no provision yet proves that states under that
order form a semilattice with merge as the join.

What this file proves. For the representation the machinery itself
uses — a class of terms as its characteristic function, the same
representation the witness fold of the qualification construction
is built from — merge is exactly the least upper bound under the
information order, and merge and the shared part form a lattice:
associativity, commutativity, idempotence, and both absorption
laws, all proved below with no premise.

Refutation condition. One pair of classes, in this representation,
whose merge is not an upper bound of both, or is above a strictly
smaller common upper bound; or one triple on which merge is not
associative. Any one of these ends the algebraic half as stated.

Evidence state. Verified behavior: the theorems below, checked by
the gate in this repository. The remaining half of the foundation
claim — that the states of a given piece of software, under the
equivalence the machinery checks, are faithfully represented by
these classes — is an identification premise, not proved here and
not proved in either family home. It stands as named future work
in the future-work file of this repository.

Home. Native to this repository. The witness fold whose values
live in this lattice is cited, not re-proved: see the fold entry
of the cited registry.
-/

namespace Merge

/-- A class of terms, carried as its characteristic function. -/
abbrev Class (T : Type) := T → Bool

/-- The information order: every member of the first class is a
member of the second. -/
def below (a b : Class T) : Prop := ∀ t, a t = true → b t = true

/-- Merge: the union of two classes. -/
def join (a b : Class T) : Class T := fun t => a t || b t

/-- The shared part of two classes. -/
def meet (a b : Class T) : Class T := fun t => a t && b t

/-- The empty class. -/
def empty : Class T := fun _ => false

theorem refl (a : Class T) : below a a := fun _ h => h

theorem trans {a b c : Class T} (h1 : below a b) (h2 : below b c) :
    below a c :=
  fun t h => h2 t (h1 t h)

theorem antisymm {a b : Class T} (h1 : below a b) (h2 : below b a) :
    a = b := by
  funext t
  by_cases ha : a t = true
  · rw [ha, h1 t ha]
  · have hb : b t = false := by
      cases hb : b t with
      | false => rfl
      | true => exact absurd (h2 t hb) ha
    have ha' : a t = false := by
      cases h : a t with
      | false => rfl
      | true => exact absurd h ha
    rw [ha', hb]

theorem bottom (a : Class T) : below empty a := by
  intro t h
  simp [Merge.empty] at h

namespace Join

theorem upper.left (a b : Class T) : below a (join a b) := by
  intro t h
  simp [Merge.join, h]

theorem upper.right (a b : Class T) : below b (join a b) := by
  intro t h
  simp [Merge.join, h]

/-- Merge is the least upper bound: any class above both parts is
above the merge. Together with the two upper bounds, this is the
provision the foundation claim was missing, at the level of this
representation. -/
theorem least {a b c : Class T} (h1 : below a c) (h2 : below b c) :
    below (join a b) c := by
  intro t h
  simp only [Merge.join, Bool.or_eq_true] at h
  cases h with
  | inl h => exact h1 t h
  | inr h => exact h2 t h

theorem assoc (a b c : Class T) :
    join (join a b) c = join a (join b c) := by
  funext t
  simp only [Merge.join]
  cases a t <;> cases b t <;> cases c t <;> rfl

theorem comm (a b : Class T) : join a b = join b a := by
  funext t
  simp only [Merge.join]
  cases a t <;> cases b t <;> rfl

theorem idem (a : Class T) : join a a = a := by
  funext t
  simp only [Merge.join]
  cases a t <;> rfl

theorem empty.left (a : Class T) : join empty a = a := by
  funext t
  simp only [Merge.join, Merge.empty]
  cases a t <;> rfl

theorem empty.right (a : Class T) : join a empty = a := by
  funext t
  simp only [Merge.join, Merge.empty]
  cases a t <;> rfl

end Join

namespace Meet

theorem lower.left (a b : Class T) : below (meet a b) a := by
  intro t h
  simp only [Merge.meet, Bool.and_eq_true] at h
  exact h.1

theorem lower.right (a b : Class T) : below (meet a b) b := by
  intro t h
  simp only [Merge.meet, Bool.and_eq_true] at h
  exact h.2

/-- The shared part is the greatest lower bound. -/
theorem greatest {a b c : Class T} (h1 : below c a) (h2 : below c b) :
    below c (meet a b) := by
  intro t h
  simp only [Merge.meet, Bool.and_eq_true]
  exact ⟨h1 t h, h2 t h⟩

theorem assoc (a b c : Class T) :
    meet (meet a b) c = meet a (meet b c) := by
  funext t
  simp only [Merge.meet]
  cases a t <;> cases b t <;> cases c t <;> rfl

theorem comm (a b : Class T) : meet a b = meet b a := by
  funext t
  simp only [Merge.meet]
  cases a t <;> cases b t <;> rfl

theorem idem (a : Class T) : meet a a = a := by
  funext t
  simp only [Merge.meet]
  cases a t <;> rfl

end Meet

namespace Absorb

/-- Absorption: merging a class with a shared part changes
nothing. -/
theorem left (a b : Class T) : join a (meet a b) = a := by
  funext t
  simp only [Merge.join, Merge.meet]
  cases a t <;> cases b t <;> rfl

/-- Absorption, dual form. -/
theorem right (a b : Class T) : meet a (join a b) = a := by
  funext t
  simp only [Merge.join, Merge.meet]
  cases a t <;> cases b t <;> rfl

end Absorb

end Merge
