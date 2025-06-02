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

## check if this is an install or upgrade
if [ -x ~/.dotfiles ]; then INSTALLED="true"; fi

## clone repository locally
rm -rf ~/.dotfiles
echo "* Cloning dotfiles locally ..."
git clone https://github.com/karimsa/dotfiles ~/.dotfiles
pushd ~/.dotfiles

## dependency installation
echo "* Installing dependencies ..."
case $OSTYPE in
  linux*) ;;

  darwin*)
    brew bundle
    ;;
esac

## Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

nvm install stable
nvm install --lts stable

## create aliases file
if [ -z "$INSTALLED" ]; then :; else
  echo "* Copying over aliases ..."
cat >> ~/.zshrc << _EOF
## for dotfiles
alias rs="source ~/.zshrc"
source ~/.dotfiles/.rc
_EOF
else
  echo "* Skipping aliases (upgrade = $INSTALLED)"
fi
