#!/bin/zsh

# prof
[ -f "$HOME/.config/zsh/.zprofile" ] && source "$HOME/.config/zsh/.zprofile"

# anitgen
[ -f "$HOME/.config/zsh/antigen.zsh" ] && source "$HOME/.config/zsh/antigen.zsh"
antigen use oh-my-zsh

## themes
antigen theme gallois

## plugins
### omz
antigen bundle git
antigen bundle command-not-found
#antigen bundle autojump
### other
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions


antigen apply

# prompt
#export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#export PS1='%{$fg[blue]%}[%~% ]%(?.%{$fg[cyan]%}.%{$fg[red]%})%B$%b '

# load aliases
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc" 

# options
setopt correct
setopt nocaseglob
setopt extendedglob
setopt numericglobsort                                  
setopt nobeep                                            
setopt appendhistory                                      
setopt histignorealldups                                   
setopt autocd                                               
setopt inc_append_history                                    

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'     
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         
zstyle ':completion:*' rehash true                             
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.cache/zsh/history
HISTSIZE=100000
SAVEHIST=100000


