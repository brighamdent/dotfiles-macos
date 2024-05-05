if status is-interactive
    # Commands to run in interactive sessions can go here
    # ~/.config/fish/config.fish

set -g fish_greeting ""
set -x PATH $HOME/bin $PATH
# set -g fish_term24bit 0
# source ~/.cache/wal/colors.fish
# set -U fish_color_autosuggestion #e01616

alias ls 'ls --color=auto'
alias ll 'ls -l'
alias la 'ls -a'
alias grep 'grep --color=auto'
alias vim 'nvim'
alias fd 'cd (fdir)'
# alias neofetch 'neofetch --ascii ~/dotfiles/neofetch/.config/neofetch/archlogo.txt'
alias neofetch 'fastfetch'
alias waypaper-engine 'waypaper-engine r --script=~/scripts/changewallpaper.sh'
alias ls 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias clear 'clear && neofetch'
cat /home/brigham/.cache/wal/sequences
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-dark

function ff
    set item (find . -type f -print 2> /dev/null | fzf)
    if test -n "$item"
        echo "Opening in nvim: $item"
        nvim "$item"
    end
end

function fdir
    find . -type d 2> /dev/null | fzf
end

if not set -q VIMRUNTIME
  neofetch
  starship init fish | source
end
end
if test -z "$DISPLAY" -a (tty) = '/dev/tty1'
    exec Hyprland
end

