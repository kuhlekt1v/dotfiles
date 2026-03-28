# Powerlevel10k instant prompt must stay near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize Homebrew environment variables and PATH.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Powerlevel10k theme.
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k configuration if it exists.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add external CLI tools to PATH.
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Allow changing directories by typing the directory name.
setopt auto_cd

# Configure shell history behavior.
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# Enable substring history search with arrow keys.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Initialize completion system.
autoload -Uz compinit
compinit

# Enable case insensitive and partial completion matching.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' '+r:|=*' '+l:|=*'

# Lazygit aliases.
alias lazy="lazygit"
alias lg="lazygit"

# Change directory into a project inside ~/Dev.
dcd() {
  local base_dir=~/Dev

  if [[ -z "$1" ]]; then
    cd "$base_dir" || return 1
    return 0
  fi

  if [[ -d "$base_dir/$1" ]]; then
    cd "$base_dir/$1" || return 1
  else
    echo "Directory '$1' not found in $base_dir."
    return 1
  fi
}

# Load local user environment scripts.
. "$HOME/.local/bin/env"

# Configure Node Version Manager.
export NVM_DIR="$HOME/.nvm"
export EDITOR=nvim

# Load NVM.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load NVM bash completion.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# opencode
export PATH=$HOME/.opencode/bin:$PATH
