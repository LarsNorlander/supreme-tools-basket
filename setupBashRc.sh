#!/usr/bin/env bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "${DIR}/custom_git_prompt" ~/.custom_prompt

if test -f ~/.custom_prompt/custom_prompt.sh
	then
		echo 'if [ -f "${HOME}/.custom_prompt/custom_prompt.sh" ] ; then source "${HOME}/.custom_prompt/custom_prompt.sh" ;fi' >> ~/.bashrc
		echo "" >> ~/.bashrc
fi
