#!/usr/bin/env zsh
# pieces.zsh — declare system pieces as env vars (multi-scale)
#
# Format: P[σ]__GENUS__DIFFERENTIA
#   P__    = σ=0  (default, backward compatible)
#   PN1__  = σ=-1 (internals — one level down)
#   P1__   = σ=+1 (system-of-systems — one level up)
#
# Value: "auto" | <manifest-key-override>

export SYS_MANIFEST="${SYS_MANIFEST:-${0:a:h}/manifest.toml}"
export SYS_CONFIG="${SYS_CONFIG:-${0:a:h}/sys.toml}"
export SYS_REGISTRY="${SYS_REGISTRY:-${0:a:h}/registry}"

# ═══ System identity & statistics (computed from sys.toml + source data) ═══
# Populated by piece CLI. Guarded — fails silently if piece unavailable.

if command -v python3 &>/dev/null && [[ -x "${0:a:h}/piece" ]]; then
    eval "$("${0:a:h}/piece" --export-env 2>/dev/null)"
fi

# ═══ σ=0  current system ════════════════════════════════════════

export P__DISTINCTION__BOUNDARY="auto"
export P__DISTINCTION__TYPE="auto"
export P__TOKEN__NAME="auto"
export P__TOKEN__HANDLE="auto"
export P__RELATION__COMPOSITION="auto"
export P__RELATION__SEQUENCE="auto"
export P__RELATION__DEPENDENCY="auto"
export P__RULE__SCHEMA="auto"
export P__RULE__INVARIANT="auto"
export P__FLOW__PIPELINE="auto"
export P__FLOW__SIGNAL="auto"
export P__FEEDBACK__REGULATION="auto"
export P__FEEDBACK__AMPLIFICATION="auto"
export P__GOVERNANCE__CONSTITUTION="auto"
export P__GOVERNANCE__POLICY="auto"

# ═══ σ=-1  internals of token--name ═════════════════════════════

export PN1__DISTINCTION__GRAPHEME="auto"
export PN1__TOKEN__CODEPOINT="auto"
export PN1__RELATION__ADJACENCY="auto"
export PN1__RULE__ENCODING="auto"

# ═══ σ=-1  internals of relation--composition ═══════════════════

export PN1__DISTINCTION__PARTWHOLE="auto"
export PN1__TOKEN__PARENT="auto"
export PN1__TOKEN__CHILD="auto"
export PN1__RELATION__CONTAINMENT="auto"

# ═══ σ=+1  this system as piece of larger ═══════════════════════

export P1__DISTINCTION__DOMAIN="auto"
export P1__TOKEN__SYSTEM="auto"
export P1__TOKEN__PEER="auto"
export P1__RELATION__FEDERATION="auto"
export P1__FLOW__INTERCHANGE="auto"
