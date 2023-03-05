return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("flutter-tools").setup({
        experimental = {
          lsp_derive_paths = true,
        },
      })
    end,
  },
}
