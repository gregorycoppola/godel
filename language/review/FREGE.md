# Frege on sense and reference

## Biographical context

Gottlob Frege (1848–1925) is the founder of modern logic and
analytic philosophy of language. His Begriffsschrift (1879)
introduced the first fully formal logical notation — the first
actual implementation of something like Leibniz's characteristica
universalis. His paper "Über Sinn und Bedeutung" (On Sense and
Reference, 1892) introduced the distinction that bears his name.

## The puzzle of identity

Frege begins with a puzzle. The statement:

    the morning star = the morning star

is trivially true — it says nothing. But:

    the morning star = the evening star

is a significant astronomical discovery. Both statements have
the same logical form: a = a and a = b. Why does one feel
trivial and the other informative?

If meaning were just reference, both statements would say the
same thing — that a certain planet is identical to itself.
There would be no difference in cognitive value.

## Sinn and Bedeutung

Frege's solution: expressions have two kinds of meaning.

**Bedeutung (reference):** the object the expression picks out
in the world. "The morning star" and "the evening star" have
the same Bedeutung — they both refer to Venus.

**Sinn (sense):** the mode of presentation — the way the
object is given to us. "The morning star" presents Venus as
the bright object visible in the morning. "The evening star"
presents the same object differently. Different Sinn, same
Bedeutung.

The informativeness of identity statements comes from the
difference in Sinn. We learn something when we discover that
two different modes of presentation pick out the same object.

## Compositionality

Frege held that the sense of a complex expression is determined
by the senses of its parts and their mode of combination. This
is the compositionality principle:

    The sense of the whole is a function of the senses of the parts.

This principle is essential for language to be learnable. A finite
vocabulary of primitive senses, combined according to finite rules,
generates an infinite space of expressible thoughts.

## The concept horse problem

Frege distinguished objects (what names refer to) from concepts
(what predicates refer to). But he ran into a paradox: the concept
horse is an object — a thing you can refer to with a name. But
concepts are not objects. So "the concept horse" does not refer
to a concept.

This problem — the tension between the metalanguage and the
object language — anticipates Gödel's incompleteness theorems
and Russell's paradox.

## The Begriffsschrift as characteristica universalis

Frege's notation used a finite set of primitive symbols:

    content stroke, judgment stroke, conditionality, negation,
    identity, generality (universal quantifier), function letters

From these finitely many primitives, all of mathematics was
to be expressible. The Grundgesetze (1893, 1903) attempted
this program — and was destroyed by Russell's paradox in 1902.

But the program itself — a finite primitive vocabulary sufficient
for all reasoning — is exactly Leibniz's characteristica universalis
and exactly the structure our theorem shows is necessary.

## Relevance to this project

The Sinn/Bedeutung distinction maps directly onto the BP token
encoding. The full 8-dimensional token embedding is the Sinn —
the mode of presentation, including belief values and factor
entries. The routing key (dims 5, 6, 7) is the Bedeutung —
what the token refers to in the factor graph structure.

Two tokens with different Sinn but the same routing key have
the same Bedeutung to the attention mechanism. The attention
head is a Bedeutung extractor — it discards Sinn and routes
on reference alone.

Frege's compositionality principle is instantiated by the
BP transformer: the belief at each node is a function of
the beliefs at neighboring nodes (the parts) combined by
the updateBelief rule (the mode of combination). The whole
posterior is compositionally determined by the parts.