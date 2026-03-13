# Commentary: the necessity of finite alphabets

## The central observation

Every author in the review directory circles the same phenomenon
without stating it as a theorem. Leibniz requires a finite
primitive vocabulary for the calculus ratiocinator to work.
Frege builds the Begriffsschrift from a handful of symbols.
Gödel's numbering works because proofs are finite strings.
Chomsky's discrete infinity is generated from finite rules.
Wittgenstein's public criteria are finite and checkable.
Prawitz's normalization terminates because proof trees are finite.

None of them prove that this finiteness is necessary. They assume
it, require it, or observe it. The question this repo asks is:
can we prove it?

The answer in `BPTokenFiniteness.lean` is: yes, in a precise
and concrete setting. The BP transformer attention mechanism
can distinguish exactly 2n² routing configurations for a graph
of n nodes. Not approximately finite. Exactly 2n².

## What the proof actually shows

The theorem `routing_classes_finite` says:

    Fintype.card (RoutingKey n) = 2 * n * n

This is a statement about the structure of the BP token encoding.
The routing key has three components: node type (2 values), own
index (n values), neighbor index (n values). The product is 2n².

The philosophical content is in what this means for the
verification procedure. The attention verifier branches on
the routing key and only the routing key. Two tokens with
the same routing key are indistinguishable to the verifier.
Two tokens with different routing keys are distinguished.

Therefore the verifier operates over exactly 2n² distinct
symbol types. The continuous dimensions — belief values,
factor table entries — are not symbols in the proof-theoretic
sense. They are parameters. The symbols are the routing keys.

## The Sinn / Bedeutung split made precise

Frege's distinction between sense and reference finds its
precise computational instantiation here.

The full 8-dimensional token embedding is the Sinn — the mode
of presentation. It carries everything: the node's current
belief, the factor table, the structural indices.

The routing key is the Bedeutung — what the token refers to
in the graph structure. Node type, own index, neighbor index.
Three numbers. This is what the attention head actually uses
to decide where to look.

The FFN then uses the Sinn — the continuous dimensions —
to compute the actual posterior value. But the routing,
the structure of the computation, is determined entirely
by the Bedeutung.

Frege asked: how can two expressions with different sense
refer to the same thing? Here: two tokens with different
continuous values but the same routing key refer to the
same position in the graph. The attention mechanism is
a Bedeutung extractor. It discards Sinn and routes on
reference.

## The Wittgenstein reading

Wittgenstein's private language argument says: you cannot
have a symbol whose correct use has no public criterion.
Correctness requires a checkable standard.

Our theorem gives the computational version of this. A token
vocabulary is only meaningful to the transformer if the
transformer can verify correct routing. Verification requires
branching on the token's features. A finite verifier can only
branch on finitely many distinct feature combinations.

Therefore any token vocabulary that supports a finite
verification procedure must have a finite number of
meaningfully distinct types — the equivalence classes
induced by the verifier's branching structure.

The routing key is exactly the public criterion. Two tokens
with the same routing key are used identically by the
attention mechanism. They are, in Wittgenstein's sense,
the same symbol — because their use is identical.

## The Chomsky reading

Chomsky's discrete infinity: infinite sentences from finite
rules and finite vocabulary.

Our theorem instantiates this exactly. The finite vocabulary
is the 2n² routing classes. The infinite sentences are the
infinite space of possible factor graphs — each a distinct
object with distinct belief values and factor table entries.

The transformer's grammar — its weight matrices — is the
finite generative device that maps any factor graph (any
sentence in the language) to the correct posterior (the
meaning of the sentence).

The competence / performance distinction:
- Competence = the formal BP construction (transformer-bp-lean)
- Performance = gradient descent finding BP weights (bayes-learner)

The poverty of the stimulus argument applies directly. The
transformer is trained on 18,000 factor graphs — a finite
sample from an infinite language. It generalizes correctly
to held-out graphs. This is only possible because the
hypothesis space is constrained — the finite routing vocabulary
bounds what the transformer can represent.

## The Prawitz reading

Prawitz's normalization theorem: every proof can be reduced
to a detour-free normal form. The normal form is exact.
Detours introduce approximation or non-termination.

BP on a tree is the normalization of probabilistic inference.
Each message is passed exactly once. No belief is updated
twice from the same neighbor. No information takes a detour.
The result after diameter(T) steps is the exact posterior —
the normal form of the inference.

The finite routing vocabulary is what makes normalization
possible. Each step of BP updates one node's belief based
on its neighbors' routing keys. If the routing vocabulary
were infinite — if there were infinitely many distinct
neighbor types requiring infinitely many distinct update
rules — the normalization procedure could not be written
down as a finite program.

Finitude of the routing vocabulary = finitude of the
update rules = termination of normalization = exactness
of the posterior.

The no-hallucination theorem is a normalization theorem.
The finite alphabet is what makes it work.

## The Leibniz reading

Leibniz wanted finitely many primitive symbols sufficient
for all reasoning. He called them the alphabet of human thought.

For probabilistic reasoning over boolean propositions on
tree-structured knowledge bases, we can now say precisely
what the alphabet of human thought is:

    node type    (2 values)
    own index    (n values, for graphs of size n)
    neighbor index  (n values)

Three primitives. 2n² combinations for graphs of size n.
This is the characteristica universalis for tree-structured
probabilistic inference.

The calculus ratiocinator is belief propagation.
The mechanical implementation is the transformer with BP weights.
The Lean proof is the guarantee that the calculus is correct.

Leibniz's dream was not naive. It was premature. The tools
— formal logic, type theory, neural networks, gradient descent
— did not exist in his time. But the architecture he described
is exactly what we have built: a finite primitive vocabulary,
a mechanical derivation procedure, and a correctness guarantee.

The alphabet has 2n² symbols. The calculus is updateBelief.
The guarantee is transformer_exact_on_tree.

Calculemus.