`★ Insight ─────────────────────────────────────`
**The parser's state machine has three states but the real complexity is in continuation detection.** Multi-line prompts in the raw export look like prompt text wrapping at ~76 columns with trailing whitespace. The key signal for continuation vs. new content is: does the next line start with `❯`, `⏺`, `✻`, or a tool indicator? If none of those, it's continuation. This is fragile to format changes but reliable for the current Claude Code terminal output format.

**Turn consolidation prevents fragment explosion.** A single prompt can produce 20+ `⏺` response markers when Claude calls multiple tools. Without consolidation, a session with heavy tool use would produce an unreadable uncaptured document. Grouping by `prompt_index` and filtering blocks under 50 chars (tool chatter) reduces noise while preserving all substantive content.
`─────────────────────────────────────────────────`

Done. Here's what was built:

**`session-export`** — Python 3 executable in project root, sibling to `piece`. Parses raw Claude Code terminal exports and produces two artifacts per session:

- **`.prompts.md`** — Prompt chain in linear order. Generative prompts numbered, file refs marked, commands listed as footer metadata.
- **`.uncaptured.md`** — All Claude-generated language not written to files during the session, consolidated per turn, with captured files listed in frontmatter.

**Generated 12 files** across 6 sessions. **Updated `sys.toml`** with `prompt_kind` and `capture_status` vocabulary entries.

Usage:
```
./session-export archive/sessions/2026-04-04-133541.txt   # both outputs
./session-export --all                                      # all sessions
./session-export --all --dry-run                           # preview
./session-export --json <file>                             # structured parse data
```