-- Indent Blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    indent = { char = "│", highlight = "IblIndent" },
    scope = { char = "│", highlight = "IblScope" },
  },
  config = function(_, opts)
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

    require("ibl").setup(opts)
  end,
}
