-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>nh", function()
  Snacks.notifier.show_history()
end, { desc = "Notification History" })

-- search and replace in selection
vim.keymap.set("x", "<C-r>", function()
  local search = vim.fn.input("Search: ")
  if search == "" then
    return
  end

  local replace = vim.fn.input("Replace: ")
  local vpos = vim.fn.getpos("v")
  local cpos = vim.fn.getpos(".")

  local srow, scol = vpos[2], vpos[3]
  local erow, ecol = cpos[2], cpos[3]

  if srow > erow or (srow == erow and scol > ecol) then
    srow, erow = erow, srow
    scol, ecol = ecol, scol
  end

  local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
  if #lines == 0 then
    return
  end

  local search_pat = vim.pesc(search)
  local replace_lua = replace:gsub("%%", "%%%%")

  if #lines == 1 then
    local line = lines[1]
    local before = line:sub(1, scol - 1)
    local selected = line:sub(scol, ecol)
    local after = line:sub(ecol + 1)
    lines[1] = before .. selected:gsub(search_pat, replace_lua) .. after
  else
    local first = lines[1]
    local last = lines[#lines]

    local first_before = first:sub(1, scol - 1)
    local first_selected = first:sub(scol)
    lines[1] = first_before .. first_selected:gsub(search_pat, replace_lua)

    for i = 2, #lines - 1 do
      lines[i] = lines[i]:gsub(search_pat, replace_lua)
    end

    local last_selected = last:sub(1, ecol)
    local last_after = last:sub(ecol + 1)
    lines[#lines] = last_selected:gsub(search_pat, replace_lua) .. last_after
  end

  vim.api.nvim_buf_set_lines(0, srow - 1, erow, false, lines)
end, {
  desc = "Search and replace in visual selection",
})
