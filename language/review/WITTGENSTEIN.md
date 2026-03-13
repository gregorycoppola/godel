# Wittgenstein on meaning and use

## Biographical context

Ludwig Wittgenstein (1889–1951) produced two distinct and largely
incompatible philosophies of language. The early Wittgenstein
(Tractatus Logico-Philosophicus, 1921) held that language pictures
the world — propositions are logical pictures of facts. The late
Wittgenstein (Philosophical Investigations, published posthumously
1953) abandoned this view entirely and developed the use theory
of meaning.

## The picture theory (early)

In the Tractatus, the world consists of facts. Language consists
of propositions. A proposition is meaningful if and only if it
pictures a possible fact. The logical form of the proposition
mirrors the logical form of the fact.

Elementary propositions are logically independent combinations
of names. Names refer to simple objects. The totality of names
is the totality of simple objects — the substance of the world.

Key claim:

    The limits of my language are the limits of my world.

The primitive symbols of language correspond one-to-one with
the simple objects of reality. Meaning is reference.

## The private language argument (late)

In the Investigations, Wittgenstein asks: could there be a language
whose words refer to private inner experiences — sensations only
the speaker can access?

His answer: no. A private language is impossible because there
would be no criterion for correct use. If I define the symbol S
to mean a certain sensation I have, there is no way to check
whether I am using S correctly on subsequent occasions. My memory
of the original sensation is not an independent check — it is
just more of the same inner process.

Correct use requires a public criterion. A criterion requires
a practice. A practice requires a community.

Key claim:

    An inner process stands in need of outward criteria.

Meaning is not private reference. Meaning is public use.

## Language games

Wittgenstein replaces the picture theory with the concept of
language games — forms of life in which words get their meaning
from the role they play in practice. Different contexts, different
games, different meanings.

There is no single essence of language. There is no master
vocabulary from which all meaning derives. There are only
practices, and the words that participate in them.

## The rule-following considerations

Wittgenstein asks: what does it mean to follow a rule? If I
have been computing +2 correctly up to 1000, what determines
that my next step should be 1002 and not 1004?

No finite set of past applications determines the rule
uniquely — infinitely many rules are consistent with any
finite history of use. Yet we do follow rules, and we agree
about what counts as correct.

His conclusion: rule-following is a practice, not a mental
state. Correctness is determined by the community, not by
an inner process of interpretation.

## Relevance to this project

The private language argument is a philosophical precursor
to the computational result in this repo. Wittgenstein argues
informally that meaning requires public criteria — a finite,
checkable standard. We prove formally that any mechanically
verifiable language must operate over a finite primitive
vocabulary. The finite vocabulary is the public criterion.

The rule-following considerations anticipate the question of
what a finite program can determine about symbol identity.
Wittgenstein says no finite history determines a rule uniquely.
Our theorem says a finite program partitions symbols into
finitely many equivalence classes — and only those classes
are meaningful to the verifier.