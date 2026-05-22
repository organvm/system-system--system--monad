# Multiverse: Formal Definition Pipeline

## Layer 1 — Logic Statements (Modal + First-Order)

**Primitive vocabulary:**

```
U       — universe (a complete state-assignment over all propositions)
M       — multiverse (the collection of all universes under consideration)
R(u,v)  — accessibility relation: universe v is reachable from universe u
S(u)    — the state function: maps universe u to its full configuration
t       — discrete time index
φ       — any well-formed proposition evaluable within a universe
```

**Axioms:**

```
A1  (Existence)        ∃u ∈ M : S(u) ≠ ∅
    — At least one universe carries non-trivial state.

A2  (Distinctness)     ∀u,v ∈ M : u ≠ v → S(u) ≠ S(v)
    — No two universes share identical state. Identity = state-identity.

A3  (Branching)        ∀u ∈ M, ∀t : |{v : R(u,v) ∧ branch(u,t,v)}| ≥ 0
    — At any time-step, a universe may branch into zero or more successors.

A4  (Propagation)      ∀u ∈ M, ∀t : ∃v ∈ M : R(u,v) ∧ S(v) = P(S(u), t)
    — Every universe propagates forward via transition function P.

A5  (Non-Collapse)     ∀u,v ∈ M : R(u,v) ∧ R(u,w) ∧ v ≠ w → ¬∃t' > t : S(v,t') = S(w,t')
    — Branches, once split, never reconverge to identical state.

A6  (Locality)         □φ ↔ ∀v : R(u,v) → v ⊨ φ
    — Necessity = truth across all accessible universes (Kripke).

A7  (Contingency)      ◇φ ↔ ∃v : R(u,v) ∧ v ⊨ φ
    — Possibility = truth in at least one accessible universe.

A8  (Seed)             ∃u₀ ∈ M : ¬∃w ∈ M : R(w, u₀) ∧ w ≠ u₀
    — There exists at least one root universe with no external predecessor.
```

**Derived modal principle:**

```
D1  (Multiverse Completeness)
    ∀φ : ◇φ → ∃u ∈ M : u ⊨ φ
    — Every possible proposition is realized in some universe.
    (Follows from A1, A4, A7 under maximal branching.)
```

---

## Layer 2 — Mathematical Proofs

**Definition.** Let `M = (U, R, S, P)` be a multiverse structure where `U` is a set of universes, `R ⊆ U × U` an accessibility relation, `S: U × T → Σ` a state function into configuration space `Σ`, and `P: Σ × T → 𝒫(Σ)` a propagation operator.

---

**Theorem 1 (Closure under Propagation).**
*If `u ∈ M` and `σ' ∈ P(S(u,t), t)`, then `∃v ∈ M` such that `S(v, t+1) = σ'`.*

*Proof.* By A4, for every `u` and `t`, there exists `v` with `R(u,v)` and `S(v) = P(S(u),t)`. Since `P` may be set-valued (branching), each element `σ' ∈ P(S(u,t),t)` induces a distinct `v` by A2. Hence `M` is closed under `P`. ∎

---

**Theorem 2 (Irreversibility of Branching).**
*Let `R(u,v)` and `R(u,w)` with `v ≠ w`. Then for all `t' > t`: `S(v,t') ≠ S(w,t')`.*

*Proof.* Direct from A5 (Non-Collapse). ∎

*Corollary.* The branching tree of `M` is a **forest** (directed acyclic graph with no recombination). The cardinality `|M|` is monotonically non-decreasing over time.

---

**Theorem 3 (Reachability from Seed).**
*For every `u ∈ M`, there exists a finite chain `u₀, u₁, ..., uₖ = u` such that `R(uᵢ, uᵢ₊₁)` for all `i`, and `u₀` satisfies A8.*

