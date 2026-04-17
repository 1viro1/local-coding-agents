# local-coding-agents

Reproducible **local-first** coding agents: **Ollama** (models) + **OpenClaw** (gateway + tools) + **VS Code / VSCodium / Cursor** (OpenClaw Node). Optional **Claude** or other cloud providers stay behind explicit config.

## Prerequisites

- macOS (tested conceptually for Apple Silicon; yours is M-series).
- [Node.js](https://nodejs.org/) **20+** and npm **9+** (for OpenClaw CLI).
- [Ollama](https://ollama.com/download) for local inference.

## Quick start

1. **Ollama** — install, run the app or `ollama serve`, then pull the default coder model:

   ```bash
   ./scripts/pull-default-model.sh
   ```

   See [docs/setup-ollama.md](docs/setup-ollama.md).

2. **OpenClaw** — install CLI, onboard with Ollama, start gateway:

   ```bash
   npm install -g openclaw
   export OLLAMA_API_KEY=ollama-local
   openclaw onboard
   openclaw gateway
   ```

   See [docs/setup-openclaw.md](docs/setup-openclaw.md). For a mergeable template (no secrets committed), see [configs/openclaw.local-ollama.example.json5](configs/openclaw.local-ollama.example.json5).

3. **IDE Node** — install the OpenClaw VS Code extension (VSIX), connect to the gateway, validate:

   See [docs/vscode-node.md](docs/vscode-node.md).

4. **Workflows & guardrails** — ask / plan / agent modes and permission defaults:

   See [docs/workflows-and-guardrails.md](docs/workflows-and-guardrails.md).

## Future: PyCharm / JetBrains

Specification and milestones: [docs/jetbrains-plugin-spec.md](docs/jetbrains-plugin-spec.md).

## Security

Summary: [docs/security-model.md](docs/security-model.md). Never commit gateway tokens or API keys; use `~/.openclaw/` and environment variables.

## Troubleshooting

[docs/troubleshooting.md](docs/troubleshooting.md).

## Contributing / agent onboarding

[AGENTS.md](AGENTS.md).

## References

- OpenClaw docs index: <https://docs.openclaw.ai/llms.txt>
- Gateway CLI: <https://docs.openclaw.ai/cli/gateway>
- Ollama provider: <https://github.com/openclaw/openclaw/blob/main/docs/providers/ollama.md>
- VS Code / Cursor node: <https://github.com/xiaoyaner-home/openclaw-vscode>
