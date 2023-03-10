local init = require("mason-lspconfig.server_configurations.bicep")
return {
  {
    "garyhurtz/cmp_kitty",
    init = function()
      require("cmp_kitty"):setup()
    end,
  },
}
