---
uid: DOC-M-03
name: parameter-decomposition--seven-studies
entity_uid: ent_231BC

nature: ALGORITHM
category: M
layer: 3
domain: Materia
provenance: LOCAL

formalization: SKETCHED
lifecycle: theory
integration: 2A
state: active

version: 1
supersedes: null
superseded_by: null

process_type: null

atoms: []
---

# Parameter Decomposition of the Seven Parallel Studies

Extends the Universal Rendering Thesis (URT) to formalize Gap 4: the seven parallel studies as dimensions of parameter space Theta with interference structure.

## Logic (IS)

**Extension to URT vocabulary:**

- `Theta` decomposes as a product: `Theta = Theta_0 x Theta_1 x Theta_2 x Theta_3 x Theta_4 x Theta_5 x Theta_6`
- Each factor `Theta_k` corresponds to the parameter subspace governed by Study `k`
- `pi_k : Theta -> Theta_k` — projection onto the k-th factor
- `I : Theta -> O` — the interference function mapping full parameter vectors to rendered objects

**Mapping:**

| Study | Factor | Governs | Layer(s) |
|---|---|---|---|
| 1. Signal Theory | Theta_0 | What registers as difference: thresholds, sensitivity, resolution | 0 (Distinction) |
| 2. State Mechanics | Theta_1 | What persists: memory depth, state-space cardinality, decay rates | 1 (Token) |
| 3. Rule Dynamics | Theta_2 | Which constraints survive: rule-set fitness, compatibility | 3 (Rule) |
| 4. Interface Negotiation | Theta_3 | What gets exposed/hidden: coupling contracts, boundary terms | 2-3 (Relation-Rule) |
| 5. Loop Ecology | Theta_4 | Which feedback patterns stabilize: loop lifetimes, coupling strength | 4-5 (Flow-Feedback) |
| 6. Schema Competition | Theta_5 | Which named patterns become canonical: schema fitness | 3, 5-6 (Rule-Feedback-Governance) |
| 7. Protocol Genesis | Theta_6 | How governance emerges: meta-rule selection dynamics | 6 (Governance) |

**Axioms (extending URT):**

**A6 (Product Decomposition).** Parameter space factors into seven subspaces, one per study. Every parameter vector `theta` decomposes uniquely as:

$$\theta = (\theta_0, \theta_1, \theta_2, \theta_3, \theta_4, \theta_5, \theta_6) \quad \text{where } \theta_k = \pi_k(\theta) \in \Theta_k$$

**A7 (Non-Independence).** The factors are not independent. The constraint function `C(sigma)` induces cross-factor coupling: the viable values in `Theta_k` depend on the values chosen in other factors.

$$C(\sigma) \subsetneq \Theta_0 \times \Theta_1 \times \cdots \times \Theta_6$$

The strict subset relation captures the fact that not all combinations of factor-values are jointly realizable. This is the formal content of "mutual pressure."

**A8 (Interference).** The rendered object is not the sum of independent contributions from each study. It is the joint output of `G` applied to the full coupled vector. The interference function is `G` itself:

$$O = G(\sigma, \theta_0, \theta_1, \ldots, \theta_6)$$

There is no meaningful `G_k(sigma, theta_k)` that produces a partial object. The studies are analytically separable but ontologically entangled.

**A9 (Study as Active Inquiry).** Each factor space `Theta_k` is not a fixed set. It is a frontier — the set of configurations not yet eliminated by the constraint function. The "study" is the ongoing narrowing of `Theta_k` as constraints tighten.

$$\text{Study}_k(\sigma) = \Theta_k \cap \pi_k\big(C(\sigma)\big)$$

The study "never resolves" because `C(sigma)` is itself evolving — Protocol Genesis (Study 7) modifies the constraint function, which reshapes the viable region of every other study.

---

## Mathematics (MUST)

**Theorem 4 (Interference Pattern).** The system rendered at scale sigma is the intersection of all seven study-frontiers projected through the constraint function. No single study determines the system; only their joint interference does.

*Proof.* By A6, every `theta in C(sigma)` decomposes as `(theta_0, ..., theta_6)`. By A7, `C(sigma)` is a proper subset of the product — i.e., `C(sigma)` is a constraint surface embedded in the product space, not the full product itself.

Define the marginal viable set for study `k`:

$$M_k(\sigma) = \{\theta_k \in \Theta_k \mid \exists\, \theta_{j \neq k} : (\theta_0, \ldots, \theta_6) \in C(\sigma)\}$$

Each `M_k(sigma)` is the projection of the constraint surface onto factor `k`. But the constraint surface is not the product of its projections:

$$C(\sigma) \subseteq M_0(\sigma) \times M_1(\sigma) \times \cdots \times M_6(\sigma)$$

with strict inclusion in general. The configurations that are viable per-factor are a superset of the configurations that are jointly viable. This gap is the interference: the system is smaller than the union of what each study independently permits. QED

**Theorem 5 (Mutual Pressure = Cross-Factor Constraint).** The "mutual pressure" between studies is precisely the conditional constraint: fixing one study's parameters narrows the viable range of others.

*Proof.* For any factor `k` and any `theta_k in M_k(sigma)`, define the conditional viable set:

$$C_{-k}(\sigma \mid \theta_k) = \{(\theta_0, \ldots, \theta_{k-1}, \theta_{k+1}, \ldots, \theta_6) \mid (\theta_0, \ldots, \theta_k, \ldots, \theta_6) \in C(\sigma)\}$$

