# Resolution (Robinson 1965)

## Overview

The basis of automated theorem proving, SAT solvers, and Prolog.
A proof is a sequence of resolution steps. Each step takes two clauses
(disjunctions of literals) that share a complementary literal, and
produces their resolvent — the clause you get by canceling the
complementary pair.

Example:

    (A ∨ B)  and  (¬A ∨ C)  resolve to  (B ∨ C)

A proof of φ is a resolution derivation of the empty clause □ from
the negation of φ (proof by refutation).

## Instantiation of the Definition

    F  =  propositional or first-order formulas in clause normal form
    P  =  finite sequences of resolution steps
    ⊢  =  π ⊢ φ  iff  π is a valid refutation of ¬φ ending in □

## Verification Procedure

To verify a resolution proof π:

    for each step i in π:
        check: do the two parent clauses contain complementary literals?
        check: does the resolvent follow correctly?
    check: does the last step produce □?

Each check is a finite lookup and pattern match. Linear in proof length.
Decidable and extremely fast in practice.

## The Alphabet

    literals:    propositional variables and their negations
    clause sep:  ∨
    the empty clause: □

Finitely many connectives. Variables are finitely described schemas.

## Why Resolution Won in Practice

The verification procedure is so simple that it can be implemented
in a few dozen lines of code. The trusted kernel of a resolution
prover is tiny. This is the finite alphabet constraint in action —
the simplicity of the alphabet makes the verifier simple.

## Meets the Definition?

Yes. Verification is linear-time decidable. Alphabet is minimal —
arguably the smallest useful logical alphabet. Proof objects are
finite sequences. All conditions satisfied.

## Notes

Resolution is complete for refutation — if a formula is unsatisfiable,
there is a resolution proof of □. It is not complete for arbitrary
theoremhood without the refutation encoding.