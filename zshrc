#---------------------oh-my-zsh-------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
VSCODE=code-insiders
plugins=(git vscode)

#---------------------Custom----------------------------------------------------
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
# alias code-insiders to code
alias code="code-insiders"

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

echo
tput setaf 45  && echo -n "  ████████████████" && tput setaf 147 && echo -n "                 \e[3mlily-ceres\e[0m         " && tput setaf 166 && echo -n "        ████████████████" && echo
tput setaf 213 && echo -n "  ████████████████" && tput setaf 147 && echo -n "                                    " && tput setaf 214 && echo -n "        ████████████████" && echo
tput setaf 15  && echo -n "  ████████████████" && tput setaf 175 && echo -n "         welcome to the cutie zone! " && tput setaf 15  && echo -n "        ████████████████" && echo
tput setaf 213 && echo -n "  ████████████████" && tput setaf 167 && echo -n "        are you in the sudoers file?" && tput setaf 206 && echo -n "        ████████████████" && echo
tput setaf 45  && echo -n "  ████████████████" && tput setaf 147 && echo -n "                                    " && tput setaf 127 && echo -n "        ████████████████" && echo
echo
