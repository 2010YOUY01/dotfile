echo "Setup dotfiles"
path=$(dirname "$0")
path=$(realpath "$path")

# backup old setups
mv $HOME/.vim $HOME/.vim-backup
mv $HOME/.tmux.conf $HOME/.tmux.conf-backup
mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh-backup
mv $HOME/.vimrc $HOME/.vimrc-backup
mv $HOME/.zshrc $HOME/.zshrc-backup

# Install oh-my-zsh
./oh-my-zsh-setup.sh
# oh-my-zsh theme
ln -s $path/yyt.zsh-theme $HOME/.oh-my-zsh/themes/yyt.zsh-theme

# Setup neovim, vim
./vim-setup.sh

# create symbolic links
ln -s $path/.tmux.conf $HOME/.tmux.conf
rm $HOME/.zshrc
ln -s $path/.zshrc $HOME/.zshrc
