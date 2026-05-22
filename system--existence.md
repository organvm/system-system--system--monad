---
uid: DOC-F-01
name: system--existence
entity_uid: ent_C15F4

nature: DEFINITION
category: F
layer: 0
domain: Foundation
provenance: HYBRID

formalization: FORMAL
lifecycle: formal
integration: 1A
state: active

version: 1
supersedes: null
superseded_by: null

process_type: null

atoms:
  - ATM-F-001
  - ATM-F-002
  - ATM-F-003
  - ATM-F-004
  - ATM-F-005
  - ATM-F-006
  - ATM-F-007
---

<!-- DOC-ENVELOPE
id: DOC-F-01
total_sections: 7
total_atoms: 7
dominant_provenance: HYBRID
dominant_nature: DEFINITION
sections:
  - name: "Core Claim"
    atoms: [ATM-F-001]
  - name: "Information-Theoretic Definition"
    atoms: [ATM-F-002]
  - name: "Deficit as Signature"
    atoms: [ATM-F-003]
  - name: "Proof Sketch"
    atoms: [ATM-F-004]
  - name: "Equivalent Formulations"
    atoms: [ATM-F-005]
  - name: "Consequences"
    atoms: [ATM-F-006]
  - name: "One-Line Version"
    atoms: [ATM-F-007]
-->

## System as Provable Equation

### User_Prompt

<!-- ATM-F-001 IN
idea: "A system exists iff its elements are not independent — measurable, falsifiable, provable"
section: "Core Claim"
position: 1
of_total: 7
prev: null
context_above: null
provenance: LOCAL
nature: CLAIM
layers: [0, 2]
domain: Foundation
formalization: INTUITIVE
formalized_by: ATM-F-002
editorial: CLEAN
integration: 1A
-->

❯ define system as mathematically proveable equation                                  **

**The core claim:** A system exists if and only if its elements are not independent. This is measurable, falsifiable, and provable.

<!-- ATM-F-001 OUT
next: ATM-F-002
context_below: "Information-theoretic formalization using Shannon entropy"
-->

---

### Definition (Information-Theoretic)

<!-- ATM-F-002 IN
idea: "System defined as H(S) < Σ H(e_i) — joint entropy strictly less than sum of individual entropies"
section: "Information-Theoretic Definition"
position: 2
of_total: 7
prev: ATM-F-001
context_above: "Core claim that system = non-independence of elements"
provenance: HYBRID
nature: DEFINITION
layers: [0, 2]
domain: Foundation
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

Given elements $E = \{e_1, e_2, \ldots, e_n\}$ each with state space $\Omega(e_i)$:

$$\boxed{H(S) < \sum_{i=1}^{n} H(e_i) \iff S \text{ is a system}}$$

Where $H$ is Shannon entropy. A system exists precisely when the joint entropy of the whole is **strictly less** than the sum of individual entropies. The deficit *is* the structure.

<!-- ATM-F-002 OUT
next: ATM-F-003
context_below: "ΔS deficit formula — quantifying the degree of systemhood"
-->

### The Deficit is the System's Signature

<!-- ATM-F-003 IN
idea: "ΔS = Σ H(e_i) - H(S) quantifies degree of systemhood; zero = collection, positive = system, max = deterministic machine"
section: "Deficit as Signature"
position: 3
of_total: 7
prev: ATM-F-002
context_above: "Entropy inequality as system definition"
provenance: HYBRID
nature: FRAMEWORK
layers: [0, 2]
domain: Foundation
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

$$\Delta_S = \sum_{i=1}^{n} H(e_i) - H(S) \geq 0$$

- $\Delta_S = 0$ : mere collection (no relations, no system)
- $\Delta_S > 0$ : system (elements constrain each other)
- $\Delta_S \to H_{max}$ : maximally constrained (deterministic machine)

$\Delta_S$ equals the total multi-information (interaction information) — the mutual constraint the elements exert on one another. It is provably non-negative by the subadditivity of entropy.

<!-- ATM-F-003 OUT
next: ATM-F-004
context_below: "Proof of subadditivity theorem grounding the deficit"
-->

### Proof Sketch

