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
            "node_modules/",
            "%.git/",
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

      keybindings.map("n", "<leader>fh", telescope_builtin.help_tags, "Find Help")
      keybindings.map("n", "<leader>fsk", telescope_builtin.keymaps, "Find Keymaps")
      keybindings.map("n", "<leader>ff", telescope_builtin.find_files, "Find File")
      keybindings.map("n", "<leader>fs", telescope_builtin.builtin, "Find Select Telescope")
      keybindings.map("n", "<leader>fw", telescope_builtin.grep_string, "Find current Word")
      keybindings.map("n", "<leader>fg", telescope_builtin.live_grep, "Find by Grep")
      keybindings.map("n", "<leader>fd", telescope_builtin.diagnostics, "Find Diagnostics")
      keybindings.map("n", "<leader>fr", telescope_builtin.resume, "Find Resume")
      keybindings.map("n", "<leader>f.", telescope_builtin.oldfiles, 'Find Recent Files ("." for repeat)')
      keybindings.map("n", "<leader><leader>", telescope_builtin.buffers, "Find existing buffers")
    end,
  },
}
