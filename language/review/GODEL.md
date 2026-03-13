# Gödel on formal systems and their limits

## Biographical context

Kurt Gödel (1906–1978) was a logician and mathematician whose
incompleteness theorems (1931) are among the most celebrated
results in the history of mathematics. He also proved the
completeness of first-order logic (1929), established the
consistency of the axiom of choice and the continuum hypothesis
with ZFC set theory (1938), and made contributions to general
relativity and the philosophy of time.

## The completeness theorem (1929)

Gödel's doctoral dissertation proved that first-order predicate
logic is complete: every valid first-order formula has a formal
proof. If a formula is true in every model, there is a finite
proof of it from the axioms using the finite rules of inference.

This established that the finite formal system of first-order
logic is sufficient to capture all first-order logical truth.
The finite alphabet and finite rules are not a limitation —
they are enough.

## The incompleteness theorems (1931)

Two years later, Gödel proved the incompleteness theorems,
which seem to contradict the optimism of the completeness result.

**First incompleteness theorem:** Any consistent formal system
F that is sufficiently expressive (can encode arithmetic) contains
a sentence G_F such that:

    G_F is true (in the standard model)
    G_F is not provable in F

The system cannot prove all truths. It is incomplete.

**Second incompleteness theorem:** Such a system cannot prove
its own consistency. If F is consistent, the statement "F is
consistent" is not provable in F.

## Gödel numbering

The proof of the first incompleteness theorem works by
encoding statements about the formal system as statements
within the formal system. Every symbol, formula, and proof
is assigned a natural number — a Gödel number.

This encoding is only possible because:

    proofs are finite sequences
    of formulas that are finite strings
    over a finite alphabet

Gödel numbering is an injection from the set of proofs into
the natural numbers. It exists because proofs are finite
combinatorial objects over a finite alphabet. An infinite
alphabet would make Gödel numbering impossible — there would
be no computable injection into the natural numbers.

The incompleteness theorems are therefore, implicitly, theorems
about finite alphabet systems. They would not make sense for
infinite alphabets.

## The limits of formalization

Gödel's theorems established that no finite formal system can
capture all mathematical truth. Every sufficiently strong
system is either incomplete (misses some truths) or inconsistent
(proves some falsehoods).

This is sometimes read as a limitation of formal systems.
Gödel himself suggested it showed that human mathematical
intuition transcends any formal system.

But there is another reading: the incompleteness theorems
show exactly where the boundary lies between what finite
formal systems can and cannot do. They do not show that
formal systems are useless — they show that finite systems
have precise, characterizable limits.

## Relevance to this project

Gödel numbering is the direct precedent for the encoding
argument in this repo. We show that the BP token encoding
maps factor graph states to finite vectors — an injection
from an infinite space of possible graphs into a finite
vocabulary of 2n² routing classes. This is Gödel numbering
applied to factor graphs.

The incompleteness theorems set the outer boundary of what
our system can do. The QBBN on trees is complete for
tree-structured inference — it can prove all posteriors
exactly. But Gödel tells us there will be truths about
factor graphs that no finite formal system can capture.
The loopy graph case — where BP is approximate — is a
concrete instance of this limit.

The completeness theorem is more directly relevant:
first-order logic is complete with a finite alphabet and
finite rules. Our theorem shows the BP transformer has
the same structure — a finite alphabet (2n² routing classes)
and finite rules (updateBelief) that are complete for
tree-structured inference.