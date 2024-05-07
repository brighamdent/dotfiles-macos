#
# ~/.bashrc
#
set -o vi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# List of aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias fd='cd "$(fdir)"'
alias waypaper-engine='waypaper-engine r --script=~/scripts/changewallpaper.sh'
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias clear='clear && neofetch'
alias neofetch= 'fastfetch'

# List of Variables
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-dark

#Starts wall on boot
cat /home/brigham/.cache/wal/sequences
PS1='[\u@\h \W]\$ '

#Functions for Fzf "Find file in current directory"
ff() {
    local item
    item=$(find . -type f -print 2> /dev/null | fzf) && {
        echo "Opening in nvim: $item"
        nvim "$item"
    }
}
#Functions for Fzf "Find directory in current dirrectory"
fdir() {
    find . -type d 2> /dev/null | fzf
}
# runs neofetch as log as it is not inside nvim
if [ -z "$VIMRUNTIME" ]; then
  neofetch
  eval "$(starship init bash)"
fi
# [[ $- == *i* ]] && source /usr/share/blesh/ble.sh


