return {
  { "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
  { "savq/melange-nvim" },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "ray-x/aurora", lazy = false, priority = 1000 },
  { "embark-theme/vim", lazy = false, priority = 1000, name = "embark" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "uhs-robert/oasis.nvim", lazy = false, priority = 1000 },
  { "NLKNguyen/papercolor-theme", lazy = false, priority = 1000 },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "github_light_default",
      --colorscheme = "matugen",
      --colorscheme = "melange",
      -- colorscheme = "randombones",
      colorscheme = "oasis-canyon",
    },
  },
}
