# AGENTS.md

This repo is **documentation + config templates + small shell helpers** for running local coding agents (Ollama + OpenClaw + VS Code/Cursor Node). There is no application runtime in this repository beyond scripts.

## Design intent

- One place for **reproducible setup** (README + `docs/`).
- **No secrets in git**: tokens live in user config (`~/.openclaw/`) or environment; templates use placeholders only.
- **Optional paid models** (e.g. Claude) are documented as explicit opt-in, not defaults.

## What to read first

1. [README.md](README.md) — quick start.
2. [docs/setup-ollama.md](docs/setup-ollama.md)
3. [docs/setup-openclaw.md](docs/setup-openclaw.md)
4. [docs/vscode-node.md](docs/vscode-node.md)
5. [docs/workflows-and-guardrails.md](docs/workflows-and-guardrails.md)

## Scripts

- `scripts/pull-default-model.sh` — `ollama pull` for the default Qwen coder tag.
- `scripts/check-ollama.sh` — quick check that Ollama responds on `127.0.0.1:11434`.

Run from repo root:

```bash
chmod +x scripts/*.sh
./scripts/check-ollama.sh
./scripts/pull-default-model.sh
```

## Checks (this repo)

There is no Python package or CI in this repo. If you add code (e.g. a small CLI in Python), add `pyproject.toml`, tests, and document `hatch run all-checks` or equivalent in this file in the same change.

## Global Cursor rules

When editing from Cursor, follow the rules under `~/.cursor/rules/` (code quality, workflow, docs-as-you-go, etc.).
