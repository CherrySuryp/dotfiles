# --- Powerlevel10k configuration ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=""
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


# --- Exports ---
export ZSH="$HOME/.oh-my-zsh"


# --- Theme ---
ZSH_THEME="powerlevel10k/powerlevel10k"


# --- Plugins ---
plugins=(
  git 
  docker
  terraform
  zsh-autosuggestions 
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


# --- Extras ---
for conf in "$HOME/.config/zsh/"*.zsh(N); do
  source "$conf"
done
