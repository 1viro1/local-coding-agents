# Setup: Ollama (local models)

## Install

1. Download and install from [ollama.com/download](https://ollama.com/download).
2. Ensure the daemon is running (menu bar app on macOS, or `ollama serve`).

## Verify

From the repo root:

```bash
./scripts/check-ollama.sh
```

Or manually:

```bash
curl -fsS http://127.0.0.1:11434/api/tags | head
```

## Default model for this project

We standardize on **Qwen Coder** for local daily use on Apple Silicon with ~24GB RAM:

- **Recommended**: `qwen2.5-coder:14b`
- **Lighter / faster**: `qwen2.5-coder:7b`

Pull the default:

```bash
./scripts/pull-default-model.sh
```

Override the tag:

```bash
DEFAULT_OLLAMA_MODEL=qwen2.5-coder:7b ./scripts/pull-default-model.sh
```

## Remote Ollama host

If Ollama runs on another machine, set `OLLAMA_BASE_URL` for checks:

```bash
OLLAMA_BASE_URL=http://192.168.1.10:11434 ./scripts/check-ollama.sh
```

OpenClaw must use the **native** Ollama base URL (`http://host:11434`) **without** `/v1` for reliable tool calling. See upstream [Ollama provider docs](https://github.com/openclaw/openclaw/blob/main/docs/providers/ollama.md).
