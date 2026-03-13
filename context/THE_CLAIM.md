# The Claim

## Informal Statement

Any logical system in which proofs are mechanically verifiable must operate over
a finite set of primitive symbols.

Equivalently: you cannot build a decidable proof checker over an infinite alphabet.

## Why This Matters

The characteristica universalis — Leibniz's dream of a universal formal language —
is only meaningful if the symbols are finite. An infinite symbol set means the
verification procedure has no finite description. You cannot write it down.
You cannot run it. It is not a procedure at all.

This is not a limitation. It is a feature. Finitude of symbols is what makes
reasoning mechanical. The infinite expressive power of a formal system comes not
from having infinitely many primitive symbols, but from combining finitely many
symbols in infinitely many ways.

## Precise Statement (Version 1)

Let S be a proof system consisting of:

    - an alphabet A of primitive symbols
    - a set of well-formed formulas WFF(A) over A
    - a binary verification relation:  verify : Proof × WFF(A) → {true, false}

**Claim:** If verify is computable (decidable by a Turing machine), then A is finite.

## Proof Sketch

A Turing machine M operates over a fixed finite tape alphabet T by definition.
For M to compute verify, both the proof and the formula must be encodable as
strings over T. Any such encoding maps A into T* (finite strings over T).
If A were infinite, distinct symbols would require strings of unbounded length,
but then A is not really a primitive alphabet — it is itself a structured language
over a finite base. The "infinite alphabet" collapses into a finite one with syntax.

More precisely: if A is infinite and verify is computable, then there exists a
computable injection  encode : A → T*  for some finite T. But then T is the real
alphabet and A is a derived notation. Every infinite "alphabet" is secretly a
finite alphabet with grammar.

## Precise Statement (Version 2 — stronger)

There is no notion of "primitive symbol" that is both:
    (a) infinite, and
    (b) supports a decidable verification procedure

without reducing to a finite alphabet at some lower level.

## What We Are Not Claiming

We are not claiming that formal systems cannot reason about infinite objects.
They can — arithmetic reasons about infinitely many numbers using finitely many
symbols (0, S, +, ×, =, the logical connectives, variables).

We are claiming that the *symbols themselves* must be finite. The infinite lives
in the combinations, not the primitives.

## Open Questions

- Can this be stated as a clean theorem in type theory (Lean 4)?
- Is the "collapse" argument (infinite alphabet → finite base) provable formally?
- What is the right notion of "alphabet" in dependent type theory?