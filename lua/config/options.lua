-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- blinking underline in insert mode
vim.opt.guicursor = "n-v-c:block,i-ci-ve:hor20-blinkwait700-blinkoff400-blinkon250,r-cr:hor20,o:hor50"
vim.cmd([[ highlight CursorLine guibg=NONE gui=underline ]])
vim.o.termguicolors = true
vim.o.shell = "fish"
