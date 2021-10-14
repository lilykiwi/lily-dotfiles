# should return ~/summerysaturn/dotfiles on my system
dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  if [ -e $2$1 ]
  then
    echo $2$1 exists
  else
    echo "$2$1 doesn't exist, creating it"
  fi
  mkdir -p $2
  rm -rf $2$1 && ln -s $dir/$1 $2$1
}

git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'

# function  $1                $2   # details
create_link alacritty.yml     ~/.  # Alacritty terminal config
create_link zshrc             ~/.  # ZSH config (oh-my-zsh)
create_link p10k.zsh          ~/.  # p10k-zsh
create_link nanorc            ~/.config/nano/ # nano

echo "please run the following scripts (if you haven't already):"
if [ -e ~/.oh-my-zsh ]
then
  echo "Oh-My-Zsh is already installed! good!"
else
  echo "sh -c \"\$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)\""
  echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi
if [ -e ~/.emacs.d ]
then
  echo "Emacs is installed!"
else
  echo "sudo apt install emacs"
  echo "git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d"
fi
if [ -e ~/.asdf ]
then
  echo "asdf is already installed! good!"
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  pushd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  popd
fi
