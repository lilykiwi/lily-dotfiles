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
  vscode
  asdf
)

#---------------------Custom----------------------------------------------------
# Asciidoctor with bibliography, style, latexmath.
#alias adoc="asciidoctor -a stylesheet=adoc.css -a stylesdir=$HOME/summerysaturn/char-dotfiles/old -a stem=latexmath"
# Asciidoctor-pdf with bibliography, latexmath.
#alias adocpdf="asciidoctor-pdf"
# Little shortcut to restart shell then cd to the current dir
alias restartShell="clear && exec zsh --login && cd ."
# redo last
alias fuck='sudo $(fc -nl -1)'
# restyle ls
alias ls='ls -shN --color=auto --group-directories-first'
# systemd reboot to windows command
#alias windows='systemctl reboot --boot-loader-entry=auto-windows'
# alias code-insiders to code
#alias code="code-insiders"

# Add this dotfile folder to path for cnote
export PATH="$PATH:$HOME/summerysaturn/char-dotfiles/scripts"

# Add deno
export DENO_INSTALL="/home/char/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# add local bin path
export PATH=$HOME/.local/bin:$PATH

# mon2cam stuff? i guess? lol
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"


bindkey -M emacs '^[[3;5~' kill-word
bindkey '^H' backward-kill-word

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

neofetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lily/.asdf/installs/python/anaconda3-2022.05/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lily/.asdf/installs/python/anaconda3-2022.05/etc/profile.d/conda.sh" ]; then
        . "/home/lily/.asdf/installs/python/anaconda3-2022.05/etc/profile.d/conda.sh"
    else
        export PATH="/home/lily/.asdf/installs/python/anaconda3-2022.05/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

