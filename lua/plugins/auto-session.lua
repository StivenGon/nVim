return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "info",
      auto_session_root_dir = vim.fn.expand('$HOME/nvim/sessions/'),
      auto_Session_allowed_dirs = { '/*' },
      auto_session_create_enabled = false,
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = { "neo-tree" }, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
  end,
}
