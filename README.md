# godel

A formal investigation into a foundational question:

**Must any verifiable logical system operate over a finite set of symbols?**

This repo works toward a precise mathematical answer and provides a Lean 4 proof
of the new content — the connection between finite verification procedures and
the finite effective alphabet of the BP transformer.

## The New Result

For a factor graph with n nodes, the attention mechanism of the BP transformer
can distinguish exactly 2n² routing configurations:

    theorem routing_classes_finite (n : Nat) :
        Fintype.card (RoutingKey n) = 2 * n * n

This is proved in `Godel/BPTokenFiniteness.lean` with zero sorries.
Background results are axiomatized honestly — see `proof_ideas/WHAT_IS_NEW.md`
for a precise account of what is new vs what is classical.

## The Proof Chain

    godel/FiniteStateSpace     -- finite machines have finite alphabets
         ↓
    godel/BPTokenFiniteness    -- BP transformer has alphabet of size 2n²
         ↓
    transformer-bp-lean        -- transformer with this encoding implements BP
         ↓
    hard-bp-lean               -- BP exact on trees
         ↓
    paper4 no-hallucination    -- transformer does not hallucinate on trees

## Structure

    context/         -- the claim, definitions, motivation, related work
    proof_ideas/     -- one idea per file, informal arguments
    proof_systems/   -- one file per proof system, instantiating the definition
    Godel/           -- Lean 4 proofs
      FiniteStateSpace.lean    -- finite machines, equivalence relation
      BPTokenFiniteness.lean   -- the new result, zero sorries

## Connection to the Trilogy

Paper 1 introduced the QBBN as a candidate characteristica universalis.
Paper 3 named the Leibniz connection explicitly.
This repo proves that the finiteness of the BP token alphabet is not a
design choice but a logical consequence of the verification procedure.

## Dev

    lake build

No external dependencies. Zero sorries in the proved theorems.
Background classical results are axiomatized.