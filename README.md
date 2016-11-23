# dotfiles

Custom config for easier shell life.

## Installation

To install on linux, run:

`curl -so- https://raw.githubusercontent.com/karimsa/dotfiles/master/install.sh | sudo bash`

or for OS X (*do not run as root on os x*):

`curl -so- https://raw.githubusercontent.com/karimsa/dotfiles/master/install.sh | bash`

## What's included

 - [aliases](aliases) for:
    - ls
    - git
    - npm
    - bower
    - ember
    - react-native
    - swift
    - misc
 - [z](https://github.com/rupa/z): rapidly jump around in directories.
 - [custom bash prompt](utils/ps1.sh): includes custom character for the prompt, path, and Git branch name.
 - packages:
    - homebrew (on os x)
    - build-essential (on linux)
    - carthage (on os x)
    - curl
    - git
    - libssl-dev (on linux)
    - mongodb
    - watchman (on os x)

## License

Licensed under the [MIT license](LICENSE.md).