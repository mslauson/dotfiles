return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    depends = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    config = function()
      require("neo-tree").setup({
        source_selector = {
          winbar = true,
        },
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
          filtered_items = {
            always_show = {
              ".gitinclude",
              ".gitignore",
              ".gitmodules",
              ".config",
              ".profile",
              ".zshrc",
              ".zshrc_history",
            },
          },
        },
      })
    end,
  },
}
