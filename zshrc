#---------------------oh-my-zsh-------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

plugins=(git)

#---------------------Aliases---------------------------------------------------
# Purges removed packages with residual configs
alias aptpurge="sudo apt-get remove --purge $(dpkg -l | grep '^iU' | awk '{print $2}')"
# Asciidoctor with bibliography, style, latexmath.
alias adoc="asciidoctor -r asciidoctor-bibliography -a stylesheet=adoc.css -a stylesdir=$HOME/Documents/lyla-dotfiles -a stem=latexmath"
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

#---------------------pyenv-----------------------------------------------------
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

#---------------------p10k------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#---------------------init------------------------------------------------------
pyenv global 3.8.3
tput setaf 50; fortune -s | cowsay -f turtle
