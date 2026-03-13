# Commentary: meaning is routing

## The slogan

In a transformer proof system, meaning is routing.

The meaning of a token — in the proof-theoretic sense —
is determined by which other tokens it attends to and
which tokens attend to it. The routing structure is the
meaning structure.

This is not a metaphor. It is a theorem. The attention
verifier branches only on the routing key. Two tokens
with the same routing key are used identically. Identical
use is identical meaning — by Wittgenstein's criterion,
by Frege's Bedeutung, by Prawitz's proof role.

## Three theories of meaning, one answer

The philosophy of language has three main theories of meaning:

**Referentialism:** meaning is what a word refers to.
Frege, Russell, early Wittgenstein, Kripke.

**Use theory:** meaning is how a word is used in practice.
Late Wittgenstein, Brandom, inferentialism.

**Conceptual role semantics:** meaning is the role a concept
plays in the inferential network — what it follows from
and what follows from it.
Block, Ned Hall, much of cognitive science.

These theories have been debated for a century without
resolution. In the transformer setting, all three converge
on the same answer.

**Referentialism in the transformer:** the routing key
is the reference. Node type, own index, neighbor index.
These pick out a position in the factor graph — a specific
node with specific structural relationships. The routing
key IS the reference, exactly in Frege's sense.

**Use theory in the transformer:** the use of a token is
its attention pattern — which tokens it attends to, which
attend to it, what it writes to the residual stream.
Two tokens with the same routing key have identical use.
Meaning is use, and use is routing.

**Conceptual role in the transformer:** the inferential
role of a token is its position in the BP message passing
graph. What beliefs flow into it (from its neighbors via
attention) and what belief flows out (via the FFN update
to dim 0). The conceptual role is the routing role.

All three theories say the same thing in this setting
because the transformer makes explicit what the theories
leave implicit: the structure of meaning is the structure
of valid inference, and valid inference is routing.

## The new position

We can now state a fourth position — the computational
theory of meaning — that the transformer instantiates:

    The meaning of a symbol is the equivalence class
    it belongs to under the verification procedure.

Two symbols are synonymous if and only if the verifier
cannot distinguish them. The meaning of a symbol is
exactly what the verifier tracks about it — no more,
no less.

This is more precise than referentialism (it explains
why Bedeutung is coarser than Sinn), more formal than
use theory (it gives a decision procedure for synonymy),
and more mechanistic than conceptual role semantics
(it identifies the specific computation that constitutes
the inferential role).

## Continuous values are not meaning

The most counterintuitive consequence of this position:
the continuous values in the BP token — belief values,
factor table entries — are not part of the token's meaning.

They are parameters. They affect the posterior value
computed by the FFN. But they do not affect the routing.
Two tokens with different beliefs but the same routing
key have the same meaning — they occupy the same position
in the inference structure.

This is analogous to Frege's observation that the morning
star and the evening star have the same Bedeutung despite
different Sinn. The continuous values are Sinn — modes
of presentation. The routing key is Bedeutung — the
structural reference.

Meaning is discrete. The world it reasons about is continuous.
The transformer bridges discrete meaning and continuous
values through the FFN — the Bayesian update that converts
discrete routing structure into precise posterior probabilities.

## Implications for hallucination

Hallucination, in this framework, is a failure of meaning.

A hallucinating transformer produces a token whose
routing key does not correspond to any valid position
in a grounded knowledge base. It generates Sinn without
Bedeutung — a mode of presentation with no referent.

The QBBN transformer cannot hallucinate on trees because
every token's routing key corresponds to a specific node
in the factor graph. The Bedeutung is always grounded.
The attention mechanism enforces this grounding by routing
only to tokens with matching indices.

Meaning without grounding is hallucination.
Grounding is routing.
Routing is finite.
Therefore: exact meaning requires a finite alphabet.

Leibniz was right. The calculus ratiocinator requires
the characteristica universalis. And the characteristica
universalis must be finite.