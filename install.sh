################################################
## install.sh - karimsa/dotfiles              ##
## installs the dotfiles part of this project ##
################################################

PLATFORM="$(echo $OSTYPE | sed 's/[0-9]//g')"

## Detect the profile file
## Source: https://github.com/creationix/nvm
detect_profile() {
  if [ -n "${PROFILE}" ] && [ -f "${PROFILE}" ]; then
    echo "${PROFILE}"
    return
  fi

  local DETECTED_PROFILE
  DETECTED_PROFILE=''
  local SHELLTYPE
  SHELLTYPE="$(basename "/$SHELL")"

  if [ "$SHELLTYPE" = "bash" ]; then
    if [ -f "$HOME/.bashrc" ]; then
      DETECTED_PROFILE="$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
      DETECTED_PROFILE="$HOME/.bash_profile"
    fi
  elif [ "$SHELLTYPE" = "zsh" ]; then
    DETECTED_PROFILE="$HOME/.zshrc"
  fi

  if [ -z "$DETECTED_PROFILE" ]; then
    if [ -f "$HOME/.profile" ]; then
      DETECTED_PROFILE="$HOME/.profile"
    elif [ -f "$HOME/.bashrc" ]; then
      DETECTED_PROFILE="$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
      DETECTED_PROFILE="$HOME/.bash_profile"
    elif [ -f "$HOME/.zshrc" ]; then
      DETECTED_PROFILE="$HOME/.zshrc"
    fi
  fi

  if [ ! -z "$DETECTED_PROFILE" ]; then
    echo "$DETECTED_PROFILE"
  fi
}

## tell windows users to screw off
case $OSTYPE in
  linux*|darwin*) ;;
  *)
    echo "Error: please install linux."
    exit 1
    ;;
esac

## requries root privilege on linux
if [[ "$PLATFORM" == "linux" && "$UID" -ne "0" ]]; then
  echo "Error: requires root privileges on linux."
  exit 1
fi

## deny root privilege on os x
if [[ "$PLATFORM" == "darwin" && "$UID" == "0" ]]; then
  echo "Error: do not run as root on OS X."
  exit 1
fi

## load environment
echo "* Loading environment ..."
source $(detect_profile)

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
    # fix permissions, in case
    # from: https://gist.github.com/isaacs/579814#file-take-ownership-sh
    sudo mkdir -p /usr/local/{share/man,bin,lib/node,include/node}
    sudo chown -R $USER /usr/local/{share/man,bin,lib/node,include/node}

    # install node first, for yarn to be satisfied
    brew install node

    # fix node for yarn
    brew link --overwrite node

    # install rest of dependencies from the list
    brew install $(cat dependencies/brew)
    ;;
esac

if [ -z "$INSTALLED" ]; then :; else
  ## install z
  curl -so ~/.zsh https://raw.githubusercontent.com/rupa/z/master/z.sh

  ## install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

  ## load nvm
  source /usr/local/nvm/nvm.sh
fi

## install the latest stable node
nvm install stable

## install latest lts node
nvm install --lts stable

## create aliases file
if [ -z "$INSTALLED" ]; then :; else
  echo "* Copying over aliases ..."
cat >> $(detect_profile) << _EOF
## for dotfiles
alias rs="source $(detect_profile)"
source ~/.dotfiles/.bashrc
_EOF
else
  echo "* Skipping aliases (upgrade = $INSTALLED)"
fi

## reload profile
echo "* Reloading profile ..."
source $(detect_profile)

## install npm dependencies
ig $(cat dependencies/node)

## generate ssh key
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

## leave the dotfiles directory
popd
