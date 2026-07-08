local function apply()
  -- if vim.g.colors_name ~= "cyberdream-light" then
  --   return
  -- end
  vim.opt.cursorline = true
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = true, sp = "#999999" })
end

pcall(apply)
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = apply })
