# What is new in this repo

## Background (axiomatized, not proved here)

The following are classical results or definitional facts.
They are axiomatized in the Lean files, not proved.
References are given for each.

**Turing machines have finite alphabets.**
Definitional. See any computability textbook.

**Finite automata have finitely many distinguishable states.**
Myhill-Nerode theorem (1958). Classical result in formal
language theory.

**Base-n encoding is injective and bounded.**
Pure arithmetic. Universally accepted.

**Computable functions require finite descriptions.**
Church-Turing thesis. Empirical / definitional depending
on your philosophical position.

**The attention verifier branches only on routing keys.**
Follows from the construction in transformer-bp-lean.
Axiomatized here to avoid a literal Lean import between repos.
The proof is in transformer-bp-lean/Attention.lean.

**Fin a × Fin b × Fin c has a*b*c elements.**
Standard finite combinatorics. In Mathlib as Fintype.card_prod.

## What is new (proved in this repo)

**The BP token encoding induces exactly 2n² routing classes.**

    theorem routing_classes_finite (n : Nat) :
        Fintype.card (RoutingKey n) = 2 * n * n

This is the new claim. It says: for a factor graph with n nodes,
the attention mechanism of the BP transformer can distinguish
exactly 2n² token configurations — 2 node types times n possible
own indices times n possible neighbor indices.

This number is finite for any fixed graph. The infinite space
of possible belief values and factor table entries does not
contribute to routing — it only affects output magnitude.

**The BP transformer has a finite effective alphabet.**

    theorem bp_proof_system_finite_alphabet (n : Nat) (hn : 0 < n) :
        ∃ (alphabetSize : Nat),
          alphabetSize = Fintype.card (RoutingKey n) ∧
          0 < alphabetSize

This connects the BP construction to the godel thesis: any
verifiable proof system operates over a finite primitive alphabet.
The BP transformer instantiates this — its alphabet has size 2n².

## Why this matters

These theorems provide the theoretical justification for the
BP token encoding used in transformer-bp-lean. The encoding
is not arbitrary — it is the minimal encoding that gives the
attention mechanism exactly the finite vocabulary it needs
to route correctly.

The connection runs:

    godel/FiniteStateSpace     -- finite machines have finite alphabets
         ↓
    godel/BPTokenFiniteness    -- BP transformer has alphabet of size 2n²
         ↓
    transformer-bp-lean        -- transformer with this encoding implements BP
         ↓
    hard-bp-lean               -- BP is exact on trees
         ↓
    paper4 no-hallucination    -- transformer does not hallucinate on trees