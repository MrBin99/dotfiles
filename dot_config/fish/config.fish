# --------------------------------- Variables -------------------------------- #

# Remove greeting messages.
set fish_greeting ''

# Set the default editor to use.
set EDITOR vim

# Set "bat" as the default man pager.
set -x MANPAGER "bat -plman"

# Set theme for "bat" command.
set -x BAT_THEME "OneHalfDark"

# ---------------------------------- Aliases --------------------------------- #

# Eza.
alias ls "eza --icons --color=always --group-directories-first"
alias lt "ls -T -L 5"
alias ll "ls -lag --header"
alias llt "ls -Tgla -L 5 --header"

# Ripgrep.
alias grep "rg"

# Bat.
alias cat "bat --paging=never"
alias less "bat --paging=always"

# ------------------------------ Abbreviations ------------------------------- #

# Update and upgrade system.
abbr update "sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo apt autopurge && sudo apt autoclean"

# -------------------------------- Keybindings ------------------------------- #

bind --user \b backward-kill-word

# -------------------------- Add directory to path. -------------------------- #

fish_add_path $HOME/.local/bin

# ---------------------------------- Startup --------------------------------- #

# Start Mise.
if test -f $HOME/.local/bin/mise
  mise activate fish | source
end

# Start Starship prompt.
if mise which starship > /dev/null
  starship init fish | source
end
