-- -------------------------------------------------------------------------- --
--                   Misc helper functions for keybindings                    --
-- -------------------------------------------------------------------------- --

local M = {}

-- Maps a new keybinding.
M.map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Sets the leader key.
M.set_leader = function(key)
	vim.g.mapleader = key
	vim.g.maplocalleader = key

	M.map({ "n", "v" }, key, "<nop>")
end

return M
