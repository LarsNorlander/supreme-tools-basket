function install {
  echo "installing $1"
  eval install_$1
}

function install_python {

  sudo apt install python-pip
  #install python
  sudo pip install virtualenv

  #install pycharm
  sudo add-apt-repository ppa:mystic-mirage/pycharm
  sudo apt update
  sudo apt install pycharm
}


usage() { echo "Usage: $0 [-l <string,<string>] \n enter lang to install comp plus idea" 1>&2; exit 1; }
    while getopts ":l:cr:" opt; do
  case $opt in
    l)
      lang=${OPTARG}
      install $lang
      ;;
    \?)
      usage
      ;;
  esac
done




shift $((OPTIND-1))
