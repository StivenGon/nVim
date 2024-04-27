local set = vim.keymap.set

set("v","<C-c>",'"+y')
set("n","<C-v>",'"+p')
set("v","<C-v>",'"+p')
set("c","<C-v>","<C-R>+")
set("i","<C-v>",'<ESC>"+pi')


local map = require("which-key").register

--[[ Default opts
  mode = "n"
  prefix = ""
  buffer = nil
  silent = true
  noremap = true
  nowait = false
  expr = false
--]]

map({
  -- Neo Tree
  {
    ["<leader>n"] = { "<CMD>Neotree float<CR>", "Open neotree" },
  },

  -- Telescope
  {
    ["<leader>t"] = { name = "+telescope" },
    ["<leader>tt"] = { "<CMD>Telescope find_files<CR>", "Find files" },
    ["<leader>tg"] = { "<CMD>Telescope live_grep<CR>", "Live grep" },
    ["<leader>ts"] = { require("auto-session.session-lens").search_session, "Session switcher" },
  },

  -- LSP
  {
    ["<leader>l"] = { name = "+lsp" },
    ["<leader>lh"] = { vim.lsp.buf.hover, "Open hover float" },
    ["<leader>le"] = { vim.diagnostic.open_float, "Open error float" },
    ["<leader>lD"] = { vim.lsp.buf.declaration, "Go to declaration" },
    ["<leader>ld"] = { vim.lsp.buf.definition, "Go to definition" },
    ["<leader>lR"] = { vim.lsp.buf.references, "Show references" },
    ["<leader>lt"] = { vim.lsp.buf.type_definition, "Go to type definition" },
    ["<leader>li"] = { vim.lsp.buf.implementation, "Go to implementation" },
    ["<leader>ls"] = { vim.lsp.buf.signature_help, "Show signature" },
    ["<leader>la"] = { vim.lsp.buf.code_action, "Code actions" },
    ["<leader>ll"] = { require("lsp_lines").toggle, "Toggle lsp_lines" },
    ["<leader>lr"] = { vim.lsp.buf.rename, "Rename Symbol" },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format()
      end,
      "Reformat file",
    },
  },

  -- Bufferline
  {
    ["<A-1>"] = { "<CMD>BufferLineGoToBuffer 1<CR>", "Buffer 1" },
    ["<A-2>"] = { "<CMD>BufferLineGoToBuffer 2<CR>", "Buffer 2" },
    ["<A-3>"] = { "<CMD>BufferLineGoToBuffer 3<CR>", "Buffer 3" },
    ["<A-4>"] = { "<CMD>BufferLineGoToBuffer 4<CR>", "Buffer 4" },
    ["<A-5>"] = { "<CMD>BufferLineGoToBuffer 5<CR>", "Buffer 5" },
    ["<A-6>"] = { "<CMD>BufferLineGoToBuffer 6<CR>", "Buffer 6" },
    ["<A-7>"] = { "<CMD>BufferLineGoToBuffer 7<CR>", "Buffer 7" },
    ["<A-8>"] = { "<CMD>BufferLineGoToBuffer 8<CR>", "Buffer 8" },
    ["<A-9>"] = { "<CMD>BufferLineGoToBuffer 9<CR>", "Buffer 9" },
    ["<A-z>"] = { "<CMD>BufferLineCyclePrev<CR>", "Cycle to previous buffer" },
    ["<A-x>"] = { "<CMD>BufferLineCycleNext<CR>", "Cycle to next buffer" },
    ["<A-{>"] = { "<CMD>BufferLineMovePrev<CR>", "Move buffer to the left" },
    ["<A-}>"] = { "<CMD>BufferLineMoveNext<CR>", "Move buffer to the right" },
  },

  -- Undotree
  {
    ["<leader>u"] = { name = "Undotree" },
    ["<leader>ut"] = { "<CMD>UndotreeToggle<CR>", "Toggle Undotree" },
    ["<leader>ue"] = { "<CMD>UndotreeFocus<CR>", "Focus Undotree" },
  },

  -- Surround
  { -- The rest of the mappings are on plugins/mini.lua
    ["<leader>s"] = { name = "Surround" },
  },

  --Copilot
  {
    ["<leader>c"] = { name = "Copilot" },
    ["<leader>ct"] = { "<CMD>Copilot toggle<CR>", "Toggle Copilot" },
    ["<leader>cc"] = { "<CMD>CopilotChat", "Start Copilot Chat" },
    ["<leader>cs"] = { "<CMD>CopilotChatToggle<CR>", "Toggle Copilot Split" },
    ["<leader>cr"] = { "<CMD>CopilotChatReset<CR>", "Reset Copilot Chat" },
  },
  -- Misc
  {
    ["J"] = { "mzJ`z", "Append line below to current line" },
    ["<leader>m"] = { name = "Miscellaneous" },
    ["<leader>m<leader>"] = { "<CMD>retab<CR>", "Run :retab" },
    ["<leader>/"] = { "<CMD>noh<CR>", "Remove search highligths" },
    ["<A-q>"] = { "<CMD>bd<CR>", "Close current buffer" },
    ["<leader>bf"] = { "<CMD>set buflisted<CR>", "Enable buflisted for current buffer" },
    ["<A-s>"] = { "<CMD>w<CR>", "Save with no formatting" },
    -- Save with formatting
    ["<C-s>"] = {
      function()
        vim.lsp.buf.format({ timeout_ms = 5000 })
        vim.cmd("w")
      end,
      "Save current file",
    },
    -- Neovide Fullscreen
    ["<C-F11>"] = {
      function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
      end,
      "Toggle Fullscreen",
    },
  },
})

map({
  -- Save insert mode
  ["<C-s>"] = {
    function()
      vim.lsp.buf.format()
      vim.cmd("w")
    end,
    "Save current file",
  },
  { mode = "i" },
})

map({
  -- Save normal mode
  ["<C-s>"] = {
    function()
      vim.lsp.buf.format()
      vim.cmd("w")
    end,
    "Save current file",
  },
})

map({
  -- Visual Misc
  ["J"] = { "<CMD>m '>+1<CR>gv=gv", "Move selection down" },
  ["K"] = { "<CMD>m '<-2<CR>gv=gv", "Move selection up" },
}, { mode = "v" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection without yank" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })
vim.keymap.set("n", "<C-n>", "<CMD>Neotree float<CR>")


