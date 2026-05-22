---
uid: DOC-O-01
name: composition--well-founded
entity_uid: ent_B85C9

nature: AXIOM
category: O
layer: 1
domain: Composition
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
  - ATM-O-001
  - ATM-O-002
  - ATM-O-003
  - ATM-O-004
  - ATM-O-005
  - ATM-O-006
  - ATM-O-007
  - ATM-O-008
---

<!-- DOC-ENVELOPE
id: DOC-O-01
total_sections: 6
total_atoms: 8
dominant_provenance: HYBRID
dominant_nature: AXIOM
note: "Duplicate block (ATM-O-006) excised 2026-04-04 during restructuring. Self-correction appendix retained as ATM-O-007/ATM-O-008."
sections:
  - name: "Logical Foundation"
    atoms: [ATM-O-001]
  - name: "Well-Founded Decomposition Proof"
    atoms: [ATM-O-002]
  - name: "Algorithmic Specification"
    atoms: [ATM-O-003]
  - name: "Composition Operations Summary"
    atoms: [ATM-O-004, ATM-O-005]
  - name: "Duplicate Instance"
    atoms: [ATM-O-006]
  - name: "Stratum Generalization Correction"
    atoms: [ATM-O-007, ATM-O-008]
-->

# System Objects: Macro-to-Micro Composition Ontology

## I. Logical Foundation

<!-- ATM-O-001 IN
idea: "System object defined as bounded entity with scale level σ, composition relation ◁, sequencing order ≺; five axioms: scale stratification, transitive composition, finite grounding, sequencing within composition, nesting closure"
section: "Logical Foundation"
position: 1
of_total: 8
prev: null
context_above: null
provenance: HYBRID
nature: AXIOM
layers: [0, 1, 2, 3]
domain: Composition
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

**Definition.** A *system object* is a bounded entity `O` equipped with:
- a **scale level** `σ(O) ∈ ℤ` (macro = high, micro = low)
- a **composition relation** `◁` where `A ◁ B` means "A is a constituent of B"
- a **sequencing order** `≺` that linearly orders sibling constituents within any parent

**Axiom 1 (Scale Stratification).**
```
∀ A, B : A ◁ B → σ(A) < σ(B)
```
Every constituent exists at a strictly lower scale than its composite.

**Axiom 2 (Transitive Composition).**
```
∀ A, B, C : (A ◁ B ∧ B ◁ C) → A ◁ C
```
Composition chains propagate — micro elements of a meso object are micro elements of the macro object that contains it.

**Axiom 3 (Finite Grounding).**
```
∀ O : ∃ finite chain O₁ ◁ O₂ ◁ … ◁ Oₙ = O where ∄ X : X ◁ O₁
```
Every object bottoms out at irreducible primitives.

**Axiom 4 (Sequencing Within Composition).**
```
∀ B, ∀ A₁ A₂ : (A₁ ◁ B ∧ A₂ ◁ B ∧ A₁ ≠ A₂) → (A₁ ≺_B A₂) ∨ (A₂ ≺_B A₁)
```
Sibling constituents within any parent are totally ordered — they have positions.

**Axiom 5 (Nesting Closure).**
```
∀ O : O may serve simultaneously as ◁-child, ≺-sibling, and ◁-parent
```
Any object can be assembled into, sequenced alongside, and nested within — all at once. Roles are non-exclusive.

<!-- ATM-O-001 OUT
next: ATM-O-002
context_below: "Well-founded decomposition theorem proving unique ordered tree structure"
-->

---

## II. Mathematical Proof

<!-- ATM-O-002 IN
idea: "Well-Founded Decomposition theorem: every system object admits unique ordered rooted tree; proof via well-foundedness of ◁ (σ strictly decreasing) + finite grounding + total order on children"
section: "Well-Founded Decomposition Proof"
position: 2
of_total: 8
prev: ATM-O-001
context_above: "Five axioms defining system objects"
provenance: HYBRID
nature: PROOF
layers: [2, 3]
domain: Composition
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

**Theorem (Well-Founded Decomposition).** Every system object `O` admits a unique tree decomposition `T(O)` where:
- root = `O`
- children of any node `N` = `{A : A ◁ N}`, ordered by `≺_N`
- leaves = primitives (Axiom 3 guarantees termination)

