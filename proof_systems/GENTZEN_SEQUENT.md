# Gentzen sequent calculus (LK / LJ)

## Overview

Introduced by Gerhard Gentzen in 1934. Proofs are finite trees of
sequents. A sequent has the form:

    Γ ⊢ Δ

meaning: assuming all formulas in Γ, at least one formula in Δ holds.
Each node in the proof tree is a sequent. Each node follows from its
children by one of a finite set of inference rules.

## Instantiation of the Definition

    F  =  sequents  Γ ⊢ Δ  where Γ, Δ are finite lists of formulas
    P  =  finite trees of sequents
    ⊢  =  π ⊢ φ  iff  π is a valid proof tree with root φ,
           where each node follows from its children by a named rule

## Verification Procedure

To verify π ⊢ φ:

    check: root of π equals φ
    for each node in π (tree traversal):
        check: does this node follow from its children
               by one of the finite list of inference rules?

Each rule check is a finite pattern match against a fixed list of
maybe 20 rules. Tree traversal is finite. Decidable.

## The Alphabet

Same logical vocabulary as Hilbert. The sequent arrow ⊢ is added.
The rules themselves (→L, →R, ∧L, ∧R, cut, weakening, contraction)
are finite in number and finitely described.

## Cut Elimination

Gentzen's Hauptsatz: every proof with cuts can be transformed into
a cut-free proof. Cut is the sequent calculus version of a detour —
introducing a formula just to use it and discard it.

Cut elimination is Gentzen's normalization theorem. It corresponds
directly to Prawitz normalization in natural deduction and to
BP convergence on trees. The cut-free proof is the direct proof —
no wasted steps.

## Meets the Definition?

Yes. Verification is decidable by tree traversal + rule lookup.
Alphabet finite. Proof objects are finite trees. All conditions met.

## Connection to This Project

Cut elimination = normalization = BP convergence on trees.
All three say: the detour-free computation reaches the exact answer.
The finite rule set is what makes cut elimination a finite procedure.