# Editor
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

# History
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY EXTENDED_HISTORY

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Better defaults
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS

# Aliases
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias vimdiff='nvim -d'
alias c='clear'
alias ll='ls -lah'
alias la='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias rg='rg --smart-case'

# fzf (Ctrl-R history, Ctrl-T files, Alt-C dirs)
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

# zoxide (smarter cd — use `z` or just `cd` if you prefer)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# meat (reading-diff tool)
export MEAT_MODEL="opencode-go/gpt-5.6-luna"

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<

# Machine-local secrets (not in git)
[[ -f "$HOME/.local-secrets" ]] && source "$HOME/.local-secrets"
