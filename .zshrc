# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rlexmann/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Keyboard setup
autoload zkbd
function zkbd_file() {
    [[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}

[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
keyfile=$(zkbd_file)
ret=$?
if [[ ${ret} -ne 0 ]]; then
    zkbd
    keyfile=$(zkbd_file)
    ret=$?
fi
if [[ ${ret} -eq 0 ]] ; then
    source "${keyfile}"
else
    printf 'Failed to setup keys using zkbd.\n'
fi
unfunction zkbd_file; unset keyfile ret

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char
# End of keyboard setup

# Prompt setup
autoload -Uz promptinit
promptinit
autoload -Uz colors
colors

PROMPT='%B%F{198}%n%F{039}@%m%f:%F{221}%d%f
%F{046}>> %f%b'

# Set informative window title for rxvt terminal
case $TERM in
	rxvt*)
		precmd() {print -Pn "\e]0;$HOST:$PWD\a"}
		;;
esac
# Aliases
alias du='du -h'
#alias ethz-vpn='sudo openconnect --force-dpd=30 --no-dtls -b -u rlexmann sslvpn.ethz.ch'
alias ls='ls --color=auto -v'
alias mc='. /usr/lib64/mc/mc-wrapper.sh'
alias mhscreen='xrandr --output eDP1 --auto --output HDMI1 --auto --panning 2880x1620+2560+0 --scale 1.5x1.5 --right-of eDP1'
alias tree='tree -C'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias matroid1='ssh -L 4711:localhost:22 matroid1.inf.ethz.ch'
alias matroid2='ssh -L 4712:localhost:22 matroid2.inf.ethz.ch'
alias cerberus='ssh -L 4713:localhost:33597 -J supermodularity.inf.ethz.ch localhost -p 42095'
alias thinkcentre='ssh -L 4714:localhost:54113 -J supermodularity.inf.ethz.ch localhost -p 42096'
# End of aliases
