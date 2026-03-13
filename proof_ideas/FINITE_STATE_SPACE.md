# Proof idea: finite embedding dimension implies finite effective alphabet

## The Core Claim

A transformer with embedding dimension d operates over a d-dimensional
real vector space. Its weights are fixed finite matrices. Therefore
the transformer's internal computation is a finite sequence of linear
maps and pointwise nonlinearities over ℝ^d.

The key observation: two input tokens that produce identical internal
representations throughout the forward pass are indistinguishable to
the transformer. They are, for all computational purposes, the same token.

The set of distinguishable token configurations is therefore the
quotient of ℝ^d by the equivalence relation induced by the transformer's
weight matrices. We claim this quotient is effectively finite — in a
precise sense that connects to the finite alphabet requirement.

## The Equivalence Relation

Define:

    x ~_W y  iff  for all layers l, head h:
                  attention_l_h(x) = attention_l_h(y)
                  and ffn_l(x) = ffn_l(y)

Two token embeddings x, y ∈ ℝ^d are equivalent under ~_W if the
transformer with weights W treats them identically at every layer.

The equivalence classes of ~_W are the "symbols" of the transformer.
Two tokens in the same class are indistinguishable — they are the
same symbol from the transformer's point of view.

## Why the Quotient Is Effectively Finite

The transformer computes a sequence of operations:

    attention scores:  softmax(Q·K^T / √d)
    value aggregation: weighted sum of V vectors
    FFN:               two linear maps with nonlinearity

Each operation maps ℝ^d → ℝ^d. The composition is a function
f_W : ℝ^d → ℝ^d.

For verification purposes, we care about distinguishability at
the output — can the verifier tell two inputs apart based on
what they produce?

The verifier is a finite program operating on finite-precision
numbers. It can only distinguish values that differ by more than
some precision threshold ε. Therefore:

    x ~_ε y  iff  ||f_W(x) - f_W(y)|| < ε

The number of ε-distinguishable regions of ℝ^d under f_W is finite
for any fixed ε > 0 and any fixed finite-precision f_W.

This is not a limitation — it is the formal content of the claim
that the transformer operates over a finite effective alphabet.

## The Lipschitz Bound

For a transformer with bounded weights, f_W is Lipschitz:

    ||f_W(x) - f_W(y)|| ≤ L · ||x - y||

for some Lipschitz constant L determined by the weight matrices.

This means: two inputs that are within δ = ε/L of each other
produce outputs within ε of each other. They are indistinguishable
to any ε-precision verifier.

The number of δ-balls needed to cover any bounded region of ℝ^d
is finite (compactness of bounded sets in ℝ^d). Therefore the
number of distinguishable input configurations is finite.

## The Myhill-Nerode Analogy

This is the continuous analog of Myhill-Nerode for finite automata.

Myhill-Nerode says: the number of states in the minimal DFA
equals the number of equivalence classes of the relation
"x and y are indistinguishable by the automaton."

Here: the number of distinguishable token types equals the number
of equivalence classes of ~_ε. For bounded inputs and finite-precision
weights, this number is finite.

The transformer's embedding dimension d plays the role of the
number of states. Higher d means finer distinctions — more
equivalence classes — a richer effective alphabet. But always finite.

## The BP Construction As Illustration

In the BP construction, the token encoding uses 8 dimensions:

    dim 0:   own belief  ∈  [0, 1]
    dim 1-4: factor table entries  ∈  [0.05, 1.0]
    dim 5:   node type  ∈  {0, 1}
    dim 6:   own index  ∈  {0/(n-1), ..., (n-1)/(n-1)}
    dim 7:   neighbor index  ∈  {0/(n-1), ..., (n-1)/(n-1)}

The truly discrete dimensions are 5, 6, 7 — finitely many values
by construction. Dimensions 0-4 are continuous but bounded.

The verifier (the BP step checker) only needs to distinguish:
    - which node type (dim 5): 2 cases
    - which own index (dim 6): n cases
    - which neighbor index (dim 7): n cases

Total distinguishable configurations relevant to routing: 2n²
For any fixed graph size n, this is finite.

The continuous dimensions (beliefs, factor entries) affect the
output value but not the routing logic. The routing is fully
determined by the discrete dimensions.

This separation — discrete dimensions for routing, continuous
dimensions for values — is the structure that makes the BP
transformer verifiable by a finite procedure.

## The General Implication

For any transformer, the forward pass computation partitions
the input space into finitely many distinguishable regions.
The partition is determined by:

    - the weight matrices (finite)
    - the precision of the verifier (finite)
    - the embedding dimension (finite)

The effective alphabet of the transformer — the set of
distinguishable input configurations — is therefore always finite.

This means: any reasoning the transformer performs is over
a finite discrete language, even if that language is implicitly
defined by continuous weight matrices rather than explicitly
enumerated.

Gradient descent discovers this language by finding the weight
matrices that make the right distinctions — the distinctions
that correspond to the discrete structure of the problem being solved.

For the BP transformer, the problem is factor graph inference.
The discrete structure is the graph topology and node types.
The language gradient descent discovers is the encoding of
factor graph states.

## Lean Statement

    theorem finite_effective_alphabet
      (d : ℕ)
      (W : TransformerWeights d)
      (ε : ℝ) (hε : ε > 0)
      (B : ℝ) (hB : B > 0) :
      let f := transformer_forward W
      let equiv := fun x y => ||f x - f y|| < ε
      Finite (setoid_quotient equiv (ball B))

where ball B is the bounded input region and setoid_quotient
is the set of equivalence classes under equiv within that region.

The proof goes via compactness of ball B in ℝ^d and the
Lipschitz property of f (which follows from bounded weights).