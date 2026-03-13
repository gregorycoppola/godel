# Commentary: the discrete and the continuous

## The tension

Mathematics and physics are built on continuous structures —
real numbers, smooth functions, differential equations.
Logic and computation are built on discrete structures —
symbols, rules, finite strings.

The transformer sits at the intersection. Its weights are
continuous (real-valued matrices). Its computation is
discrete (finite layers, finite heads, finite dimensions).
Its inputs are continuous (embedding vectors). Its routing
is discrete (attention concentrates on specific tokens).

This tension is not a bug. It is the architecture of
exact probabilistic inference.

## The division of labor

The BP transformer divides its work cleanly:

**Discrete (routing):**
    - which token attends to which (attention mechanism)
    - node type, own index, neighbor index (routing key)
    - the structure of the factor graph
    - 2n² possible configurations

**Continuous (values):**
    - what the belief values are (dim 0)
    - what the factor table entries are (dims 1-4)
    - the actual posterior probabilities
    - infinite possible configurations

The discrete part is verified by the routing verifier —
a finite procedure checking finite equivalence classes.
The continuous part is verified by the FFN verifier —
an arithmetic check that the Bayesian update was applied
correctly.

Both verifiers are finite programs. But they operate on
different kinds of content. The discrete verifier checks
structure. The continuous verifier checks values.

## Why discrete meaning enables continuous precision

It might seem paradoxical: a finite alphabet of 2n²
routing classes somehow enables exact computation of
continuous posterior probabilities.

The resolution: the discrete alphabet determines where
to look. The continuous values determine what to compute.
The finite structure channels the infinite precision.

A factor graph with continuous-valued factor tables has
an uncountable number of possible configurations. Yet
the transformer handles all of them with a finite routing
vocabulary. The routing says: "look at your neighbor."
The continuous values say: "here is what your neighbor
believes, here is the factor table, compute accordingly."

The discrete structure is the grammar. The continuous
values are the content. Grammar is finite. Content is infinite.
Together they generate exact inference over an infinite
space of possible worlds.

## The Chomsky parallel made precise

Chomsky's discrete infinity: finite grammar, infinite language.

Our setting:
    finite grammar  =  2n² routing classes
    infinite language  =  all possible factor graphs
                          with all possible belief values

The transformer's competence is the finite grammar —
the weight matrices that implement BP routing and update.
The transformer's performance on any specific factor graph
is the application of the finite grammar to infinite content.

Grammaticality = correct routing (verified by routing key)
Meaning = correct posterior (computed by updateBelief)

A grammatical sentence with correct meaning is a transformer
forward pass that routes correctly and computes the exact
Bayesian posterior. This is what `transformer_exact_on_tree`
proves.

## The activation function as the bridge

The sigmoid activation in the FFN is the bridge between
the discrete and the continuous.

The discrete routing places two neighbor beliefs in dims
4 and 5. These are continuous values — real numbers in (0,1).

The FFN converts them to log-odds (logit), adds them
(discrete addition in log-odds space), and converts back
to probability (sigmoid). The result is a continuous value
in (0,1) — the new belief.

The logit/sigmoid pair is the mathematical bridge between
the discrete structure of the inference (which neighbors
contribute, how evidence combines) and the continuous
values of the beliefs (what the actual probabilities are).

Discrete structure + continuous values + sigmoid bridge
= exact Bayesian inference.

This is why sigmoid is the natural activation for this
architecture. Not ReLU (which has no continuous probabilistic
interpretation at its ceiling), not tanh (which goes negative),
but sigmoid — which maps the real line to (0,1) and whose
inverse (logit) makes evidence combination additive.

The bridge between discrete and continuous is the sigmoid.
The grammar is discrete. The world is continuous.
The transformer computes at the intersection.

## What this means for language

Natural language sits at the same intersection.

Words are discrete symbols. Meanings are continuous —
graded, contextual, probabilistic. The grammar is finite.
The space of expressible thoughts is infinite.

The question of how discrete symbols can carry continuous
meaning has been a central puzzle in philosophy of language
and cognitive science. Frege's Sinn/Bedeutung distinction
is one attempt. Possible worlds semantics is another.
Probabilistic semantics (Goodman, Frank, Tenenbaum) is
a third.

Our setting suggests a computational answer: discrete
symbols determine routing (structure, reference, grammar).
Continuous values determine posteriors (meaning, content,
belief). The FFN — the Bayesian update — is the bridge.

A natural language processor that implements this architecture
would have: a finite syntactic vocabulary (routing keys),
continuous semantic representations (belief values), and a
Bayesian update procedure (updateBelief) for combining
evidence from neighboring nodes in the parse tree.

This is not a metaphor for how language works.
It may be a description.