vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "gemini-dark"

-- Gemini Code Block Palette
local bg = "#000000" -- Deep slate canvas
local fg = "#ffffff" -- Off-white text
local comment = "#80868b" -- Muted Google gray
local keyword = "#969dff" -- Pinkish/magenta for control flow
local function_ = "#8ab4f8" -- Crisp blue for functions/methods
local constant = "#ff96da" -- Pastel red/orange for numbers/constants
local type_ = "#ffdb0f" -- Warm yellow for types/classes
local visual = "#3c4043" -- Selection highlight
local string_ = "#60d673" -- Strings

local highlights = {
  -- Base
  Normal = { fg = fg, bg = bg },
  NormalFloat = { fg = fg, bg = bg },
  Comment = { fg = comment, italic = true },

  -- Syntax Hierarchy
  Constant = { fg = constant },
  String = { fg = string_ },
  Character = { fg = string_ },
  Number = { fg = fg },
  Boolean = { fg = fg, bold = true },
  Float = { fg = fg },

  Identifier = { fg = fg },
  Function = { fg = function_ },

  -- TreeSitter & LSP Highlights (Crucial for modern Neovim/LazyVim)
  ["@variable"] = { fg = fg }, -- Standard variables
  ["@variable.builtin"] = { fg = keyword }, -- self, absolute constants, etc.
  ["@variable.parameter"] = { fg = fg }, -- Function arguments (_processor_name, message)
  ["@variable.member"] = { fg = fg }, -- Struct/Map keys and fields (key:, data:)
  ["@property"] = { fg = fg }, -- Properties/fields
  ["@attribute"] = { fg = type_ }, -- Elixir attributes like @module_attribute
  ["@keyword.operator"] = { fg = fg }, -- Operators that are words (e.g., 'do', 'end', 'in')

  -- Keep these as type_ (yellow) for definitions/structs if desired:
  ["@function.elixir"] = { fg = type_ },
  ["@function.call.elixir"] = { fg = fg },
  ["@number.elixir"] = { fg = type_ },

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
  ["@constructor.elixir"] = { fg = type_ }, -- Often catches the defined module name
  ["@namespace.elixir"] = { fg = fg }, -- Keeps regular namespaces white

  Statement = { fg = fg },
  Conditional = { fg = fg },
  Repeat = { fg = fg },
  Label = { fg = fg },
  Operator = { fg = fg },
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
  SpecialChar = { fg = constant },
  Tag = { fg = keyword },
  Delimiter = { fg = fg },
  Debug = { fg = constant },

  -- Editor UI Elements
  CursorLine = { bg = "#252526" },
  LineNr = { fg = comment },
  CursorLineNr = { fg = function_, bold = true },
  Visual = { bg = visual },
  Search = { bg = "#41331c", fg = "#fdd663" },
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
  Pmenu = { bg = "#1a1a1a", fg = fg }, -- Very dark gray dropdown background
  PmenuSel = { bg = visual, fg = fg }, -- Color of the currently selected item
  PmenuSbar = { bg = "#111111" }, -- Scrollbar background
  PmenuThumb = { bg = comment }, -- Scrollbar handle
}

for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end
