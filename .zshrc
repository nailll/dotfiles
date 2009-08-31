#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
default=$'%{\e[0m%}'
green=$'%{\e[32;1m%}'
blue=$'%{\e[36;1m%}'
grey=$'%{\e[30;1m%}'
red=$'%{\e[31;1m%}'

autoload -U compinit promptinit
compinit
promptinit

# Default promp
#prompt walters
PS1="$grey%n$green%#$default "
PS2="> "
RPROMPT="$grey [%~]$default"

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' 'm:{A-Z}={a-z}'
## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
MAILCHECK=0

autoload -U colors
colors

# history
SAVEHIST=500
HISTFILE=~/.zshistory
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# home/end key bindings urxvt
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[Od" backward-word # ctrl+left
bindkey "^[Oc" forward-word #ctrl+right

# home/end key bindings gnome-terminal
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char
bindkey '^[[1' backward-word # ctrl+left
bindkey '^[[1' forward-word #ctrl+right


# keybindings
#alias zkbd='zsh /usr/share/zsh/4.3.9/functions/Misc/zkbd'
#autoload zkbd

#function zkbd_file() {
#	[[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
#	[[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
#	return 1
#}
#keyfile=$(zkbd_file)
#ret=$?
#if [[ ${ret} -ne 0 ]]; then
#	zkbd
#	keyfile=$(zkbd_file)
#	ret=$?
#fi
#if [[ ${ret} -eq 0 ]] ; then
#	source "${keyfile}"
#else
#	printf 'Failed to setup keys using zkbd.\n'
#fi
#unfunction zkbd_file; unset keyfile ret

##setup key accordingly
#[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
#[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
#[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
#[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# terminal title
case $TERM in (xterm*|rxvt)
	precmd () { print -Pn "\e]0;%n@%m: %~\a" }
	preexec () { print -Pn "\e]0;%n@%m: $1\a" }
	;;
esac

# applications
alias -s {txt,info}=gvim
alias -s {avi,mpeg,mpg,mov,m2v}=mplayer
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {jpg,png,gif}=gthumb
alias -s {ogg,mp3,wav,wma}=banshee-1
alias -s pdf=xpdf
autoload -U pick-web-browser
alias -s {html,htm}=pick-web-browser
alias wget-site=wget -rEkp -np -nc
alias ls='ls --color=auto'

if [ -d ~/bin ] ; then
	PATH=~/bin:"${PATH}"
fi

export OOO_FORCE_DESKTOP="gnome"
export MOZ_DISABLE_PANGO=1
