#!/bin/bash

# load all aliases
for i in ~/.dotfiles/aliases/*.sh; do
    source $i
done

# load all utils
for i in ~/.dotfiles/utils/*.sh; do
    source $i
done