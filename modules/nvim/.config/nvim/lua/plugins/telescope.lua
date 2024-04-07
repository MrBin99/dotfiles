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
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
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
      telescope.load_extension("fzf")

      -- Keybindings.
      local telescope_builtin = require("telescope.builtin")
      local keybindings = require("helpers.keybindings")

      keybindings.map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "[F]ind [H]elp" })
      keybindings.map("n", "<leader>fsk", telescope_builtin.keymaps, { desc = "[F]ind [K]eymaps" })
      keybindings.map("n", "<leader>ff", telescope_builtin.find_files, { desc = "[F]ind [F]ile" })
      keybindings.map("n", "<leader>fs", telescope_builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
      keybindings.map("n", "<leader>fw", telescope_builtin.grep_string, { desc = "[F]ind current [W]ord" })
      keybindings.map("n", "<leader>fg", telescope_builtin.live_grep, { desc = "[F]ind by [G]rep" })
      keybindings.map("n", "<leader>fd", telescope_builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
      keybindings.map("n", "<leader>fr", telescope_builtin.resume, { desc = "[F]ind [R]esume" })
      keybindings.map("n", "<leader>f.", telescope_builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
      keybindings.map("n", "<leader><leader>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
    end,
  },
}
