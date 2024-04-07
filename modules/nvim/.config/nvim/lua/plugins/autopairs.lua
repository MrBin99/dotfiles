-- -------------------------------------------------------------------------- --
--                               nvim-autopairs                               --
--                     https://github.com/hrsh7th/nvim-cmp                    --
-- -------------------------------------------------------------------------- --

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {},
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- Integrate "nvim-autopairs" with "cmp"
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
