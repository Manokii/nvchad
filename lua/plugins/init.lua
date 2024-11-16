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

  {
    "yetone/avante.nvim",
    -- event = "VeryLazy",
    -- lazy = true,
    version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    cmd = { "AvanteAsk", "AvanteToggle", "AvanteChat", "AvanteClear" },
    -- keys = {
    --   { "<leader>aa", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
    -- },
    opts = {
      --
      -- add any opts here
      -- for example
      provider = "gemini",
      gemini = {
        model = "gemini-2.0-flash",
        api_key_name = "cmd:op read op://private/Gemini/api_key",
      },
      -- openai = {
      --   endpoint = "https://api.openai.com/v1",
      --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --   timeout = 30000, -- timeout in milliseconds
      --   temperature = 0, -- adjust if needed
      --   max_tokens = 4096,
      --   reasoning_effort = "high", -- only supported for "o" models
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
}
