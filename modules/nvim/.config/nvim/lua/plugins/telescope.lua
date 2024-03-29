-- -------------------------------------------------------------------------- --
--                  Telescope fuzzy finding (all the things)                  --
--              https://github.com/nvim-telescope/telescope.nvim              --
-- -------------------------------------------------------------------------- --

return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local telescope_themes = require("telescope.themes")

      -- Configure Telescope.
      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            ".git/.*",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extenstions = {
          ["ui-select"] = {
            telescope_themes.get_dropdown(),
          },
        },
      })

      -- Enable Telescope extensions.
      telescope.load_extension("ui-select")

      -- Keybindings.
      local telescope_builtin = require("telescope.builtin")
      local keybindings = require("helpers.keybindings")

      keybindings.map("n", "<leader>ff", telescope_builtin.find_files, { desc = "[F]ind [F]ile" })
      keybindings.map("n", "<leader>fg", telescope_builtin.live_grep, { desc = "[F]ind [G]rep" })
      keybindings.map("n", "<leader>fe", telescope_builtin.diagnostics, { desc = "[F]ind [E]rrors" })
      keybindings.map("n", "<leader>fb", telescope_builtin.buffers, { desc = "[F]ind [B]uffer" })
      keybindings.map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "[F]ind [H]elp" })
    end,
  },
}
