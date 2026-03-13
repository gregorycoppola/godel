# Related Work

## Church-Turing Thesis

**Claim:** Any effectively computable function is computable by a Turing machine.

**Relevance:** If we accept Church-Turing, then "mechanically verifiable" means
"Turing computable", which immediately inherits the finite alphabet constraint
from the definition of a Turing machine.

The claim in this repo is in some sense a corollary of Church-Turing: once you
accept that computation means Turing computation, finite alphabets are mandatory.

The more interesting question is whether we can prove a version that does not
depend on Church-Turing — a purely mathematical result about proof systems,
not an empirical thesis about physical computation.

## Gödel Completeness Theorem (1929)

**Claim:** Every valid first-order formula has a finite proof.

**Relevance:** The proof is constructive and works over a countable language
with a finite primitive alphabet. The finiteness is assumed, not proved.
This repo asks whether it could have been otherwise.

## Gödel Incompleteness Theorems (1931)

**First incompleteness:** Any consistent, complete formal system that can
express arithmetic is not decidable (its theoremhood is not computable).

**Second incompleteness:** Such a system cannot prove its own consistency.

**Relevance:** Both theorems use Gödel numbering — encoding proofs as natural
numbers. This encoding works because proofs are finite strings over a finite
alphabet. The incompleteness theorems are, implicitly, results about finite
symbol systems. They would not make sense for infinite alphabets.

## Post Correspondence Problem

**Claim:** There is no algorithm to decide whether a given instance of the
Post Correspondence Problem has a solution.

**Relevance:** Post's work (1946) established many undecidability results
and was built entirely on finite string rewriting over finite alphabets.
The finite alphabet is the foundation of the theory of computation.

## Kolmogorov Complexity

**Claim:** The complexity of a string is the length of the shortest program
that outputs it.

**Relevance:** Programs are finite strings over a finite alphabet (the
programming language's character set). Kolmogorov complexity is undefined
for infinite alphabets in the standard sense. This is another instance of
the same constraint.

## Formal Verification Systems (Lean, Coq, Isabelle)

All major proof assistants operate over finite term languages:
    - Lean 4: Calculus of Constructions with a finite set of term constructors
    - Coq: Similar
    - Isabelle/HOL: Higher-order logic with finite primitive vocabulary

The trusted kernel of each system is small precisely because the symbol
set is finite and auditable. An infinite kernel could not be trusted.

## What Is New Here

Existing work *assumes* finite alphabets as part of the definition of
formal systems. No existing result (to our knowledge) proves that
finite alphabets are *necessary* — that you cannot have a decidable
proof system over a genuinely infinite primitive alphabet.

The collapse argument in `DECIDABILITY.md` is the core new claim:
any infinite alphabet that supports a decidable verification procedure
is secretly a finite alphabet with syntax. We are not aware of this
being stated and proved as an explicit theorem.