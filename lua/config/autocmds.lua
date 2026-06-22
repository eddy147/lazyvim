-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

-- Work around a LazyVim regression calling vim.hl.hl_op()
pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_highlight_yank")
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("lazyvim_highlight_yank", { clear = true }),
  callback = function()
    local hl = vim.hl or vim.highlight
    if hl and type(hl.on_yank) == "function" then
      hl.on_yank()
    end
  end,
})

local templated_yaml = vim.api.nvim_create_augroup("templated_yaml", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = templated_yaml,
  pattern = { "*.yaml", "*.yml" },
  callback = function(args)
    local name = vim.api.nvim_buf_get_name(args.buf)
    if vim.bo[args.buf].filetype ~= "yaml" then
      return
    end

    local in_template_path = name:find("/templates/")
      or name:find("/helm/")
      or name:find("/charts/")
      or name:find("%.gotmpl%.ya?ml$")

    local line_count = vim.api.nvim_buf_line_count(args.buf)
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, math.min(line_count, 250), false)
    for _, line in ipairs(lines) do
      local has_go_control = line:match("^%s*{{%-?%s*(if|else|end|range|with|define|block|template)")
      local has_unquoted_expr = line:match(":%s*{{.-}}") or line:match("^%s*{{.-}}%s*$")
      if has_go_control or (in_template_path and line:find("{{")) or has_unquoted_expr then
        vim.bo[args.buf].filetype = "gotmpl"
        return
      end
    end
  end,
})
