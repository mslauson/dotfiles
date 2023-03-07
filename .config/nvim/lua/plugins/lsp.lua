return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      {
        "neovim/nvim-lspconfig",
        ft = {
          "dockerfile",
          "javascript",
          "kotlin",
          "lua",
          "markdown",
          "python",
          "sh",
          "sql",
          "typescript",
          "xml",
        },

        config = function()
          local lspconfig = require("lspconfig")
          local lsp = require("util.lsp")

          lspconfig.bashls.setup({
            on_attach = lsp.on_attach,
            capabilities = lsp.cmp_capabilities,
          })

          lspconfig.kotlin_language_server.setup({
            on_attach = lsp.on_attach,
            capabilities = lsp.cmp_capabilities,
          })

          lspconfig.lemminx.setup({
            on_attach = lsp.on_attach,
            capabilities = lsp.cmp_capabilities,
            settings = {
              xml = {
                fileAssociations = {
                  {
                    systemId = "http://maven.apache.org/xsd/maven-4.0.0.xsd",
                    pattern = "pom.xml",
                  },
                },
              },
            },
          })

          lspconfig.pylsp.setup({
            on_attach = lsp.on_attach,
            capabilities = lsp.cmp_capabilities,
            settings = { pylsp = { configurationSources = { "flake8" } } },
          })

          lspconfig.tsserver.setup({
            on_attach = lsp.on_attach,
            capabilities = lsp.cmp_capabilities,
          })

        end,
      }, -- Required
      {
        "williamboman/mason.nvim",
        dependencies = {
          { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        },
        config = function()
          require("mason").setup({
            ui = { border = "rounded" },
          })
          require("mason-lspconfig").setup()
          require("mason-tool-installer").setup({
            ensure_installed = {
              -- LSP
              "bash-language-server",
              "kotlin-language-server",
              "jdtls",
              "lemminx",
              "lua-language-server",
              "typescript-language-server",

              -- Linters
              "flake8",
              "hadolint",
              "markdownlint",
              "shellcheck",
              "vale",

              -- Formatters
              "shellharden",
              "sql-formatter",
            },
          })
        end,
      }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      { "mfussenegger/nvim-jdtls" }, -- Optional
      { "jose-elias-alvarez/null-ls.nvim" }, -- Optional
      { "jose-elias-alvarez/nvim-lsp-ts-utils" }, -- Optional
      { "ray-x/lsp_signature.nvim" }, -- Optional
      { "williamboman/nvim-lsp-installer" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
  },
}
