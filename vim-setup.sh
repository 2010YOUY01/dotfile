# Vim-plug
# Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Delete previous config files
rm ~/.vimrc ~/.config/nvim/init.vim ~/.config/nvim/coc-settings.json
# Create symlink for vimrc
mkdir ~/.config/nvim
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ~/dotfiles/.vimrc ~/.vimrc
