#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc

curl -fLo ${DIR}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -E -s dummy.out << EOF
:PlugInstall
:update
:quit
EOF
