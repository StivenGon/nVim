return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    opts = {
      filesystem = {
        bind_to_cwd = true,
        cwd_target = {
          sidebar = "window",
          current = "window",
          float = "window",
        },

      },
      close_if_last_window = true,
      hijack_netrw_behavior = "open_current",
      default_component_config = {
        window = {
          position = "float",
        },
      },
    }
  end
}
