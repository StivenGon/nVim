return {
  "Theyashsawarkar/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true
    local bufferline = require("bufferline")
    bufferline.setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
      },
    })
  end,
}
