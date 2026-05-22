---
uid: DOC-P-04
name: primitives--classification
entity_uid: ent_9DC44

nature: FRAMEWORK
category: P
layer: 2
domain: Primitives
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

None of them are primitives. All eight are **modules or containers** that decompose further. The primitives live one level beneath.

---

## Ontological Classification of V(Π)

### The Three Categories (from your prior formalizations)

| Type | Definition | Test |
|------|-----------|------|
| **Primitive** | Irreducible. No internal structure. Atomic parameter. | Can you decompose it into sub-components that are independently meaningful? If no → primitive. |
| **Module** | Composed of primitives. Has internal structure. Functions as a unit. | Does it have parts that could be individually varied? If yes → module. |
| **Container** | Holds other entities. Identity is relational to contents. Provides boundary/context. | Does it define a space within which other variables operate? If yes → container. |

### Classification

```
CONTAINERS (define the arena)
├── D   dimensionality     — container
│        Holds: d_spatial, d_compact (each is primitive: ℕ)
│        Why container: D defines the stage on which Γ, Κ, Β are
│        even expressible. Without D, forces have nowhere to propagate,
│        boundaries have nothing to bound.
│
├── Β   boundary conditions — container
│        Holds: topology, extent, openness constraints
│        Why container: Β is literally what makes Π a *this* rather
│        than an everything. It's the edge-condition that converts
│        unbounded possibility into a specific plane.
│
└── Κ   information capacity — container
         Holds: maximum distinguishable states per region
         Why container: Κ is the envelope — the complexity ceiling
         that constrains how much structure Σ, Ι, Φ can actually
         realize. It doesn't act; it bounds.

MODULES (composed, unitary function)
├── Γ   force geometry      — module
│        Primitives inside: {coupling_constant_i, range_i, mediator_i}
│        Each force is a primitive triple. Γ bundles them into
│        a regime. Vary one coupling constant → different Γ,
│        but Γ still functions as a unit.
│
├── Τ   temporal character   — module
│        Primitives inside: direction (binary/ternary), rate (scalar),
│        reversibility (boolean)
│        Three independently variable primitives composed into
│        a single temporal signature.
│
├── Ι   interaction rules    — module
│        Primitives inside: {selection_rule_i, symmetry_j, conservation_k}
│        Each rule is primitive (a single permission/prohibition).
│        Ι is the grammar — the composed rule-set.
│
└── Φ   energy regime        — module (not container)
         Primitives inside: {energy_quantity (scalar, conserved),
         distribution_function (spatial map), gradient (vector field)}
         Energy-the-quantity is primitive. The regime is a module
         that composes quantity + distribution + flow.

PRIMITIVES (none of the eight — they live one level down)
└── Σ   phase-state spectrum — ???
```

### The Σ Problem

**Σ** resists clean classification:

- As stated (powerset of phase states) → **container** — it holds which phases are available
- But each *individual phase state* (solid, plasma, condensate) → is it primitive?

**No.** A phase state is itself a module: it's a region in Γ × Φ × Τ space where a particular substrate organization is stable. "Solid" = specific force-energy-temperature regime where crystalline order persists. Change Γ or Φ and the phase dissolves.

So Σ is a **derived container** — it doesn't hold independent primitives. It holds *stability regions* of the other variables. Σ is emergent from Γ × Φ × Τ.

```
Σ = { σ ∈ SubstrateConfigurations | stable(σ, Γ, Φ, Τ) }
```

### Revised Architecture

```
PRIMITIVES (irreducible parameters)
   d_spatial         ∈ ℕ
   d_compact         ∈ ℕ
   coupling_i        ∈ ℝ⁺        (per force)
   range_i           ∈ ℝ⁺ ∪ {∞}  (per force)
   energy_quantity   ∈ ℝ⁺
   time_direction    ∈ {forward, none, symmetric}
   time_rate         ∈ ℝ⁺
   reversibility     ∈ {true, false}
   selection_rule_j  ∈ {permit, forbid} per transition
   entropy_bound     ∈ ℝ⁺

MODULES (composed from primitives)
   Γ = {⟨coupling_i, range_i, mediator_i⟩}
   Τ = ⟨direction, rate, reversibility⟩
   Φ = ⟨energy_quantity, distribution, gradient⟩
   Ι = {selection_rule_j}

CONTAINERS (bound the arena)
   D = ⟨d_spatial, d_compact⟩
   Β = constraint_set(D)
   Κ = f(energy_quantity, D)          ← derived, not independent

EMERGENT (derived from module interaction)
   Σ = stable_phases(Γ, Φ, Τ, Ι)    ← not a variable at all;
                                        it's a consequence
```

### The Reduction

Your eight variables collapse:

- **6 true variables**: D, Γ, Τ, Φ, Ι, Β
- **1 derived bound**: Κ (computable from D + Φ)
- **1 emergent set**: Σ (computable from Γ + Φ + Τ + Ι)

ehe plane of existence is defined by **six independent modules/containers** composed from roughly **10–15 primitives** depending on how many forces and interaction rules the plane admits.