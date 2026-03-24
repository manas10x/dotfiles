# dotfiles

My personal shell configuration for a Fedora Linux + GNOME setup. Built around Zsh, Oh My Zsh, and Starship — optimized for Flutter/Android development and Neovim as the primary editor.

---

## What's inside

| File | Purpose |
|---|---|
| `.zshrc` | Main shell config |
| `.zshrc.local` | Secrets and API keys — **never committed** |

---

## Features

### Prompt
Powered by [Starship](https://starship.rs/) — fast, minimal, git-aware. Oh My Zsh's built-in theme is disabled to avoid conflicts.

### Plugins

| Plugin | What it does |
|---|---|
| `git` | Git aliases and completions (built-in OMZ) |
| `z` | Jump to frequent directories by fuzzy name — `z flutter` takes you there |
| `sudo` | Press `Esc Esc` to prepend `sudo` to the last command |
| `colored-man-pages` | Syntax-highlighted man pages |
| `zsh-syntax-highlighting` | Colors commands as you type — red for invalid, green for valid |
| `zsh-autosuggestions` | Ghost-text completions from history, accept with `→` |
| `fzf-tab` | Replaces tab completion with a live fuzzy picker |

### History
- 50,000 entries saved with timestamps
- Synced across all open terminals in real time
- Duplicates suppressed
- Commands prefixed with a space are not saved (useful for sensitive one-liners)

### Vi mode
- `jj` in insert mode to escape to normal mode
- Restored bindings that vi mode normally kills:

| Key | Action |
|---|---|
| `Ctrl+A` | Beginning of line |
| `Ctrl+E` | End of line |
| `Ctrl+K` | Delete to end of line |
| `Ctrl+R` | Fuzzy history search |

### fzf
| Key | Action |
|---|---|
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Fuzzy file picker — inserts path into current command |
| `Tab` | Fuzzy completion everywhere (via fzf-tab) |

### NVM — lazy loaded
NVM loads only when you first call `nvm`, `node`, `npm`, or `npx`. Saves ~200–400ms on every shell startup.

### Neovim as default
- `$EDITOR` and `$VISUAL` set to `nvim`
- Man pages open inside Neovim with `nvim +Man!`

---

## Aliases

### General

| Alias | Command |
|---|---|
| `v`, `vi` | `nvim` |
| `ll` | `ls -lah --color=auto` |
| `la` | `ls -A --color=auto` |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `ze` | Edit `~/.zshrc` in Neovim |
| `zr` | Reload `~/.zshrc` |
| `zs` | Edit `~/.zshrc.local` (secrets file) |
| `cp` / `mv` / `rm` | Interactive versions — prompts before overwriting or deleting |

### Git

| Alias | Command |
|---|---|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `gpl` | `git pull` |
| `gco` | `git checkout` |
| `gb` | `git branch` |
| `gl` | `git log --oneline --graph --decorate --all` |
| `gd` | `git diff` |
| `gst` | `git stash` |

### Flutter / Dart

| Alias | Command |
|---|---|
| `fr` | `flutter run` |
| `fd` | `flutter run -d` (specify device) |
| `fb` | `flutter build apk` |
| `fba` | `flutter build apk --release` |
| `fpg` | `flutter pub get` |
| `fpu` | `flutter pub upgrade` |
| `fclean` | `flutter clean && flutter pub get` |
| `ftest` | `flutter test` |
| `fdevices` | `flutter devices` |
| `flogs` | `flutter logs` |

---

## Setup

### Prerequisites

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Starship
curl -sS https://starship.rs/install.sh | sh

# fzf
sudo dnf install fzf
```

### Clone and link

```bash
git clone https://github.com/yourusername/dotfiles ~/dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
```

### Install external plugins

```bash
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf-tab
git clone https://github.com/Aloxaf/fzf-tab \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

### Secrets

Create `~/.zshrc.local` for API keys and tokens — this file is never committed:

```bash
touch ~/.zshrc.local
chmod 600 ~/.zshrc.local

# Add your keys
echo 'export GEMINI_API_KEY="your-key-here"' >> ~/.zshrc.local
```

### Apply

```bash
source ~/.zshrc
```

---

## Adding more dotfiles

Same symlink pattern works for any config file:

```bash
cp ~/.config/starship.toml ~/dotfiles/starship.toml
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
```

---

## System

- OS: Fedora Linux (Workstation)
- Shell: Zsh + Oh My Zsh
- Prompt: Starship
- Editor: Neovim (via [bob](https://github.com/MordechaiHadad/bob))
- WM: GNOME
