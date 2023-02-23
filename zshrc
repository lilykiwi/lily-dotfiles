# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#---------------------oh-my-zsh-------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
VSCODE=code-insiders
plugins=(
  git
  asdf
)

#---------------------Custom----------------------------------------------------

# Little shortcut to restart shell then cd to the current dir
alias restartShell="clear && exec zsh --login && cd ."
# redo last
alias fuck='sudo $(fc -nl -1)'
# restyle ls
alias ls='ls -shN --color=auto --group-directories-first'

#---------------------Node JS---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---------------------asdf------------------------------------------------------

. /opt/asdf-vm/asdf.sh

#---------------------p10k------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZLE_RPROMPT_INDENT=0

#---------------------JavaFX----------------------------------------------------

export PATH_TO_FX=/home/char/deps/javafx-sdk-15.0.1/lib

#---------------------init------------------------------------------------------

autoload -Uz compinit
compinit

macchina
