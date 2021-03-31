#     _                                      _ _____ 
#  __| | _____ github.com/devaneyJE    _    | | ____|
# / _` |/ _ \ \ / / _` | '_ \ / _ \ | | |_  | |  _|  
#| (_| |  __/\ V / (_| | | | |  __/ |_| | |_| | |___ 
# \__,_|\___| \_/ \__,_|_| |_|\___|\__, |\___/|_____|
#                                  |___/            
### fish config file

### startup
function fish_greeting
#	neofetch
end

### keybindings
function fish_user_key_bindings
	#fish_vi_key_bindings
	fish_default_key_bindings
end

### aliases

## ls to exa
alias ls='exa -F --color=always --group-directories-first'
alias la='exa -aF --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aTF --color=always --group-directories-first'
alias lr='exa -aRF --color=always --group-directories-first'

## editor
alias vim='nvim'
alias v='vim'

## pacman
alias sps='sudo pacman -S'
alias pss='sudo pacman -Ss'

## wifi
alias wifilist='nmcli device wifi list'
alias wificonnect='nmcli --ask device wifi connect' 

## doomstuff
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

## git
alias gconf="/usr/bin/git --git-dir=$HOME/repos/devaneyJE/dotfiles --work-tree=$HOME"
alias confadd="gconf add -u ~/.config && gconf status"

### path adjustments
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/repos/devaneyJE/toolbox:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"
