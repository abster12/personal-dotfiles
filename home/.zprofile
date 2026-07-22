# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# LM Studio CLI
export PATH="$PATH:$HOME/.lmstudio/bin"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# User env (uv / other local toolchains)
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
