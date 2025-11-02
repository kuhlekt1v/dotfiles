# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Function to cd into an directory within Dev.
dcd() {
  # Define the base directory
  local base_dir=~/Dev

  # If no argument is provided, navigate to ~/Dev
  if [[ -z "$1" ]]; then
    cd "$base_dir" || return 1
    return 0
  fi

  # Check if the directory exists within ~/Dev
  if [[ -d "$base_dir/$1" ]]; then
    cd "$base_dir/$1" || return 1
  else
    echo "Directory '$1' not found in $base_dir."
    return 1
  fi
}

alias lazy="lazygit"
alias lg="lazygit"
