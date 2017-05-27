#!/bin/bash
# check if vim installed
vim --version > /dev/null
status=$?
if [ $status -ne 0 ]; then
  echo "vim not installed"
  sudo apt install vim
fi 

sudo apt -y install cmake
sudo apt -y install g++
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc

curl -fLo ${DIR}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c "PlugInstall|update|quit|quit"

./${DIR}/pluuged/YouCompleteMe/install.py

#vim -E -s dummy.out << EOF
#:PlugInstall
#:update
#:quit
#EOF
