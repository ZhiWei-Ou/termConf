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
