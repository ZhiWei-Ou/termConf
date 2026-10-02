# termConf
the tmux config and the zsh config for terminal

# Download
```bash
git clone -b main git@github.com:ZhiWei-Ou/termConf.git \
    ~/.config/term_conf
```

# Dependencies
Requirements:
- [tmux](https://tmuxcheatsheet.com/how-to-install-tmux/) 
- [on-my-zsh](https://ohmyz.sh/#install)
- [CMake-Completion](https://github.com/zsh-users/zsh-completions)

## Windows Terminal font

Choose and install one of these Chinese fallback fonts:

- `Noto Sans Mono CJK SC`: download the release ZIP from
  [noto-cjk](https://github.com/notofonts/noto-cjk/).
- `Sarasa Mono SC`: download it from
  [Sarasa Gothic](https://github.com/be5invis/Sarasa-Gothic/).

Open the Windows Terminal `settings.json` file and configure the default font.
For example, to use `Sarasa Mono SC`:

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

The second font in `face` is the fallback font used for Chinese characters. To
use Noto instead, set `face` to
`"JetBrainsMono Nerd Font Mono, Noto Sans Mono CJK SC"`.

# Startup
```bash
# create symbolic links of config files
ln -si ~/.config/term_conf/.zshrc ~/.zshrc
ln -si ~/.config/term_conf/.tmux.conf ~/.tmux.conf
ln -si ~/.config/term_conf/.tmux.conf.local ~/.tmux.conf.local

# optional
mkdir -p ~/.workrc
touch ~/.workrc/rc.local

# reload zsh
source ~/.zshrc
```

# Advanced
We can create a `~/.workrc/rc.local` to export the environment variables for work.

## Zsh completion directory

`ZSH_COMPLETION_DIR` exports the resolved zsh-completions directory, which is
added to `fpath` before completion initialization. It uses `ZSH_CUSTOM` when set,
otherwise `$ZSH/custom`, with `~/.oh-my-zsh` as the fallback for `ZSH`.

Redirect your command's Zsh completion output into an `_command` file there.
For a command that supports `completion zsh`, for example:

```sh
mkdir -p "$ZSH_COMPLETION_DIR"
your-command completion zsh > "$ZSH_COMPLETION_DIR/_your-command"
```

Use the completion-generation syntax supported by your command, then start a
new Zsh session to load the new completion file.

## tmux window names

Automatic window labels use the basename of the active pane's current directory
and update when the directory or active pane changes. For example,
`~/.config/term_conf` appears as `term_conf`; the home directory appears as `~`.
Manually renamed windows keep their custom names. Naming uses tmux's built-in
format without launching a shell.

## tmux network speed

The status bar shows download (`↓`) and upload (`↑`) rates for the default
network interface. Units scale from B/s to KiB/s, MiB/s, and GiB/s. The bar
refreshes every two seconds; slower system queries can delay network samples.
Network speed is hidden below 80 columns, and the date below 120 columns.

With tmux 3.4+ and mouse support enabled, click either rate to open network
details. The popup samples the default interface when opened and shows its
name, first available IPv4 and non-link-local IPv6 address, download/upload
rates, and total received/sent bytes. It reuses the status bar's recent sampling
baseline and reads fresh counters, so opening it does not wait for another
one-second sampling interval. Rates remain unavailable until a valid status
sample is ready after an interface change or counter reset. Totals come from
the system interface counters and may reset when the interface or system
restarts. Click outside the card or its heading, or press `Esc` or `q`, to
close it. Its background follows the terminal, like the calendar popup.

- Linux and WSL use `ip` from iproute2 and `/proc/net/dev`. In WSL, the rates
  cover the WSL network interface rather than all Windows applications.
- macOS uses the built-in `route`, `netstat`, and `ifconfig` commands.
- Windows with tmux under Cygwin/MSYS uses `powershell.exe` and the built-in
  NetTCPIP/NetAdapter modules. PowerShell must be available on `PATH`.

Sampling uses Perl, which is already required by Oh my tmux!. No tmux plugin
is needed. Interface changes, counter resets, and unavailable statistics clear
the network readout until a valid sample is available.

## tmux calendar

With tmux 3.4 or newer and mouse support enabled, click the status bar date to
open a calendar above it. Weeks start on Monday, and today has a warm orange
background with bold dark text. Click outside the card or its heading, or press
`Esc` or `q`, to close it. The date appears at
120 columns or wider. The popup uses the terminal default background, so it
follows the terminal emulator's transparency settings. tmux does not provide
independent popup opacity or show the pane's text through the popup.
The calendar uses the existing Perl dependency; no `cal` command or plugin is
required. Older tmux versions keep the date as plain text.

## tmux time zones

Click the clock label to view the local time, UTC, Beijing, Tokyo, London,
New York, and Los Angeles. The popup shows dates and UTC offsets, including
daylight saving time, from the latest background refresh. Click outside the
card or its heading, or press `Esc` or `q`, to close it.
Dates use `MM-DD` in terminals narrower than 44 columns.
It uses the same terminal background as the calendar and requires tmux 3.4+.
Linux/WSL and macOS use Perl and `/usr/share/zoneinfo` (install `tzdata` if
missing). Windows under Cygwin/MSYS uses the existing `powershell.exe`
dependency and Windows time zone rules for the city clocks.

Calendar and time zone menus are prepared in the background for each session
and refreshed when the minute changes. Cached clicks use tmux commands without
starting a shell or writing a temporary file. Minute and day changes appear
after the next status refresh. During initial preparation, clicks can still
generate a menu directly. Repeated status clicks also respond immediately,
including tmux's second-click and triple-click events.

# FAQ
- This repo has the `zsh-syntax-highlighting` feature enabled by default.
> We can install it by:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- If you want to enable `zsh-autosuggestions` feature.
> we can install it by:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
```
> and then add `zsh-autosuggestions` to the plugin list in `~/.zshrc`.
