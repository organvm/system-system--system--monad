---
uid: DOC-O-03
name: verification--truth-striving
entity_uid: ent_B8A48

nature: PROOF
category: O
layer: 1
domain: Composition
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

# Truth-Striving Decision Verification: A Formal Architecture

**Date**: 2026-04-04
**Domain**: System ontology / verification architecture
**Problem**: Human cognitive limitations generate structurally self-similar (fractal) errors
across every scale of system interaction. Design a system that can prove its decisions
strive toward ideal representation of object-function-as-truth.

---

## 0. The Fractal Error Problem

Human error in system interaction is not noise. It is *structured* and *self-similar*.
A naming error at the variable level reflects the same categorical confusion as an
architectural error at the system level. The cognitive limitation that misclassifies
a function at the token scale reproduces isomorphically at the module scale, the
service scale, the organizational scale.

This is fractal propagation: error pattern E manifests at scale s as phi^s(E_0),
where E_0 is the base cognitive distortion and phi is the self-similarity transform.

The consequence: no single-scale verification suffices. A system that checks only
syntax catches only the token-scale projection of the error. The same structural
mistake persists at every other scale, undetected.

---

## 1. Foundational Definitions

**Definition 1 (Object-Function-as-Truth).**
An object o in O is fully characterized by its function F(o): the complete specification
of what o does, how it composes, what invariants it maintains. The truth of o IS F(o).
Not its name. Not its category. Not its provenance. Its function.

**Definition 2 (Representation).**
A representation R(o) is any encoding of o within a system: a file, a name, a config
value, a structural position, an interface contract. R(o) is *truthful* when the
semantics recoverable from R(o) are isomorphic to F(o).

**Definition 3 (Representational Distance).**
```
delta(o) = d(F(o), sem(R(o)))
```
where sem extracts recoverable semantics and d measures structural divergence between
the true function and what the representation communicates.

delta(o) = 0: perfect representation. The ideal: delta(o) -> 0 for all o in the system.

**Definition 4 (Fractal Error).**
An error pattern E is fractal if there exists a self-similarity transform phi such that
E manifests at scale s as phi^s(E_0). Concretely: the same category of mistake appears
at every level of granularity with the same structural signature.

**Definition 5 (Decision).**
A decision d is a transformation on the representation space: d: R -> R'. Every edit,
rename, restructuring, configuration change, or architectural choice is a decision.

**Definition 6 (Truth-Striving Decision).**
Decision d is truth-striving for object o if:
```
delta(o, R') <= delta(o, R)
```
Strictly truth-striving if the inequality is strict. A decision that does not increase
representational distance is oriented toward truth even if it does not achieve it.

---

## 2. The Proof Obligation

The central mechanism. Every decision carries a structured proof obligation.

**Definition 7 (Proof Obligation).**
```
P(d) = {
  object:      o -- what this decision concerns
  function:    F(o) -- what o actually does (ground truth claim)
  claim:       "R'(o) represents F(o) as [explicit mapping]"
  evidence:    [type check, test, lint, structural invariant, review]
  error_scan:  for each E_k in taxonomy: assertion that d does not introduce E_k
  lineage:     [prior decisions d depends on, with their P(d)]
  bound:       delta(o, R') <= epsilon for stated epsilon
}
```

A decision is *verified* when its proof obligation is discharged -- all evidence
confirms the claim, error scan passes, bound holds.

**Definition 8 (Verified Decision System).**
S = (O, F, R, D, V) is a verified decision system if every d in D carries a
discharged proof obligation P(d) where V(P(d)) = verified.

---

## 3. Truth-Convergence

**Theorem (Truth-Convergence).**
A verified decision system S is truth-convergent (iterative application of verified
decisions drives delta -> 0 for all objects) if and only if:

1. **Soundness**: V never verifies a non-truth-striving decision.
   (No false passes. If V says verified, delta did not increase.)

2. **Progressiveness**: For any R with delta(o,R) > 0, there exists at least
   one decision d such that V(P(d)) = verified and d is strictly truth-striving.
   (No stuck states. If representation is imperfect, improvement is always available.)

