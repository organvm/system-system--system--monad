---
uid: DOC-V-02
name: plane-existence--variables
entity_uid: ent_E786E

nature: QUESTION
category: V
layer: 5
domain: Multiverse
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

## Variables of Env Defining Plane-Existence (Abiotic)

### The Question Formalized

Let **Π** = a plane of existence. What is the minimal variable set **V(Π)** such that **Π** is fully determined, with no reference to organic life?

---

### Variable Set

```
Π := ⟨ Φ, Γ, Σ, D, Τ, Κ, Β, Ι ⟩
```

| Var | Name | Type | Governs |
|-----|------|------|---------|
| **Φ** | Energy regime | ℝ⁺ → distribution | Thermodynamic gradient field — what energy is available, how it flows. Defines whether work can occur. A plane with Φ = 0 everywhere is inert (no process, no existence in the phase-change sense). |
| **Γ** | Force geometry | Set of coupling constants + ranges | Which fundamental interactions hold and at what strength. Gravitational-dominant vs electromagnetic-dominant vs nuclear-dominant planes are categorically different environments. |
| **Σ** | Phase-state spectrum | Powerset(PhaseStates) | Which substrate phases the plane admits — plasma, solid, liquid, gas, condensate, degenerate matter, exotic. A plane that admits only plasma is a different existence-domain than one admitting crystalline solids. |
| **D** | Dimensionality | ⟨d_spatial, d_compact⟩ ∈ ℕ × ℕ | Extended spatial dimensions + compactified dimensions. Determines what geometries, orbits, and structures are topologically possible. |
| **Τ** | Temporal character | ⟨direction, rate, reversibility⟩ | Arrow (entropic, causal, or both), flow rate relative to energy density (relativistic dilation), and whether micro-reversibility holds. A plane with no temporal arrow has no process-ordering. |
| **Κ** | Information capacity | S_max per volume | Bekenstein-like bound — maximum entropy (and therefore maximum distinguishable states) per spatial region. Determines the *complexity ceiling* of the plane. Low Κ = simple. High Κ = rich structure possible. |
| **Β** | Boundary conditions | Constraint set on Π | What bounds the plane — finite/infinite extent, periodic boundaries, horizons, topological closure. Determines whether the plane is open (can exchange with other planes) or closed. |
| **Ι** | Interaction rules | Relation on substrate types | What can couple to what. Not force strength (that's Γ) but *selection rules* — which transformations are permitted, which are forbidden. Symmetry and symmetry-breaking live here. |

---

### Dependencies and Layering

These aren't independent. They form a partial order:

```
D (dimensionality)
 ├── constrains → Γ (forces require dimensions to propagate)
 ├── constrains → Κ (holographic bound is dimension-dependent)
 └── constrains → Β (boundary topology is dimension-dependent)

Γ (forces)
 └── constrains → Σ (which phases are stable depends on force balance)

Φ (energy) + Σ (phases) + Τ (time)
 └── together determine → whether transformation occurs
     (i.e., whether the plane is *alive* in the process sense,
      not biologically, but ontologically)

Ι (interaction rules)
 └── constrains → what subset of Φ × Σ transitions are realized
```

### The Existence Condition

A plane **Π** exists (in the process-ontological sense from the prior formalization) iff:

```
∃ Φ > 0 ∧ |Σ| ≥ 2 ∧ Τ.direction ≠ null ∧ Ι ≠ ∅
```

Translation: nonzero energy, at least two phase states (so transformation is possible), a temporal arrow (so processes are ordered), and at least one permitted interaction (so coupling occurs).

**D, Γ, Κ, Β** determine *which* plane. The four-part conjunction determines *whether* a plane.

---

### What Organic Life Adds (Excluded, but Noted)

Life doesn't introduce new variables — it exploits a narrow band within the existing eight:

- Moderate Φ (not too hot, not too cold — far from equilibrium but not overwhelmingly so)
- Σ includes liquid phase (solvent for molecular interaction)
- High Κ (enough information capacity for replication and error-correction)
- Τ with strong irreversibility (entropy production as metabolism)

Life is a *region* in **V(Π)** space, not an addition to it. The plane doesn't need life to be defined. Life needs the plane to be tuned.