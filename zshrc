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
alias adoc="asciidoctor -a stylesheet=adoc.css -a stylesdir=$HOME/summerysaturn/char-dotfiles/old -a stem=latexmath"
# Asciidoctor-pdf with bibliography, latexmath.
alias adocpdf="asciidoctor-pdf"
# Little shortcut to restart shell then cd to the current dir
alias restartShell="clear && exec zsh --login && cd ."
# redo last
alias fuck='sudo $(fc -nl -1)'
# restyle ls
alias ls='ls -shN --color=auto --group-directories-first'
# systemd reboot to windows command
alias windows='systemctl reboot --boot-loader-entry=auto-windows'

# Add this dotfile folder to path for cnote
export PATH="$PATH:$HOME/summerysaturn/char-dotfiles/scripts"

# Add deno
export DENO_INSTALL="/home/char/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

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

#---------------------JavaFX----------------------------------------------------
export PATH_TO_FX=/home/char/deps/javafx-sdk-15.0.1/lib

#---------------------init------------------------------------------------------
autoload -Uz compinit
compinit
tput setaf 49

echo "     _ __   ___   __ _  __ _  ___ _ __ ___"
echo "    | '_ \ / _ \ / _\` |/ _\` |/ _ \ '__/ __|"
echo "    | |_) | (_) | (_| | (_| |  __/ |  \__ \\"
echo "    | .__/ \___/ \__, |\__, |\___|_|  |___/"
echo "    | |           __/ | __/ |"
echo "    |_|          |___/ |___/"
echo ""
export PATH=$HOME/.local/bin:$PATH
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
