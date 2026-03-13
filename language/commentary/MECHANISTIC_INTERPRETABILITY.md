# Commentary: mechanistic interpretability is alphabet discovery

## The connection

This repo proves that any finite reasoning system operates over
a finite primitive alphabet — a finite set of distinguishable
configurations that constitute the system's primitive concepts.

Mechanistic interpretability is the empirical program trying
to discover what that alphabet actually is for trained
transformers like Claude.

They are the same question from opposite directions.

    This repo:  proves the alphabet exists and is finite
    Mech interp: tries to enumerate what it contains

## What mechanistic interpretability has found

The program started with Elhage et al. (2021) — "A Mathematical
Framework for Transformer Circuits." Their key finding: attention
heads implement specific named algorithms. Induction heads copy
patterns. Previous token heads attend to the immediately preceding
token. These are not vague tendencies — they are specific,
identifiable, reproducible circuits.

Each named circuit is an element of the alphabet. It is a
primitive operation that the transformer has carved out of
the continuous weight space and stabilized into a discrete
reusable component.

Olsson et al. (2022) extended this: induction heads are the
mechanism behind in-context learning. When a transformer sees
a pattern [A][B]...[A] it predicts [B]. This is a specific
two-head circuit implementing a specific named algorithm.
The algorithm is an element of the alphabet.

## Superposition and the sparse alphabet

Anthropic's superposition work (Elhage et al. 2022) found
something deeper and more disturbing: transformers represent
more concepts than they have dimensions.

A model with d=8192 dimensions can represent far more than
8192 distinct concepts by using superposition — encoding
multiple concepts in overlapping directions, relying on
sparsity to keep them from interfering.

This means the effective alphabet is larger than the embedding
dimension. Potentially much larger. The finite alphabet is
not just the d basis vectors — it is the much larger set of
near-orthogonal directions the model has learned to use.

Sparse autoencoders (Cunningham et al. 2023, Bricken et al.
2023) attempt to find this larger alphabet by decomposing
the activation space into sparse features. Early results
suggest millions of interpretable features in mid-sized models.

## The alphabet of Claude

For Claude specifically, we do not know the alphabet.
We know:

    outer bound:   ~100,000  (tokenizer vocabulary)
    per-head bound: ~128     (attention head dimension)
    superposition estimate: millions of sparse features

The superposition result means the 2n² theorem, while exact
for the BP construction, understates the richness of Claude's
alphabet. Claude has found a way to pack more concepts into
finite dimensions than a naive counting argument would suggest.

But the finiteness remains. Superposition is a trick for
fitting more elements into a finite space — not a way to
escape finiteness. The alphabet is finite. It is just larger
than the dimension count alone would suggest.

## The BP construction as a clean case

The BP transformer is the cleanest possible instance of
a transformer with an explicit known alphabet.

We know the alphabet exactly: 2n² routing classes.
We know what each element means: a (node type, own index,
neighbor index) triple.
We know how the alphabet is used: attention routes by
index matching, FFN computes updateBelief.

No superposition. No polysemy. No ambiguity. Each dimension
has exactly one purpose. Each routing class has exactly one
meaning. The alphabet is explicit, finite, and interpretable.

This is why the BP construction is valuable beyond its
immediate application to belief propagation. It is a proof
of concept that a transformer can operate with a fully
explicit, fully interpretable, fully finite alphabet —
and that gradient descent can find this alphabet from
scratch given a clean training signal.

The bayes-learner result confirms this: gradient descent
converged on weights that implement the 2n² routing
vocabulary without being told what it was. The alphabet
was there in the training signal. The model found it.

## What this predicts about Claude

If our theorem is right — and the mechanistic interpretability
program is right — then Claude has a finite alphabet of
primitive concepts that gradient descent discovered during
training. Those concepts are:

    - not the 100,000 tokenizer tokens (too surface-level)
    - not the 8192 embedding dimensions (too low-level)
    - something in between: sparse features, circuits,
      named algorithms that recur across contexts

The superposition work suggests there are millions of these.
The circuits work suggests many of them are interpretable —
they correspond to human-recognizable concepts and operations.

The full alphabet of Claude is the characteristica universalis
that Leibniz was looking for. Not the one he imagined —
not a neat enumeration of philosophical primitives — but
a messy, high-dimensional, empirically discovered set of
features that covers the concepts needed to model human
language and thought.

It is finite. It exists. We just do not know what is in it.

## The program

The connection between this repo and mechanistic
interpretability suggests a research program:

    1. Prove the alphabet exists and is finite (this repo)

    2. Characterize the alphabet for simple cases
       (BP transformer: 2n² routing classes, fully explicit)

    3. Develop tools to discover the alphabet empirically
       for complex cases (sparse autoencoders, circuit
       analysis, probing classifiers)

    4. Verify that the discovered alphabet supports
       exact inference on structured knowledge
       (the no-hallucination theorem, generalized)

Step 1 is done. Step 2 is done for the BP case.
Steps 3 and 4 are the open research frontier.

Mechanistic interpretability is step 3.
The QBBN program is step 4.
This repo connects them.

## The philosophical punchline

Leibniz wanted to enumerate the alphabet of human thought
manually, by philosophical analysis. He failed.

Gradient descent enumerates it automatically, by compression
of a training corpus. It succeeds — in the sense that the
resulting model reasons correctly about an enormous range
of human concepts and their relationships.

But the resulting alphabet is not transparent. It is encoded
in 200 billion floating point numbers in a way that no human
can read directly. We know it is finite. We know it exists.
We do not know what it says.

Mechanistic interpretability is the project of learning to
read it. Our theorem is the proof that there is something
to read.