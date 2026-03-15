# Finite Concept Space

## What the Proof Shows

A finite state machine can only distinguish finitely many inputs.
This is not a claim about transformers specifically. It is a claim
about all finite computation.

The proof in FiniteStateSpace.lean makes this precise. Given a
transition function δ : Fin(n) → A → Fin(n), every symbol in A
maps to a behavior — a function from states to states. The number
of distinct behaviors is bounded by n^n. Two symbols with the same
behavior are indistinguishable to the machine. Those equivalence
classes are the concepts.

## Why This Matters for Inference

If you want verifiable inference — if you want "is this output
correct?" to be a meaningful question — you need a finite verifier.
A finite verifier has finitely many states. Therefore it has
finitely many concepts.

This is not a design choice. It is a logical necessity. The concept
space is determined by the verifier, not by the input space.

## The Contrapositive

An ungrounded language model has no finite verifier. Therefore it
has no well-defined concept space. Therefore "is this output
correct?" is not a well-defined question. Hallucination is not
occasional failure — it is the structural consequence of operating
without concepts.

## The Sorry Status

The main theorem finite_distinguishable_symbols is proved modulo
two encoding lemmas:

- encodeFunction_lt: the base-n encoding of any behavior fits
  inside Fin(n^n). Requires induction on n with arithmetic bounds.
- encodeFunction_injective: different behaviors get different
  encodings. Requires induction on n with digit extraction.

Both are classical results about base-n representations. They
introduce no mathematical uncertainty — the concepts are standard
combinatorics pending Lean formalization.