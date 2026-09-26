# --------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT
# --------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------
# PATH
# --------------------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# --------------------------------------------------
# SOURCE DE ARCHIVOS COMPLEMENTARIOS
# --------------------------------------------------
source "$HOME/jlimbhert/dotfiles/termux/zsh_rc/config.zsh"
source "$DIR_ZSH/funciones.zsh"

# --------------------------------------------------
# COMPLETIONS
# --------------------------------------------------
fpath+=("$DIR_PLUGINS_ZSH"/zsh-completions/src)

autoload -Uz compinit
compinit -u

# --------------------------------------------------
# ZOXIDE
# --------------------------------------------------
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# --------------------------------------------------
# HISTORIAL
# --------------------------------------------------
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt appendhistory
setopt sharehistory
setopt histignorealldups
setopt histreduceblanks

# --------------------------------------------------
# OPCIONES
# --------------------------------------------------
setopt autocd

# --------------------------------------------------
# PLUGINS
# --------------------------------------------------
[[ -f "$DIR_PLUGINS_ZSH"/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source "$DIR_PLUGINS_ZSH"/powerlevel10k/powerlevel10k.zsh-theme

[[ -f "$DIR_PLUGINS_ZSH"/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source "$DIR_PLUGINS_ZSH"/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f "$DIR_PLUGINS_ZSH"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source "$DIR_PLUGINS_ZSH"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------------------------------------------------
# P10K CONFIG
# --------------------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --------------------------------------------------
# ALIAS
# --------------------------------------------------
alias ls="lsd --group-dirs=first --icon=always"
alias ll="lsd -l --group-dirs=first --icon=always"
alias la="lsd -la --group-dirs=first --icon=always"

alias up="pkg update && pkg upgrade -y"

alias jl="cd $HOME/jlimbhert"
alias jla="cd $HOME/storage/shared/jlimbhert"

alias servi='browser-sync start --server --files "*.html, *.css"'

alias lab_sync="python3 ~/jlimbhert/tools/lab_sync/lab_sync_V1.py"

alias mkev="python -m venv venv"
alias ev+="source venv/bin/activate"
alias ev-="deactivate"

alias jcpc='termux-clipboard-set'
# --------------------------------------------------
# FUNCIONES
# --------------------------------------------------
source "$HOME"/jlimbhert/dotfiles/termux/zsh_rc/funciones.zsh
