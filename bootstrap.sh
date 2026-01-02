sudo apt install git vim zsh powerline
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

ln -snfv dotfiles/.vimrc ~
ln -snfv dotfiles/.zshrc ~
ln -snfv dotfiles/.tmux.conf ~
ln -snfv dotfiles/.gitignore ~
ln -snfv dotfiles/.gitconfig ~

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
