---
uid: DOC-P-01
name: stratification--primitives
entity_uid: ent_2247D

nature: FRAMEWORK
category: P
layer: 2
domain: Primitives
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
  - ATM-P-011
  - ATM-P-012
  - ATM-P-013
  - ATM-P-014
  - ATM-P-015
  - ATM-P-016
  - ATM-P-017
  - ATM-P-018
  - ATM-P-019
  - ATM-P-020
  - ATM-P-021
---

<!-- DOC-ENVELOPE
id: DOC-P-01
total_sections: 3
total_atoms: 11
dominant_provenance: HYBRID
dominant_nature: FRAMEWORK
sections:
  - name: "Layer Stratification (0-6)"
    atoms: [ATM-P-011, ATM-P-012, ATM-P-013, ATM-P-014, ATM-P-015, ATM-P-016, ATM-P-017]
  - name: "Nesting Invariant and Recursion"
    atoms: [ATM-P-018]
  - name: "Universality Audit"
    atoms: [ATM-P-019, ATM-P-020, ATM-P-021]
-->

<!-- ATM-P-011 IN
idea: "System primitives stratify as nesting order, not flat collection — Layer 0 is Distinctions: the irreducible act of drawing a boundary"
section: "Layer Stratification (0-6)"
position: 1
of_total: 11
prev: null
context_above: null
provenance: LOCAL
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

A system is not a flat collection — it is a nesting order. The primitives stratify:
❯ what primitives nest within a system?
**Layer 0 — Distinctions**
The irreducible act: drawing a boundary. Before there are parts, there is the cut that separates inside from outside, this from not-this. Every system begins with at least one distinction.

<!-- ATM-P-011 OUT
next: ATM-P-012
context_below: "Layer 1 — Tokens: stabilized distinctions with persistent identity"
-->

<!-- ATM-P-012 IN
idea: "Layer 1 — Tokens: a distinction stabilized, given identity, made re-invocable — variables, labels, handles, names"
section: "Layer Stratification (0-6)"
position: 2
of_total: 11
prev: ATM-P-011
context_above: "Layer 0 — Distinctions as irreducible boundary-act"
provenance: HYBRID
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

**Layer 1 — Tokens**
Named things that persist across reference. A token is a distinction that has been stabilized — given identity, made re-invocable. Variables, labels, handles, names.

<!-- ATM-P-012 OUT
next: ATM-P-013
context_below: "Layer 2 — Relations: constraints on token co-occurrence"
-->

<!-- ATM-P-013 IN
idea: "Layer 2 — Relations: tokens alone are inert; relations bind tokens into structure via dependency, containment, sequence, transformation, exclusion"
section: "Layer Stratification (0-6)"
position: 3
of_total: 11
prev: ATM-P-012
context_above: "Layer 1 — Tokens as stabilized distinctions"
provenance: HYBRID
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

**Layer 2 — Relations**
Tokens alone are inert. Relations bind tokens into structure: dependency, containment, sequence, transformation, exclusion. A relation is a constraint on how tokens may co-occur.

<!-- ATM-P-013 OUT
next: ATM-P-014
context_below: "Layer 3 — Rules: second-order constraints governing which connections are permissible"
-->

<!-- ATM-P-014 IN
idea: "Layer 3 — Rules: second-order constraints — determines which connections are permissible; grammars, schemas, type systems, protocols"
section: "Layer Stratification (0-6)"
position: 4
of_total: 11
prev: ATM-P-013
context_above: "Layer 2 — Relations as token-binding constraints"
provenance: HYBRID
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

**Layer 3 — Rules**
Relations that govern other relations. A rule is a second-order constraint — it doesn't just connect tokens, it determines *which connections are permissible*. Grammars, schemas, type systems, protocols.

<!-- ATM-P-014 OUT
next: ATM-P-015
context_below: "Layer 4 — Flows: rules activated in time"
-->

<!-- ATM-P-015 IN
idea: "Layer 4 — Flows: rules activated in time — input enters, transformations apply, output exits; process, pipeline, signal path, event propagation"
section: "Layer Stratification (0-6)"
position: 5
of_total: 11
prev: ATM-P-014
context_above: "Layer 3 — Rules as second-order constraints"
provenance: HYBRID
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

**Layer 4 — Flows**
Rules activated in time. A flow is a rule being executed: input enters, transformations apply, output exits. Process, pipeline, signal path, event propagation.

<!-- ATM-P-015 OUT
next: ATM-P-016
context_below: "Layer 5 — Feedback: self-referential flows enabling regulation, adaptation, drift, collapse"
-->

<!-- ATM-P-016 IN
idea: "Layer 5 — Feedback: flows whose outputs re-enter as inputs — the system becomes self-referential, capable of regulation, adaptation, drift, collapse"
section: "Layer Stratification (0-6)"
position: 6
of_total: 11
prev: ATM-P-015
context_above: "Layer 4 — Flows as rules activated in time"
provenance: HYBRID
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

**Layer 5 — Feedback**
Flows whose outputs re-enter as inputs. This is where the system becomes self-referential — capable of regulation, adaptation, drift, and collapse. Feedback is what makes a system *alive* rather than merely mechanical.

<!-- ATM-P-016 OUT
next: ATM-P-017
context_below: "Layer 6 — Governance: rules about which rules may change, the system's immune system"
-->

