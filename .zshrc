# ==============================================================================
# OH MY ZSH
# ==============================================================================

export ZSH="$HOME/.oh-my-zsh"

# Disabled in favor of Starship prompt
ZSH_THEME=""

# ==============================================================================
# OMZ BEHAVIOR
# ==============================================================================

ENABLE_CORRECTION="false"
unsetopt CORRECT
unsetopt CORRECT_ALL
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
DISABLE_UNTRACKED_FILES_DIRTY="true"   # faster git status in large repos

# ==============================================================================
# PLUGINS
# zsh-syntax-highlighting and zsh-autosuggestions must be installed separately:
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting \
#     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#   git clone https://github.com/zsh-users/zsh-autosuggestions \
#     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# fzf-tab:
#   git clone https://github.com/Aloxaf/fzf-tab \
#     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# ==============================================================================

plugins=(
  git
  z
  sudo
  colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# ==============================================================================
# HISTORY
# ==============================================================================

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE   # commands prefixed with a space are not saved
setopt SHARE_HISTORY       # sync history across open terminals
setopt EXTENDED_HISTORY    # save timestamp and duration

# ==============================================================================
# PATH  (typeset -U auto-deduplicates)
# ==============================================================================

typeset -U PATH
export ANDROID_HOME="$HOME/Android/sdk"

path=(
  "$HOME/.local/bin"
  "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
  "$HOME/development/flutter/bin"
  "$ANDROID_HOME/cmdline-tools/latest/bin"
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/emulator"
  /usr/local/bin
  /usr/bin
  $path
)

# ==============================================================================
# ENVIRONMENT
# ==============================================================================

export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'   # open man pages inside Neovim

export LANG=en_US.UTF-8

# ==============================================================================
# SECRETS  — keep your actual keys in ~/.zshrc.local (never commit that file)
# Create it with:  echo 'export GEMINI_API_KEY="your-key"' >> ~/.zshrc.local
# ==============================================================================

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ==============================================================================
# NVM  
# ==============================================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export NVM_DIR="$HOME/.nvm"

# ==============================================================================
# FZF
# Install on Fedora:  sudo dnf install fzf
# ==============================================================================

[ -f /usr/share/fzf/shell/key-bindings.zsh ] && \
  source /usr/share/fzf/shell/key-bindings.zsh

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# ==============================================================================
# VI MODE
# ==============================================================================

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Restore useful emacs-style bindings that vi mode removes
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^R' history-incremental-search-backward   # Ctrl+R fuzzy history

# ==============================================================================
# ALIASES — General
# ==============================================================================

alias v='nvim'
alias vi='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -sh'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Reload / edit zshrc
alias zr='source ~/.zshrc && echo "zshrc reloaded"'
alias ze='nvim ~/.zshrc'
alias zs='nvim ~/.zshrc.local'   # edit secrets file

# ==============================================================================
# ALIASES — Git
# ==============================================================================

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gst='git stash'

# ==============================================================================
# ALIASES — Flutter / Android / Dart
# ==============================================================================

alias fr='flutter run'
alias fd='flutter run -d'          # fd <device-id>
alias fb='flutter build apk'
alias fba='flutter build apk --release'
alias fpg='flutter pub get'
alias fpu='flutter pub upgrade'
alias fclean='flutter clean && flutter pub get'
alias ftest='flutter test'
alias fdoc='dart doc'
alias flogs='flutter logs'
alias fdevices='flutter devices'

# ==============================================================================
# STARSHIP PROMPT  (must be last)
# ==============================================================================

eval "$(starship init zsh)"
