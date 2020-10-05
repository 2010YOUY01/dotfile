echo "Setup dotfiles"
path=$(dirname "$0")
path=$(realpath "$path")
ln -s $path/.vim $HOME/.vim
ln -s $path/.tmux.conf $HOME/.tmux.conf
ln -s $path/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $path/.vimrc $HOME/.vimrc
ln -s $path/.zshrc $HOME/.zshrc
