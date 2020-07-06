# should return ~/GitHub/dotfiles on my system
dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  if [ -e $2$1 ]
  then
    echo $2$1 exists
  else
    echo "$2$1 doesn't exist"
  fi
  rm -f $2$1 && ln -s $dir/$1 $2$1
}

# function  $1             $2   # details
create_link alacritty.yml  ~/.  # Alacritty terminal config
create_link zshrc          ~/.  # ZSH config (oh-my-zsh)
create_link p10k.zsh       ~/.  # p10k-zsh

if [ -e ~/.asdf ]
then
  echo "asdf is already installed"
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  pushd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  popd
fi
echo "Restart shell and run:"
echo "  asdf plugin add lua"
echo "  asdf install lua 5.3.5"
echo "  asdf plugin add ruby"
echo "  asdf install lua 2.7.1"
echo "  asdf plugin add python"
echo "  asdf install python 3.8.3"
