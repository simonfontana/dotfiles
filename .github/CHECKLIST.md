Checklist
=========

The makeover from Ubuntu and i3 to Fedora and Sway, one item at a time.
For each item: how it worked before, how it works with today's defaults, how others do it, then a decision and one commit.
Delete this file when the list is done.

## Phase 0: foundation

- [x] 1. Repo and bootstrap
  - This checklist and the README live in `.github/`.
  - Bootstrap uses `bootstrap.d/` so other distros can be added later; Fedora only for now. Added with the first item that installs something.
  - yadm is a pinned release download into `~/.local/bin`.
  - `main` is pushed after every item; it becomes the default branch when it can set up a machine.
- [x] 2. Git config
  - Lives in `~/.config/git/`; per-machine settings go in the untracked `config.local`.
  - delta is the pager; `git d` shows it side by side. ydiff is gone.
  - Editor comes from `$EDITOR` (item 11); diff and merge use git's built-in nvimdiff (item 44).
  - Trying the settings from GitButler's "How Core Git Developers Configure Git".
- [x] 3. Fonts
  - Symbols Nerd Font, pinned and downloaded by the bootstrap, is a fontconfig fallback, so any font shows the icons.
  - Fedora's packaged Cascadia NF was rejected: it lacks about 13% of the icons, among them nvim's yaml icon.
  - The text font is chosen at item 13.

## Phase 1: shell and terminal

- [x] 4. Login shell: zsh via `chsh`
  - The bootstrap runs `chsh` when the login shell isn't zsh.
  - Bootstrap scripts have number prefixes, so the packages are installed before the scripts that need them.
  - With zsh as the login shell, SDDM no longer reads `~/.bash_profile`; the session environment is item 11.
- [x] 5. zsh behaviour: vi mode, cursor shapes, word movement, history, Ctrl keys
  - Config lives in `~/.config/zsh/`; `~/.zshenv` only points zsh there. History is in `~/.local/state/zsh/`.
  - Built-in vi mode, plus zsh's bundled vim text objects and surround.
  - History is shared between terminals right away; HISTSIZE and SAVEHIST now match, so it really keeps 100,000 lines.
  - New from current practice: fzf on Ctrl+R/Ctrl+T/Alt+C, ↑/↓ search by what's typed, `autocd`.
  - Editing the line in `$EDITOR` moved to Ctrl+X Ctrl+E; it was shadowed by Ctrl+E before.
  - Bracketed paste is back on, so a pasted line waits for Enter.
- [x] 6. Completion: compinit, menu select, docker-compose, go-task
  - Built-in completion with the old menu keys: hjkl and Shift+Tab. New: lowercase also matches uppercase, ls colours, group headings.
  - The cache lives in `~/.cache/zsh/`.
  - The old docker-compose completion was never on `fpath`, and docker-compose v1 is gone; dropped. Docker versus podman is item 46.
  - go-task's own RPM ships its completion. fzf-tab was rejected: not packaged, and fzf's `**<Tab>` covers most of it.
- [ ] 7. Plugins: autosuggestions and syntax highlighting (from Fedora packages)
- [ ] 8. Prompt: spaceship with a slimmer config, Ctrl+G toggles git info
- [ ] 9. Moving around: autojump, lf on Ctrl+P
- [ ] 10. Aliases and functions: `..`, `ex`, `wttr`, docker/k8s, the Satisfactory network hack
- [ ] 11. Environment and PATH: Go, cargo, Homebrew, Android SDK, nvim, LM Studio, the secrets file, EDITOR
- [ ] 12. CLI tools: thefuck, lazygit, ydiff, colordiff, glow, notes-cli, k9s/kubectl/helm
- [ ] 13. Terminal: alacritty with doom_one, or foot
- [ ] 51. bash: set up `.bashrc` or keep Fedora's default

## Phase 2: Sway core

- [ ] 14. Base config: upstream or Fedora stock config, included or copied; start from vanilla
- [ ] 15. Keyboard: repeat rate, altgr-intl
- [ ] 16. Mouse and focus: `mouse_warping`, floating modifier
- [ ] 17. Monitor: 240 Hz, VRR, `DP-2` disabled
- [ ] 18. Wallpaper
- [ ] 19. Window keys: hjkl, splits, layouts, parent/child
- [ ] 20. Workspaces: 1–10 plus z/x/c, output assignment, moving workspaces between outputs
- [ ] 21. Resize mode
- [ ] 22. Session keys: reload, exit, lock, power menu
- [ ] 23. Window rules: floating Yad/origin.exe, PanGPUI at the mouse
- [ ] 24. Window look: title bars, inactive-window dimming and fading

## Phase 3: session plumbing

- [ ] 25. Lock and idle: screen off after 10 min, lock only on suspend or a keypress, fullscreen keeps the screen awake
- [ ] 26. Notifications daemon
- [ ] 27. Polkit agent
- [ ] 28. Screen sharing: portals, the Teams cursor hack
- [ ] 29. Network applet
- [ ] 30. Bluetooth
- [ ] 31. Night light
- [ ] 32. Clipboard
- [ ] 33. Keyring: gnome-keyring or kwallet; VS Code and Signal logins
- [ ] 34. Autostart

## Phase 4: bar, launcher, keys

- [ ] 35. Bar behaviour: hidden until Alt; burn-in risk on the OLED
- [ ] 36. Bar contents
- [ ] 37. Launcher
- [ ] 38. Volume keys
- [ ] 39. Media keys
- [ ] 40. Brightness keys (laptop only)
- [ ] 41. Screenshots

## Phase 5: apps and look

- [ ] 42. GTK/Qt theme, dark mode, cursor
- [ ] 43. File manager
- [ ] 44. Neovim
- [ ] 45. VS Code settings and keybindings
- [ ] 46. Dev runtimes: Python, docker/podman, AppImages
- [ ] 52. The `nvim` branch compared with `master`'s config
- [ ] 53. Things the old repo never tracked: go-task, uv, LM Studio, Claude Code settings, flatpaks, a survey of `~/.config`

## Phase 6: gaming (after Fedora 45)

- [ ] 47. HDR, VRR, Steam and gamescope in Sway
- [ ] 48. Retiring Plasma

## Phase 7: later

- [ ] 49. Other machines: yadm alternates, the old laptop and workstation branches
- [ ] 50. Cleanup: delete the old clone, the old GitHub branches and `draft-2026-10`
