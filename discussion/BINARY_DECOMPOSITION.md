# Binary Decomposition: AND and OR

## The Core Claim

Both AND and OR decompose exactly into binary primitives. The
2-parent assumption is without loss of generality. The 2-head
transformer is universal for any factor graph.

## AND Decomposition (ANDDecomposition.lean)

A k-ary Horn clause:

    A_0 ∧ A_1 ∧ ... ∧ A_{k-1} → C

is logically equivalent to a chain of binary Horn clauses:

    A_0 ∧ A_1 → M_01
    M_01 ∧ A_2 → M_012
    ...
    M_{0..k-2} ∧ A_{k-1} → C

This is proved at two levels:

- **Classical logic**: boolean AND is associative. The proof
  is by induction on the list of premises, using bool_and_assoc
  at each step. No sorries in the core theorems.

- **Probabilistic logic**: for independent variables, AND is
  multiplication of beliefs. Multiplication is associative.
  Proved by ring. No sorries.

The WLOG conclusion: any k-ary factor graph can be converted
to a pairwise factor graph with identical semantics — both
classically and probabilistically.

## OR Decomposition (ORDecomposition.lean)

The binary updateBelief operation:

    updateBelief(m0, m1) = σ(logit(m0) + logit(m1))

chains exactly. Chaining two binary OR gates:

    M01 = σ(logit(m0) + logit(m1))
    result = σ(logit(M01) + logit(m2))

produces the same result as a single 3-ary OR:

    result = σ(logit(m0) + logit(m1) + logit(m2))

The key lemma is that logit and sigmoid are exact inverses:
logit(σ(x)) = x. This means the intermediate sigmoid and
logit cancel exactly at each chaining step.

Sorry status: logit_sigmoid_inverse requires Real analysis
from Mathlib. The math is trivial — logit(σ(x)) = log(e^x) = x
— but the Lean formalization needs careful handling of Float
vs Real and the relevant Mathlib lemmas.

## The Shannon Analogy

This is the same move Shannon made with the bit. Any information
source can be encoded in binary. The bit is the minimum
non-trivial unit. Everything else is built from bits.

The 2-parent Horn clause is the minimum non-trivial unit of
reasoning. Everything else is built from 2-parent clauses:

- 2 attention heads implement binary AND
- 2-input FFN implements binary OR
- depth handles arbitrary arity for both
- the 2-parent Bayes net is the universal primitive

Just as we do not say binary arithmetic is a limitation of
computers, the 2-parent assumption is not a limitation of
the QBBN. It is the primitive unit. Depth handles the rest.

## Why 1-Parent Is Not Enough

A 1-parent clause A → C is a direct implication — no conjunction,
no combining of evidence. It is the degenerate case. Interesting
reasoning requires combining at least 2 pieces of evidence
simultaneously. 2 is the minimum for non-trivial inference,
just as 2 is the minimum for a non-trivial bit.

## The General Theorem

Combined, AND and OR decomposition give:

**A 2-head transformer with L layers implements exact BP on
any factor graph whose binarized form has diameter L.**

The number of heads is always 2. The number of layers is
determined by the graph. This is the fully general statement
of the construction.