By A7, this set depends on `theta_k`. The pressure gradient from study `j` to study `k` at configuration theta is:

$$P_{j \to k}(\sigma, \theta) = \frac{\partial}{\partial \theta_j} \text{vol}\big(M_k(\sigma \mid \theta_j)\big)$$

When this is nonzero, study `j` actively constrains study `k`. The seven studies are in mutual pressure whenever the pressure matrix `[P_{j->k}]` is dense. QED

**Theorem 6 (Protocol Genesis as Constraint-Function Dynamics).** Study 7 is structurally distinct: it operates on `C` itself, not within `C`.

*Proof.* Studies 1-6 explore regions of their respective `Theta_k` subject to `C(sigma)`. But Study 7 (Protocol Genesis) explores the space of possible constraint functions:

$$\Theta_6 = \{C' : \sigma \to \mathcal{P}(\Theta) \mid C' \text{ is a valid containment stack}\}$$

A choice of `theta_6 in Theta_6` is a choice of governance — a choice of which other parameter combinations are permitted. This makes Study 7 second-order: it operates on the space of constraints, not the space of constrained objects.

By A5 (Self-Inclusion), `C` is itself an object rendered by `G`, so `C = G(sigma_C, theta_C)` where `theta_C` includes a self-referential component. This is the formal content of "governance emerging from ungoverned competition." QED

**Corollary (Non-Termination).** Study 7 never completes because `C` is a fixed point of a self-referential operation. Any modification to governance is itself governed by the modified governance. The system cannot finalize its own meta-rules from inside — this is Godel applied to the constraint function.

---

## Algorithm (COMPUTE)

```python
from dataclasses import dataclass, field
from typing import Any, Callable
import itertools


@dataclass(frozen=True)
class FactorParams:
    """Parameters for a single study's subspace."""
    study: int
    values: tuple[tuple[str, Any], ...]

    def get(self, key: str) -> Any:
        return dict(self.values)[key]


@dataclass(frozen=True)
class FullParams:
    """A point in the product space Theta = Theta_0 x ... x Theta_6."""
    factors: tuple[FactorParams, ...]

    def project(self, k: int) -> FactorParams:
        """pi_k — projection onto study k's subspace."""
        return self.factors[k]

    def flat(self) -> dict[str, Any]:
        """Flatten all factor params into a single dict."""
        result = {}
        for fp in self.factors:
            for key, val in fp.values:
                result[f"s{fp.study}.{key}"] = val
        return result


STUDY_NAMES = {
    0: "Signal Theory",
    1: "State Mechanics",
    2: "Rule Dynamics",
    3: "Interface Negotiation",
    4: "Loop Ecology",
    5: "Schema Competition",
    6: "Protocol Genesis",
}


@dataclass
class CrossFactorConstraint:
    """A constraint coupling two or more studies."""
    name: str
    involved_studies: tuple[int, ...]
    predicate: Callable[[FullParams], bool]


@dataclass
class ConstraintSurface:
    """C(sigma) — the joint viable region in product space."""
    per_factor: dict[int, Callable[[FactorParams], bool]] = field(
        default_factory=dict
    )
    cross_factor: list[CrossFactorConstraint] = field(default_factory=list)

    def viable(self, sigma: int, theta: FullParams) -> bool:
        """theta in C(sigma) iff it passes all per-factor AND cross-factor constraints."""
        for k, pred in self.per_factor.items():
            if not pred(theta.project(k)):
                return False
        for cf in self.cross_factor:
            if not cf.predicate(theta):
                return False
        return True

    def marginal_viable(self, k: int, sigma: int,
                        sample_others: list[FullParams]) -> list[FactorParams]:
        """M_k(sigma) — approximate marginal by checking which theta_k values
        are viable for at least one combination of other factors."""
        viable_k = set()
        for full_theta in sample_others:
            if self.viable(sigma, full_theta):
                viable_k.add(full_theta.project(k))
        return list(viable_k)

    def pressure(self, j: int, k: int, sigma: int,
                 base: FullParams,
                 perturbations: list[FactorParams]) -> float:
        """P_{j->k} — how much varying study j's params changes
        the viable volume of study k."""
        base_viable = self.viable(sigma, base)
        flips = 0
        for alt_j in perturbations:
            factors = list(base.factors)
            factors[j] = alt_j
            alt_theta = FullParams(factors=tuple(factors))
            if self.viable(sigma, alt_theta) != base_viable:
                flips += 1
        return flips / len(perturbations) if perturbations else 0.0


def interference_pattern(
    sigma: int,
    candidates: list[FullParams],
    surface: ConstraintSurface,
) -> list[FullParams]:
    """The system at scale sigma = all jointly viable parameter vectors.
    Strictly smaller than the product of per-factor viable sets.
    The difference is the interference."""
    return [theta for theta in candidates if surface.viable(sigma, theta)]
```

---

## What This Formalizes

| Prior claim | Now formalized as |
|---|---|
| "each study is a different dimension of Theta" | A6: product decomposition Theta = Theta_0 x ... x Theta_6 |
| "the system emerges from their mutual pressure" | A7 + Theorem 5: cross-factor constraints, pressure matrix P_{j->k} |
| "the system is the interference pattern" | Theorem 4: C(sigma) subset M_0 x ... x M_6, strict inclusion = interference |
| "Protocol Genesis never completes" | Theorem 6 + Corollary: self-referential constraint dynamics, Godel on C |
| Study 7 is structurally distinct | Theorem 6: operates on C itself, not within C |
