local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

local DEFAULT_CONFIG = {
  italic_comment = true,
  transparent_bg = false,
  colors = require("themes.cobalt.palette"),
  overrides = {},
  theme = "cobalt",
}

local TRANSPARENTS = {
  "Normal",
  "SignColumn",
  "NvimTreeNormal",
  "NvimTreeVertSplit",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
}

local function apply_term_colors(colors)
  g.terminal_color_0 = colors.bg_darker
  g.terminal_color_1 = colors.diagnostic_error
  g.terminal_color_2 = colors.diagnostic_hint
  g.terminal_color_3 = colors.constant
  g.terminal_color_4 = colors.type
  g.terminal_color_5 = colors.number
  g.terminal_color_6 = colors.comment
  g.terminal_color_7 = colors.fg
  g.terminal_color_8 = colors.nontext
  g.terminal_color_9 = colors.diagnostic_error
  g.terminal_color_10 = colors.diagnostic_hint
  g.terminal_color_11 = colors.constant
  g.terminal_color_12 = colors.type
  g.terminal_color_13 = colors.number
  g.terminal_color_14 = colors.comment
  g.terminal_color_15 = colors.fg
  g.terminal_color_background = colors.bg
  g.terminal_color_foreground = colors.fg
end

local function override_groups(groups, overrides)
  for group, setting in pairs(overrides) do
    groups[group] = setting
  end
  return groups
end

local function apply(configs)
  local colors = configs.colors
  apply_term_colors(colors)
  local groups = require("themes.cobalt.groups").setup(configs)

  if configs.transparent_bg then
    for _, group in ipairs(TRANSPARENTS) do
      if groups[group] then
        groups[group].bg = nil
      end
    end
  end

  if type(configs.overrides) == "table" then
    groups = override_groups(groups, configs.overrides)
  elseif type(configs.overrides) == "function" then
    groups = override_groups(groups, configs.overrides(colors))
  end

  for group, setting in pairs(groups) do
    nvim_set_hl(0, group, setting)
  end
end

local user_configs = {}

local function get_configs()
  return tbl_deep_extend("force", DEFAULT_CONFIG, user_configs)
end

local function setup(configs)
  if type(configs) == "table" then
    user_configs = configs
  end
end

local function load(theme)
  if vim.fn.has("nvim-0.7") ~= 1 then
    vim.notify("cobalt: you must use neovim 0.7 or higher")
    return
  end

  if g.colors_name then
    cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    cmd("syntax reset")
  end

  o.background = "dark"
  o.termguicolors = true
  g.colors_name = theme or "cobalt"

  apply(get_configs())
end

return {
  load = load,
  setup = setup,
  configs = get_configs,
  colors = function()
    return get_configs().colors
  end,
}
