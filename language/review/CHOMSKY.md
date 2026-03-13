# Chomsky on discrete infinity and generative grammar

## Biographical context

Noam Chomsky (born 1928) is a linguist, philosopher, and
political commentator. His 1957 monograph Syntactic Structures
and his 1965 Aspects of the Theory of Syntax revolutionized
linguistics by arguing that human language has a deep
computational structure — a finite set of rules generating
an infinite set of grammatical sentences. His work established
modern theoretical linguistics as a formal science.

## The central observation: discrete infinity

The most striking property of human language is what Chomsky
calls discrete infinity:

    From a finite set of elements (words, morphemes, phonemes),
    humans can produce and understand infinitely many sentences —
    each a discrete, distinct object.

This is not a trivial observation. A continuous system (like
pitch in music) does not have discrete infinity — there are
infinitely many pitches but they form a continuum, not a
discrete enumerable set. Language is different: sentences
are countably infinite and each is a distinct, well-defined
object.

The discreteness comes from the finite vocabulary and finite
rules. The infinity comes from the recursive application of
those rules. Together: discrete infinity.

## Generative grammar

Chomsky's solution: human language competence is a finite
generative device — a grammar — that specifies exactly which
infinite set of sentences are grammatical.

A grammar consists of:

    a finite set of terminal symbols (words)
    a finite set of non-terminal symbols (syntactic categories)
    a finite set of rewrite rules
    a start symbol

From these finite components, the grammar generates an
infinite language. Membership in the language is decidable —
you can check whether a sentence is grammatical by parsing it
against the finite rule set.

This is exactly the proof system definition:
    F  =  grammatical sentences (infinite set)
    P  =  parse trees (finite objects)
    ⊢  =  decidable by the finite rule set

## The competence / performance distinction

Chomsky distinguishes:

**Competence:** the speaker's internalized grammar — the
finite generative device that implicitly specifies the
infinite set of grammatical sentences.

**Performance:** actual language use — subject to memory
limitations, distractions, errors, incomplete sentences.

The grammar is a finite object. The language it generates
is infinite. The speaker's competence is the finite grammar,
not the infinite language.

## Universal grammar

Chomsky argues that the basic structural principles of
grammar are innate — part of the human biological endowment.
All human languages share a common deep structure (Universal
Grammar) that is finite and species-specific.

The finitude of Universal Grammar is what makes language
acquisition possible. A child acquires a grammar from finite
exposure to sentences. This is only possible if the space
of possible grammars is constrained — finite in the relevant
sense — by innate structure.

## The poverty of the stimulus argument

Children acquire the grammar of their language from a
finite and noisy sample of sentences. Yet they converge
on the correct grammar — they generalize correctly to
sentences they have never heard. A pure inductive learner
with no innate constraints could not do this.

The constraints — Universal Grammar — are finite. They
bound the hypothesis space. The child's learning problem
is finite search in a finite constrained space.

This is the linguistic analog of the empirical result in
bayes-learner: gradient descent, given a finite training
set and a finite model, converges on the correct generative
structure — belief propagation — that it was never explicitly
shown.

## Relevance to this project

Chomsky's discrete infinity is instantiated precisely by
the BP transformer. The finite vocabulary of 2n² routing
classes generates an infinite space of possible factor graphs
and inference problems. Each factor graph is a discrete
object. The transformer's grammar — its weight matrices —
is a finite generative device that solves the inference
problem for any graph in the language.

The competence / performance distinction maps onto the
formal / empirical distinction in paper4. The formal proof
(transformer-bp-lean) describes competence — the finite
weight construction that implements BP exactly. The empirical
result (bayes-learner) describes performance — gradient
descent finding the competence grammar from finite training
data.

Universal Grammar corresponds to the BP construction itself —
the finite inductive bias that makes the right generalization
possible. Without it (a randomly initialized transformer with
no structural bias toward BP), the child/model would not
converge on the correct grammar from finite data. With it,
convergence is guaranteed.