<!-- ATM-F-004 IN
idea: "Subadditivity theorem: H(e1,...,en) ≤ Σ H(ei) with equality iff mutually independent — proof via chain rule"
section: "Proof Sketch"
position: 4
of_total: 7
prev: ATM-F-003
context_above: "ΔS deficit formula and its interpretation"
provenance: HYBRID
nature: PROOF
layers: [2]
domain: Foundation
formalization: FORMAL
editorial: CLEAN
integration: 1B
-->

**Theorem (Subadditivity).** For any joint distribution over $(e_1, \ldots, e_n)$:

$$H(e_1, \ldots, e_n) \leq \sum_{i=1}^{n} H(e_i)$$

with equality **iff** all $e_i$ are mutually independent.

*Proof:* Follows from the chain rule $H(S) = \sum_i H(e_i | e_1, \ldots, e_{i-1})$ and the fact that conditioning reduces entropy: $H(e_i | e_1, \ldots, e_{i-1}) \leq H(e_i)$, with equality iff $e_i$ is independent of all predecessors. $\square$

Therefore: **the existence of a system is equivalent to the presence of statistical dependence among its elements, and the magnitude of systemhood is the quantity of that dependence.**

<!-- ATM-F-004 OUT
next: ATM-F-005
context_below: "Four equivalent formulations across mathematical frames"
-->

### Equivalent Formulations

<!-- ATM-F-005 IN
idea: "System definition restated across entropy, state-space, dynamical, and category-theoretic frames"
section: "Equivalent Formulations"
position: 5
of_total: 7
prev: ATM-F-004
context_above: "Subadditivity proof"
provenance: HYBRID
nature: MODEL
layers: [0, 2]
domain: Foundation
formalization: FORMAL
editorial: CLEAN
integration: 1B
-->

| Frame | Equation | What it measures |
|-------|----------|-----------------|
| **Entropy** | $H(S) < \Sigma_i H(e_i)$ | State-space compression |
| **State-space** | $|\Omega(S)| < \prod_i |\Omega(e_i)|$ | Reachable configurations < possible configurations |
| **Dynamical** | $\exists\, \varphi: \mathcal{S} \times T \to \mathcal{S}$ s.t. $\varphi$ is not separable into $\prod_i \varphi_i$ | Evolution is irreducibly joint |
| **Category-theoretic** | $S = (Ob, Mor, \circ)$ where $Mor \neq \emptyset$ | Non-trivial morphisms between objects |

<!-- ATM-F-005 OUT
next: ATM-F-006
context_below: "Five consequences of the information-theoretic system definition"
-->

### What This Buys You

<!-- ATM-F-006 IN
idea: "Five consequences: provable, falsifiable, quantitative, emergence located as relational entropy, boundary derived not assumed"
section: "Consequences"
position: 6
of_total: 7
prev: ATM-F-005
context_above: "Four equivalent mathematical framings"
provenance: HYBRID
nature: CLAIM
layers: [0, 2, 6]
domain: Foundation
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

1. **Provable**: $\Delta_S \geq 0$ is a theorem of information theory.
2. **Falsifiable**: Measure $\Delta_S$; if zero, no system.
3. **Quantitative**: $\Delta_S$ gives a *degree* of systemhood, not binary.
4. **Emergence is located**: The "missing" entropy ($\Delta_S$) is not mystical — it is the information encoded in relations rather than elements. Emergence = relational entropy.
5. **Boundary is derived, not assumed**: The partition that maximizes $\Delta_S$ over candidate element sets defines the system's natural boundary.

<!-- ATM-F-006 OUT
next: ATM-F-007
context_below: "Single-sentence distillation of the system definition"
-->

### The One-Line Version

<!-- ATM-F-007 IN
idea: "A system is a set of elements whose joint state space is smaller than the product of their individual state spaces"
section: "One-Line Version"
position: 7
of_total: 7
prev: ATM-F-006
context_above: "Five consequences of the definition"
provenance: HYBRID
nature: DEFINITION
layers: [0]
domain: Foundation
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

> **A system is a set of elements whose joint state space is smaller than the product of their individual state spaces.**

The gap is the structure. The structure is provable. The proof is subadditivity.

<!-- ATM-F-007 OUT
next: null
context_below: null
-->
