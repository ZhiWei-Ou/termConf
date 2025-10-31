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
