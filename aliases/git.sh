alias g="git"
alias f="g clone"
alias p="g push"
alias y="g pull"
alias d="g diff"
alias s="g status"
alias r="g remote"
alias t="g tag"
alias a="g add -A -v"
alias c="g commit -v -m"
alias ac="a && c"
alias m="g checkout"
alias mb="m -b"
alias po="p origin"
alias yo="y origin"
alias pm="po \$(git rev-parse --abbrev-ref HEAD)"
alias ym="yo \$(git rev-parse --abbrev-ref HEAD)"

yk () {
  git clone git@github.com:${1}.git ${2}
}