*Proof.*
1. By Axiom 1, `σ` strictly decreases along any `◁`-chain, so `◁` is well-founded (no infinite descent).
2. By Axiom 3, every `◁`-chain terminates at a primitive, so leaves exist.
3. By Axiom 4, children at each node carry a total order `≺_N`, making the tree an *ordered rooted tree*.
4. Uniqueness: the tree is fully determined by `◁` and `≺`, both given.  ∎

**Corollary (Scale as Depth).** For any node at tree depth `d` from root: `σ(node) = σ(O) - d`. Scale is anti-correlated with depth — macro at root, micro at leaves.

<!-- ATM-O-002 OUT
next: ATM-O-003
context_below: "Python algorithmic specification implementing the axioms"
-->

---

## III. Algorithmic Specification

<!-- ATM-O-003 IN
idea: "Python SystemObject dataclass implementing ◁ (assemble/nest_within), ≺ (sequence_at), decompose (recursive tree), and bidirectional walk (macro-to-micro, micro-to-macro)"
section: "Algorithmic Specification"
position: 3
of_total: 8
prev: ATM-O-002
context_above: "Well-founded decomposition proof"
provenance: HYBRID
nature: ALGORITHM
layers: [2, 3, 4]
domain: Composition
formalization: FORMAL
editorial: CLEAN
integration: 1B
-->

```python
from dataclasses import dataclass, field
from typing import Self


@dataclass
class SystemObject:
    """A system object at any scale — simultaneously assemblable,
    sequenceable, and nestable."""

    id: str
    scale: int
    children: list[Self] = field(default_factory=list)  # ◁ relation (ordered by ≺)

    def is_primitive(self) -> bool:
        """Axiom 3: grounding check."""
        return len(self.children) == 0

    def decompose(self) -> dict:
        """Recursive tree decomposition (Theorem above)."""
        return {
            "id": self.id,
            "scale": self.scale,
            "primitive": self.is_primitive(),
            "constituents": [c.decompose() for c in self.children],
        }

    def assemble(self, *parts: Self) -> Self:
        """Macro ← micro: attach lower-scale parts as constituents."""
        for p in parts:
            assert p.scale < self.scale, f"Axiom 1 violation: {p.scale} ≮ {self.scale}"
            self.children.append(p)
        return self

    def sequence_at(self, index: int, sibling_pool: list[Self]) -> list[Self]:
        """Insert self into a sibling sequence at position `index`."""
        sibling_pool.insert(index, self)
        return sibling_pool

    def nest_within(self, parent: Self) -> Self:
        """Axiom 5: self becomes constituent of parent."""
        return parent.assemble(self)

    def walk_macro_to_micro(self):
        """Generator: yields objects from this scale down to primitives."""
        yield self
        for child in self.children:
            yield from child.walk_macro_to_micro()

    def walk_micro_to_macro(self) -> list[Self]:
        """Collect primitives first, composites after — reversed depth-first."""
        result = []
        for child in self.children:
            result.extend(child.walk_micro_to_macro())
        result.append(self)
        return result
```

<!-- ATM-O-003 OUT
next: ATM-O-004
context_below: "Composition operations summary table"
-->

---

## IV. Composition Operations Summary

<!-- ATM-O-004 IN
idea: "Five operations: Assemble (◁, micro→macro), Sequence (≺, lateral), Nest (◁ inverse, macro→micro), Decompose (◁⁻¹, unfold to primitives), Walk (traverse hierarchy)"
section: "Composition Operations Summary"
position: 4
of_total: 8
prev: ATM-O-003
context_above: "Python algorithmic specification"
provenance: HYBRID
nature: SCHEMA
layers: [2, 3]
domain: Composition
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

| Operation | Relation | Direction | Effect |
|-----------|----------|-----------|--------|
| **Assemble** | `◁` | micro → macro | Lower-scale objects become constituents of higher-scale object |
| **Sequence** | `≺` | lateral | Objects at same parent get ordered positions |
| **Nest** | `◁` (inverse) | macro → micro | An object places itself inside a higher-scale container |
| **Decompose** | `◁⁻¹` | macro → micro | Recursively unfold to primitives |
| **Walk** | `◁` + `≺` | either direction | Traverse the full scale hierarchy |

