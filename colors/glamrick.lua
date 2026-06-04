-- ~/.config/nvim/colors/glamrick.lua
-- Glamrick: single-file Neovim colorscheme (dark, medium contrast)

-- ensure true color
vim.o.termguicolors = true

-- name
vim.g.colors_name = "glamrick"

-- helper
local function hi(group, guifg, guibg, gui, guisp)
  local s = {}
  if guifg then
    s.fg = guifg
  end
  if guibg then
    s.bg = guibg
  end
  if guisp then
    s.sp = guisp
  end

  if gui then
    for style in gui:gmatch("[^,%s]+") do
      if style == "bold" then
        s.bold = true
      elseif style == "italic" then
        s.italic = true
      elseif style == "underline" then
        s.underline = true
      elseif style == "undercurl" then
        s.undercurl = true
      elseif style == "reverse" then
        s.reverse = true
      elseif style == "strikethrough" then
        s.strikethrough = true
      elseif style == "nocombine" then
        s.nocombine = true
      end
    end
  end

  vim.api.nvim_set_hl(0, group, s)
end

-- palette
local p = {
  bg = "#0b1020",
  bg_alt = "#0f1626",
  fg = "#c8d6e8",
  comment = "#5b6b7f",
  cursor = "#dfefff",
  gutter_fg = "#394756",
  selection = "#112033",

  red = "#ff6b6b",
  orange = "#ffb86b",
  yellow = "#ffd66b",
  green = "#8be98b",
  cyan = "#69d1ff",
  blue = "#79a7ff",
  violet = "#9aa3ff",
  gray = "#9fb0c6",
  white = "#ffffff",
}

-- clear & reset
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

-- basic
hi("Normal", p.fg, p.bg)
hi("Cursor", p.bg, p.cursor, "reverse")
hi("CursorLine", nil, p.bg_alt)
hi("CursorLineNr", p.orange, p.bg_alt, "bold")
hi("LineNr", p.gutter_fg, p.bg)
hi("ColorColumn", nil, "#0c1a2b")
hi("Visual", nil, p.selection)
hi("Search", p.bg, p.yellow, "bold")
hi("IncSearch", p.bg, p.orange, "bold")
hi("Pmenu", p.fg, p.bg_alt)
hi("PmenuSel", p.bg, p.cyan, "bold")
hi("PmenuSbar", nil, p.bg_alt)
hi("PmenuThumb", nil, p.cyan)
hi("StatusLine", p.gray, p.bg_alt)
hi("StatusLineNC", p.gutter_fg, p.bg)
hi("VertSplit", p.bg_alt, nil)
hi("Comment", p.comment, nil, "italic")
hi("Whitespace", p.gutter_fg, nil)
hi("NormalFloat", p.fg, p.bg_alt)
hi("FloatBorder", p.gutter_fg, nil)
hi("Title", p.orange, nil, "bold")

-- syntax / treesitter
hi("@comment", p.comment, nil, "italic")
hi("@constant", p.yellow, nil)
hi("@attribute", p.yellow, nil, "bold")
hi("@string", p.green, nil)
hi("@variable", p.white, nil)
hi("@function", p.orange, nil)
hi("@function.builtin", p.violet, nil)
hi("@keyword", p.violet, nil, "bold")
hi("@type", p.cyan, nil, "bold")
hi("@parameter", p.white, nil)
hi("@property", p.blue, nil)
hi("@field", p.blue, nil)
hi("@operator", p.cyan, nil)
hi("@punctuation.bracket", p.gutter_fg, nil)

-- legacy groups/fallbacks
hi("Constant", p.yellow, nil, "bold")
hi("String", p.green, nil)
hi("Character", p.orange, nil)
hi("Boolean", p.green, nil, "bold")
hi("Identifier", p.blue, nil)
hi("Function", p.blue, nil)
hi("Statement", p.violet, nil, "bold")
hi("Conditional", p.violet, nil, "bold")
hi("Repeat", p.violet, nil, "bold")
hi("Label", p.violet, nil)
hi("Operator", p.cyan, nil)
hi("Keyword", p.cyan, nil, "bold")
hi("Exception", p.red, nil, "bold")
hi("Type", p.cyan, nil, "bold")
hi("StorageClass", p.cyan, nil)
hi("Structure", p.cyan, nil)
hi("Typedef", p.cyan, nil)
hi("Underlined", p.cyan, nil, "underline")
hi("Error", p.red, nil, "bold")
hi("Todo", p.yellow, nil, "bold,italic")

-- LSP
hi("LspDiagnosticsDefaultError", p.red)
hi("LspDiagnosticsDefaultWarning", p.orange)
hi("LspDiagnosticsDefaultInformation", p.cyan)
hi("LspDiagnosticsDefaultHint", p.green)

-- diff/git
hi("DiffAdd", p.green)
hi("DiffChange", p.yellow)
hi("DiffDelete", p.red)
hi("GitGutterAdd", p.green)
hi("GitGutterChange", p.yellow)
hi("GitGutterDelete", p.red)

-- telescope
hi("TelescopeBorder", p.gutter_fg)
hi("TelescopeNormal", p.fg, p.bg)
hi("TelescopePromptPrefix", p.orange, nil, "bold")

-- misc
hi("MatchParen", nil, "#112233", "bold")
hi("SearchResult", p.bg, p.yellow)
