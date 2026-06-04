return {
  { "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
  { "savq/melange-nvim" },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "ray-x/aurora", lazy = false, priority = 1000 },
  { "oxfist/night-owl.nvim", lazy = false, priority = 1000 },
  { "embark-theme/vim", lazy = false, priority = 1000, name = "embark" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "uhs-robert/oasis.nvim", lazy = false, priority = 1000 },
  -- {
  --   "daedlock/matugen.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("matugen").setup({
  --       colors_path = "~/.config/matugen/colors.json",
  --     })
  --     vim.cmd.colorscheme("matugen")
  --   end,
  -- },
  { "NLKNguyen/papercolor-theme", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "github_light_default",
      --colorscheme = "matugen",
      --colorscheme = "melange",
      --colorscheme = "night-owl",
      colorscheme = "oasis-starlight",
    },
  },
}
