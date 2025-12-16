# autorun
fastfetch
# if pgrep -x hyprland >/dev/null 2>&1; then
#    current_ws=$(hyprctl activeworkspace -j | jq -r '.id')
#    if [[ "$current_ws" == "0" ]]; then
#        kitty --hold btop & disown
#    fi
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit
# Dir setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

 # Download zinit if it's not there
 if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt autocd extendedglob
setopt hist_ignore_space
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sven/.zshrc'

# Autoload compleations
autoload -U compinit && compinit
zinit cdreplay -q

# Powelevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Compleation styles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Keybinds
bindkey '^[[1;5A' history-search-backward
bindkey '^[[1;5B' history-search-forward

# Alias
alias c='clear'
alias ls='ls --color'
alias hx='helix'
alias shx='sudo helix'
alias pman='pacman'
alias spman='sudo pacman'
alias spex='pkexec env $(env | grep -v -e "^HYPRLAND_CMD=" -e "^NIX_PROFILES=" -e "^--" -e "^Total" -e "^System" -e "^User" -e "^TIMEFMT" -e "^Kernel" -e "^-c")'
alias j='java'
alias jc='javac'
alias p='python'
alias hyprc='shx ~/.config/hypr'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Editor
export EDITOR="helix"
export VISUAL="helix"
