################################################
## install.sh - karimsa/dotfiles              ##
## installs the dotfiles part of this project ##
################################################

## requries root privileges
if [ "$UID" -ne "0" ]; then
  echo "Error: requires root privileges."
  exit 1
fi

## tell windows users to screw off
case $OSTYPE in
  linux*|darwin*) ;;
  *)
    echo "Error: please install linux."
    exit 1
    ;;
esac

## verify that homebrew is installed
if [[ "$(echo $OSTYPE | sed 's/[0-9]//g')" == "darwin" && -z "$(which brew)" ]]; then
  echo "* Installing homebrew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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
  linux*)
    # run preinstall script
    ./sources/preinstall.sh

    # add all sources
    for i in sources/*.list; do
      cp $i /etc/apt/sources.list.d/$i
    done

    # update from sources
    apt-get update

    # install dependencies
    apt-get install -y $(cat dependencies/apt)
    ;;

  darwin*)
    # verify that homebrew is installed
    if [ -z "$(which brew)" ]; then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # install all dependencies from the list
    brew install $(cat dependencies/brew)
    ;;
esac

## install z
echo "* Installing zsh ..."
curl -so ~/.zsh https://raw.githubusercontent.com/rupa/z/master/z.sh

## create aliases file
if [ "$INSTALLED" -ne "" ]; then
echo "* Copying over aliases ..."
cat >> ~/.bash_aliases << _EOF
## for dotfiles
source ~/.dotfiles/.bash_aliases
_EOF
fi

## leave the dotfiles directory
popd