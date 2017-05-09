#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GITIGNOREFOLDER="${DIR}/gitignore-master"

function getAllIgnoreFiles {
  wget -o "${DIR}" https://github.com/github/gitignore/archive/master.zip
  unzip ${DIR}/master.zip
}

function findIgnoreFile {
  file=""
  file=eval find ${GITIGNOREFOLDER} -iname "*${1,,}*"
  echo ${file}
}

function addGitIgnore {
  if [ ! -d "${GITIGNOREFOLDER}" ]; then
    getAllIgnoreFiles
  fi
    file=$(findIgnoreFile ${1})
  cp "$file" "$repoPath"
}

function updateGitConfig {
  echo "update gitConfig"
  cp ${DIR}/.gitconfig ~/.gitconfig
}

usage() { echo "Usage: $0 [-c [<string,<string>]>] [-c <string>]" 1>&2; exit 1; }
    while getopts ":l:cr:" opt; do
  case $opt in
    l)
      lang=${OPTARG}
      ;;
    r)
      repoPath=${OPTARG}
      ;;
    c)
      updateGitConfig
      ;;
    \?)
      usage
      ;;
  esac
done

shift $((OPTIND-1))

if [ ! -z "${repoPath}" ] && [ ! -z "${lang}" ]; then
  for i in $(echo ${lang} | sed "s/,/ /g"); do
    echo "adding gitIgnore ${i}"
    addGitIgnore ${i}
    done
fi
# clean up ignorefiles
rm -fr ${GITIGNOREFOLDER}
rm -f master.zip
