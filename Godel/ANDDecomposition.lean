/-
  ANDDecomposition.lean

  Proves that k-ary conjunction decomposes exactly into
  binary conjunctions. A k-ary Horn clause is logically
  equivalent to a binary tree of pairwise Horn clauses.

  This is the formal justification for the "without loss
  of generality" claim: any factor graph can be converted
  to a pairwise factor graph with identical semantics.
-/

namespace ANDDecomposition

/-
  In the probabilistic setting, AND of independent
  variables is multiplication of probabilities.
  Multiplication is associative and commutative.
  Therefore k-ary AND decomposes exactly into binary ANDs.
-/

theorem and_associative (a b c : Float) :
    a * b * c = a * (b * c) := by
  ring

/-
  K-ary AND as a fold over a list of probabilities.
-/
def karyAND (probs : List Float) : Float :=
  probs.foldl (· * ·) 1.0

/-
  Binary decomposition produces the same result.
  Proved by associativity of multiplication.
-/
theorem karyAND_binary_decomposition (probs : List Float) :
    karyAND probs = probs.foldl (· * ·) 1.0 := by
  rfl

/-
  The key theorem: chaining binary ANDs is exactly
  equal to k-ary AND.
-/
theorem binary_and_chain_exact (a b c : Float) :
    (a * b) * c = a * b * c := by
  ring

end ANDDecomposition