<!-- ATM-O-004 OUT
next: ATM-O-005
context_below: "Synthesis: every system object is product, position, and part simultaneously"
-->

<!-- ATM-O-005 IN
idea: "Every system object is simultaneously product (assembled from below), position (sequenced among siblings), and part (nested within above) — three roles compose without conflict"
section: "Composition Operations Summary"
position: 5
of_total: 8
prev: ATM-O-004
context_above: "Five composition operations table"
provenance: HYBRID
nature: CLAIM
layers: [2, 3]
domain: Composition
formalization: FORMAL
editorial: CLEAN
integration: 1A
-->

Every system object is simultaneously a **product** (assembled from below), a **position** (sequenced among siblings), and a **part** (nested within above). The three roles compose without conflict because `◁` governs vertical structure, `≺` governs horizontal structure, and Axiom 5 permits all roles concurrently.

<!-- ATM-O-005 OUT
next: ATM-O-006
context_below: "Duplicate of primary content (byte-identical)"
-->




<!-- ATM-O-006 IN
idea: "[DUPLICATE EXCISED] Byte-identical repeat of sections I-IV removed during 2026-04-04 restructuring. Original preserved in archive/duplicates/."
section: "Duplicate Instance"
position: 6
of_total: 8
prev: ATM-O-005
context_above: "End of primary composition ontology"
provenance: HYBRID
nature: SCHEMA
layers: [0]
domain: Composition
formalization: EXCISED
editorial: EXCISED
integration: EXCISED
-->

*[Duplicate of sections I–IV excised. Copy-paste artifact. See `archive/duplicates/` for provenance.]*

<!-- ATM-O-006 OUT
next: ATM-O-007
context_below: "Self-correction on stratum generalization"
-->




<!-- ATM-O-007 IN
idea: "Self-correction: the 7-stratum sample was illustrative, not exhaustive — formal treatment should parameterize over arbitrary stratum set |L| ≥ 2"
section: "Stratum Generalization Correction"
position: 7
of_total: 8
prev: ATM-O-006
context_above: "Duplicate content block"
provenance: HYBRID
nature: DISTINCTION
layers: [0, 2, 3]
domain: Composition
formalization: SKETCHED
editorial: CLEAN
integration: 1B
-->

  /btw did i narrow stratums via my array i provided those were just a sample--thoughts?

    The array you gave — primitives, functions, sequences, submodules, modules, directories, containers — reads as an illustrative sample, not a
    closed enumeration. I treated it as a fixed 7-stratum tower, which narrowed the ontology unnecessarily.

    What your prompt actually specifies is the coupling grammar: X couple AS Y. That grammar is stratum-agnostic. It says:

    1. Any object at scale n can couple to become a constituent at scale n+1
    2. The specific labels (function, sequence, module…) are instances, not the schema

<!-- ATM-O-007 OUT
next: ATM-O-008
context_below: "The real structure: open stratum count, AS = ontological promotion, recursive closure"
-->

<!-- ATM-O-008 IN
idea: "The real structure: open stratum count (user-defined), AS = ontological promotion across adjacent strata, 'contained' = recursive closure, sample array demonstrates the pattern but doesn't exhaust it"
section: "Stratum Generalization Correction"
position: 8
of_total: 8
prev: ATM-O-007
context_above: "Self-correction acknowledging over-concretization"
provenance: HYBRID
nature: FRAMEWORK
layers: [0, 2, 3]
domain: Composition
formalization: SKETCHED
editorial: CLEAN
integration: 1A
-->

    The formal treatment should have parameterized over an arbitrary stratum set L with |L| ≥ 2, using your sample as one possible instantiation. The
    axioms (adjacent coupling, upward composition, lateral sequencing, terminal self-containment) hold regardless of how many strata exist or what
    they're named.

    The real structure your prompt encodes:

    - Open stratum count — any number of named levels, user-defined
    - "AS" = ontological promotion — coupling transforms identity across adjacent strata
    - "contained" = recursive closure — the terminal stratum folds back on itself
    - The sample array demonstrates the pattern, it doesn't exhaust it

    So yes — I over-concretized. The formalization should pivot on the coupling operator and stratum adjacency as the universal mechanism, with your
    7-element array as one projection.

<!-- ATM-O-008 OUT
next: null
context_below: null
-->
