return {
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      filetypes = {
        "css",
        "scss",
        "sass",
        "less",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "lua",
      },
      user_commands = true,
      options = {
        parsers = {
          css = true,
          css_fn = true,
          rgb = { enable = true },
          hsl = { enable = true },
          hex = { rrggbbaa = true },
          names = { enable = false },
        },
        display = {
          mode = "background",
        },
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },
}
