# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#---------------------oh-my-zsh-------------------------------------------------
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH Theme, pretty self explanatory.
#ZSH_THEME="af-magic"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
alias adoc="asciidoctor -r asciidoctor-bibliography -a stylesheet=adoc.css -a stylesdir=$HOME/Documents/ch-dotfiles -a stem=latexmath"
# Asciidoctor-pdf with bibliography, latexmath.
alias adocpdf="asciidoctor-pdf -r asciidoctor-bibliography"
# Little alias for displaying images, `icat img.png`
alias icat="kitty +kitten icat"
# Little shortcut to restart shell then cd to the current dir
alias restartShell="clear && exec zsh && cd ."

hash -d u4=$HOME/Documents/a2-s2-college/U4

#---------------------Path Additions--------------------------------------------

# Add this dotfile folder to path for cnote
export PATH="$PATH:$HOME/Documents/lyla-dotfiles"

#---------------------Node JS---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---------------------RVM-------------------------------------------------------
# Ruby Version Manager to Path. Must be last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#---------------------p10k------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#---------------------Fun Stuff-------------------------------------------------
# Display cute image on launch - broken with p10k sadly
# icat ~/zsh.png
# echo "cnote to-do list:"
# cnote showall
