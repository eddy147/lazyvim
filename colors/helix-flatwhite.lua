-- ~/.config/nvim/colors/helix-flatwhite.lua
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "helix-flatwhite"

-- Helix flatwhite palette definition
local p = {
  base1 = "#605a52",
  base2 = "#93836c",
  base3 = "#b9a992",
  base4 = "#dcd3c6",
  base5 = "#e4ddd2",
  base6 = "#f1ece4",
  base7 = "#f7f3ee",
  accent = "#6a4cff",
  orange_text = "#5b5143",
  orange_text_sec = "#957f5f",
  orange_bg = "#f7e0c3",
  green_text = "#525643",
  green_text_sec = "#81895d",
  green_bg = "#e2e9c1",
  teal_text = "#465953",
  teal_text_sec = "#5f8c7d",
  teal_bg = "#d2ebe3",
  black_txt = "#000000",
  blue_text = "#4c5361",
  blue_text_sec = "#7382a0",
  blue_bg = "#dde4f2",
  purple_text = "#614c61",
  purple_text_sec = "#9c739c",
  purple_bg = "#f1ddf1",
  diff_add = "#2db448",
  diff_change = "#f2a60d",
  diff_delete = "#ff1414",
  white = "#ffffff",
}

local hl = {
  -- Editor Base UI
  Normal = { fg = p.base1, bg = p.base7 },
  NormalFloat = { fg = p.base1, bg = p.base6 },
  FloatBorder = { fg = p.base3, bg = p.base6 },
  ColorColumn = { bg = p.base6 },
  LineNr = { fg = p.base3, bg = p.base6 },
  CursorLineNr = { fg = p.base1, bg = p.base6, bold = true },
  Visual = { bg = p.base4 },
  VisualNOS = { bg = p.base4 },
  Search = { fg = p.base1, bg = p.orange_bg },
  IncSearch = { fg = p.base1, bg = p.orange_bg },
  SignColumn = { bg = p.base7 },
  VertSplit = { fg = p.base4, bg = p.base7 },
  WinSeparator = { fg = p.base4, bg = p.base7 },
  StatusLine = { fg = p.base7, bg = p.base1, bold = true },
  StatusLineNC = { fg = p.base7, bg = p.base3 },

  -- Pmenu (Completion Menu)
  Pmenu = { fg = p.base1, bg = p.base6 },
  PmenuSel = { fg = p.base7, bg = p.base1 },
  PmenuSbar = { bg = p.base5 },
  PmenuThumb = { bg = p.base3 },

  -- Syntax Base
  Comment = { fg = p.base2, bg = p.base6 },
  Constant = { fg = p.blue_text, bg = p.blue_bg },
  String = { fg = p.green_text, bg = p.green_bg },
  Character = { fg = p.green_text, bg = p.green_bg },
  Number = { fg = p.blue_text, bg = p.blue_bg },
  Boolean = { fg = p.blue_text, bg = p.blue_bg },
  Float = { fg = p.blue_text, bg = p.blue_bg },
  Identifier = { fg = p.base1 },
  Function = { fg = p.base1, bold = true },
  Statement = { fg = p.purple_text, bg = p.purple_bg },
  Keyword = { fg = p.purple_text, bg = p.purple_bg },
  PreProc = { fg = p.purple_text, bg = p.purple_bg },
  Type = { fg = p.base1 },
  Special = { fg = p.blue_text, bg = p.green_bg },
  Underlined = { underline = true },
  Error = { fg = p.diff_delete },
  Todo = { fg = p.orange_text, bg = p.orange_bg, bold = true },
  MoreMsg = { fg = p.base1, bold = true },
  Title = { fg = p.purple_text, bold = true },

  -- TreeSitter & LSP Groups
  ["@comment"] = { fg = p.base2, bg = p.base6 },
  ["@variable"] = { fg = p.base1 },
  ["@variable.parameter"] = { fg = p.blue_text, bg = p.blue_bg },
  ["@variable.member"] = { fg = p.base1 },
  ["@keyword"] = { fg = p.purple_text, bg = p.purple_bg },
  ["@string"] = { fg = p.green_text, bg = p.green_bg },
  ["@number"] = { fg = p.blue_text, bg = p.blue_bg },
  ["@boolean"] = { fg = p.blue_text, bg = p.blue_bg },
  ["@type"] = { fg = p.base1 },
  ["@type.builtin"] = { fg = p.base1 },
  ["@function"] = { fg = p.base1, bold = true },
  ["@function.call"] = { fg = p.base1 },
  ["@constructor"] = { fg = p.base1 },
  ["@operator"] = { fg = p.black_txt },
  ["@module"] = { fg = p.teal_text, bg = p.teal_bg },
  ["@attribute"] = { fg = p.blue_text, bg = p.blue_bg },
  ["@punctuation.bracket"] = { bold = true },
  ["@punctuation.delimiter"] = { fg = p.base1 },

  -- LSP Semantic Token Support
  ["@lsp.type.variable"] = { fg = p.base1 },
  ["@lsp.type.parameter"] = { fg = p.blue_text, bg = p.blue_bg },
  ["@lsp.type.keyword"] = { fg = p.purple_text, bg = p.purple_bg },
  ["@lsp.type.namespace"] = { fg = p.teal_text, bg = p.teal_bg },

  -- Diagnostics
  DiagnosticError = { fg = p.diff_delete },
  DiagnosticWarn = { fg = p.orange_text, bg = p.orange_bg },
  DiagnosticInfo = { fg = p.orange_text, bg = p.orange_bg },
  DiagnosticHint = { bold = true },
  DiagnosticUnderlineError = { undercurl = true, sp = p.diff_delete },
  DiagnosticUnderlineWarn = { undercurl = true, sp = p.orange_text },

  -- Indent lines (Subtle, avoiding dark bold lines)
  MiniIndentscopeSymbol = { fg = p.base4, bold = false },
  MiniIndentscopePrefix = { fg = p.base4, bold = false },
  SnacksIndent = { fg = p.base5 },
  SnacksIndentScope = { fg = p.base4, bold = false },
  IblIndent = { fg = p.base5 },
  IblScope = { fg = p.base4, bold = false },

  -- Directory & Explorer (Snacks.nvim)
  Directory = { fg = p.base1, bold = true },
  SnacksPickerDirectory = { fg = p.base1, bold = true },
  SnacksExplorerDirectory = { fg = p.base1, bold = true },
  SnacksPickerPath = { fg = p.base3 },

  -- Snacks Picker & Explorer Git Status Highlights
  SnacksPickerGitStatusIgnored = { fg = p.base3 }, -- Ignored files/dirs (.git, node_modules)
  SnacksPickerGitStatusUntracked = { fg = p.teal_text, bg = p.teal_bg, italic = true }, -- Untracked files/dirs
  SnacksPickerGitStatusModified = { fg = p.orange_text, bg = p.orange_bg }, -- Modified files/dirs
  SnacksPickerGitStatusStaged = { fg = p.green_text, bg = p.green_bg }, -- Staged files/dirs
  SnacksPickerGitStatusDeleted = { fg = p.diff_delete }, -- Deleted files
  SnacksPickerGitStatusRenamed = { fg = p.purple_text, bg = p.purple_bg }, -- Renamed files

  -- GitSigns (Sign Column Next to Line Numbers)
  GitSignsAdd = { fg = p.diff_add, bg = p.base7 },
  GitSignsChange = { fg = p.diff_change, bg = p.base7 },
  GitSignsDelete = { fg = p.diff_delete, bg = p.base7 },
  GitSignsChangedelete = { fg = p.diff_change, bg = p.base7 },
  GitSignsTopdelete = { fg = p.diff_delete, bg = p.base7 },
  GitSignsUntracked = { fg = p.teal_text_sec, bg = p.base7 },

  -- GitSigns Number Line Highlights (If number column highlighting is enabled)
  GitSignsAddNr = { fg = p.diff_add },
  GitSignsChangeNr = { fg = p.diff_change },
  GitSignsDeleteNr = { fg = p.diff_delete },

  -- Floating Preview & Picker Windows
  SnacksPickerPreview = { fg = p.base1, bg = p.base6 },

  -- Git Hunk / Diff Preview Highlights (Subtle light-theme tint)
  DiffAdd = { fg = p.green_text, bg = p.green_bg },
  DiffChange = { fg = p.orange_text, bg = p.orange_bg },
  DiffDelete = { fg = p.diff_delete, bg = p.purple_bg },
  DiffText = { fg = p.base1, bg = p.orange_bg, bold = true },

  -- Syntax highlights within diff windows
  diffAdded = { fg = p.green_text, bg = p.green_bg },
  diffRemoved = { fg = p.diff_delete, bg = p.purple_bg },
  diffChanged = { fg = p.orange_text, bg = p.orange_bg },
  diffOldFile = { fg = p.orange_text },
  diffNewFile = { fg = p.green_text },
  diffFile = { fg = p.blue_text, bold = true },
  diffLine = { fg = p.base3 },

  -- Cursor Highlights
  Cursor = { fg = p.base7, bg = p.base1 }, -- Dark brown/gray block with light text
  TermCursor = { fg = p.base7, bg = p.base1 },
  CursorColumn = { bg = p.base6 },
  CursorLine = { bg = p.base6 },

  -- Secondary cursor states (Visual mode / Search)
  vCursor = { fg = p.base7, bg = p.purple_text },
  iCursor = { fg = p.base7, bg = p.base1 },
  lCursor = { fg = p.base7, bg = p.base1 },
}

for group, settings in pairs(hl) do
  vim.api.nvim_set_hl(0, group, settings)
end
