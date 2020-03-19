# should return ~/GitHub/dotfiles
SOURCEDIR=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  echo from $SOURCEDIR/$1 to $2$1
  rm -f $2$1 && ln -s $SOURCEDIR/$1 $2$1
}

# /. means dotfile, / means regular file
# function    $1                 $2
create_link   zshrc              ~/.
create_link   kitty.conf         ~/.config/kitty/
create_link   colors.conf        ~/.config/kitty/
create_link   gateau.zsh-theme   ~/.oh-my-zsh/themes/
