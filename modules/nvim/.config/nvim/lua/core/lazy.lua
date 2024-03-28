-- -------------------------------------------------------------------------- --
--                             Install "lazy.nvim"                            --
--                     https://github.com/folke/lazy.nvim                     --
-- -------------------------------------------------------------------------- --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if already installed.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Load the plugin.
local ok, lazy = pcall(require, "lazy")

if not ok then
  error("Failed to load lazy.nvim")

  return
end

-- We have to set the leader key here for lazy.nvim to work.
-- require("helpers.keys").set_leader(" ")

-- Load plugins from specifications.
lazy.setup("plugins")

-- "lazy.nvim" keybindings.
require("helpers.keybindings").map("n", "<leader>l", lazy.show, "Show Lazy")
