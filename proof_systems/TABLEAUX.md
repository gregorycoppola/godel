# Semantic tableaux (Beth / Smullyan)

## Overview

Proof by systematic search for a countermodel. To prove φ, you try
to construct a model in which φ is false. You branch on the logical
structure of the formulas, systematically expanding them according
to rules, until every branch either closes (contradiction found)
or remains open (countermodel found).

If every branch closes, no countermodel exists, so φ is valid.
A closed tableau is the proof.

## Instantiation of the Definition

    F  =  signed formulas: T φ (φ is true) or F φ (φ is false)
    P  =  finite closed tableau trees
    ⊢  =  π ⊢ φ  iff  π is a closed tableau starting from F φ

## Verification Procedure

To verify a tableau proof π:

    check: root is F φ (the negation of what we want to prove)
    for each node in the tree:
        check: does this node follow from its parent
               by a valid tableau expansion rule?
    check: every branch contains a complementary pair T ψ and F ψ
           for some formula ψ  (the branch is closed)

Each check is a finite rule lookup. Tree traversal is finite.
Decidable.

## The Alphabet

    T  F  (signs)
    ¬  ∧  ∨  →  (connectives)
    variables

Finitely many symbols. The expansion rules (maybe 10-15 rules,
one per connective per sign) are finite and enumerable.

## Where Tableaux Are Used

Modal logic, description logics (the basis of OWL and the semantic
web), automated reasoning in AI planning. The tableau method
generalizes cleanly to non-classical logics by changing the
expansion rules — but always keeping them finite in number.

## Meets the Definition?

Yes. Verification is decidable by tree traversal and rule checking.
Alphabet is finite. Proof objects are finite closed trees.
All conditions satisfied.