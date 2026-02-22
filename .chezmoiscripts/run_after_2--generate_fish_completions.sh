#!/usr/bin/env fish

chezmoi completion fish > $HOME/.config/fish/completions/chezmoi.fish
mise completion fish > $HOME/.config/fish/completions/mise.fish
starship completions fish > $HOME/.config/fish/completions/starship.fish
rg --generate=complete-fish > $HOME/.config/fish/completions/rg.fish

fish_update_completions
