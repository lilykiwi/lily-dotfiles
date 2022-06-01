dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  if [ -e $2$1 ]
  then
    echo "exists   $3$2, replacing"
  else
    echo "creating $3$2"
  fi
  mkdir -p $2
  rm -rf $2$1 && ln -s $dir/$1 $2$1
}

git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'

# function  $1                $2
create_link alacritty.yml     ~/.
create_link zshrc             ~/.
create_link p10k.zsh          ~/.
create_link config.rasi       ~/.config/rofi/

# directories (gen 2 dotfiles)
create_link awesome           ~/.config/
create_link neofetch          ~/.config/
create_link openbox           ~/.config/
create_link picom             ~/.config/
create_link polybar           ~/.config/
create_link rofi              ~/.config/
