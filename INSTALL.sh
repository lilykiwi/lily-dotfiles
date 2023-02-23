dir=$(readlink -f $(dirname $0))

# !!! deletes and symlinks !!!
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

git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'
git config --global credential.helper store

# function  $1                $2
# files
create_link zshrc              ~/.
create_link p10k.zsh           ~/.
create_link kitty.conf         ~/.config/kitty/

# directories
create_link awesome            ~/.config/
create_link chrome             ~/.config/
create_link macchina           ~/.config/
create_link picom              ~/.config/
create_link rofi               ~/.config/
create_link scripts            ~/.local/
create_link ulauncher-lilykiwi ~/.config/ulauncher/user-themes/

echo ""
echo "done!"

