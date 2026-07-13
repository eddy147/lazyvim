vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "cobalt"

-- Gemini Code Block Palette
local bg = "#0040FF"
local bg_darker = "#0033cc"
local fg = "#eeeeff"
local comment = "#bbdddd"
local keyword = "#e6ddff"
local function_ = "#ffffff"
local constant = "#ffff99"
local type_ = "#acdadc"
local visual = "#0030eb"
local string_ = function_
local variable = "#eeeeee"
local number = "#e9a4f4"
local operator = constant
local key = type_
local value = constant
local nontext = "#3359ff"

local highlights = {
  -- Base
  Normal = { fg = fg, bg = bg },
  NormalFloat = { fg = comment, bg = bg },
  FloatBorder = { fg = nontext, bg = bg },
  Comment = { fg = comment, italic = true },

  -- Syntax Hierarchy
  Constant = { fg = constant, bold = false },
  String = { fg = string_ },
  Character = { fg = string_ },
  Number = { fg = fg },
  Boolean = { fg = fg, bold = true },
  Float = { fg = fg },

  Identifier = { fg = fg },
  Function = { fg = function_ },

  envField = { fg = key },
  envValue = { fg = value },

  -- TreeSitter & LSP Highlights (Crucial for modern Neovim/LazyVim)
  ["@variable"] = { fg = variable }, -- Standard variables
  ["@variable.elixir"] = { fg = variable, underline = false }, -- Standard variables
  ["@string.special.symbol.elixir"] = { fg = type_ }, -- Standard variables
  ["@variable.builtin"] = { fg = keyword }, -- self, absolute constants, etc.
  ["@variable.parameter"] = { fg = variable }, -- Function arguments (_processor_name, message)
  ["@variable.member"] = { fg = variable }, -- Struct/Map keys and fields (key:, data:)
  ["@property"] = { fg = fg }, -- Properties/fields
  ["@attribute"] = { fg = variable }, -- Elixir attributes like @module_attribute
  ["@function"] = { fg = constant, italic = true },
  ["@function.elixir"] = { fg = constant, italic = true },
  ["@function.call.elixir"] = { fg = function_ },
  ["@function.call"] = { fg = function_, underline = true },
  ["@number.elixir"] = { fg = number },
  ["@constant.elixir"] = { fg = number },

  -- LSP Semantic Tokens fallback
  ["@lsp.type.variable"] = { fg = fg },
  ["@lsp.type.parameter"] = { fg = fg },
  ["@lsp.type.property"] = { fg = fg },

  -- Elixir Module & Namespace Rules
  ["@module"] = { fg = type_ }, -- General module calls (e.g., Broadway.start_link)
  ["@module.elixir"] = { fg = fg }, -- General module calls (e.g., Broadway.start_link)
  ["@lsp.type.namespace"] = { fg = fg }, -- Aliases in code blocks

  -- Force definitions and structural types to stay yellow
  ["@type"] = { fg = type_ }, -- General types
  ["@type.elixir"] = { fg = type_ }, -- General types
  ["@type.definition"] = { fg = type_ }, -- Fallback for definitions
  ["@keyword.directive"] = { fg = keyword }, -- For 'defmodule', 'use', 'alias'

  -- The precise TreeSitter nodes for Elixir module definitions
  ["@constructor.elixir"] = { fg = type_ },
  ["@namespace.elixir"] = { fg = fg },
  ["@keyword.operator"] = { fg = operator }, -- Operators that are words (e.g., 'do', 'end', 'in')
  ["@keyword"] = { fg = keyword },
  ["@keyword.elixir"] = { fg = keyword, underline = false },
  ["@keyword.lua"] = { fg = keyword, underline = false },

  -- Markdown
  ["@markup.raw.block"] = { bg = bg },

  Statement = { fg = fg },
  Conditional = { fg = fg },
  Repeat = { fg = fg },
  Label = { fg = fg },
  Operator = { fg = operator },
  Keyword = { fg = keyword },
  Exception = { fg = keyword },

  PreProc = { fg = fg },
  Include = { fg = fg },
  Define = { fg = fg },
  Macro = { fg = fg },

  Type = { fg = type_ },
  StorageClass = { fg = keyword },
  Structure = { fg = type_ },
  Typedef = { fg = type_ },

  Special = { fg = fg },
  SpecialChar = { fg = type_ },
  Tag = { fg = keyword },
  Delimiter = { fg = fg },
  Debug = { fg = constant },

  RenderMarkdownCode = { fg = fg, italic = true, bg = bg_darker },

  -- Editor UI Elements
  CursorLine = { bg = "#0033cc" },
  LineNr = { fg = comment },
  CursorLineNr = { fg = "#FFFFFF", bold = true },
  Visual = { bg = visual },
  Search = { bg = "#002cb2", fg = type_ },
  IncSearch = { bg = "#fdd663", fg = bg },

  -- Diagnostics (LSP Errors, Warnings, etc.)
  DiagnosticError = { fg = "#ff6b6b" }, -- Bright pastel red for errors
  DiagnosticWarn = { fg = "#ffb86c" }, -- Bright orange for warnings
  DiagnosticInfo = { fg = "#8ab4f8" }, -- Blue for info
  DiagnosticHint = { fg = "#60d673" }, -- Green for hints

  -- Underlines in the text itself
  DiagnosticUnderlineError = { undercurl = true, sp = "#ff6b6b" },
  DiagnosticUnderlineWarn = { undercurl = true, sp = "#ffb86c" },
  DiagnosticUnderlineInfo = { undercurl = true, sp = "#8ab4f8" },
  DiagnosticUnderlineHint = { undercurl = true, sp = "#60d673" },

  -- Dropdown / Autocomplete Menu (Pmenu)
  Pmenu = { bg = "#0033CC", fg = fg }, -- Very dark gray dropdown background
  PmenuSel = { bg = visual, fg = fg }, -- Color of the currently selected item
  PmenuSbar = { bg = "#002699" }, -- Scrollbar background
  PmenuThumb = { bg = "#002cb2" }, -- Scrollbar handle

  -- Snacks Explorer / Picker readability
  SnacksPickerPathHidden = { fg = constant },
  SnacksPickerPathIgnored = { fg = constant },
  SnacksPickerDir = { fg = fg },
  SnacksPickerDirectory = { fg = fg },
  SnacksPickerGitStatusIgnored = { fg = fg },
  SnacksPickerGitStatusUntracked = { fg = fg },
  -- SnacksIndentScope = { fg = "#aaaaaa" },
  -- SnacksIndentChunk = { fg = "#aaaaaa" },
  SnacksIndent = { fg = nontext },
  SnacksPickerBorder = { fg = nontext },
  SnacksPickerTotals = { fg = constant },

  WinSeparator = { fg = nontext, bg = bg },
  VertSplit = { fg = nontext, bg = bg },
}

for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end
