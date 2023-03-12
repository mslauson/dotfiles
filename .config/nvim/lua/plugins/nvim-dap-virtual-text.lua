return {
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        text = "⚡",
        text_pos = "eol",
      })
    end,
  },
}
