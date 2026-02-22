# --------------------------------- Variables -------------------------------- #

# Remove greeting messages.
set fish_greeting ''

# Set the default editor to use.
set EDITOR vim

# Set "bat" as the default man pager.
set -x MANPAGER "bat -plman"

# Set theme for "bat" command.
set -x BAT_THEME "OneHalfDark"

# Default options for "fzf" command.
set DEFAULT_FZF_OPTS "--style=full --color='pointer:#56B6C2' --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Set defaults options for "fzf" command.
set -x FZF_DEFAULT_OPTS "$DEFAULT_FZF_OPTS"

# Set options for "zoxide" using "fzf" command.
set -x _ZO_FZF_OPTS "$DEFAULT_FZF_OPTS"

# ---------------------------------- Aliases --------------------------------- #

# Eza.
alias ls "eza --icons --color=always --group-directories-first"
alias lt "ls -T -L 5"
alias ll "ls -lag --header"
alias llt "ls -Tgla -L 5 --header"

# Ripgrep.
alias grep "rg"

# fd-find.
alias find "fd"

# delta.
alias diff "delta"

# Bat.
alias cat "bat --paging=never"
alias less "bat --paging=always"

# Confirm before making mistakes.
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'

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

# Start fzf.
if mise which fzf > /dev/null
  fzf --fish | source

  # Unbind default "ctrl-t" and bind "alt-t" it to "fzf-file-widget".
  bind -e ctrl-t
  bind alt-t fzf-file-widget
end

# Startup zoxide.
if mise which zoxide > /dev/null
  zoxide init fish --cmd cd | source

  # Bind "alt-y" to "zoxide".
  bind alt-y cdi
end

# Start Starship prompt.
if mise which starship > /dev/null
  starship init fish | source
end
