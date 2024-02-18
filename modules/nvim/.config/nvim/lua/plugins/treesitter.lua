-- -------------------------------------------------------------------------- --
--                                 Treesitter                                 --
--             https://github.com/nvim-treesitter/nvim-treesitter             --
-- -------------------------------------------------------------------------- --

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
      },
      additional_vim_regex_highlighting = false,
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    })
  end
}
