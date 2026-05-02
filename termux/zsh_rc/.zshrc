# --------------------------------------------------
# Powerlevel10k instant prompt (ARRIBA)
# --------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------
# COMPLETIONS
# --------------------------------------------------
fpath+=(~/JLimbhert/Jroot/Dotfiles/termux/zsh_rc/plugins/zsh-completions/src)

autoload -Uz compinit
compinit

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

# --------------------------------------------------
# OPCIONES
# --------------------------------------------------
setopt autocd
setopt correct

# --------------------------------------------------
# PROMPT BASE (p10k lo reemplaza luego)
# --------------------------------------------------
PROMPT='%n@%m:%~$ '

# --------------------------------------------------
# PLUGINS
# --------------------------------------------------

# Tema Powerlevel10k
source ~/JLimbhert/Jroot/Dotfiles/termux/zsh_rc/plugins/powerlevel10k/powerlevel10k.zsh-theme

# Autosuggestions
source ~/JLimbhert/Jroot/Dotfiles/termux/zsh_rc/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting (SIEMPRE AL FINAL)
source ~/JLimbhert/Jroot/Dotfiles/termux/zsh_rc/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------------------------------------------------
# CONFIG P10K
# --------------------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --------------------------------------------------
# ALIAS
# --------------------------------------------------

#Lsd
alias ls="lsd --group-dirs=first --icon=always"
alias ll="lsd -l --group-dirs=first --icon=always"
alias la="lsd -la --group-dirs=first --icon=always"

# Actualizar sistema
alias up="pkg update && pkg upgrade -y"

# Navegación
[ -d $HOME/JLimbhert ] && cd $HOME/JLimbhert
alias jl="cd $HOME/JLimbhert"

# Android storage
alias jla="cd $HOME/storage/shared/JLimbhert"

# Servidor web
alias servi='browser-sync start --server --files "*.html, *.css"'

# Script personalizado
alias lab_sync="python3 ~/JLimbhert/Jroot/Herramientas/lab_sync/lab_sync.py"

#Entorno Virtual Python
alias mkev="python -m venv venv"
alias ev+="source venv/bin/activate"
alias ev-="deactivate"
alias ev="which python"

# --------------------------------------------------
# FUTURO (NVIM / TMUX / RANGER)
# --------------------------------------------------
# Aquí puedes agregar:
# alias nvim="nvim"
# alias tm="tmux"
# alias r="ranger"
