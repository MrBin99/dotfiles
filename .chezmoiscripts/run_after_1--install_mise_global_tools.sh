#!/usr/bin/env bash

# Make sure that the local bin is in the PATH,
# so that we can use the tools installed by mise.
PATH="$HOME/.local/bin:$PATH"

# Add a local mise config that is not managed by chezmoi.
# This allows to install tools specific to this machine.
if [[ ! -f "$HOME/.config/mise/config.local.toml" ]]; then
  echo "[tools]" > "$HOME/.config/mise/config.local.toml"
  mise trust -y $HOME/.config/mise/config.local.toml
fi

mise trust -y $HOME/.config/mise/config.toml
mise install -y
mise upgrade -y
