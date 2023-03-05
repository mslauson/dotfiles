return {
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("mason-nvim-dap-virtual-text").setup({
        enabled = true,
        text = "⚡",
        text_pos = "eol",
      })
    end,
  },
}
