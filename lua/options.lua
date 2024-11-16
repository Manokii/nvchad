require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.scrolloff = 10
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
o.colorcolumn = "80"

vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = 'nvim %{expand("%:p")}'

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- spreading the background color to tmux
-- see https://www.reddit.com/r/neovim/comments/1ehidxy/you_can_remove_padding_around_neovim_instance/

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then
      return
    end
    if os.getenv "TMUX" then
      io.write(string.format("\027Ptmux;\027\027]11;#%06x\007\027\\", normal.bg))
    else
      io.write(string.format("\027]11;#%06x\027\\", normal.bg))
    end
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    if os.getenv "TMUX" then
      io.write "\027Ptmux;\027\027]111;\007\027\\"
    else
      io.write "\027]111\027\\"
    end
  end,
})
