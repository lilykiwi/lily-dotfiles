#---------------------oh-my-zsh-------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
VSCODE=code-insiders
plugins=(git vscode)

#---------------------Custom----------------------------------------------------
# Purges removed packages with residual configs
alias aptpurge="sudo apt-get remove --purge $(dpkg -l | grep '^iU' | awk '{print $2}')"
# Asciidoctor with bibliography, style, latexmath.
alias adoc="asciidoctor -r asciidoctor-bibliography -a stylesheet=adoc.css -a stylesdir=$HOME/summerysaturn/lyla-dotfiles -a stem=latexmath"
# Asciidoctor-pdf with bibliography, latexmath.
alias adocpdf="asciidoctor-pdf -r asciidoctor-bibliography"
# Little shortcut to restart shell then cd to the current dir
alias restartShell="clear && exec zsh --login && cd ."

# Add this dotfile folder to path for cnote
export PATH="$PATH:$HOME/summerysaturn/lyla-dotfiles/scripts"

#---------------------Node JS---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---------------------asdf------------------------------------------------------
. $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

#---------------------p10k------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/Documents/lyla-dotfiles/p10k.zsh.
[[ ! -f ~/Documents/lyla-dotfiles/p10k.zsh ]] || source ~/Documents/lyla-dotfiles/p10k.zsh

ZLE_RPROMPT_INDENT=0

#---------------------init------------------------------------------------------
autoload -Uz compinit
compinit
tput setaf 14; fortune -a -s | cowsay -f turtle
