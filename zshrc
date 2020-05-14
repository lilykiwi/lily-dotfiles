# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#---------------------oh-my-zsh-------------------------------------------------
# Path to your oh-my-zsh installation.
export ZSH="/home/char/.oh-my-zsh"
# ZSH Theme, pretty self explanatory.
ZSH_THEME="gateau"

source $ZSH/oh-my-zsh.sh
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

plugins=(git)

# commented for now, could be useful
#setopt correct

#---------------------Aliases---------------------------------------------------
# Purges removed packages with residual configs
alias aptpurge="sudo apt-get remove --purge $(dpkg -l | grep '^iU' | awk '{print $2}')"
# Asciidoctor with bibliography, style, latexmath.
alias adoc="asciidoctor -r asciidoctor-bibliography -a stylesheet=adoc.css -a stylesdir=/home/char/Documents/ch-dotfiles -a stem=latexmath"
# Asciidoctor-pdf with bibliography, latexmath.
alias adocpdf="asciidoctor-pdf -r asciidoctor-bibliography -a stem=latexmath"
# Little alias for displaying images, `icat img.png`
alias icat="kitty +kitten icat"
# Little shortcut to restart shell
alias restartShell="clear && exec zsh"

#---------------------Node JS---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---------------------RVM-------------------------------------------------------
# Ruby Version Manager to Path. Must be last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#---------------------Fun Stuff-------------------------------------------------
# Display cute image on launch
icat ~/zsh.png
echo "cnote to-do list:"
cnote showall
