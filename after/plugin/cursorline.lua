local function apply()
  -- if vim.g.colors_name ~= "cyberdream-light" then
  --   return
  -- end
  vim.opt.cursorline = true
  vim.cmd([[ highlight CursorLine guibg=NONE gui=underline ]])
end

pcall(apply)
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = apply })
