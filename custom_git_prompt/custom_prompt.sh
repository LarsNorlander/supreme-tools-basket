#!/usr/bin/env bash

# Setting custom prompt,
#
source .git-prompt.sh

PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'\t -> '
PS1="$PS1"'\u@\h:\w '             # user@host:baseNamePWD<space>


if test -f ~/.custom_prompt/.git-prompt.sh
	then
		source ~/.custom_prompt/.git-prompt.sh
		PS1="$PS1"'\[\033[35m\]'       # change to purple
		PS1="$PS1"'`__git_ps1`'
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $

