# godel

A formal investigation into a simple but foundational question:

**Must any verifiable logical system operate over a finite set of symbols?**

This repo works toward a precise mathematical answer — and eventually a Lean 4 proof.
The motivation comes from the characteristica universalis tradition (Leibniz, Frege, Gödel)
and connects directly to the QBBN framework in the paper4 trilogy. If reasoning is to be
mechanically checkable, the symbols it operates over cannot be infinite. This repo asks:
can we prove that?

Start with `context/THE_CLAIM.md`, then `context/DECIDABILITY.md`.

## Structure

    context/    -- the claim, definitions, motivation, related work
    lean/       -- formal proofs (coming later, once the claim is sharp)

## Connection to the trilogy

Paper 1 introduced the QBBN as a candidate characteristica universalis.
Paper 3 named the Leibniz connection explicitly.
This repo asks whether the finiteness of the symbol set is not just a design choice
but a logical necessity for any mechanically verifiable system.