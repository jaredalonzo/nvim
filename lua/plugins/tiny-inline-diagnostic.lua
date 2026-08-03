return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000, -- load early so it wins over other diagnostic UI
  opts = {
    preset = "modern", -- try: "classic", "minimal", "powerline", "ghost", "simple"
    transparent_bg = true, -- no background box; blends with transparent tokyonight
    options = {
      show_source = false, -- set true to show the linter/LSP name (e.g. "mypy")
      multilines = true, -- render multi-line messages instead of truncating
      show_all_diags_on_cursorline = false, -- only the cursor line's diagnostics
    },
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)
    vim.diagnostic.config({ virtual_text = false }) -- avoid double-rendering with LazyVim's default
  end,
}
