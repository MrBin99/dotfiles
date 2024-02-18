-- -------------------------------------------------------------------------- --
--                  Telescope fuzzy finding (all the things)                  --
--              https://github.com/nvim-telescope/telescope.nvim              --
-- -------------------------------------------------------------------------- --

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })

      -- Keybindings.
      local telescope_builtin = require("telescope.builtin")
      local keybindings = require("helpers.keybindings")

      keybindings.map("n", "<leader>ff", telescope_builtin.find_files, "Files")
      keybindings.map("n", "<leader>fg", telescope_builtin.live_grep, "Grep")
      keybindings.map("n", "<leader>fb", telescope_builtin.buffers, "Buffer")
      keybindings.map("n", "<leader>fh", telescope_builtin.help_tags, "Help")
    end
  }
}
