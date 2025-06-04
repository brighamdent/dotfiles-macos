if status is-interactive
    # Commands to run in interactive sessions can go here

set -Ux EDITOR nvim
set -g fish_greeting ""
set -x PATH $HOME/bin $PATH
set -x MUSIC_DIR ~/media/music/Liked-Songs/
set -x open  ~/media/music/Liked-Songs/
# set -x OPENAI_API_KEY sn4_7ed6422eicvk3162jdd4scz0oyto
set -x OPENAI_API_KEY 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

if test -n "$NVIM_LISTEN_ADDRESS"
  set -x MANPAGER "/usr/local/bin/nvr -c 'Man!' -o -"
end

bind \cH backward-kill-word
#List of aliases
alias ll 'ls -l'
alias la 'ls -a'
alias grep 'grep --color=auto'
alias vim 'nvim'
alias fd 'cd (fdir)'
alias neofetch 'fastfetch'
alias ls 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias clear 'clear && neofetch'
alias tmfloat '~/scripts/tmux_session_float.sh'
alias tmcode '~/scripts/tmux_session_code.sh'
alias music 'tmux new-session -s $fish_pid "tmux source-file ~/.config/ncmpcpp/tsession"'
alias ncmp 'TERM=xterm ncmpcpp'
alias yt-rip-audio "yt-dlp -x --audio-format mp3 -P /home/brigham/media/music/Sound\ Scapes/"
alias homelab "ssh brigham@192.168.58"
alias cmt '~/scripts/commit.sh'
alias sr '~/scripts/search_replace.sh'
alias sd '~/scripts/search_delete.sh'

alias gw "cat $HOME/.gitweek 2>/dev/null"
alias gwc "rm -f $HOME/.gitweek || true"

#Starts wal on boot
# wal -q -w
# wal -R -q
# source ~/.cache/wal/sequences
# source ~/.venv/bin/activate.fish
# source ~/.cargo/env

# cat /home/brigham/.cache/wal/sequences

#Variables
set GTK_THEME -g Adwaita:dark
set QT_STYLE_OVERRIDE -g Adwaita-dark

#Functions for Fzf "Find file in current directory"
function ff
    set item (find . -type f -print 2> /dev/null | fzf)
    if test -n "$item"
        echo "Opening in nvim: $item"
        nvim "$item"
    end
end

#Functions for Fzf "Find directory in current dirrectory"
function fdir
    find . -type d 2> /dev/null | fzf
end
if not set -q NVIM
    neofetch
end
zoxide init --cmd cd fish | source
starship init fish | source

end

if test -z "$DISPLAY" -a (tty) = '/dev/tty1'
    exec Hyprland
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

