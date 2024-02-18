-- -------------------------------------------------------------------------- --
--                                Auto-commands                               --
-- -------------------------------------------------------------------------- --

local group = vim.api.nvim_create_augroup("mrbin99", { clear = true })
local create_autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save.
create_autocmd("BufWritePre", {
  group = group,
  pattern = "*",
  command = ":%s/\\s\\+$//e"
})