3. **Fractal Coverage**: For every error class E_k in the fractal error taxonomy,
   V includes at least one check that detects E_k at every applicable scale s.
   (No blind scales. The verification sees the error pattern everywhere it recurs.)

**Proof sketch.**
Soundness: delta is monotonically non-increasing under verified decisions.
Progressiveness: no fixpoint exists above delta = 0.
Fractal coverage: no scale serves as a reservoir for undetected error accumulation.
Together: bounded, monotonically non-increasing, no stable plateau above zero.
Therefore: convergent to zero. []

---

## 4. Fractal Error Taxonomy

The specific cognitive limitations that generate self-similar errors:

| ID | Error Class | Signature | Scale Examples |
|----|-------------|-----------|----------------|
| E1 | **Name-Function Divergence** | Name does not derive from what the thing does | var, file, repo, org |
| E2 | **False Equivalence** | Distinct functions treated as interchangeable | type conflation, module merge, system coupling |
| E3 | **Premature Abstraction** | Abstracted before function is understood | helper fns, utility modules, framework choices |
| E4 | **Structural Misplacement** | Object located where its function is not exercised | file in wrong dir, config in wrong layer |
| E5 | **Phantom Dependency** | Assumed relationship without functional basis | unnecessary imports, cargo-cult patterns |
| E6 | **Representational Drift** | Representation was truthful but function evolved | stale docs, legacy names, outdated abstractions |
| E7 | **Category Inflation** | Distinctions without functional difference | redundant types, over-specified taxonomies |

Each E_k manifests at every scale with isomorphic structure.

---

## 5. The Decision Protocol

```
PROTOCOL Decide(o, d):

  -- Phase 1: Ground
  1. IDENTIFY the object o
  2. STATE its function F(o) -- what it actually does, not what it is called
  3. STATE the transformation d and resulting representation R'(o)

  -- Phase 2: Claim
  4. ASSERT: sem(R'(o)) approximates F(o)
  5. MAKE EXPLICIT the mapping between R'(o) structure and F(o) behavior

  -- Phase 3: Verify
  6. SCAN against fractal error taxonomy:
       for each E_k in {E1..E7}:
         for each reachable scale s:
           assert d does not introduce E_k at scale s
  7. DISCHARGE evidence:
       - type check    (structural truthfulness)
       - test          (behavioral truthfulness)
       - lint          (conventional truthfulness)
       - invariant     (compositional truthfulness)
       - review        (semantic truthfulness -- may require external oracle)
  8. COMPUTE bound: delta(o, R') <= epsilon

  -- Phase 4: Record
  9. RECORD P(d) with all evidence, lineage, error scan results
  10. If V(P(d)) != verified: REJECT d. Do not apply.

  -- Phase 5: Propagate
  11. For each object o' that depends on o:
        RE-EVALUATE delta(o', R) under the new R'(o)
        If delta increased: flag for remediation
```

---

## 6. System-Level Invariants

Beyond per-decision verification, the system maintains structural invariants:

**I1 (Naming Isomorphism).**
For all o in S: name(R(o)) is derivable from F(o) by a fixed naming protocol.
No name exists without functional justification. Names are *computed from function*,
not chosen by convention or habit.

**I2 (Structural Coherence).**
For all o in S: location(R(o)) reflects the compositional role of F(o) in the
larger system. Placement is a claim about function, not an organizational convenience.

**I3 (Dependency Minimality).**
For all edges (o1, o2) in the dependency graph: there exists a functional necessity.
F(o1) requires F(o2) to operate. No edge without functional justification.

**I4 (Representational Freshness).**
For all o in S: age of R(o) since last verification does not exceed threshold tau.
Staleness is treated as potential E6. Unverified representations are suspect
representations.

**I5 (Scale Invariance of Verification).**
V applies at every scale. Token-level, file-level, module-level, system-level,
cross-system-level. No scale is exempt. This is the direct counter to fractal error:
if the error is scale-invariant, the verification must be scale-invariant.

---

## 7. Reflexive Closure

The verification system V is itself an object in O. Its function F(V) is:
"verify that decisions strive toward truthful representation of object-function."

Therefore V carries its own proof obligation:

