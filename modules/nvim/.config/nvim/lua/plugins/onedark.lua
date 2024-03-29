-- -------------------------------------------------------------------------- --
--                                   OneDark                                  --
--                  https://github.com/navarasu/onedark.nvim                  --
-- -------------------------------------------------------------------------- --

return {
  "navarasu/onedark.nvim",
  config = function()
    -- Configure OneDark theme.
    require("onedark").setup()

    -- Load OneDark theme.
    require("onedark").load()
  end,
}
