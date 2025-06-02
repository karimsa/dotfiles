################################################
## install.sh - karimsa/dotfiles              ##
## installs the dotfiles part of this project ##
################################################

# make sure we're using zsh
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Error: please use zsh"
  exit 1
fi

## tell windows users to screw off
case $OSTYPE in
  linux*|darwin*) ;;
  *)
    echo "Error: please install a real OS."
    exit 1
    ;;
esac

## deny root privilege
if [[ "$UID" == "0" ]]; then
  echo "Error: do not run as root"
  exit 1
fi

## verify that homebrew is installed
if [[ "$PLATFORM" == "darwin" && -z "$(which brew)" ]]; then
  echo "* Installing homebrew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## update package manager
echo "* Upgrading packages ..."
case $OSTYPE in
  linux*) apt-get update && apt-get upgrade -y ;;
  darwin*) brew update && brew upgrade ;;
esac

## verify that git is installed
if [ -z "$(which git)" ]; then
  echo "* Installing git ..."
  case $OSTYPE in
    linux*) apt-get install -y git ;;
    darwin*) brew install git ;;
  esac
fi

## clone repository locally
if [ -x ~/.dotfiles ]; then
  pushd ~/.dotfiles
  git pull origin master
else
  git clone https://github.com/karimsa/dotfiles ~/.dotfiles
  pushd ~/.dotfiles
fi

## dependency installation
echo "* Installing dependencies ..."
case $OSTYPE in
  linux*) ;;

  darwin*)
    brew bundle
    ;;
esac

## Node
if ! which node &>/dev/null; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

  nvm install stable
  nvm install --lts stable
fi

## create aliases file
if ! grep 'dotfiles' ~/.zshrc &>/dev/null; then
  echo "* Copying over aliases ..."
cat >> ~/.zshrc << _EOF
## for dotfiles
alias rs="source ~/.zshrc"
source ~/.dotfiles/.rc
_EOF
fi

# Link vimrc to source from ~/.dotfiles/.vimrc
if ! grep 'dotfiles' ~/.vimrc &>/dev/null; then
cat >> ~/.vimrc << _EOF
  source ~/.dotfiles/.vimrc
_EOF
fi

# Link tmux.conf to source from ~/.dotfiles/.tmux.conf
if ! grep 'dotfiles' ~/.tmux.conf &>/dev/null; then
cat >> ~/.tmux.conf << _EOF
  source ~/.dotfiles/.tmux.conf
_EOF
fi
