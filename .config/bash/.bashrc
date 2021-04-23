#
# ~/.bashrc
#

# user mods

set -o vi
export VISUAL=vim
export EDITOR=$VISUAL

## path editing
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/repos/devaneyJE/toolbox:$PATH"
export PATH="$HOME/go/bin:$PATH"

## aliases

[ -f ~/.config/shell/aliasrc ] && source "$HOME/.config/shell/aliasrc"

alias ls='ls -Fh'
alias sudos='sudo env "PATH=$PATH"'
alias vibashrc="vim $HOME/.bashrc"
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

source "$HOME/.cargo/env"
