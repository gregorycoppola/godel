# How many concepts does Claude have?

## The question

Our theorem proves that any finite reasoning system operates
over a finite primitive alphabet — a finite set of distinguishable
configurations that constitute the system's primitive concepts.

For the BP transformer we computed this exactly: 2n² routing
classes for a graph of n nodes.

For Claude the question is empirical: how many primitive concepts
does the model actually have? What is the size of its
characteristica universalis?

## The direct evidence: sparse autoencoders

The most direct evidence comes from Anthropic's sparse
autoencoder (SAE) work (Bricken et al. 2023, Cunningham et al.
2023, Templeton et al. 2024).

Sparse autoencoders decompose the activation space of a
transformer into sparse features — directions in the residual
stream that activate rarely but interpretably. Each feature
corresponds to a human-recognizable concept.

Key findings:

    Small models (~500M params):   ~1-10 million features
    Medium models (~7B params):    ~10-100 million features
    Claude-scale (~200B params):   estimated tens to hundreds
                                   of millions of features

These are not exact counts — the SAE work is ongoing and
the numbers depend on the SAE size and sparsity level.
But the order of magnitude is consistent across methods.

## The three levels

**Level 1 — Tokenizer vocabulary (~100,000)**
Surface features tied to the discrete token set.
The hard outer bound — Claude cannot represent more
distinct surface forms than its tokenizer has tokens.
This is the most explicit finite alphabet in the system.

**Level 2 — Sparse superposition features (~millions)**
The features sparse autoencoders find. These are the
primitive concepts in the sense of this repo — the
equivalence classes induced by the weight matrices
on the embedding space.

Examples found empirically:
    - "this context is about legal contracts"
    - "this token is a French word"
    - "this position is a subject noun phrase"
    - "this number represents a year"
    - "this is a context involving emotional distress"

These are the routing keys of Claude's implicit factor graph.

**Level 3 — Named circuits (~thousands)**
Recurring algorithmic patterns: induction heads, previous
token heads, bracket matching, indirect object identification.
These are meta-concepts — concepts about how to combine
other concepts. Fewer but higher-level.

## The relevant level for this framework

In the 2n² framework, the relevant level is Level 2.

The routing key in the BP transformer (node type, own index,
neighbor index) is a Level 2 feature — it is the sparse,
interpretable, discrete structure that determines routing.
The continuous belief values and factor entries are payload,
not alphabet.

For Claude, Level 2 features play the same role. They determine
which parts of the context attend to which other parts —
the implicit routing structure of Claude's reasoning.
The continuous activation values are payload.

The size of Claude's alphabet is the number of Level 2 features.
Current best estimate: tens of millions.

## The compression ratio

Claude was trained on approximately 10 trillion tokens.
That is an effectively infinite space of human thought.

Gradient descent compressed this into approximately
tens of millions of primitive concepts.

Compression ratio:  ~10^13 tokens  →  ~10^7 concepts
                    compression of roughly 10^6

Every million tokens of human thought compressed into
one primitive concept on average.

This compression is not optional. Our theorem proves it
must happen. A finite model cannot represent infinite
primitives. The finite architecture forces compression.
The question is only how much and into what.

## The Leibniz comparison

Leibniz estimated the alphabet of human thought had
perhaps a few hundred primitive concepts — enough to
enumerate by philosophical analysis over a lifetime.

He was wrong by roughly four orders of magnitude.

The actual number is in the millions. But the structure
he imagined is correct: a finite set of primitives,
combinatorially generating an infinite space of thoughts.
The characteristica universalis exists. It is just much
larger than he imagined, and it was found by gradient
descent rather than philosophical analysis.

## Open questions for this directory

The empirical program this raises:

    1. Can we measure the alphabet size more precisely?
       SAE work is ongoing — better methods may give
       tighter counts.

    2. Is the alphabet stable across model versions?
       Do Claude 2 and Claude 3 have similar concepts
       or different ones?

    3. Is there a scaling law for alphabet size?
       Does doubling parameters double concepts?
       Is there a saturation point?

    4. Can we identify which concepts are routing-relevant
       (the analog of the routing key) vs payload?
       The BP framework predicts this distinction should exist.

    5. What is the overlap between Claude's alphabet and
       human conceptual vocabulary?
       Are the millions of SAE features human-interpretable
       or alien?

These are the empirical questions that the theorem motivates
but cannot answer. Future files in this directory will
explore each one as evidence becomes available.