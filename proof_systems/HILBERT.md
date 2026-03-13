# Hilbert-style proof systems

## Overview

The oldest and most classical formulation. A proof is a finite sequence
of formulas. Each formula in the sequence is either an axiom or follows
from earlier formulas by a rule of inference (typically modus ponens alone).

## Instantiation of the Definition

    F  =  well-formed formulas over {¬, →, variables, parentheses}
    P  =  finite sequences of formulas
    ⊢  =  π ⊢ φ  iff  π is a sequence ending in φ where each line
           is an axiom or follows by modus ponens from earlier lines

## Verification Procedure

To verify π ⊢ φ:

    for each line i in π:
        check: is line i an axiom? (finite lookup)
        or check: do two earlier lines have the form A and A → line_i?
    check: does the last line equal φ?

Each check is a finite pattern match. The whole procedure terminates
in O(n²) steps where n is the length of π. Clearly decidable.

## The Alphabet

Typical Hilbert system alphabet:

    logical:     ¬  →  (  )
    variables:   p  q  r  ...  (countably many but finitely described)
    axiom schemas: finite list, e.g. the Łukasiewicz axioms

Variables are not themselves primitive symbols — they are positions
in schemas. The truly primitive symbols are the connectives and
punctuation. Finitely many.

## Soundness and Completeness

Sound and complete for classical propositional logic.
Sound and complete for first-order logic (Gödel 1929).

## Notes

Hilbert systems are highly unergonomic for humans — proofs are very
long because modus ponens is the only rule. But they are the simplest
possible proof system to verify, which is why they appear in
foundational work. The verifier is essentially a one-liner.

## Meets the Definition?

Yes. Verification is decidable by exhaustive line-by-line checking.
Alphabet is finite (connectives + punctuation). Proof objects are
finite sequences. All conditions satisfied.