# claude-boop

Notifications for [Claude Code](https://docs.claude.com/en/docs/claude-code). Plays a sound when Claude needs your attention (permission prompt / idle) or finishes a response.

## Install

**macOS / Linux (Homebrew):**

```sh
brew install akeenkarkare/claude-boop/claude-boop
claude-boop install
```

**Windows:** download `claude-boop-vX.Y.Z-x86_64-pc-windows-msvc.zip` (or `aarch64-pc-windows-msvc` on ARM) from the [latest release](https://github.com/akeenkarkare/homebrew-claude-boop/releases/latest), extract `claude-boop.exe` somewhere on your `PATH`, then:

```powershell
claude-boop install
```

That's it — `install` patches `~/.claude/settings.json` (`%USERPROFILE%\.claude\settings.json` on Windows) to wire up `Notification` and `Stop` hooks. It preserves any existing hooks and is safe to run twice.

## Commands

| Command | What it does |
| --- | --- |
| `claude-boop play --event notification` | Play the permission/idle sound |
| `claude-boop play --event stop` | Play the "generation complete" sound |
| `claude-boop install` | Add hooks to `~/.claude/settings.json` |
| `claude-boop uninstall` | Remove claude-boop's hooks |

The `play` commands are what the hooks invoke — you usually don't run them by hand.

## Custom sounds

Sounds are compiled into the binary. To use your own, clone the repo, drop replacements into `assets/notification.{aiff,wav}` and `assets/stop.{aiff,wav}` (the `.aiff` files are used on macOS/Linux, the `.wav` files on Windows), then `cargo install --path .`.

## Platforms

- **macOS** — uses `afplay` (built in)
- **Linux** — uses `paplay`, `aplay`, or `ffplay` (whichever's installed)
- **Windows** — uses PowerShell's built-in `System.Media.SoundPlayer`

## Uninstall

```sh
claude-boop uninstall
brew uninstall claude-boop
```
