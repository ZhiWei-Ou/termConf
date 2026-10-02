<h1 align="center">🖥️ termConf</h1>

<p align="center">
  Zsh and tmux dotfiles with a warm orange theme and a clickable status bar.
</p>

<p align="center">
  <a href=".zshrc"><img src="https://img.shields.io/badge/Zsh-shell-ff9b72?style=flat-square&amp;logo=zsh&amp;logoColor=white" alt="Zsh shell configuration"></a>
  <a href=".tmux.conf.local"><img src="https://img.shields.io/badge/tmux-3.4%2B-ff9b72?style=flat-square&amp;logo=tmux&amp;logoColor=white" alt="tmux 3.4+ for clickable status cards"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-ff9b72?style=flat-square" alt="MIT License"></a>
</p>

<p align="center">
  <a href="#platform-details"><img src="https://img.shields.io/badge/Linux-1f1f1f?style=flat-square&amp;logo=linux&amp;logoColor=white" alt="Linux platform details"></a>
  <a href="#platform-details"><img src="https://img.shields.io/badge/macOS-1f1f1f?style=flat-square&amp;logo=apple&amp;logoColor=white" alt="macOS platform details"></a>
  <a href="#platform-details"><img src="https://img.shields.io/badge/Windows-WSL-1f1f1f?style=flat-square&amp;logo=linux&amp;logoColor=white" alt="Windows setup through WSL"></a>
</p>

<p align="center">
  <a href="#features">✨ Features</a> ·
  <a href="#quick-start">🚀 Quick Start</a> ·
  <a href="#usage">🧭 Usage</a> ·
  <a href="#configuration">⚙️ Configuration</a> ·
  <a href="https://github.com/ZhiWei-Ou/termConf/issues">🐛 Issues</a>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/07a30c92-c975-4a79-b33a-407dc09bb273" alt="termConf terminal preview with Zsh and the tmux status bar" width="960">
</p>

<a name="features"></a>

## ✨ Features

- 🎨 **Matching Zsh and tmux colors** — warm orange accents, muted labels, and terminal-default backgrounds.
- 📁 **Directory-based window names** — labels follow the active pane's directory basename; home appears as `~`. The current window has a rounded tab.
- 📡 **Network monitoring** — download and upload rates in the status bar; click to see the interface, IP addresses, and traffic totals.
- 📅 **Calendar and world clocks** — click the date or time to open a card, then click outside to close it.
- 🪟 **Floating terminal** — toggle a reusable terminal with `Ctrl+backtick`.
- 🐠 **Terminal aquarium** — fish turn and follow each other, bubbles rise, and foreground plants sway; press any key to return.
- 🌌 **Night sky screensaver** — twinkling stars, occasional shooting stars, and a sleepy cat; press any key to return.
- ⚡ **Shell conveniences** — Git status in the prompt, syntax highlighting, extra completions, and a separate file for personal settings.

<a name="quick-start"></a>

## 🚀 Quick Start

Use Zsh and tmux on Linux, macOS, or WSL. On Windows, the setup entry point installs into your default WSL distribution.

### Prerequisites

Install these before running setup:

