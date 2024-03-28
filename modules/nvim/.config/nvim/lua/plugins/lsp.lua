-- -------------------------------------------------------------------------- --
--                                     LSP                                    --
--                  https://github.com/neovim/nvim-lspconfig                  --
--                 https://github.com/williamboman/mason.nvim                 --
--            https://github.com/williamboman/mason-lspconfig.nvim            --
-- -------------------------------------------------------------------------- --

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())

    -- LSP servers customization.
    local servers = {
      lua_ls = {}
    }

    -- Startup Mason.
    require('mason').setup()

    -- Setup LSP with Mason.
    require('mason-lspconfig').setup {
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end
}
