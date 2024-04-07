-- -------------------------------------------------------------------------- --
--                                 Treesitter                                 --
--             https://github.com/nvim-treesitter/nvim-treesitter             --
-- -------------------------------------------------------------------------- --

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc",
    },
    additional_vim_regex_highlighting = false,
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
