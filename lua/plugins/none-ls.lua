return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      soruces = {
        null_ls.builtins.formatting.stylua,
      }
    })

    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {})
  end
}
