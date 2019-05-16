alias ls='ls -G'
alias ll='ls -al'
alias grep='grep --color'
alias cl='clear'
alias ..='cd ..'
alias cl='clear'
alias hs='history'
alias tree="/usr/local/bin/tree"

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;34m\] \w \$\[\033[00m\] '
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Users/ray/bin"
export PYTHONPATH="$PYTHONPATH:/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python"
shopt -s histverify
set -o vi
set -o noclobber
