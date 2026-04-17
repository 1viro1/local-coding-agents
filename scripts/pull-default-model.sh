#!/usr/bin/env bash
set -euo pipefail

# Default local coding model for this repo (M-series + 24GB RAM friendly).
# Override: DEFAULT_OLLAMA_MODEL=qwen2.5-coder:7b ./scripts/pull-default-model.sh
MODEL="${DEFAULT_OLLAMA_MODEL:-qwen2.5-coder:14b}"

if ! command -v ollama >/dev/null 2>&1; then
  echo "ollama not found. Install from https://ollama.com/download" >&2
  exit 1
fi

echo "Pulling ${MODEL} (set DEFAULT_OLLAMA_MODEL to change)..."
ollama pull "${MODEL}"
echo "Done. ollama list:"
ollama list
