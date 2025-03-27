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
    opts = {}, -- your configuration
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      enabled = false,
    },
  },
}
