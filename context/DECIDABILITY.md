# Decidability and Finite Alphabets

## What "Verifiable" Means

A proof system has a *decidable* verification procedure if there exists an algorithm
that, given any proof π and any formula φ, terminates and correctly answers:
does π prove φ?

In the Church-Turing framework, "algorithm" means Turing machine. So:

    verify is computable
    ⟺
    there exists a Turing machine M such that M(π, φ) = 1 iff π proves φ

## The Finite Alphabet Constraint in Turing Machines

A Turing machine is defined as a tuple:

    M = (Q, Γ, b, Σ, δ, q₀, F)

where:
    Q   = finite set of states
    Γ   = finite tape alphabet
    b   = blank symbol (b ∈ Γ)
    Σ   = finite input alphabet (Σ ⊆ Γ)
    δ   = transition function
    q₀  = initial state
    F   = set of accepting states

The finiteness of Γ and Σ is not an assumption — it is part of the definition.
A "Turing machine with infinite alphabet" is not a Turing machine.

## What This Means for Proof Systems

If verify is computed by a Turing machine M over tape alphabet Γ, then:

1. Proofs must be representable as strings over Γ
2. Formulas must be representable as strings over Γ
3. Therefore all primitive symbols of the proof system must be encodable in Γ*

If the proof system's alphabet A is infinite, we need an encoding:

    encode : A → Γ*

This encoding must itself be computable (otherwise we cannot feed inputs to M).
A computable injection from A into Γ* means A is at most countably infinite,
and every element of A has a finite string representation over Γ.

But now Γ is doing the real work. A is not a primitive alphabet anymore —
it is a formal language over Γ. The "symbols" of A are actually *words*.

## The Collapse Theorem (Informal)

**Theorem:** Any computable proof system with an infinite primitive alphabet
is equivalent to a computable proof system with a finite primitive alphabet.

**Proof idea:** Given encode : A → Γ* computable, rewrite every proof and formula
by replacing each symbol a ∈ A with its encoding encode(a) ∈ Γ*.
The resulting system has alphabet Γ (finite) and is computationally equivalent.

The "infinite alphabet" was never truly primitive — it was a notation layer
on top of a finite base.

## Decidability vs Semidecidability

Note the distinction:

- **Decidable** (recursive): verify always terminates with yes or no
- **Semidecidable** (r.e.): verify terminates with yes if the proof is valid,
  may loop forever otherwise

Most interesting proof systems (PA, ZFC) are only semidecidable for theoremhood
(you can enumerate proofs but not decide non-provability). But *verification* —
checking that a given proof is valid — is decidable in all standard systems.
This is what makes formal proof checkers (Lean, Coq, Isabelle) possible.

## The Lean Connection

In Lean 4, the kernel is a small decidable type checker. It operates over:
    - a finite set of term constructors
    - a finite set of reduction rules
    - a finite set of typing rules

The finiteness is what makes it trustworthy. An infinite kernel could not be
audited, implemented, or run.