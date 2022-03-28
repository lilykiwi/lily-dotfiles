dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  if [ -e $3$2 ]
  then
    echo "exists   $3$2, replacing"
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
create_link config.rasi  config.rasi   ~/.config/rofi/   # rofi

# directories (gen 2 dotfiles)
create_link awesome           awesome      ~/.config/
