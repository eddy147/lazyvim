return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "prettier" },
        jsonc = { "prettier" },
        json5 = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = { "--print-width", "140" },
        },
      },
    },
  },
}
