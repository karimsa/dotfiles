## Make it easier to dangerously delete files permenantly
alias rf="rm -rf"

## Maximum laziness
alias ..="cd .."
alias ...="..;.."
alias ....="..;..;.."

## Networking
alias flushdns="sudo dscacheutil -flushcache ; sudo killall -HUP mDNSResponder"
alias nstat="netstat -tulnp"

## Volume control
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

## Restarts bluetooth driver on macOS
## Source: https://gist.github.com/nicolasembleton/afc19940da26716f8e90
alias restartbt="sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport ; sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport"

function bw() {
  if test -z "$1" || test -z "$2"; then
    echo "usage: bw <pttn-1> <pttn-2>"
    return
  fi
  awk "/$1/{flag=1;next}/$2/{flag=0}flag"
}

