# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/char/.oh-my-zsh"

ZSH_THEME="gateau"

source $ZSH/oh-my-zsh.sh

kitty +kitten icat ~/Documents/Notebook/icat3.jpg

alias aptpurge="sudo apt-get remove --purge $(dpkg -l | grep '^iU' | awk '{print $2}')"
alias adoc="asciidoctor -r asciidoctor-bibliography -a stylesheet=adoc.css -a stylesdir=/home/char/Documents/dotfiles"
alias adocpdf="asciidoctor-pdf -r asciidoctor-bibliography -a stylesheet=adoc.css -a stylesdir=/home/char/Documents/dotfiles"

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins=(zsh-autosuggestions, git)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