```
P(V) = {
  object:     V
  function:   "distinguish truth-striving decisions from non-truth-striving decisions"
  claim:      "V's criteria derive from the formal definitions above"
  evidence:   meta-tests, adversarial decision examples, coverage over error taxonomy
  error_scan: V is specifically vulnerable to:
                E3 (premature abstraction of verification itself)
                E6 (verification criteria drifting from actual function)
                E7 (inflating verification categories beyond functional necessity)
  lineage:    the formal definitions in sections 1-2
  bound:      V's false-positive and false-negative rates are bounded
}
```

The system cannot exempt itself from its own proof obligations.
This reflexivity is what prevents the verification layer from becoming
a source of the same fractal errors it was designed to catch.

---

## 8. The Distinction: Proving Correctness vs. Proving Orientation

Critical epistemological point. This system does NOT prove that decisions are correct.
Correctness is undecidable in general -- you cannot always determine delta(o) = 0
because F(o) may not be fully knowable.

What it proves: **orientation**. That the decision was made *in striving toward*
reduced representational distance. The proof obligation demonstrates:

- The decider identified the object and its function
- The decider explicitly claimed how the representation maps to function
- The decider checked against known error patterns
- The decider produced evidence for the claim
- The decider bounded the remaining distance

This is a gradient proof, not an endpoint proof. You cannot prove you are at the
minimum. You can prove you are moving downhill. And you can prove your gradient
computation is not corrupted by the very errors you are trying to eliminate.

---

## 9. Toward Implementation

The formalization above is implementation-agnostic. It specifies WHAT must be proved,
not HOW the proof is mechanized. Implementation requires binding:

- **O** to concrete object types (files, configs, modules, services, ...)
- **F** to concrete function specifications (types, tests, contracts, ...)
- **R** to concrete representations (source code, file structure, naming, ...)
- **V** to concrete verification tools (type checkers, test suites, linters, CI, ...)
- **P(d)** to concrete proof records (commit messages, PR descriptions, decision logs, ...)
- **Error taxonomy** to concrete detection rules at each scale

The next phase: instrument an existing system (e.g., the domus dotfile infrastructure)
as a verified decision system and measure whether truth-convergence holds in practice.

---

## 10. Summary

| Layer | Content |
|-------|---------|
| Problem | Human error is fractal: self-similar across all scales of interaction |
| Ideal | delta(o) = 0: representation isomorphic to object-function |
| Mechanism | Proof obligation P(d) for every decision d |
| Guarantee | Truth-convergence under soundness + progressiveness + fractal coverage |
| Reflexivity | V verifies itself -- no exempt layer |
| Epistemology | Proves orientation (moving toward truth), not correctness (being at truth) |


The formalization is at `.claude/plans/2026-04-04-truth-striving-decision-verification.md`.

Core architecture:

**The fractal error problem**: Your cognitive distortions aren't random noise — they're structurally self-similar across scales. The same misclassification that corrupts a variable name recurs isomorphically at the module level, the system level, the organizational level. No single-scale check suffices because the error pattern persists at every scale it isn't inspected.

**The proof obligation**: Every decision d carries a structured obligation P(d) that must be discharged before d applies. P(d) contains: the object, its true function, an explicit claim mapping representation to function, evidence (type/test/lint/review), a scan against the fractal error taxonomy (7 error classes, each checked at every reachable scale), and a bound on remaining representational distance.

**The critical distinction**: The system does not prove decisions are *correct* — correctness is undecidable in general. It proves decisions are *oriented toward truth*. A gradient proof, not an endpoint proof. You cannot prove you're at the minimum; you can prove you're moving downhill and that your gradient computation isn't corrupted by the same errors you're eliminating.

**Truth-convergence** requires three conditions:
1. **Soundness** — verification never passes a non-truth-striving decision
2. **Progressiveness** — for any imperfect representation, a strictly improving verified decision exists
3. **Fractal coverage** — verification detects every error class at every scale

**Reflexive closure** — the verification system is itself an object in the system, carrying its own proof obligation. It cannot exempt itself. This prevents the verification layer from becoming a new source of the fractal errors it was built to catch.

The next phase is implementation binding: instrumenting a concrete system (domus is the natural candidate) as a verified decision system and measuring whether truth-convergence holds in practice.