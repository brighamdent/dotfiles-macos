# ~/.zshrc

# # Set vi mode (optional)
# bindkey -v

# Alias modifications
alias vim='nvim'
alias fd='cd "$(fdir)"'
alias waypaper-engine='waypaper-engine r --script=~/scripts/changewallpaper.sh'
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias clear='clear && neofetch'
alias neofetch='fastfetch'

# Exported environment variables
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-dark

# PS1 prompt
PS1='[%n@%m %~]\$ '

# Custom functions
ff() {
    local item
    item=$(find . -type f -print 2> /dev/null | fzf) && {
        echo "Opening in nvim: $item"
        nvim "$item"
    }
}

fdir() {
    find . -type d 2> /dev/null | fzf
}

# Run neofetch if not inside nvim
if [[ -z "$VIMRUNTIME" ]]; then
  fastfetch
  eval "$(starship init zsh)"
fi

# Source additional scripts or files
if [[ $- == *i* ]]; then
    source /usr/share/blesh/ble.sh
fi
