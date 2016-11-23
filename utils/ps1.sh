# Sexy bash prompt
# Includes custom character for the prompt, path, and Git branch name.
# Source: https://github.com/mdo/config/blob/master/.bash_profile
parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'; }
export PS1="\n\[$(tput bold)\]\[$(tput setaf 5)\]➜ \[$(tput setaf 6)\]\${PWD##*/}\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"