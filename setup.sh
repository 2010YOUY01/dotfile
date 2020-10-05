echo "Setup dotfiles"
path=$(dirname "$0")
path=$(realpath "$path")

# Install oh-my-zsh
./oh-my-zsh-setup.sh
# oh-my-zsh theme
cp $path/yyt.zsh-theme $HOME/.oh-my-zsh/themes/yyt.zsh-theme

# backup old setups
mv $HOME/.vim $HOME/.vim-backup
mv $HOME/.tmux.conf $HOME/.tmux.conf-backup
mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh-backup
mv $HOME/.vimrc $HOME/.vimrc-backup
mv $HOME/.zshrc $HOME/.zshrc-backup

# create symbolic links
ln -s $path/.vim $HOME/.vim
ln -s $path/.tmux.conf $HOME/.tmux.conf
ln -s $path/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $path/.vimrc $HOME/.vimrc
ln -s $path/.zshrc $HOME/.zshrc
