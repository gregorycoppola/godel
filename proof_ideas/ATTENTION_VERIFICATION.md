# Proof idea: verifying one attention step forces finite cases

## The Setup

Consider a single attention head in the BP transformer construction.
Its job is to route one neighbor's belief into a scratch slot.

The claim made by one attention step is:

    "token j correctly identified its neighbor k and copied
     neighbor k's belief into dim 4 of token j's embedding"

To verify this claim, a verifier V must check:

    (a) the Q·K dot product was maximized at token k (not some other token)
    (b) the softmax concentrated mass at k
    (c) the value vector copied dim 0 of token k into dim 4 of token j

Each of these is a check about a specific token identity. The verifier
must be able to answer: "is token k the correct neighbor of token j?"

## The Key Question

How does the verifier know which token is the correct neighbor?

It must read this from the token features. In the BP construction:

    dim 6 of token j  =  j's own index  /  (n-1)
    dim 7 of token j  =  j's neighbor index  /  (n-1)

The verifier checks:

    dim 7 of token j  ==  dim 6 of token k

This is a finite equality check between two real numbers. One case:
equal (correct neighbor) or not equal (wrong neighbor).

## What Happens With an Infinite Token Vocabulary

Suppose we tried to build a transformer over an infinite set of
possible token types — where each token type was genuinely primitive
and distinct, not encodable in a finite-dimensional space.

The verifier would need to check, for each possible token j and
each possible token k: "is k the correct neighbor of j?"

If there are infinitely many token types, this requires infinitely
many cases in the verifier. A finite program cannot have infinitely
many cases. Therefore:

    either the token types are finitely encodable (reducing to a
    finite alphabet), or the attention step cannot be verified by
    any finite program.

There is no third option.

## The Finite Cases Argument

More precisely: the verifier V is a finite program. It contains
a finite number of instructions. Each instruction is a test or
an operation over the token features.

The number of distinct behaviors V can exhibit on different inputs
is bounded by its number of states — which is finite.

Therefore V partitions the space of (token j, token k) pairs into
finitely many equivalence classes:

    (j, k) ~_V (j', k')  iff  V behaves identically on both pairs

The "correct neighbor" check can only distinguish finitely many
cases — one per equivalence class. Any two pairs that fall in the
same class are treated identically by the verifier.

For the attention step to be correctly verified, the correct neighbor
relationship must be encodable in a way that V can distinguish.
That encoding must be finite — it must fit into a finite number
of equivalence classes.

The finite-dimensional token embedding is exactly this encoding.
Dim 6 and dim 7 encode identity and neighbor relationship in
a way that a finite verifier (equality check) can distinguish.

## The General Principle

This argument applies to every attention head, not just the
neighbor-lookup head in the BP construction.

For any attention head, verification requires answering:
"did this head attend to the right tokens?" That question
requires distinguishing tokens — and a finite verifier can
only distinguish finitely many token types.

Therefore: any transformer whose attention steps are finitely
verifiable must have a finitely encodable token vocabulary.
The effective number of distinct token types is bounded by
the verifier's state space.

## The Lean Statement

    theorem attention_verification_finite_cases
      (Q K V : Matrix n d d)
      (tokens : Fin n → Fin d → ℝ)
      (verify_step : (Fin n → Fin d → ℝ) → (Fin n → Fin d → ℝ) → Bool)
      (h : Computable verify_step) :
      ∃ (k : ℕ), ∀ (t₁ t₂ : Fin n → Fin d → ℝ),
        -- the verifier induces a partition into at most k classes
        Fintype (Setoid.quotient (kernel_equiv verify_step))

where kernel_equiv verify_step is the equivalence relation:
two inputs are equivalent if verify_step cannot distinguish them.

## What This Buys

Once we have this theorem, we know:

    1. the verifier partitions token space into finitely many classes
    2. attention routing is only meaningful up to those classes
    3. the "symbols" of the transformer proof system are those classes
    4. the effective alphabet is finite

The transformer's attention mechanism implicitly defines a finite
discrete language — the language of distinguishable token configurations.
Gradient descent discovers what that language should be.
In the BP construction, it is the language of factor graph encodings.