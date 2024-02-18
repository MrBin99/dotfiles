-- -------------------------------------------------------------------------- --
--                                  ScrollEOF                                 --
--                  https://github.com/Aasim-A/scrollEOF.nvim                 --
-- -------------------------------------------------------------------------- --

return {
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
    config = function ()
      require("scrollEOF").setup()
    end
  }
}