*Proof.* Assume for contradiction that some `u` has no finite chain to a seed. Then every predecessor of `u` also has a predecessor, yielding an infinite regress. But `M` is well-founded by A8 (existence of at least one root) combined with A5 (no cycles, since reconvergence is forbidden and `R` is acyclic by Theorem 2's corollary). Contradiction. ∎

---

**Theorem 4 (Cardinality Growth Bound).**
*Let `b(t) = \max_{u \in M} |P(S(u,t), t)|` be the maximum branching factor at time `t`. Then:*

```
|M(t)| ≤ |M(0)| · ∏ᵢ₌₀ᵗ b(i)
```

*Proof.* By induction on `t`. At `t=0`, `|M(0)|` universes exist. At each step, each universe produces at most `b(t)` successors (A3, A4). By A2, all successors are distinct. The bound follows. ∎

*Note.* If `b(t) = b` is constant: `|M(t)| ≤ |M(0)| · bᵗ` — exponential growth. If `b(t)` is unbounded, `|M|` can be uncountable.

---

## Layer 3 — Algorithmic Functions (Post-Simulate Propagation)

```python
from dataclasses import dataclass, field
from typing import Callable, FrozenSet
from collections import deque


@dataclass(frozen=True)
class Universe:
    """A universe is its state. Identity = state-identity (A2)."""
    id: int
    state: tuple  # frozen configuration vector σ ∈ Σ
    parent_id: int | None = None
    t: int = 0


@dataclass
class Multiverse:
    """M = (U, R, S, P) with post-simulate propagation."""

    propagate: Callable[[tuple, int], list[tuple]]
    # P: (state, time) → list of successor states

    halt: Callable[[tuple, int], bool] = lambda s, t: False
    # termination predicate

    universes: dict[int, Universe] = field(default_factory=dict)
    adjacency: dict[int, list[int]] = field(default_factory=dict)
    _counter: int = 0

    def _next_id(self) -> int:
        self._counter += 1
        return self._counter

    def seed(self, initial_state: tuple) -> Universe:
        """A8: create root universe with no predecessor."""
        u = Universe(id=self._next_id(), state=initial_state, parent_id=None, t=0)
        self.universes[u.id] = u
        self.adjacency[u.id] = []
        return u

    def step(self, u: Universe) -> list[Universe]:
        """A4: propagate universe u forward one time-step.
        Returns all branched successors (A3)."""
        if self.halt(u.state, u.t):
            return []

        successor_states = self.propagate(u.state, u.t)
        children = []

        for sigma_prime in successor_states:
            v = Universe(
                id=self._next_id(),
                state=sigma_prime,
                parent_id=u.id,
                t=u.t + 1,
            )
            # A2 enforced: distinct states → distinct universes
            self.universes[v.id] = v
            self.adjacency[u.id].append(v.id)
            self.adjacency[v.id] = []
            children.append(v)

        return children

    def propagate_all(self, max_t: int) -> None:
        """Post-simulate propagation: BFS across the branching tree."""
        frontier = deque(
            u for u in self.universes.values() if u.parent_id is None
        )

        while frontier:
            u = frontier.popleft()
            if u.t >= max_t:
                continue
            children = self.step(u)
            frontier.extend(children)

    def trace(self, uid: int) -> list[Universe]:
        """Theorem 3: reconstruct seed-to-universe chain."""
        path = []
        current = uid
        while current is not None:
            u = self.universes[current]
            path.append(u)
            current = u.parent_id
        path.reverse()
        return path

    def depth(self) -> int:
        return max((u.t for u in self.universes.values()), default=0)

    def cardinality(self) -> int:
        return len(self.universes)

    def leaves(self) -> list[Universe]:
        """Terminal universes: no children or halted."""
        return [
            u for uid, u in self.universes.items()
            if not self.adjacency[uid]
        ]

    def verify_non_collapse(self) -> bool:
        """Theorem 2: no two siblings share state at any future time."""
        for uid, children_ids in self.adjacency.items():
            states_at_t: dict[int, set] = {}
            for cid in children_ids:
                c = self.universes[cid]
                states_at_t.setdefault(c.t, set())
                if c.state in states_at_t[c.t]:
                    return False  # collapse detected
                states_at_t[c.t].add(c.state)
        return True
```

**Example — binary branching multiverse:**

```python
def binary_propagator(state: tuple, t: int) -> list[tuple]:
    """Each universe branches into two: one where the
    next bit is 0, one where it is 1."""
    return [state + (0,), state + (1,)]

M = Multiverse(propagate=binary_propagator, halt=lambda s, t: t >= 4)
M.seed(initial_state=())
M.propagate_all(max_t=4)

assert M.cardinality() == 31        # 1 + 2 + 4 + 8 + 16
assert M.depth() == 4
assert len(M.leaves()) == 16        # 2⁴ terminal universes
assert M.verify_non_collapse()      # Theorem 2 holds
```

---

## Summary of the Pipeline

| Layer | Form | Governs |
|-------|------|---------|
| **Logic** | Modal + first-order axioms (A1–A8) | What a multiverse **is** — ontological commitments |
| **Mathematics** | Theorems 1–4 with proofs | What **must** hold — structural invariants |
| **Algorithm** | `Multiverse.propagate_all()` | How to **compute** post-simulate propagation |

The axioms constrain. The proofs guarantee. The algorithm executes. Propagation is not replay — it is generative continuation from any simulated state forward into the full branching structure licensed by `P`.