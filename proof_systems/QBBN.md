# The QBBN as a proof system

## Overview

The Quantified Boolean Bayesian Network (QBBN) introduced in Paper 1
is a proof system in the generalized sense — one where "proof" means
a schedule of message passing steps and "formula" means a query about
a posterior belief.

This is a probabilistic proof system. It does not prove certainties.
It proves posteriors — the correct degree of belief in a proposition
given evidence. On trees, those posteriors are exact.

## Instantiation of the Definition

    F  =  queries of the form: "what is P(node j = 1 | evidence E)?"
           encoded as a QBBN knowledge base K with clamped evidence nodes

    P  =  a message passing schedule: a finite sequence of BP steps,
           each step specifying which node updates its belief from
           which neighbors

    ⊢  =  π ⊢ φ  iff  π is a valid BP schedule of length ≥ diameter(G)
           that correctly applies the updateBelief rule at each step,
           starting from the encoded state of K

## Verification Procedure

To verify a BP proof π of query φ:

    check: initial state encodes K and evidence E correctly
    for each step i in π:
        check: does node j's new belief equal
               updateBelief(neighbor_0_belief, neighbor_1_belief)?
        check: are the neighbor beliefs correctly read from the
               previous state?
    check: final belief at query node j equals the claimed posterior

Each check is arithmetic over [0,1] — computable and finite.
The whole procedure is decidable.

## The Alphabet

    node indices:      0  1  2  ...  n-1  (finite, given by the graph)
    belief values:     real numbers in [0,1]  (represented finitely
                       as floating point or rational numbers)
    factor table entries: non-negative reals  (finitely represented)
    the updateBelief function: one fixed formula

The "symbols" of the QBBN are node indices and factor table entries.
Both are finite for any given knowledge base.

## Soundness

On tree-structured graphs: the final beliefs are exactly the true
Bayesian marginal posteriors. Proved formally in hard-bp-lean.
This is the soundness theorem for the QBBN proof system.

On loopy graphs: soundness is not guaranteed in general. The system
is still verifiable (you can check each step) but the conclusion
(the posterior) may not be the true Bayesian posterior.

## Completeness

For any tree-structured QBBN and any query, a valid BP schedule
of length diameter(G) exists and produces the exact posterior.
The proof system is complete for tree-structured queries.

## Meets the Definition?

Yes. Verification is decidable by step-by-step arithmetic checking.
The alphabet (node indices + factor entries) is finite for any given
knowledge base. Proof objects are finite message passing schedules.

## What Is New Here

Every other proof system in this directory proves boolean propositions
— things are either true or false. The QBBN proves degrees of belief
— real numbers in [0,1].

This is a generalization of the classical notion. A classical proof
system is a special case where all beliefs are 0 or 1. The QBBN
handles the full probabilistic case.

The verifiability constraint still holds. The finite alphabet
constraint still holds. The normalization connection still holds
(BP on trees is detour-free, like a proof in normal form).

The QBBN shows that the definition of a proof system is broad enough
to encompass probabilistic reasoning — and that the finiteness
constraints are not specific to classical logic but are universal
properties of any mechanically verifiable reasoning system.