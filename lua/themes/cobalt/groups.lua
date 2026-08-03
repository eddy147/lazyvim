---@param configs table
---@return table<string, vim.api.keyset.highlight>
local function setup(configs)
  local colors = configs.colors

  return {
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.comment, bg = colors.bg },
    FloatBorder = { fg = colors.nontext, bg = colors.bg },
    Comment = { fg = colors.comment, italic = configs.italic_comment },

    Constant = { fg = colors.constant, bold = false },
    String = { fg = colors.func },
    Character = { fg = colors.func },
    Number = { fg = colors.fg },
    Boolean = { fg = colors.fg, bold = true },
    Float = { fg = colors.fg },

    Identifier = { fg = colors.fg },
    Function = { fg = colors.func },

    envField = { fg = colors.type },
    envValue = { fg = colors.constant },

    ["@variable"] = { fg = colors.variable },
    ["@variable.elixir"] = { fg = colors.variable, underline = false },
    ["@string.special.symbol.elixir"] = { fg = colors.type },
    ["@variable.builtin"] = { fg = colors.keyword },
    ["@variable.parameter"] = { fg = colors.variable },
    ["@variable.member"] = { fg = colors.variable },
    ["@property"] = { fg = colors.fg },
    ["@attribute"] = { fg = colors.variable },
    ["@function"] = { fg = colors.func },
    ["@function.elixir"] = { fg = colors.func, italic = true },
    ["@function.call.elixir"] = { fg = colors.func },
    ["@function.call"] = { fg = colors.func, underline = true, bold = true },
    ["@number.elixir"] = { fg = colors.number },
    ["@constant.elixir"] = { fg = colors.number },

    ["@lsp.type.variable"] = { fg = colors.fg },
    ["@lsp.type.parameter"] = { fg = colors.fg },
    ["@lsp.type.property"] = { fg = colors.fg },

    ["@module"] = { fg = colors.type },
    ["@module.elixir"] = { fg = colors.fg },
    ["@lsp.type.namespace"] = { fg = colors.fg },

    ["@type"] = { fg = colors.type },
    ["@type.elixir"] = { fg = colors.type },
    ["@type.definition"] = { fg = colors.type },
    ["@keyword.directive"] = { fg = colors.keyword },

    ["@constructor.elixir"] = { fg = colors.type },
    ["@namespace.elixir"] = { fg = colors.fg },
    ["@keyword.operator"] = { fg = colors.operator },
    ["@keyword"] = { fg = colors.keyword, bold = true },
    ["@keyword.elixir"] = { fg = colors.keyword, bold = true },
    ["@keyword.lua"] = { fg = colors.keyword, bold = true },

    ["@markup.raw.block"] = { bg = colors.bg },

    Statement = { fg = colors.fg },
    Conditional = { fg = colors.fg },
    Repeat = { fg = colors.fg },
    Label = { fg = colors.fg },
    Operator = { fg = colors.operator },
    Keyword = { fg = colors.keyword },
    Exception = { fg = colors.keyword },

    PreProc = { fg = colors.fg },
    Include = { fg = colors.fg },
    Define = { fg = colors.fg },
    Macro = { fg = colors.fg },

    Type = { fg = colors.type },
    StorageClass = { fg = colors.keyword },
    Structure = { fg = colors.type },
    Typedef = { fg = colors.type },

    Special = { fg = colors.fg },
    SpecialChar = { fg = colors.type },
    Tag = { fg = colors.keyword },
    Delimiter = { fg = colors.fg },
    Debug = { fg = colors.constant },

    RenderMarkdownCode = { fg = colors.fg, italic = true, bg = colors.bg_darker },

    CursorLine = { bg = colors.bg_darker },
    LineNr = { fg = colors.comment },
    CursorLineNr = { fg = "#FFFFFF", bold = true },
    Visual = { bg = colors.visual },
    Search = { bg = colors.search, fg = colors.type },
    IncSearch = { bg = colors.incsearch, fg = colors.bg },

    DiagnosticError = { fg = colors.diagnostic_error },
    DiagnosticWarn = { fg = colors.diagnostic_warn },
    DiagnosticInfo = { fg = colors.diagnostic_info },
    DiagnosticHint = { fg = colors.diagnostic_hint },

    DiagnosticUnderlineError = { undercurl = true, sp = colors.diagnostic_error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.diagnostic_warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.diagnostic_info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.diagnostic_hint },

    Pmenu = { bg = colors.bg_darker, fg = colors.fg },
    PmenuSel = { bg = colors.visual, fg = colors.fg },
    PmenuSbar = { bg = colors.pmenu_sbar },
    PmenuThumb = { bg = colors.search },

    SnacksPickerPathHidden = { fg = colors.constant },
    SnacksPickerPathIgnored = { fg = colors.constant },
    SnacksPickerDir = { fg = colors.fg },
    SnacksPickerDirectory = { fg = colors.fg },
    SnacksPickerGitStatusIgnored = { fg = colors.fg },
    SnacksPickerGitStatusUntracked = { fg = colors.fg },
    SnacksIndent = { fg = colors.nontext },
    SnacksPickerBorder = { fg = colors.nontext },
    SnacksPickerTotals = { fg = colors.constant },

    WinSeparator = { fg = colors.nontext, bg = colors.bg },
    VertSplit = { fg = colors.nontext, bg = colors.bg },
  }
end

return {
  setup = setup,
}
