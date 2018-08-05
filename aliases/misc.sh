alias o="open"
alias k="killall"
alias rf="rm -rf"
alias rs="source ~/.bash_profile;source ~/.bashrc;source ~/.bash_aliases"
alias ..="cd .."
alias ...="..;.."
alias ....="..;..;.."
alias flushdns="sudo dscacheutil -flushcache ; sudo killall -HUP mDNSResponder"
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"
alias nstat="netstat -tulnp"

function bw() {
  if test -z "$1" || test -z "$2"; then
    echo "usage: bw <pttn-1> <pttn-2>"
    return
  fi
  awk "/$1/{flag=1;next}/$2/{flag=0}flag"
}

