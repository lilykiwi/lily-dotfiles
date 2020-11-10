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
  rm -rf $2$1 && ln -s $dir/$1 $2$1
}

if [ -e ~/.asdf ]
then
  echo "asdf is already installed! good!"
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  pushd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  popd
  echo "Restart shell and run:"
  echo "  asdf plugin add lua"
  echo "  asdf install lua 5.3.5"
  echo "  asdf plugin add ruby"
  echo "  asdf install lua 2.7.1"
  echo "  asdf plugin add python"
  echo "  asdf install python 3.8.3"
fi

if [ -e ~/.oh-my-zsh ]
then
  echo "Oh-My-Zsh is already installed! good!"
else
  echo "sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)""
fi

git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'

# function  $1                $2   # details
create_link alacritty.yml     ~/.  # Alacritty terminal config
create_link zshrc             ~/.  # ZSH config (oh-my-zsh)
create_link p10k.zsh          ~/.  # p10k-zsh
create_link devmoji.config.js ~/   # Devmoji config
create_link Xmodmap           ~/.  # Xmodmap for Keychron K6

create_link vscode-workspaces ~/.  # vscode-workspaces
