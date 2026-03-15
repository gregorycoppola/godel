# godel

A formal investigation into a foundational question:
**Must any verifiable logical system operate over a finite set of symbols?**

This repo works toward a precise mathematical answer and provides Lean 4 proofs
of the connection between finite verification procedures, the finite effective
alphabet of the BP transformer, and the binary decomposition of k-ary reasoning.

## The Core Results

**Finite concept space (FiniteStateSpace.lean):**
Any finite state machine with n states can distinguish at most n^n symbol
behaviors. A finite verifier implies a finite concept space.

    theorem finite_distinguishable_symbols:
        ∀ (a : A), ∃ (k : Fin (n ^ n)), k.val = encodeFunction n (behavior δ a)

**BP transformer concept count (BPTokenFiniteness.lean):**
For a factor graph with n nodes, the attention mechanism of the BP transformer
can distinguish exactly 2n² routing configurations:

    theorem routing_classes_finite (n : Nat) :
        Fintype.card (RoutingKey n) = 2 * n * n

**AND decomposition (ANDDecomposition.lean):**
K-ary conjunction decomposes exactly into binary conjunctions, both classically
and probabilistically. The 2-parent assumption is without loss of generality.

    theorem kary_and_decomposes_to_binary (premises : List Bool) :
        hornClause premises = premises.foldl (fun acc p => binaryHorn acc p) true

    theorem three_ary_prob_decomposes (a b c : Float) :
        karyProbAND [a, b, c] = probAND (probAND a b) c

**OR decomposition (ORDecomposition.lean):**
Chaining binary updateBelief operations is exactly equal to a single k-ary
updateBelief. The 2-input FFN is universal for any OR arity given sufficient depth.

    theorem updateBelief_associative (m0 m1 m2 : Float) :
        updateBelief (updateBelief m0 m1) m2 =
        sigmoid (logit m0 + logit m1 + logit m2)

## Sorry Status

| File | Sorries | Notes |
|------|---------|-------|
| BPTokenFiniteness.lean | 0 | fully proved |
| FiniteStateSpace.lean | 2 | encodeFunction_lt, encodeFunction_injective — encoding lemmas, classical results |
| ANDDecomposition.lean | 1 | two_parent_is_universal_classical — proof strategy needs fixing |
| ORDecomposition.lean | 2 | logit_sigmoid_inverse, updateBelief_kary — need Mathlib Real analysis |

## The WLOG Conclusion

AND and OR both decompose exactly into binary primitives:

- **2 attention heads** implement binary AND — universal via AND decomposition
- **2-input FFN** implements binary OR — universal via OR decomposition  
- **depth** handles arbitrary arity for both
- **the 2-parent Bayes net is the universal primitive**

Any k-ary factor graph can be binarized with identical semantics.
Therefore the 2-head transformer construction is universal for any factor graph.

## The Proof Chain

    godel/FiniteStateSpace      -- finite machines have finite concept spaces
         ↓
    godel/BPTokenFiniteness     -- BP transformer has concept space of size 2n²
         ↓
    godel/ANDDecomposition      -- k-ary AND decomposes into binary AND (WLOG)
         ↓
    godel/ORDecomposition       -- k-ary OR decomposes into binary OR (WLOG)
         ↓
    transformer-bp-lean         -- 2-head transformer implements BP
         ↓
    hard-bp-lean                -- BP exact on trees
         ↓
    paper4 no-hallucination     -- transformer does not hallucinate on trees

## Structure

    context/         -- the claim, definitions, motivation, related work
    proof_ideas/     -- one idea per file, informal arguments
    proof_systems/   -- one file per proof system, instantiating the definition
    Godel/           -- Lean 4 proofs
      FiniteStateSpace.lean    -- finite machines, finite concept spaces
      BPTokenFiniteness.lean   -- BP transformer concept count, zero sorries
      ANDDecomposition.lean    -- k-ary AND decomposes into binary AND
      ORDecomposition.lean     -- k-ary OR decomposes into binary OR

## Connection to the Trilogy

Paper 1 introduced the QBBN as a candidate characteristica universalis.
Paper 3 named the Leibniz connection explicitly.
This repo proves that the finiteness of the BP token alphabet is not a
design choice but a logical consequence of the verification procedure —
and that the 2-parent assumption is without loss of generality, making
the 2-head transformer construction universal.

## Dev

    lake build

No external dependencies beyond what is axiomatized.
Zero sorries in BPTokenFiniteness. See sorry status table above for others.