# Proof idea: Prawitz, normal forms, and belief propagation

## Prawitz's Question

Hilbert-style proof systems ask: what can you prove?
Prawitz asks something deeper: what makes a proof a proof?

His answer, developed in "Natural Deduction" (1965), is that a proof
is genuine when it has no detours. A detour is when you introduce
a logical connective only to immediately eliminate it — you build
something up just to tear it down. A proof in normal form takes
no detours. Every step is necessary. Every introduction leads
somewhere.

This is not just an aesthetic preference. Prawitz proved that every
proof in natural deduction can be normalized — reduced to a detour-free
form. This is the normalization theorem, and it has deep consequences.

## Introduction and Elimination Rules

Natural deduction has two kinds of rules for each connective:

**Introduction:** how to prove a connective
    To prove A ∧ B: prove A and prove B separately
    To prove A → B: assume A and derive B

**Elimination:** how to use a connective
    From A ∧ B: conclude A (or conclude B)
    From A → B and A: conclude B (modus ponens)

A detour is an introduction immediately followed by an elimination
of the same connective:

    Prove A, prove B → combine into A ∧ B → immediately extract A

This roundabout proof of A can be replaced by the direct proof of A.
The detour added nothing.

## Normal Form = Direct Proof

A proof in normal form is a direct proof. It constructs its conclusion
without unnecessary intermediate structure. Every formula that appears
in the proof is either:

    (a) a subformula of the conclusion, or
    (b) a subformula of one of the hypotheses

This is the subformula property. It means the proof stays close to
what it is actually proving — it does not wander through unrelated
territory.

## The Computational Interpretation

Under the Curry-Howard correspondence, proofs are programs and
normalization is computation:

    proof       ↔   program (lambda term)
    formula     ↔   type
    normalization ↔  beta reduction (running the program)
    normal form  ↔  value (fully reduced term)

A proof in normal form is a program that has been run to completion.
No more reductions are possible. The result is the irreducible value.

Verifying a proof in normal form is easy — you just check the type
of the value. The computation has already been done.

## Connection to Belief Propagation

Here is the key connection to your paper.

Belief propagation on a tree is a normalization procedure.

Consider what BP does:
    - each node collects messages from its neighbors
    - each node computes a new belief from those messages
    - after diameter(T) rounds, all beliefs have converged

The converged state is the normal form. Every message has been passed
exactly once. No message is passed twice. No node recomputes something
it already knows. There are no detours.

Compare to a "loopy" graph:
    - messages circulate around cycles
    - the same information passes through the same node multiple times
    - this is exactly a detour in the proof-theoretic sense
    - BP on loopy graphs does not reach exact posteriors in general

The tree structure is precisely what guarantees normalization.
On a tree, BP is a direct derivation — every step is necessary,
every message contributes new information, the result is exact.

On a loopy graph, BP is a proof with detours — it may or may not
normalize, and when it does, the result is only approximate.

## Prawitz's Normalization Theorem ↔ BP Exactness on Trees

The parallel:

    Prawitz                         Belief Propagation
    ──────────────────────────────────────────────────
    proof in natural deduction      factor graph + evidence
    normalization                   message passing rounds
    normal form                     converged beliefs
    subformula property             each message passed once
    tree-structured proof           tree-structured factor graph
    normalization theorem           BP exact on trees
    loopy proof (with detours)      loopy graph (cycles)
    may not normalize               may not converge

This is not just an analogy. Both are instances of the same
underlying phenomenon: a finite, directed computation over a
tree-structured object reaches a unique fixed point that is
provably correct. Cycles introduce the possibility of
non-termination and incorrectness.

## What This Suggests

The no-hallucination theorem in paper4 is, in Prawitz's terms,
a normalization theorem.

A transformer with BP weights, run on a tree-structured QBBN,
computes the normal form of the inference. The result is exact
because the computation is detour-free. Every attention step
routes a message that was not routed before. Every FFN step
combines evidence that has not been combined before. The tree
structure ensures no step is redundant.

Hallucination, in this framing, is a proof with detours that
never normalizes. The model circles through its training data,
passing the same patterns through the same weights, never
reaching a fixed point grounded in evidence.

The QBBN gives the model a tree to work on. The tree guarantees
normalization. Normalization guarantees correctness.

## Lean Formalization Target

The Prawitz connection suggests a new way to state the
no-hallucination theorem:

    theorem bp_is_normal_form
      (T : Tree)
      (state : BPState T)
      (h : tree_structured T) :
      is_normal_form (bp_iterate state (diameter T))

where is_normal_form means no further message passing changes
any belief — the fixed point has been reached and is exact.

This connects transformer_exact_on_tree in hard-bp-lean to
the normalization tradition in proof theory.

## Why This Matters for the Godel Repo

Prawitz's normalization theorem requires finite proofs over
finite alphabets. Normalization is a finite rewriting process —
you apply finitely many reduction steps to a finite proof object.

An infinite alphabet would mean infinite proof objects that
cannot be fully reduced in finite time.

The finiteness of the alphabet is what makes normalization
— and therefore exact inference — possible.