-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- blinking underline in insert mode
vim.opt.guicursor = "n-v-c:block,i-ci-ve:hor20-blinkwait700-blinkoff400-blinkon250,r-cr:hor20,o:hor50"
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = true, sp = "#999999" })
vim.o.termguicolors = true
vim.o.shell = "fish"
vim.g.lazyvim_blink_main = true
vim.o.winborder = "rounded"
