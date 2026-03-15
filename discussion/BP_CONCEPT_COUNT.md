# BP Transformer Concept Count

## What the Proof Shows

For a factor graph with n nodes, the BP transformer attention
mechanism operates over exactly 2n² distinct concepts.

The proof in BPTokenFiniteness.lean is complete with zero sorries.
The routing key (nodeType, ownIndex, nbrIndex) has exactly
2 × n × n possible values. Two tokens with the same routing key
are indistinguishable to the attention mechanism regardless of
their continuous belief values or factor table entries.

## What a Concept Is

A concept is a grounded Horn clause — an atomic proposition
together with its dependencies in the factor graph. The routing
key identifies the concept: what kind of node am I, and which
nodes do I depend on? The continuous dimensions are parameters,
not concepts. They are magnitudes, not meanings.

## The Pairwise Assumption

The count 2n² assumes pairwise factor graphs — every factor node
connects exactly 2 variable nodes. This is without loss of
generality: any k-ary factor graph can be binarized via AND
decomposition (see BINARY_DECOMPOSITION.md). The concept count
2n² applies to the binarized graph, where n counts all nodes
including intermediates.

## Connection to the General Theorem

The general theorem (FiniteStateSpace.lean) says: at most n^n
concepts for a machine with n states. The BP transformer
instantiation says: exactly 2n² concepts for a graph with n nodes.
The instantiation is tighter than the general bound — it counts
exactly, not just bounds.