# Lean 4 Formalization Plan

## Status

Not started. This file records the intended structure for when the
mathematical claims are sharp enough to formalize.

## The Core Structure

The key definition will be a `ProofSystem` structure:

    structure ProofSystem where
      Symbol : Type
      formula : Type
      proof : Type
      verify : proof → formula → Bool

The main theorem will be:

    theorem finite_alphabet_necessary
      (P : ProofSystem)
      (h : Computable P.verify) :
      Fintype P.Symbol

## Why This Is Nontrivial in Lean

The statement requires connecting two different notions:

1. Computability of `verify` — this needs a computability library
   (Mathlib has `Computable` for this)

2. `Fintype` — Lean's typeclass for finite types with a computable enumeration

The connection between the two is the collapse argument: if verify is
computable, then Symbol must be encodable into a finite type.

## The Encoding Lemma

A key intermediate lemma will be:

    lemma infinite_alphabet_collapses
      (A : Type) [Infinite A]
      (encode : A → List (Fin n))
      (h : Function.Injective encode) :
      -- A is "secretly" a language over Fin n

This says: any computable injection from A into finite strings over a
finite alphabet n means A is not truly primitive — it is a language.

## Dependencies

This proof will likely need:
    - Mathlib.Computability.TuringMachine
    - Mathlib.Data.Fintype.Basic
    - Mathlib.Data.Encoding (or similar)

The `universal-lean` repo established the template for zero-sorry
Lean proofs in this project. Same standards apply here.

## Sequencing

1. First: sharpen the claim in THE_CLAIM.md until it has a one-sentence
   statement a mathematician would immediately understand
2. Second: find the closest existing Mathlib lemmas
3. Third: write the ProofSystem structure and state the theorem with sorry
4. Fourth: fill in the proof

## Connection to universal-lean

The `universal-lean` repo proves transformer Turing completeness.
That proof assumes finite alphabets throughout (the Turing machines
simulated have finite tape alphabets). This repo provides the
theoretical justification for why that assumption is not restrictive —
any computable system must have a finite alphabet at some level.

The two repos together say:
    - transformers can simulate any Turing machine (universal-lean)
    - any computable reasoning system is a Turing machine (Church-Turing)
    - any Turing machine has a finite alphabet (this repo)
    - therefore the finite QBBN is not a special case — it is the general case