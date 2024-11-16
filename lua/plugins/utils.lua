-- NOTE:
-- HACK:
-- FIXME:
-- BUG:
-- ISSUE:
-- FIXIT:
-- PERF:
-- TODO:
-- WARN:
-- TEST:

return {
  { "mg979/vim-visual-multi", lazy = false }, -- Visual multi cursor
  { "numToStr/Comment.nvim", opts = {}, lazy = false },
  { "echasnovski/mini.ai", opts = {}, lazy = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      -- local cmp = require("cmp")
      -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    event = "LspAttach",
    opts = {
      document_color = {
        enabled = false,
        inline_symbol = "󱓻 ",
      },
      conceal = {
        enabled = false,
      },
    }, -- your configuration
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      enabled = false,
    },
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    opts = {
      backend = "delta",
      backend_opts = {
        delta = {
          -- Header from delta can be quite large.
          -- You can remove them by setting this to the number of lines to remove
          header_lines_to_remove = 4,

          -- The arguments to pass to delta
          -- If you have a custom configuration file, you can set the path to it like so:
          -- args = {
          --     "--config" .. os.getenv("HOME") .. "/.config/delta/config.yml",
          -- }
          args = {
            "--line-numbers",
          },
        },
      },
    },
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
    config = function()
      require "configs.tiny-inline-diagnostic"
    end,
  },

  {
    "ssstba/ecolog.nvim",
    lazy = false,
    opts = {
      preferred_environment = "local",
      types = true,
      monorepo = {
        enabled = true,
        auto_switch = true,
        notify_on_switch = true,
      },
      shelter = {
        configuration = {
          patterns = {
            ["DATABASE_URL"] = "full",
            ["# .*"] = "full",
          },
          sources = {
            [".env.example"] = "none",
          },
          partial_mode = false,
          mask_char = "█",
        },
        modules = {
          files = true,
          peek = true,
          -- snacks_previewer = false,
          -- snacks = false,
          cmp = false,
        },
      },
      path = vim.fn.getcwd(),
    },
  },
}
