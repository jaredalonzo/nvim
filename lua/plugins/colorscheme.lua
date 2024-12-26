return {
  {
    -- "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "storm",
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
