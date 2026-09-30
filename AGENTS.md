# Repository Guidelines

## Project Structure & Module Organization

This repository contains terminal configuration rather than application code:

- `.zshrc` configures Oh My Zsh, completions, prompt colors, aliases, and optional work settings.
- `.tmux.conf` contains the Oh my tmux! base configuration and embedded shell helpers.
- `.tmux.conf.local` contains tmux theme settings, behavior options, and custom bindings.
- `README.md` documents dependencies, symlink installation, and Windows Terminal fonts.

There are no dedicated source, test, or asset directories. Keep ordinary tmux customizations in `.tmux.conf.local`; the base file explicitly directs contributors to use local overrides.

## Build, Test, and Development Commands

No build step or package manager is configured. Install tmux, Oh My Zsh, and the completion/highlighting plugins described in `README.md`.

- `zsh -n .zshrc`: check shell syntax without executing startup configuration.
- `git diff --check`: detect whitespace errors before review.
- `source ~/.zshrc`: reload shell settings after installing the documented symlinks; this executes startup code and optional work settings.
- `tmux source-file ~/.tmux.conf`: reload configuration in the current tmux server after symlink installation.

For isolated interactive validation, run `tmux -L term-conf-review -f "$PWD/.tmux.conf" new-session`. Exit its test session when finished.

## Coding Style & Naming Conventions

Preserve existing section comments and nearby formatting. Use four spaces for Zsh conditional bodies, lowercase names for local helpers, and uppercase names for exported environment settings. Follow existing `tmux_conf_*` option names and `#RRGGBB` theme colors. Preserve quoting, tmux format expressions, and version guards. No formatter or linter configuration is committed.

## Testing Guidelines

There is no automated test framework or coverage target. Run syntax and whitespace checks, then manually exercise changed prompts, aliases, key bindings, popups, and status colors. Check platform-specific behavior on the affected system; record the OS, terminal, and tmux version used. Include screenshots for visual changes and distinguish manual checks from syntax validation.

## Commit & Pull Request Guidelines

Recent history uses Conventional Commits, such as `fix(tmux): dim non-current window status` and `style(zsh): tune ls file colors`. Keep commits focused. Pull requests should explain the behavior change, affected files, validation results, and dependency or version requirements. Link relevant issues and update `README.md` when setup changes.

## Security & Configuration Tips

Keep personal work exports in `~/.workrc/rc.local`, which `.zshrc` loads when present. Never commit credentials or machine-specific secrets. Preserve existing user configuration when installing symlinks.
