# Troubleshooting

## Ollama: `connection refused` on port 11434

- Start the Ollama app or run `ollama serve`.
- Verify: `./scripts/check-ollama.sh`

## OpenClaw gateway: refuses to start (gateway mode)

Upstream behavior: the gateway may refuse unless `gateway.mode=local` is set in `~/.openclaw/openclaw.json`. Run `openclaw onboard` / `openclaw setup` to repair, or use **ad hoc only**:

```bash
openclaw gateway --allow-unconfigured
```

## Tool calling broken with Ollama

Do **not** point OpenClaw at `http://127.0.0.1:11434/v1` for Ollama unless you intentionally use legacy OpenAI-compat mode. Use the **native** base URL without `/v1`. See [Ollama provider](https://github.com/openclaw/openclaw/blob/main/docs/providers/ollama.md).

## `gateway health` with `--url` errors on missing token

When using `--url ws://...`, pass `--token` or `--password` explicitly.

## VS Code node: cannot connect

- Confirm gateway is listening: `openclaw gateway status` (see upstream docs).
- Host/port/token must match extension settings.
- Approve the device on the gateway on first connect.

## Model not listed in OpenClaw

Run `ollama pull <model>` then `openclaw models list`. If you use explicit `models.providers.ollama` config, you must define models manually (auto-discovery is skipped).
