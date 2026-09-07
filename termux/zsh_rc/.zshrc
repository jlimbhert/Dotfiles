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
fpath+=(~/JLstack/plugins/zsh/zsh-completions/src)

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
[[ -f ~/JLstack/plugins/zsh/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source ~/JLstack/plugins/zsh/powerlevel10k/powerlevel10k.zsh-theme

[[ -f ~/JLstack/plugins/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source ~/JLstack/plugins/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f ~/JLstack/plugins/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source ~/JLstack/plugins/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias jla="cd $HOME/storage/shared/JL-droid"

alias servi='browser-sync start --server --files "*.html, *.css"'

alias lab_sync="python3 ~/JLimbhert/Herramientas/lab_sync/lab_sync.py"

alias mkev="python -m venv venv"
alias ev+="source venv/bin/activate"
alias ev-="deactivate"

# --------------------------------------------------
# FUNCIONES
# --------------------------------------------------
source ~/JLstack/zsh/configs_zshrc/functions.zsh