<!-- ATM-P-017 IN
idea: "Layer 6 — Governance: meta-layer of rules about which rules may change, under what conditions, by what authority — the system's immune system preserving identity through transformation"
section: "Layer Stratification (0-6)"
position: 7
of_total: 11
prev: ATM-P-016
context_above: "Layer 5 — Feedback as self-referential flow"
provenance: HYBRID
nature: FRAMEWORK
layers: [meta]
domain: Primitives
formalization: SKETCHED
granularity: MINIMAL
editorial: CLEAN
integration: 1A
-->

**Layer 6 — Governance**
The meta-layer: rules about which rules may change, under what conditions, by what authority. Without governance, feedback loops either ossify or diverge. Governance is the system's immune system — it preserves identity through transformation.

<!-- ATM-P-017 OUT
next: ATM-P-018
context_below: "Nesting invariant: each layer presupposes all beneath; each primitive is itself a system at finer resolution"
-->

---

<!-- ATM-P-018 IN
idea: "Strict nesting: each layer presupposes all beneath — and every primitive at one layer is itself a system at finer layer; recursion is the generative engine"
section: "Nesting Invariant and Recursion"
position: 8
of_total: 11
prev: ATM-P-017
context_above: "Layer 6 — Governance as meta-layer"
provenance: HYBRID
nature: CLAIM
layers: [0, 1, 2, 3, 4, 5, 6]
domain: Primitives
formalization: SKETCHED
editorial: CLEAN
integration: 1A
-->

The nesting is strict: each layer presupposes all layers beneath it. You cannot have flows without rules, rules without relations, relations without tokens, tokens without distinctions. And governance without feedback is ceremony; feedback without governance is chaos.

The recursive insight: every primitive at one layer of resolution is itself a *system* at a finer layer. A "token" is internally a system of distinctions. A "rule" is internally a system of relations. The nesting goes all the way down — and that recursion is not a defect but the generative engine of systemic complexity.

<!-- ATM-P-018 OUT
next: ATM-P-019
context_below: "Self-correction: universality holds only through Layer 2, then forks into contingency"
-->

<!-- ATM-P-019 IN
idea: "Universality audit: Layers 0-2 (distinction, token, relation) are ontological primitives present in every system; Layers 3-4 (rules, flows) are structural primitives requiring regularity and time"
section: "Universality Audit"
position: 9
of_total: 11
prev: ATM-P-018
context_above: "Strict nesting and recursive decomposition"
provenance: HYBRID
nature: DISTINCTION
layers: [0, 1, 2, 3, 4]
domain: Primitives
formalization: SKETCHED
editorial: CLEAN
integration: 1B
-->

No. The stratification holds universally only through Layer 2. After that, it forks.

**Universal (domain-invariant):**

- **Distinctions** — present in every system by definition. No system without a boundary.
- **Tokens** — anything that can be referenced requires stabilized identity. Language, code, biology, physics — all have tokens.
- **Relations** — tokens without relations is just a heap. Structure *is* relation.

**Conditionally universal (present in most but not all systems):**

- **Rules** — only emerge where relations are *constrained* rather than arbitrary. A gas cloud has relations (proximity, momentum exchange) but no rules in the governing sense. Rules require something like regularity, repeatability, or enforcement. Most designed and biological systems have them. Not all physical systems do.
- **Flows** — require time and directionality. Static structures (a crystal lattice, a mathematical proof as object) have rules and relations but no flows. Flows presuppose a medium that carries change.

<!-- ATM-P-019 OUT
next: ATM-P-020
context_below: "Layers 5-6 (feedback, governance) are architectural, domain-dependent"
-->

<!-- ATM-P-020 IN
idea: "Layers 5-6 are architectural primitives: feedback requires output-to-input pathway (not all systems have it); governance requires capacity to modify own rules (rarest)"
section: "Universality Audit"
position: 10
of_total: 11
prev: ATM-P-019
context_above: "Layers 0-2 universal, 3-4 conditional"
provenance: HYBRID
nature: DISTINCTION
layers: [5, 6]
domain: Primitives
formalization: SKETCHED
editorial: CLEAN
integration: 1B
-->

**Domain-dependent:**

- **Feedback** — requires that a system's output pathway can reach its input pathway. Open-loop systems (a waterfall, a one-shot computation, a broadcast) have flows but no feedback. Feedback is an *architectural* property, not a logical necessity.
- **Governance** — requires an agent or mechanism *capable of modifying rules*. This is the most domain-specific primitive. A thermostat has feedback but no governance — it cannot change its own setpoint. Governance appears in: organizations, adaptive software, immune systems, constitutional orders, self-modifying code. It does not appear in most physical or formal systems.

<!-- ATM-P-020 OUT
next: ATM-P-021
context_below: "Synthesis: cone of increasing contingency, not uniform nesting"
-->

---

<!-- ATM-P-021 IN
idea: "Three ontological + two structural + two architectural primitives = cone of increasing contingency, not universal nesting; original framing overstated"
section: "Universality Audit"
position: 11
of_total: 11
prev: ATM-P-020
context_above: "Feedback and governance as domain-dependent architectural primitives"
provenance: HYBRID
nature: CLAIM
layers: [0, 1, 2, 3, 4, 5, 6]
domain: Primitives
formalization: SKETCHED
editorial: CLEAN
integration: 1B
-->

So the honest answer: **three layers are ontological primitives** (you cannot describe *any* system without them), **two are structural primitives** (present wherever there is regularity and process), and **two are architectural primitives** (present only in systems complex enough to self-reference and self-modify).

The original framing overstated the nesting as universal. It's actually a *cone of increasing contingency* — each layer narrows the class of systems it applies to.

<!-- ATM-P-021 OUT
next: null
context_below: null
-->
