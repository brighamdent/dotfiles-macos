if status is-interactive
    # Commands to run in interactive sessions can go here
    # ~/.config/fish/config.fish

set -g fish_greeting ""
set -x PATH $HOME/bin $PATH
set -g fish_term24bit 0
source ~/.cache/wal/colors.fish

# function fish_prompt
#     set_color blue
#     echo -n (whoami)
#     set_color normal
#     echo -n '@'
#     set_color yellow
#     echo -n (hostname)
#     set_color normal
#     echo -n ' '
#     set_color green
#     echo -n (prompt_pwd)
#     set_color normal
#     echo -n '>'
# end

alias ls 'ls --color=auto'
alias ll 'ls -l'
alias la 'ls -a'
alias grep 'grep --color=auto'
alias vim 'nvim'
alias fd 'cd (fdir)'
alias waypaper-engine 'waypaper-engine r --script=~/scripts/changewallpaper.sh'
alias ls 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias clear 'clear; and neofetch'

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
  fastfetch
  starship init fish | source
end
end
