# Proof idea: what is a proof system?

## The Minimal Definition

A proof system is a triple:

    (F, P, ⊢)

where:

    F  =  a set of formulas
    P  =  a set of proof objects
    ⊢  ⊆  P × F  =  the "proves" relation

We write  π ⊢ φ  to mean "π is a proof of φ."

This is the most abstract possible definition. It says nothing about
what formulas look like, what proofs look like, or how the relation
works. It only says that there is a relation between proof objects
and the things they prove.

## The One Constraint That Makes It Useful

A proof system is only useful if you can check it:

    Verifiability: the relation ⊢ is decidable.

That is, there exists an algorithm V such that:

    V(π, φ) = true   iff   π ⊢ φ

This is the constraint that separates formal proof from informal argument.
In informal mathematics, "proof" means "convincing argument." In formal
mathematics, "proof" means "object that passes the verifier."

The verifier V is the whole game. Everything else follows from it.

## What Verifiability Buys You

Once ⊢ is decidable, you get:

    - Objectivity: no disagreement about whether π proves φ
    - Mechanization: a computer can check proofs
    - Trust: you only need to trust V, not the prover
    - Composability: proofs can be built from subproofs and checked
      independently

This is why Lean, Coq, and Isabelle are trustworthy. You do not need
to trust the mathematician who wrote the proof. You only need to trust
the kernel — the implementation of V. And the kernel is small precisely
because V is defined over a finite symbol set.

## The Richter Scale of Proof Systems

Not all proof systems are equally expressive. A rough hierarchy:

    Propositional logic
        F = boolean formulas over variables
        P = truth tables or resolution proofs
        ⊢ = decidable, complete

    First-order predicate logic
        F = formulas with quantifiers over a domain
        P = finite sequences of inference steps
        ⊢ = decidable verification, semidecidable theoremhood

    Second-order logic
        F = formulas quantifying over predicates
        P = similar
        ⊢ = verification decidable, theoremhood not even semidecidable

    Dependent type theory (Lean 4, Coq)
        F = types (propositions are types)
        P = terms (proofs are programs)
        ⊢ = type checking, decidable by the kernel

In all cases, verifiability — decidability of ⊢ — is preserved by
keeping F and P built from finite alphabets.

## The Structural Constraints

Beyond verifiability, a proof system usually satisfies:

**Soundness:**

    π ⊢ φ  implies  φ is true (in some intended model)

You cannot prove false things.

**Completeness:**

    φ is true  implies  exists π such that π ⊢ φ

You can prove all true things.

Gödel showed first-order logic is both sound and complete.
He also showed that any sufficiently strong system is either
incomplete or unsound (incompleteness theorems).

But note: neither soundness nor completeness is required for
verifiability. A proof system can be verifiable but unsound
(accepts invalid proofs) or verifiable but incomplete (misses
valid proofs). Verifiability is the independent core property.

## The Connection to This Repo

The question this repo asks is:

    What does verifiability — decidability of ⊢ — imply about
    the structure of F and P?

Specifically: must F and P be built from a finite alphabet?

The answer we are building toward: yes. Any decidable ⊢ forces
F and P to be finitely generated — built by finite combination
of finitely many primitives. The infinite lives in the combinations.
The finite lives in the primitives.

## Lean Formalization Target

    structure ProofSystem where
      Formula : Type
      Proof   : Type
      proves  : Proof → Formula → Prop

    structure DecidableProofSystem extends ProofSystem where
      verify  : Proof → Formula → Bool
      correct : ∀ π φ, verify π φ = true ↔ proves π φ

The key property is that verify is a total computable function —
Bool-valued, always terminating. This is what "decidable" means
in the Lean sense.

The theorem we want:

    theorem formula_finitely_generated
      (S : DecidableProofSystem)
      (h : Computable S.verify) :
      ∃ (A : Type) (_ : Fintype A), GeneratedFrom S.Formula A

where GeneratedFrom says every formula is a finite combination
of symbols from A.