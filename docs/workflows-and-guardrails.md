# Workflows and guardrails (Cursor-like)

This document defines **default modes** and **permission tiers** so local agents stay predictable and safe.

## Modes

### Ask (read-only)

- **Goal**: explain code, navigate the project, propose diffs as text.
- **Node**: allow reads, symbols, references, diagnostics, git diff.
- **Node**: no `file.write` / `file.edit` / terminal.

### Plan (read-only + structured output)

- **Goal**: same as Ask, but the agent returns a **numbered plan** (files to touch, steps, risks) before any edits.
- **Node**: same as Ask.

### Agent (controlled writes)

- **Goal**: apply edits through the IDE node, then run lightweight checks.
- **Node**: enable `file.edit` / `file.write` with **confirmation per change** until you trust the workspace.
- **Terminal**: stay **off** by default. If enabled, use a **strict allowlist** (e.g. `pytest`, `npm test`, `git status` only).

## Permission tiers (recommended rollout)

1. **Tier 0 — Discovery**: gateway on loopback; extension read-only; validate `workspace.info` and `file.read`.
2. **Tier 1 — Writes with confirmation**: enable writes in the extension; keep gateway token strong.
3. **Tier 2 — Terminal allowlist**: only after Tier 1 is stable; smallest possible command list.

## OpenClaw tool policy (conceptual)

Align OpenClaw agent/tool allowlists with the above tiers. Start restrictive; widen deliberately. Exact keys depend on your OpenClaw version — see upstream gateway and tools documentation when you enable `exec` / `write` / `edit`.

## Optional cloud fallback

- **Default**: local Ollama only (`OLLAMA_API_KEY=ollama-local` pattern).
- **Explicit opt-in**: add paid providers (e.g. Anthropic) only in local `~/.openclaw/openclaw.json` and document the switch for yourself.

## Operational habits

- Small tasks, small patches, review diffs in the IDE before staging.
- One logical change per git commit when you start committing agent-assisted work.
