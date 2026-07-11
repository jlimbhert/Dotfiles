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
# COMPLETIONS
# --------------------------------------------------
fpath+=(~/JLimbhert/Herramientas/Dotfiles/termux/zsh_rc/plugins/zsh-completions/src)

autoload -Uz compinit
compinit -u

# --------------------------------------------------
# ZOXIDE
# --------------------------------------------------
eval "$(zoxide init zsh)"

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
setopt correct

# --------------------------------------------------
# PLUGINS
# --------------------------------------------------

source ~/JLimbhert/Herramientas/Dotfiles/termux/zsh_rc/plugins/powerlevel10k/powerlevel10k.zsh-theme

source ~/JLimbhert/Herramientas/Dotfiles/termux/zsh_rc/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/JLimbhert/Herramientas/Dotfiles/termux/zsh_rc/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

alias jl="cd $HOME/JLimbhert"
alias jla="cd $HOME/storage/shared/JLimbhert"

alias servi='browser-sync start --server --files "*.html, *.css"'

alias lab_sync="python3 ~/JLimbhert/Herramientas/lab_sync/lab_sync.py"

alias mkev="python -m venv venv"
alias ev+="source venv/bin/activate"
alias ev-="deactivate"
