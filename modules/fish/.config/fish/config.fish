# ---------------------------------------------------------------------------- #
#                          MrBin99 - Fish Shell Config                         #
# ---------------------------------------------------------------------------- #

# --------------------------------- Variables -------------------------------- #

# Remove greeting messages.
set -U fish_greeting ''

# Sets the default editor.
set -U EDITOR vim

# Sets Starship default configuration path.
set -Ux STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# Sets Cargo default installation path.
set -U CARGO_ROOT $HOME/.cargo

# Sets Pyenv default installation path.
set -U PYENV_ROOT $HOME/.pyenv

# Sets NVM default installation path.
set -U NVM_ROOT $HOME/.nvm

# Sets PHPENV default installation path.
set -U PHPENV_ROOT $HOME/.phpenv

# Sets Nvim default installation path.
set -U NVIM_ROOT $HOME/.local/bin/nvim

# Sets Snap default installation path.
set -U SNAP_ROOT /snap

# Use "Bat" as viewer for man pages.
set -Ux MANPAGER "sh -c 'col -bx | batcat --theme OneHalfDark -l man -p'"

# ---------------------------------- Aliases --------------------------------- #

# Exa.
alias ls "exa --icons --color=always --group-directories-first"
alias lt "ls -T -L 5"
alias ll "ls -lag --header"
alias llt "ls -Tgla -L 5 --header"

# Ripgrep.
alias grep "rg"

# Bat.
alias bat "batcat --theme OneHalfDark"
alias less "bat"

# Duf.
alias df "duf"

# Nvim.
alias vim "nvim"
alias v "nvim"

# Git
alias lg "lazygit"
alias glo "git log --graph --pretty --format='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an> %C(cyan)<%ae>%Creset' --abbrev-commit"
alias gaa "git add -A"
alias gs "git status"
alias gc "git commit"
alias gch "git checkout"
alias gb "git branch"

# Confirm before making mistakes.
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'

# ------------------------------- Abreviations ------------------------------- #

# Update and upgrade system.
abbr update "sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo apt autopurge && sudo apt autoclean"

# -------------------------------- Keybindings ------------------------------- #

bind --user \b backward-kill-word

# -------------------------- Add directory to path. -------------------------- #

fish_add_path $HOME/.local/bin
fish_add_path $SNAP_ROOT/bin
fish_add_path $CARGO_ROOT/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path $PHPENV_ROOT/bin
fish_add_path $NVIM_ROOT/bin

# ---------------------------------- Startup --------------------------------- #

# Load NVM.
load_nvm > /dev/stderr

# Startup Pyenv in interactive mode.
if status is-interactive
  and test -d $PYENV_ROOT
  pyenv init - | source
end

# Startup PHPenv.
if status is-interactive
  and test -d $PHPENV_ROOT
  phpenv init - | source
end

# Start Starship prompt.
if test -f $HOME/.local/bin/starship
  starship init fish | source
end
