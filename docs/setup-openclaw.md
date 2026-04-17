# Setup: OpenClaw (gateway + local Ollama)

OpenClaw is the **agent + gateway** layer. Ollama is only the **model runtime**. You need both.

## Prerequisites

- **Node.js 20+** and npm 9+.
- **Ollama** running with at least one model pulled (see [setup-ollama.md](setup-ollama.md)).

## Install CLI

```bash
npm install -g openclaw
openclaw --version
```

## Local Ollama quick path

OpenClaw’s Ollama integration expects a placeholder API key for local-only discovery. Set:

```bash
export OLLAMA_API_KEY=ollama-local
```

(You can also put this in your shell profile or a local `.env` that you **do not** commit.)

## Onboard (interactive, recommended first time)

```bash
openclaw onboard
```

Choose **Ollama** and **Local only** (or **Cloud + Local** if you use Ollama cloud features).

Non-interactive option (from upstream docs):

```bash
openclaw onboard --non-interactive \
  --auth-choice ollama \
  --accept-risk
```

Optional explicit base URL and model:

```bash
openclaw onboard --non-interactive \
  --auth-choice ollama \
  --custom-base-url "http://127.0.0.1:11434" \
  --custom-model-id "qwen2.5-coder:14b" \
  --accept-risk
```

## Gateway mode

The gateway normally requires `gateway.mode=local` in `~/.openclaw/openclaw.json`. The onboard / setup flows are expected to write this. If the gateway refuses to start, see [troubleshooting.md](troubleshooting.md).

## Start the gateway

```bash
openclaw gateway
```

Foreground alias:

```bash
openclaw gateway run
```

Default WebSocket port is typically **18789**. Ad-hoc bootstrap only:

```bash
openclaw gateway --allow-unconfigured
```

## Health check

```bash
openclaw gateway health --url ws://127.0.0.1:18789 --token YOUR_TOKEN
```

When `--url` is set, pass `--token` or `--password` explicitly (CLI does not fall back to config for credentials on that path).

## Optional paid fallback (Claude, etc.)

Keep **local Ollama as default**. Add cloud providers only in `~/.openclaw/openclaw.json` when you want them; do not commit API keys. See OpenClaw [configuration examples](https://github.com/openclaw/openclaw/blob/main/docs/gateway/configuration-examples.md).

## Template in this repo

See [configs/openclaw.local-ollama.example.json5](../configs/openclaw.local-ollama.example.json5) for a commented JSON5 template. Merge fields into your real `~/.openclaw/openclaw.json` rather than copying secrets into git.

## Further reading

- Gateway CLI: <https://docs.openclaw.ai/cli/gateway>
- Ollama provider: <https://github.com/openclaw/openclaw/blob/main/docs/providers/ollama.md>
