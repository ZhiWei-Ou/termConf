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

# Startup
```bash
ln -si ~/.config/term_conf/.zshrc ~/.zshrc
ln -si ~/.config/term_conf/.tmux.conf ~/.tmux.conf
ln -si ~/.config/term_conf/.tmux ~/.tmux

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