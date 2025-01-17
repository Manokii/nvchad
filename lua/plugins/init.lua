return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "tsx",
        "typescript",
        "python",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<A-l>"] = require("cmp").mapping.complete(),
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-y>",
          },
        },
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      conf.defaults.file_ignore_patterns = {
        ".git/",
        "node_modules/",
      }
      -- or
      -- table.insert(conf.defaults.mappings.i, your table)
      table.insert(conf.extensions, {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      })
      require("telescope").load_extension "ui-select"
      require("telescope").setup(conf)
    end,

    dependencies = {
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
  },
}
