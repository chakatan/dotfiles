# vim9.0にするのに必要。
# sudo add-apt-repository ppa:jonathonf/vim
sudo apt install -y git vim zsh powerline python3 python3-venv python3-pip
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

ln -snfv ~/dotfiles/.vimrc ~
ln -snfv ~/dotfiles/.zshrc ~
ln -snfv ~/dotfiles/.tmux.conf ~
ln -snfv ~/dotfiles/.gitignore ~
ln -snfv ~/dotfiles/.gitconfig ~
ln -snfv ~/dotfiles/coc-settings.json ~/.vim

#neovim setting
export XDG_CONFIG_HOME=~/.config
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -snfv ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -snfv ~/dotfiles/coc-settings.json ~/.config/nvim
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts
nvm install node

