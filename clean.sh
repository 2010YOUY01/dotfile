echo "Clean old dotfiles"
path=$(dirname "$0")
path=$(realpath "$path")

# backup old setups
mv $HOME/.vim $HOME/.vim-backup
mv $HOME/.tmux.conf $HOME/.tmux.conf-backup
mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh-backup
mv $HOME/.vimrc $HOME/.vimrc-backup
mv $HOME/.zshrc $HOME/.zshrc-backup
mv $HOME/.config/nvim $HOME/.config/nvim-backup 
