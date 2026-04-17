# Security model

## Threat model (practical)

- **Gateway token**: anyone who can reach the gateway WebSocket and present the token can drive connected IDE nodes.
- **IDE node**: can read and (if enabled) modify your workspace and run allowlisted commands.

## Defaults we recommend

1. Bind the gateway to **loopback** only unless you fully understand exposure (Tailscale/SSH tunnels are advanced).
2. Use a **strong random gateway token**; store it in `~/.openclaw/openclaw.json` or environment — **never** commit it to this repo.
3. Start the VS Code/Cursor extension in **read-only** mode; enable **write confirmation** next.
4. Keep **terminal disabled** until you add a minimal **allowlist**.

## Secrets hygiene

- Use [`.env.example`](../.env.example) as a template; keep real values in `.env` (gitignored) or shell env.
- Do not paste tokens into chat logs, screen recordings, or shared terminals.

## Device identity (VS Code node)

The upstream extension generates a device keypair and requires gateway approval on first connect. Treat approvals like pairing a new device.

## Reporting issues

If you find a behavior that bypasses read-only or path scoping, report it to the **upstream extension** or **OpenClaw** projects with minimal repro steps.
