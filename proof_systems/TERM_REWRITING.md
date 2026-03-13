# Equational reasoning and term rewriting

## Overview

Proofs are sequences of rewrite steps. Starting from a term t,
you repeatedly replace a subterm matching the left-hand side of
an equation with the corresponding right-hand side, until you
reach the goal.

Example: prove  (a + b) + c = a + (b + c)
by rewriting left-to-right using the associativity axiom.

## Instantiation of the Definition

    F  =  equations between terms:  t₁ = t₂
    P  =  finite sequences of rewrite steps
           each step is a triple (position, rule, direction)
    ⊢  =  π ⊢ (t₁ = t₂)  iff  π is a sequence of rewrites
           starting from t₁ and ending at t₂ (or vice versa)

## Verification Procedure

To verify a rewrite proof π of  t₁ = t₂:

    start with t₁
    for each step (position p, rule l→r, direction):
        check: does the subterm at position p match l?
        apply: replace that subterm with r
    check: final term equals t₂

Each step is a finite pattern match and substitution. Linear in
proof length times term size. Decidable.

## The Alphabet

    function symbols:  f  g  +  ×  0  S  ...  (finitely many, given)
    variables:         x  y  z  ...
    equality:          =

The rewrite rules themselves are a finite set given with the system.
The finite rule set is the entire specification of the equational theory.

## Confluence and Termination

A rewrite system is:

    confluent:   any two reduction sequences from t reach the same
                 normal form (Church-Rosser property)
    terminating: all reduction sequences from t are finite

When both hold, the system is complete — every equation has a
decidable normal form. This is the equational analog of cut
elimination and BP convergence.

Normal form = the irreducible term = the "proof in normal form"
in Prawitz's sense. Same underlying phenomenon again.

## Meets the Definition?

Yes. Verification is decidable by step-by-step checking.
Alphabet is a finite signature. Proof objects are finite sequences.
All conditions satisfied.

## Connection to This Project

Term rewriting is the computational model underlying Lean 4's
simp tactic and the reduction rules of the type theory kernel.
When Lean verifies a proof by computation (decide, norm_num, simp),
it is running a term rewriting system over a finite signature.
The finite alphabet is what makes the rewriter terminating and
the verifier trustworthy.