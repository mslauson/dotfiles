return {
  {
    "folke/neodev.nvim",
    lazy = true,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  {
    "dstein64/vim-startuptime",
    init = function()
      vim.g.startuptime_tries = 5
    end,
    cmd = "StartupTime",
    dependencies = {
      "nvim-lualine/lualine.nvim", -- Just to fix stuck issue on vim-startuptime
    },
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
    config = function()
      require("notify").setup {
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade",
        timeout = 3000,
        top_down = true,
      }

      vim.notify = require "notify"
    end,
  },

  {
    "stevearc/dressing.nvim",
    enabled = false,
  },
  {'nvim-orgmode/orgmode',
   config = function()
    local orgmode = require('orgmode');
     orgmode.setup({
       --org_agenda_files = {'~/org/*'},
       --org_default_notes_file = '~/org/refile.org',
       org_agenda_templates = {
         t = { description = 'Todo', template = '* TODO %?\n  %i\n  %a', target = '~/org/refile.org' },
         n = { description = 'Note', template = '* %u %?\n  %i\n  %a', target = '~/org/refile.org' },
       },
     })

     orgmode.setup_ts_grammar()

     require('nvim-treesitter.configs').setup {
       -- If TS highlights are not enabled at all, or disabled via `disable` prop,
       -- highlighting will fallback to default Vim syntax highlighting
       highlight = {
         enable = true,
         -- Required for spellcheck, some LaTex highlights and
         -- code block highlights that do not have ts grammar
         additional_vim_regex_highlighting = {'org'},
       },
       ensure_installed = {'org'}, -- Or run :TSUpdate org
     }

   end
  }
}
