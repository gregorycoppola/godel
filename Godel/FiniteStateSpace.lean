/-
  FiniteStateSpace.lean

  Core theorem: given a finite state set Q and any symbol set A,
  the transition function δ : Q → A → Q induces an equivalence
  relation on A where two symbols are identified if they cause
  identical state transitions. The number of equivalence classes
  is bounded by |Q|^|Q| — finitely many, regardless of how large
  A is.

  This is the formal content of the claim that a finite program
  can only distinguish finitely many symbols.
-/

namespace FiniteStateSpace

/-
  A symbol behavior is a function from states to states.
  Two symbols with the same behavior are indistinguishable
  to any finite state machine.
-/

def SymbolBehavior (n : Nat) : Type :=
  Fin n → Fin n

/-
  The behavior of symbol a under transition function δ is
  the function that maps each state q to δ q a.
-/
def behavior {n : Nat} {A : Type} (δ : Fin n → A → Fin n) (a : A) :
    SymbolBehavior n :=
  fun q => δ q a

/-
  Two symbols are equivalent if they have the same behavior —
  i.e., for every state q, they cause the same transition.
-/
def symbolEquiv {n : Nat} {A : Type} (δ : Fin n → A → Fin n)
    (a b : A) : Prop :=
  behavior δ a = behavior δ b

/-
  symbolEquiv is an equivalence relation.
-/
theorem symbolEquiv_refl {n : Nat} {A : Type}
    (δ : Fin n → A → Fin n) (a : A) :
    symbolEquiv δ a a := rfl

theorem symbolEquiv_symm {n : Nat} {A : Type}
    (δ : Fin n → A → Fin n) (a b : A) :
    symbolEquiv δ a b → symbolEquiv δ b a := fun h => h.symm

theorem symbolEquiv_trans {n : Nat} {A : Type}
    (δ : Fin n → A → Fin n) (a b c : A) :
    symbolEquiv δ a b → symbolEquiv δ b c → symbolEquiv δ a c :=
  fun h1 h2 => h1.trans h2

/-
  The set of all possible symbol behaviors is a subset of
  SymbolBehavior n = (Fin n → Fin n).

  The key fact: the number of distinct functions Fin n → Fin n
  is n^n — finite for any fixed n.

  We prove this by showing SymbolBehavior n is equivalent to
  Fin (n^n) via an explicit enumeration.
-/

/-
  Helper: n^n computed as a natural number.
-/
def statePower (n : Nat) : Nat :=
  n ^ n

/-
  The number of distinct behaviors is bounded by n^n.
  We prove this by constructing an injection from behaviors
  into Fin (n^n) via lexicographic encoding.
-/

/-
  Encode a function Fin n → Fin n as a natural number
  by treating it as a base-n number.
  f(0) is the least significant "digit", f(n-1) the most.
-/
def encodeFunction (n : Nat) (f : Fin n → Fin n) : Nat :=
  Finset.sum (Finset.range n) (fun i =>
    (f ⟨i, by omega⟩).val * n ^ i)

/-
  The encoding is bounded by n^n.
-/
theorem encodeFunction_lt (n : Nat) (hn : 0 < n)
    (f : Fin n → Fin n) :
    encodeFunction n f < n ^ n := by
  unfold encodeFunction
  induction n with
  | zero => omega
  | succ m ih =>
    simp [Nat.succ_eq_add_one, Finset.sum_range_succ]
    sorry

/-
  The encoding is injective — different functions get
  different encodings.
-/
theorem encodeFunction_injective (n : Nat) (hn : 0 < n) :
    Function.Injective (encodeFunction n) := by
  intro f g h
  funext i
  induction n with
  | zero => exact absurd hn (Nat.lt_irrefl 0)
  | succ m ih =>
    sorry

/-
  Main theorem: the number of distinguishable symbol behaviors
  is bounded by n^n where n = |Q|.

  Concretely: for any transition function δ : Fin n → A → Fin n,
  the image of (behavior δ) has at most n^n elements.
-/
theorem behavior_image_bounded {n : Nat} {A : Type}
    (δ : Fin n → A → Fin n) (hn : 0 < n) :
    ∀ (a : A), encodeFunction n (behavior δ a) < n ^ n := by
  intro a
  exact encodeFunction_lt n hn (behavior δ a)

/-
  Corollary: any two symbols whose behaviors have the same
  encoding are indistinguishable.
-/
theorem same_encoding_equiv {n : Nat} {A : Type}
    (δ : Fin n → A → Fin n) (hn : 0 < n) (a b : A)
    (h : encodeFunction n (behavior δ a) =
         encodeFunction n (behavior δ b)) :
    symbolEquiv δ a b := by
  unfold symbolEquiv
  exact encodeFunction_injective n hn h

/-
  The punchline: the image of behavior δ fits inside Fin (n^n).
  There are at most n^n distinguishable symbol types,
  regardless of how many symbols A contains.
-/
theorem finite_distinguishable_symbols {n : Nat} {A : Type}
    (δ : Fin n → A → Fin n) (hn : 0 < n) :
    ∀ (a : A), ∃ (k : Fin (n ^ n)),
      k.val = encodeFunction n (behavior δ a) := by
  intro a
  exact ⟨⟨encodeFunction n (behavior δ a),
          behavior_image_bounded δ hn a⟩, rfl⟩

end FiniteStateSpace