- [Zsh](https://www.zsh.org/), Git, Perl, and [tmux](https://github.com/tmux/tmux/wiki/Installing). Use **tmux 3.4+** for clickable status cards.
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation), installed at `~/.oh-my-zsh`.
- A [Nerd Font](https://www.nerdfonts.com/font-downloads), such as `JetBrainsMono Nerd Font Mono`, selected in your terminal for the rounded tab glyphs.
- On Linux/WSL: `iproute2` for network information and `tzdata` for world clocks.

Install the two external Zsh plugins below if they are not already present. `git` and `extract` are bundled with Oh My Zsh; syntax highlighting is enabled by this configuration, and extra completions are loaded through `fpath`.

```sh
git clone https://github.com/zsh-users/zsh-completions.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
```

### Install

Run these commands from a Zsh terminal:

```sh
git clone --branch main https://github.com/ZhiWei-Ou/termConf.git \
    "$HOME/.config/term_conf"
cd "$HOME/.config/term_conf"
./setup.sh
source ~/.zshrc
```

Setup links `.zshrc`, `.tmux.conf`, and `.tmux.conf.local` into your home directory, creates `ZSH_COMPLETION_DIR`, and initializes `~/.workrc/rc.local` with comments.

Existing files or different symlinks are backed up beside their original paths. Repeated runs keep links created by setup and preserve existing `rc.local` content. Directories at configuration-file paths are not replaced. Setup does not install dependencies or execute shell startup files.

Start a tmux session from a terminal where Zsh is configured as the default shell:

```sh
tmux new-session -s dev
```

You should see directory-based window labels and the clock at the bottom. At **120 columns or wider**, all three status cards can be shown when network statistics are available.

<a name="usage"></a>

## 🧭 Usage

### Status cards

<p align="center">
  <img src="https://github.com/user-attachments/assets/03535481-89c6-41b7-a3cc-48e4d9bf99e2" alt="Animated demonstration of termConf terminal interactions" width="960">
</p>

Mouse support is enabled by default. With tmux 3.4+, click a status label to open its card:

| Label | What it shows |
| --- | --- |
| 📡 Download / upload | Default network interface, IPv4/IPv6 addresses, current rates, and received/sent totals. |
| 📅 Date | Current month, Monday-first weeks, and today's date highlighted in orange. |
| 🌍 Time | Local time, UTC, Beijing, Tokyo, London, New York, and Los Angeles, with dates and UTC offsets. |

Click outside a card or its heading, or press `Esc` or `q`, to close it.

The status bar refreshes every two seconds. Network rates appear at **80 columns or wider**, and the date at **120 columns or wider**; the clock remains visible. Calendar and world-clock cards refresh in the background when the minute changes, with updates appearing after the next status refresh. World clocks account for daylight saving time and use shorter dates below 44 columns.

Network details read fresh counters when opened and use the status bar's recent sample to calculate rates. The card is a snapshot. Rates may be unavailable briefly after an interface change or counter reset; cumulative totals come from system counters and can reset with the interface or system.

### Key bindings

The prefix is **`Ctrl+b`**: press it, release it, then press the next key.

| Keys | Action |
| --- | --- |
| `Prefix` then `c` | Create a window. |
| `Prefix` then `1`–`9` | Switch to a window by number. |
| `Prefix` then `-` / `_` | Split into top/bottom or left/right panes. |
| `Prefix` then `h` / `j` / `k` / `l` | Move between panes. |
| `Prefix` then `m` | Toggle mouse support. |
| `Prefix` then `r` | Reload tmux configuration. |
| `Prefix` then `t` | Show the aquarium in the current pane; any key closes it. |
| `Prefix` then `T` (`Shift+t`) | Open the night sky screensaver; any key closes it. |
| `Prefix` then `d` | Detach while keeping the session running. |
| `Ctrl+backtick` | Open or close the floating terminal without a prefix. |

The aquarium requires tmux 3.3+ and replaces the current pane's display while its original program keeps running. Other panes remain visible and continue refreshing. On exit, the original pane, program, and layout return. The night sky opens in a terminal-wide popup on tmux 3.2+. Both animations use the existing Perl dependency, adapt to terminal resizing, and consume the key used to dismiss them. They open only from their shortcuts; there is no automatic idle timer. The aquarium replaces the built-in clock shortcut.

Reattach to the example session:

```sh
tmux attach-session -t dev
```

For `Ctrl+backtick` in Windows Terminal, use the [shortcut mapping below](#windows-terminal).

### Windows setup

Install the prerequisites inside WSL, then open CMD or PowerShell in your checkout:

```bat
setup.bat
```

In PowerShell, use `./setup.bat`. The script calls `setup.sh` through your default WSL distribution and installs into the WSL user's Linux home directory. Open Zsh inside WSL afterward to load the configuration.

To install into another home directory, pass its Linux path:

```sh
./setup.sh /path/to/home
```

From Windows:

```bat
setup.bat /path/to/home
```

<a name="configuration"></a>

## ⚙️ Configuration

### Files

| File | Purpose |
| --- | --- |
| [`.zshrc`](.zshrc) | Prompt, plugins, completions, file colors, and aliases. |
| [`.tmux.conf.local`](.tmux.conf.local) | Theme, status cards, window naming, and custom bindings. |
| [`.tmux.conf`](.tmux.conf) | The bundled Oh my tmux! base configuration. |
| `~/.workrc/rc.local` | Personal exports and aliases, loaded at the end of `.zshrc`. |

Keep tmux customizations in `.tmux.conf.local`. Colors use the existing `tmux_conf_theme_colour_*` settings; the main accent is `#ff9b72`.

Automatic window names follow the active pane's directory, so `~/.config/term_conf` appears as `term_conf` and your home directory as `~`. Manually renamed windows retain their names.

For personal shell settings, edit `~/.workrc/rc.local`, for example:

```sh
# Personal settings loaded by ~/.zshrc.
export EDITOR=vim
alias ll='ls -lah'
```

Reload shell settings from Zsh, or reload tmux in a running session:

```sh
source ~/.zshrc
tmux source-file ~/.tmux.conf
```

### Custom completions

`ZSH_COMPLETION_DIR` is exported and added to `fpath` before completion initialization. It defaults to `~/.oh-my-zsh/custom/plugins/zsh-completions/src` and respects `ZSH_CUSTOM` when set.

Write generated Zsh completions into an `_command` file there. For example, if you use [GitHub CLI](https://cli.github.com/manual/gh_completion):

```sh
gh completion --shell zsh > "$ZSH_COMPLETION_DIR/_gh"
```

Start a new Zsh session to load the completion.

### Optional autosuggestions

Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions):

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
```

Then update the plugin list in `.zshrc`, keeping syntax highlighting last:

```zsh
plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting)
```

### Platform details

| Platform | Network information | World clocks |
| --- | --- | --- |
| Linux / WSL | `ip` from iproute2 and `/proc/net/dev`. WSL rates cover its Linux interface. | Perl and `/usr/share/zoneinfo` from tzdata. |
| macOS | Built-in `route`, `netstat`, and `ifconfig`. | Perl and `/usr/share/zoneinfo`. |
| Windows with tmux under Cygwin/MSYS | `powershell.exe` with NetTCPIP and NetAdapter modules. | PowerShell and Windows time zone rules. |

The Windows helper branches are separate from installation: `setup.bat` always targets WSL. In WSL, network rates do not represent traffic from all Windows applications.

Status cards use the terminal's default background and follow its transparency settings. They do not have a separate opacity setting, and the pane's text is not visible through a card. Calendar and network cards use Perl; no additional tmux plugin or `cal` command is required. Older tmux versions keep the status labels as plain text.

### Windows Terminal

<details>
<summary>🔤 Fonts and Chinese fallback</summary>

Select a Nerd Font as the primary font. For Chinese fallback, install either [Noto Sans Mono CJK SC](https://github.com/notofonts/noto-cjk/) or [Sarasa Mono SC](https://github.com/be5invis/Sarasa-Gothic/).

Merge this font configuration into Windows Terminal's `settings.json`:

```json
{
  "profiles": {
    "defaults": {
      "font": {
        "face": "JetBrainsMono Nerd Font Mono, Sarasa Mono SC",
        "size": 18,
        "weight": "normal"
      }
    }
  }
}
```

The second font is the fallback for Chinese characters. To use Noto instead, set `face` to `"JetBrainsMono Nerd Font Mono, Noto Sans Mono CJK SC"`.

</details>

<details>
<summary>⌨️ Ctrl+backtick for the floating terminal</summary>

Map `Ctrl+backtick` to its extended key sequence in Windows Terminal. Merge these entries into the existing `actions` and `keybindings` arrays in `settings.json`:

```json
{
  "actions": [
    {
      "id": "User.TmuxCtrlBacktick",
      "command": {
        "action": "sendInput",
        "input": "\u001b[27;5;96~"
      }
    }
  ],
  "keybindings": [
    {
      "id": "User.TmuxCtrlBacktick",
      "keys": "ctrl+`"
    }
  ]
}
```

Windows Terminal's [sendInput action](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#send-input) sends this sequence to WSL. tmux 3.2+ enables extended-key forwarding so the nested floating terminal receives the closing shortcut.

</details>

<a name="contributing"></a>

## 🤝 Contributing

Report issues through [GitHub Issues](https://github.com/ZhiWei-Ou/termConf/issues), including your OS, terminal, tmux version, and steps to reproduce. Add a screenshot or recording for visual problems.

For configuration changes, use `.tmux.conf.local` for tmux overrides and check syntax and whitespace:

```sh
zsh -n .zshrc
sh -n setup.sh
git diff --check
```

Manually verify affected shortcuts, status cards, or shell behavior on the platform you changed. Keep personal settings in `~/.workrc/rc.local`.

<a name="license"></a>

## 📄 License

[MIT](LICENSE). The bundled [Oh my tmux!](https://github.com/gpakosz/.tmux) configuration retains its upstream MIT/WTFPL notices.
