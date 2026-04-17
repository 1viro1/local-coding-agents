# Setup: VS Code / VSCodium / Cursor (OpenClaw Node)

The **OpenClaw Node** extension turns the editor into a controllable endpoint so the OpenClaw gateway can invoke IDE commands (read/write files, symbols, git, tests, etc.).

## Extension

Upstream project: [xiaoyaner-home/openclaw-vscode](https://github.com/xiaoyaner-home/openclaw-vscode)

### Install from VSIX (current upstream flow)

1. Download the latest `.vsix` from [Releases](https://github.com/xiaoyaner-home/openclaw-vscode/releases).
2. Install:

   ```bash
   # VS Code
   code --install-extension openclaw-node-vscode-x.y.z.vsix

   # Cursor
   cursor --install-extension openclaw-node-vscode-x.y.z.vsix
   ```

### Setup wizard

1. Command palette: **OpenClaw: Setup Wizard**.
2. Enter **gateway host**, **port** (default often `18789`), and **token** from your OpenClaw gateway config.
3. Approve the **device** in the gateway when prompted (first connect).
4. Start with **read-only** and **write confirmation**; keep **terminal** disabled until you trust the workflow.

## Validate connectivity

From an OpenClaw session / CLI (see upstream `nodes invoke` docs), typical smoke tests:

- `workspace.info` — workspace metadata.
- `file.read` — read a file path in the workspace.

Exact command names match the extension’s command registry (see upstream README).

## Security reminders

- Treat the gateway token like a password: **loopback bind** + strong token.
- Use extension settings: read-only, confirm writes, terminal allowlist.

## PyCharm later

JetBrains support is not this extension; see [jetbrains-plugin-spec.md](jetbrains-plugin-spec.md).
