# Prawitz on natural deduction and proof normalization

## Biographical context

Dag Prawitz (born 1936) is a Swedish philosopher and logician.
His 1965 monograph Natural Deduction: A Proof-Theoretical Study
systematized Gentzen's natural deduction calculus and proved
the normalization theorem in full generality. His subsequent
work developed proof-theoretic semantics — the view that the
meaning of logical constants is determined by their proof rules,
not by their truth conditions.

## Natural deduction

Gentzen introduced natural deduction in 1934 as a formalization
of how mathematicians actually reason — introducing and
eliminating logical connectives in a natural way, rather than
deriving everything from a fixed set of axioms.

Each logical connective has two kinds of rules:

**Introduction rules:** how to prove a connective.
To prove A ∧ B, prove A and prove B separately.
To prove A → B, assume A and derive B.

**Elimination rules:** how to use a connective.
From A ∧ B, conclude A (or B).
From A → B and A, conclude B (modus ponens).

## The normalization theorem

Prawitz's central result: every proof in natural deduction
can be transformed into a normal form — a proof with no
detours.

A detour is an introduction immediately followed by an
elimination of the same connective. You prove A ∧ B by
proving A and B, then immediately extract A — a roundabout
way of proving A that adds nothing.

The normalization theorem says every detour can be removed.
The resulting normal proof is direct — every formula that
appears is either a subformula of the conclusion or a
subformula of a hypothesis. No wasted steps.

## The subformula property

A proof in normal form satisfies the subformula property:
every formula in the proof is a subformula of the conclusion
or of one of the hypotheses.

This means the proof stays close to what it is proving.
It does not wander through unrelated territory. The finite
vocabulary of subformulas is sufficient — you do not need
to introduce new concepts to prove the conclusion.

The subformula property is the proof-theoretic analog of
the finite alphabet constraint: the proof operates over
a vocabulary determined by the statement being proved.

## Proof-theoretic semantics

Prawitz developed the view that logical meaning is determined
by proof rules, not truth conditions. The meaning of ∧ is
given by its introduction rule (prove both conjuncts) and
its elimination rules (extract either conjunct). There is
no need to appeal to a model or a truth definition.

This is a use theory of meaning for logic — the meaning
of a logical constant is its role in proofs. It connects
directly to Wittgenstein's use theory: meaning is use,
and for logical constants, use means proof rules.

## The Curry-Howard correspondence

Under the Curry-Howard correspondence, Prawitz normalization
corresponds to beta reduction in the lambda calculus —
running a program to completion. A detour in a proof is
a redex in a program — a function applied to an argument
that has not yet been reduced.

Normalization = computation. Normal form = value.
A proof in normal form is a program that has been run
to completion.

This is the foundation of type-theoretic proof assistants:
Lean 4, Coq, Agda. Proof checking is type checking.
Type checking is normalization. Normalization terminates
because well-typed programs always reduce to values.

## Relevance to this project

Prawitz normalization is the proof-theoretic precedent for
BP convergence on trees. Both are normalization procedures:

    Prawitz:  detour elimination until normal form
    BP:       message passing until convergence

Both have the subformula / locality property:

    Prawitz:  each step uses only subformulas of the goal
    BP:       each update uses only local neighbor beliefs

Both are exact on tree-structured objects and approximate
or non-terminating on cyclic objects:

    Prawitz:  normalization terminates for intuitionistic logic
              (tree-structured proof terms under Curry-Howard)
    BP:       convergence guaranteed only on tree factor graphs

The no-hallucination theorem in paper4 is, in Prawitz's terms,
a normalization theorem: the transformer with BP weights
computes the normal form of the probabilistic inference,
with no detours, in exactly diameter(T) steps.