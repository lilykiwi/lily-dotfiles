dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  if [ -e $2$1 ]
  then
    echo "exists   $2$1, replacing"
  else
    echo "creating $2$1"
  fi
  mkdir -p $2
  rm -rf $2$1
  ln -s $dir/$1 $2$1
}

check() {
  # check whether or not pacman holds this package
  pacman -Q $1 > /dev/null
}

git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'
git config --global credential.helper store

# function  $1                $2
# files
create_link alacritty.yml     ~/.
create_link zshrc             ~/.
create_link p10k.zsh          ~/.

# directories
# create_link awesome           ~/.config/
create_link neofetch          ~/.config/
create_link openbox           ~/.config/
create_link picom             ~/.config/
create_link polybar           ~/.config/
create_link rofi              ~/.config/
create_link dunst             ~/.config/
create_link oblogout-lilykiwi ~/.themes/

echo ""

check alacritty
check openbox
check neofetch
check rofi
check picom
check polybar
check dunst
check yay
check plank-theme-frost-git
check lxappearance
check obconf
check obmenu-generator
check oblogout-fork-git
check colloid-icon-theme-git
check orchis-theme-git
check nm-connection-editor
check pavucontrol
check easyeffects

echo ""

echo "--- please install (needs aur) ---"
echo "alacritty openbox neofetch rofi picom polybar dunst yay plank plank-theme-frost-git lxappearance obconf obmenu-generator oblogout orchis-theme-git nm-connection-editor pavucontrol easyeffects"
echo "---"

echo ""

echo "done!"
