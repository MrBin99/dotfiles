# --------------------------------- Variables -------------------------------- #

# Remove greeting messages.
set fish_greeting ''

# Set the default editor to use.
set EDITOR vim

# -------------------------- Add directory to path. -------------------------- #

fish_add_path $HOME/.local/bin

# ---------------------------------- Startup --------------------------------- #

# Start Mise.
if test -f $HOME/.local/bin/mise
  mise activate fish | source
end
