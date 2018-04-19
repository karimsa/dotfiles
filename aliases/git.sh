alias g="git"
alias f="g clone"
alias p="g push"
alias y="g pull"
alias d="g diff"
alias s="g status"
alias r="g remote"
alias t="g tag"
alias a="g add -A -p -v"
alias c="g commit -v -m"
alias ac="a && c"
alias m="g checkout"
alias mb="m -b"
alias po="p origin"
alias yo="y origin"
alias pm="po \$(git rev-parse --abbrev-ref HEAD)"
alias ym="yo \$(git rev-parse --abbrev-ref HEAD)"
alias idk="ac '¯\_(ツ)_/¯' && ym && pm"

# https://stackoverflow.com/a/10312587
alias gfetch="git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done"

yk () {
  git clone git@github.com:${1}.git ${2}
}

