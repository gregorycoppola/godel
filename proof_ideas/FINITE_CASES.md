# Proof idea: a finite program has finitely many cases

## The Core Intuition

A finite program is a finite object. It contains a finite number of
instructions. Therefore it contains a finite number of branch points —
if-statements, case expressions, pattern matches. Therefore it can
distinguish only finitely many situations.

If the alphabet were infinite — with truly distinct symbols that need to
be treated differently — the program would need infinitely many cases to
handle them. But it doesn't have infinitely many cases. So either:

    (a) the symbols are actually finite, or
    (b) some infinite collection of symbols all fall into the same case
        and are treated identically — meaning they are not truly distinct
        from the program's point of view

Either way, the effective alphabet the program operates over is finite.

## The Pigeonhole Version

A program with k distinct internal states can produce at most k distinct
behaviors on any input. If the alphabet has more than k symbols, at least
two symbols must produce identical behavior in the program. Those two
symbols are indistinguishable — they are the same symbol, effectively.

So the number of truly distinct symbols is bounded by the number of
distinct states of the program. And a finite program has finitely many
states.

## The Myhill-Nerode Connection

The Myhill-Nerode theorem says: the number of states in the minimal
deterministic finite automaton recognizing a language L equals the number
of equivalence classes of the relation:

    x ~ y  iff  for all z,  xz ∈ L ⟺ yz ∈ L

This is exactly the "same case" relation. Two strings are equivalent if
no program can tell them apart by what they do to future inputs.

For finite automata this gives a tight characterization. For Turing
machines the same intuition applies but the state space is unbounded
at runtime — however the *program* (the transition function) is still
finite and contains finitely many cases.

## The Decision Tree Picture

Think of a program as a binary decision tree:

    - each internal node is a test: "is symbol x equal to a?"
    - each leaf is an output: "accept" or "reject"

A finite decision tree has finitely many leaves. The leaves partition
the input space. Two inputs that reach the same leaf are treated
identically — same output.

An infinite alphabet means infinitely many possible inputs at each node.
But the tree still has finitely many leaves. So the tree groups infinitely
many symbols into finitely many equivalence classes. The equivalence
classes are the real alphabet.

## Formalizing "Finitely Many Cases"

The key object to define formally is the equivalence relation induced
by a program P on an alphabet A:

    a ~_P b  iff  for all contexts C,  P(C[a]) = P(C[b])

where C[a] means "the context C with symbol a plugged in."

**Claim:** If P is a finite program, then A / ~_P is finite.

**Proof sketch:** P has finitely many states Q. The behavior of P on
any input symbol is determined by which state transition it triggers.
The transition function δ : Q × A → Q maps each (state, symbol) pair
to a next state. The number of distinct behaviors of a symbol a is
the number of distinct functions  q ↦ δ(q, a)  from Q to Q.
There are at most |Q|^|Q| such functions — finitely many.
Therefore the number of equivalence classes of ~_P is at most |Q|^|Q|.

So A / ~_P is finite, bounded by |Q|^|Q| where |Q| is the number of
states of P.

## The Punchline

The "symbols" of a formal system are only meaningful insofar as the
verification procedure can distinguish them. Two symbols that the
verifier cannot distinguish are, for all formal purposes, the same symbol.

The number of symbols the verifier can distinguish is bounded by the
number of distinct behaviors its finite state space can exhibit.

A finite verifier therefore operates over a finite effective alphabet —
not by assumption, but by necessity.

## Lean Proof Target

    theorem finite_effective_alphabet
      (Q : Type) [Fintype Q]
      (A : Type)
      (δ : Q → A → Q) :
      Fintype (Set.range (fun a => fun q => δ q a)) := by
      apply Set.finite_range

The range of  a ↦ (q ↦ δ(q,a))  is a subset of  Q → Q,
which is finite when Q is finite. This bounds the number of
distinguishable symbols.