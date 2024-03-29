-- -------------------------------------------------------------------------- --
--                                     LSP                                    --
--                  https://github.com/neovim/nvim-lspconfig                  --
--                 https://github.com/williamboman/mason.nvim                 --
--            https://github.com/williamboman/mason-lspconfig.nvim            --
--                    https://github.com/folke/neodev.nvim                    --
-- -------------------------------------------------------------------------- --

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local keybindings = require("helpers.keybindings")
    local telescope_builtin = require("telescope.builtin")

    -- Add keybindings for LSP actions.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("mrbin99-lsp-attach", { clear = true }),
      callback = function(event)
        -- Helper function.
        local map = function(keys, func, desc)
          keybindings.map("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Go to definition.
        map("gd", telescope_builtin.lsp_definitions, "[G]o to [D]efinition")

        -- Go to references.
        map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")

        -- Go to implementations.
        map("gi", telescope_builtin.lsp_implementations, "[G]oto [I]mplementations")

        -- Rename using LSP.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]me")

        -- Propose code actions when cursor is above errors.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Show documentation.
        map("K", vim.lsp.buf.hover, "Show Documentation")

        -- Show highlights of the current word selected.
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

    -- LSP servers customization.
    local servers = {
      lua_ls = {},
    }

    -- Startup Mason.
    require("mason").setup()

    -- Setup LSP with Mason.
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
