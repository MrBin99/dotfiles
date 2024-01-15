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

# ---------------------------------- Aliases --------------------------------- #

# Git
alias glo "git log --graph --pretty --format='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
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
abbr update "sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo apt purge"

# -------------------------- Add directory to path. -------------------------- #

fish_add_path $HOME/.local/bin
fish_add_path $CARGO_ROOT/bin
fish_add_path $PYENV_ROOT/bin

# ---------------------------------- Startup --------------------------------- #

# Startup Pyenv in login mode.
if status is-login
  and test -d $PYENV_ROOT
  pyenv init --path | source
end

# Startup Pyenv in interactive mode.
if status is-interactive
  and test -d $PYENV_ROOT
  pyenv init - | source
end

# Load NVM.
load_nvm > /dev/stderr

# Start Starship prompt.
if test -f $HOME/.local/bin/starship
  starship init fish | source
end
