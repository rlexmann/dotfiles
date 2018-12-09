#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\e[01;31m\]\u\[\e[01;36m\]@\h\[\e[01;33m\]:\w\n\[\e[01;32m\]\$ \[\e(b\e[m\]'
# PS1="[$(tput bold)$(tput setaf 1)\u$(tput setaf 6)@\h$(tput setaf 3):\w $(tput setaf 2)$ $(tput sgr0)"