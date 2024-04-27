return {
    {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      require("mason").setup()
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
     local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilites
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set({'n', 'v'}, '<leader>ca',vim.lsp.buf.code_action, {})
    end
  }
}
