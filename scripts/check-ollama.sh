#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${OLLAMA_BASE_URL:-http://127.0.0.1:11434}"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl not found" >&2
  exit 1
fi

echo "Checking Ollama at ${BASE_URL}/api/tags ..."
if curl -fsS "${BASE_URL}/api/tags" >/dev/null; then
  echo "OK: Ollama responded."
  exit 0
fi

echo "Failed to reach Ollama. Is ollama running? Try: ollama serve" >&2
exit 1
