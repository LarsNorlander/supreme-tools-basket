#!/bin/bash
# check if vim installed
vim --version > /dev/null
status=$?
if [ $status -ne 0 ]; then
  echo "vim not installed"
  sudo apt install vim
fi 

sudo apt install cmake
sudo apt install g++


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc

curl -fLo ${DIR}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c "PlugInstall|update|quit|quit"

#vim -E -s dummy.out << EOF
#:PlugInstall
#:update
#:quit
#EOF
