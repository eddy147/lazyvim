return {
  {
    "https://gitlab.com/itaranto/preview.nvim",
    version = "*",
    cmd = { "PreviewFile" },
    keys = {
      { "<leader>up", "<cmd>PreviewFile<cr>", desc = "Preview PlantUML", ft = "plantuml" },
    },
    opts = {
      previewers_by_ft = {
        plantuml = {
          name = "plantuml_text",
          renderer = {
            type = "buffer",
            opts = { split_cmd = "vsplit" },
          },
        },
      },
      render_on_write = true,
    },
  },
}
