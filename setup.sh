echo "Setup dotfiles"
path=$(dirname "$0")
path=$(realpath "$path")

# Install oh-my-zsh
./ohs-install.sh
# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# move .oh-my-zsh to ~/dotfiles
rm -rf $path/.oh-my-zsh
mv $HOME/.oh-my-zsh $path
# oh-my-zsh theme
cp $path/yyt.zsh-theme $path/.oh-my-zsh/themes/yyt.zsh-theme
# delete original .zshrc
rm ~/.zshrc

# create symbolic links
ln -s $path/.vim $HOME/.vim
ln -s $path/.tmux.conf $HOME/.tmux.conf
ln -s $path/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $path/.vimrc $HOME/.vimrc
ln -s $path/.zshrc $HOME/.zshrc
