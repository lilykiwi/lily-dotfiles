dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  if [ -e $3$2 ]
  then
    echo "exists   $3$2"
  else
    echo "creating $3$2"
  fi
  mkdir -p $3
  rm -rf $3$2 && ln -s $dir/$1 $3$2
}

git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'

# function  $1                $2            $3                # details
create_link alacritty.yml     alacritty.yml ~/.               # Alacritty terminal config
create_link zshrc             zshrc         ~/.               # ZSH config (oh-my-zsh)
create_link p10k.zsh          p10k.zsh      ~/.               # p10k-zsh
create_link nanorc            nanorc        ~/.config/nano/   # nano
create_link polybar/config    config        ~/.config/polybar/ # polybar
create_link polybar/launch.sh launch.sh     ~/.config/polybar/ # polybar
create_link rofi/LilyRofi.rasi  LilyRofi.rasi   /usr/share/rofi/themes/   # rofi

echo '      run:
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
pushd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
popd'
