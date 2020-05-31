# should return ~/GitHub/dotfiles on my system
dir=$(readlink -f $(dirname $0))

# deletes and symlinks
create_link () {
  echo from $dir/$1 to $2$1
  rm -f $2$1 && ln -s $dir/$1 $2$1
}

# function  $1          $2               # details
create_link kitty.conf  ~/.config/kitty/ # Kitty teminal config
create_link colors.conf ~/.config/kitty/ # Kitty teminal config
chmod 754 cnote
create_link cnote    ~/.local/bin/    # Fun cnote script i made
create_link   zshrc              ~/.                    # ZSH config (oh-my-zsh)
create_link   gateau.zsh-theme   ~/.oh-my-zsh/themes/   # ZSH theme
create_link   p10k.zsh           ~/.                    # p10k-zsh
