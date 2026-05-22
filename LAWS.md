# Laws

The logic-bound truths from which this system derives. Proven, falsifiable, unbreakable. Everything in this directory presupposes them; nothing overrides them.

---

## Law 1: System Existence

$$H(S) < \sum_{i=1}^{n} H(e_i) \iff S \text{ is a system}$$

A system exists precisely when the joint entropy of the whole is strictly less than the sum of individual entropies. The deficit $\Delta_S = \sum H(e_i) - H(S)$ is the structure itself — not a description of structure, but the measure of it. Zero deficit means mere collection. Positive deficit means system. The proof is subadditivity of Shannon entropy, which follows from the chain rule and the fact that conditioning reduces entropy.

**Falsification criterion:** Measure $\Delta_S$. If zero, no system.

**Source:** [`system--existence.md`](system--existence.md)

---

## Law 2: Well-Founded Composition

Every system object $O$ equipped with scale level $\sigma$, composition relation $\triangleleft$, and sequencing order $\prec$ admits a **unique ordered tree decomposition**.

Five axioms ground this:
1. **Scale Stratification** — $A \triangleleft B \to \sigma(A) < \sigma(B)$
2. **Transitive Composition** — composition chains propagate
3. **Finite Grounding** — every chain terminates at irreducible primitives
4. **Sequencing Within Composition** — siblings are totally ordered
5. **Nesting Closure** — any object may be child, sibling, and parent simultaneously

The proof: $\sigma$ strictly decreases along $\triangleleft$-chains, guaranteeing well-foundedness (no infinite descent). Finite grounding ensures leaves. Total sibling order makes the tree ordered. Uniqueness follows from $\triangleleft$ and $\prec$ being given, not derived.

**Source:** [`composition--well-founded.md`](composition--well-founded.md)

---

## Law 3: Primitive Stratification

System primitives stratify as 7 layers in strict nesting order. Each layer presupposes all layers beneath it.

| Layer | Name | Universality |
|-------|------|-------------|
| 0 | **Distinction** — the irreducible act of drawing a boundary | Ontological |
| 1 | **Token** — a distinction stabilized, given identity | Ontological |
| 2 | **Relation** — constraints on how tokens co-occur | Ontological |
| 3 | **Rule** — second-order constraints governing relations | Structural |
| 4 | **Flow** — rules activated in time | Structural |
| 5 | **Feedback** — flows whose outputs re-enter as inputs | Architectural |
| 6 | **Governance** — rules about which rules may change | Architectural |

The stratification forms a **cone of contingency**: layers 0–2 are present in every system by definition (ontological primitives). Layers 3–4 require regularity and time (structural primitives). Layers 5–6 require self-reference and self-modification capacity (architectural primitives — the rarest).

The recursive insight: every primitive at one layer is itself a system at a finer layer. A token is internally a system of distinctions. A rule is internally a system of relations. The nesting goes all the way down.

**Source:** [`stratification--primitives.md`](stratification--primitives.md)

---

## Law 4: Scale Invariance (Fixed Point)

The manifest schema is a fixed point: identical structure at every $\sigma$. A piece with `composition.type = "system"` decomposes into a full manifest at $\sigma - 1$, using the same `piece/v2` schema. The hierarchy has no privileged level.

This is not analogy. The tuple $(\sigma, \Gamma, N, \delta)$ — state, affordance, neighborhood, transition — instantiates identically at every scale of containment. The primitive is not a thing at the bottom; it is a **pattern of relation** that recurs at every level.

Three consequences:
1. **Programs nest** — a seed configuration at scale $n$ can encode a seed configuration at scale $n+1$
2. **Observation is peer-to-peer** — you observe from an adjacent entity at the same scale, never from outside
3. **The compiler problem is self-similar** — compiling at scale $n$ is itself a computation at scale $n-1$

**Operational proof:** `scales/-1/` and `scales/+1/` both use the identical `piece/v2` schema as `manifest.toml` at $\sigma = 0$.

**Source:** [`scale--invariance.md`](scale--invariance.md)

---

## Law 5: Energetic Output (The Mandate of Telemetry)

$$ P(S) = \frac{\Delta \text{Events}}{\Delta t} + \frac{\Delta \text{Metrics}}{\Delta t} > 0 \iff S \text{ is active} $$

Every system of arranged primitives must create and put out energy. In this substrate, "energy" is defined as the stream of verifiable events and metric observations emitted to the registry. A system that emits zero energy ($P(S) = 0$) is considered *inert*—it has collapsed into a vacuum state or an archive. This energy is tracked, analyzed, and repurposed by the governance layer.

**Falsification criterion:** Monitor the event ledger. If $\Delta E = 0$ for a defined interval $T$, the system is inert.

**Source:** [`system--energy.md`](system--energy.md)

---

## Law 6: Isomorphic Validation (The Escrow Threshold)

An abstraction $\alpha$ transitions from `ESCROW` to `ACTIVE` if and only if $\Psi(\alpha)$ is proven true.

$\Psi(\alpha)$ is the **Isomorphism Test**. It requires that the rules and containers of an abstraction must prove themselves as isomorphisms of reality—a truthful positioning that mirrors the formal axioms and the empirical state of the workspace. Only when an abstraction surpasses its own internal substrate with this proof can it open up and interact with the wider system.

**Falsification criterion:** Attempt to map the abstraction's model to the registry's state. Any contradiction cancels the interaction.

**Source:** [`system--isomorphism.md`](system--isomorphism.md)

---


## Law 7: Tripartite Convergence (The Three Heartbeats)

$$\text{Canonical}(x) \iff |H(x)| = 3 \quad \text{where} \quad H(x) = \{L_{\text{formal}}, L_{\text{operational}}, L_{\text{governance}}\}$$

An entity achieves canonical identity if and only if it exists simultaneously across three distinct loci:

1. **$L_{\text{formal}}$** — Existence within the structural registry or index (e.g., an IRF entry, an atom ID in `atom-registry.yaml`, an entity in `registry/data/`)
2. **$L_{\text{operational}}$** — Existence within the physical substrate of work (e.g., a file in the repo, a function in code, a deployed artifact)
3. **$L_{\text{governance}}$** — Existence in the adjudication orbit (e.g., a GitHub issue, a decision record, a gate contract)

An entity with $|H(x)| < 3$ is **embryonic** — it has local existence but not canonical identity. An embryonic entity is a VACUUM: it names a place where convergence should be but is not yet.

The three heartbeats are not metadata. They are the *definition of existence* in this system. A thing that exists in only one layer is a monologue. A thing that exists in two layers is a correspondence. Only a thing that exists in three layers is real — because only tripartite convergence proves that the formal, the physical, and the governed agree on what the thing is.

**Falsification criterion:** For any entity $x$, enumerate $H(x)$. If $|H(x)| < 3$, the entity is embryonic. Embryonic entities must be promoted (heartbeats added) or declared VACUUM with an IRF item tracking the gap.

**Source:** [`system--naming-calculus.md`](system--naming-calculus.md) §4

---

## The Meta-Rule

No law overrides the law above it. No derivation overrides an axiom. No axiom overrides these laws. The derivation chain is encoded in frontmatter and the registry graph: LAWS at root, axiom documents derive from them, derivation documents derive from axioms. Each level presupposes the one above it.
