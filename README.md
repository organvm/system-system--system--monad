# system-system--system

A system operating on system, recursively self-referential. This directory is not a collection of files about systems — it is a system, built from logic-bound truths outward.

## Structure

```
*.md                     Atoms — axioms, derivations, seeds (flat, no subdirectories)
LAWS.toml / LAWS.md      The 4 unbreakable laws (machine + human readable)
manifest.toml            The system instantiated at σ=0 (piece/v2 schema)
sys.toml                 System identity, versions, vocabulary (single source of truth)
atom-registry.yaml       Computed atom index across all documents

bin/                     CLI tools (piece, sys-*, pieces.zsh)
registry/                Machine graph (entity/relation JSONs, ledger, IRF registry)
scales/                  Fractal decomposition (-1 = internals, +1 = meta)
archive/                 Raw source material (sessions, fragments, duplicates)
```

All content files live at root. The derivation chain is encoded in frontmatter and the registry graph, not in directory nesting.

## The Laws

1. **System Existence** — `H(S) < Σ H(e_i) ⟺ S is a system`
2. **Well-Founded Composition** — every system object admits a unique ordered tree via `(σ, ◁, ≺)`
3. **Primitive Stratification** — 7 layers, strict nesting, cone of contingency
4. **Scale Invariance** — same schema at every σ (the manifest is a fixed point)

See [`LAWS.md`](LAWS.md) for full statements and proofs.

## Usage

```bash
# Resolve a piece at σ=0
./piece token--name

# All pieces at current scale
./piece --all

# Filter by ontological layer
./piece --layer 2

# Decompose a composite piece (σ → σ-1)
./piece --decompose token--name

# Recursive decomposition to atoms
./piece --telescope token--name

# Dependency graph (DOT format)
./piece --graph --deep

# Validate consistency across all files (env vars, versions, counts)
./piece --validate

# Compute all statistics from source data
./piece --stats

# Print shell export statements for all SYS_* variables
./piece --export-env

# Regenerate coverage reports from atom-registry.yaml
./piece --generate-coverage

# Shell integration (loads P__* pieces + SYS_* statistics)
source pieces.zsh
echo $P__TOKEN__NAME
echo $SYS_ATOM_TOTAL
```

## How Expansion Works

The system grows from within, not from without:

1. **New piece at σ=0** — add entry to `manifest.toml`, declare env var in `pieces.zsh`
2. **Decompose a piece** — create `scales/-1/<piece-name>.toml` with identical `piece/v2` schema
3. **New derivation** — add `<name>.md` at root with YAML frontmatter, register in `atom-registry.yaml`
4. **Deeper decomposition** — `scales/-2/` for σ=-2, same schema all the way down

The fixed-point property guarantees the schema works at every depth. The cone of contingency tells you which layers are available at each scale.
