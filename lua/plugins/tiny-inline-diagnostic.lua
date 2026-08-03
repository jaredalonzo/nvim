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
      show_all_diags_on_cursorline = true, -- only the cursor line's diagnostics
    },
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)
    vim.diagnostic.config({ virtual_text = false }) -- avoid double-rendering with LazyVim's default

    -- By default only the FIRST diagnostic on the cursor line gets the CursorLine
    -- background band; subsequent ones are forced transparent (NoBg). Give every
    -- diagnostic on the cursor line the same band by treating it as index_diag == 1.
    local hl = require("tiny-inline-diagnostic.highlights")
    local orig = hl.get_diagnostic_highlights
    hl.get_diagnostic_highlights = function(blend_factor, diag_ret, curline, index_diag)
      if diag_ret.line == curline and not diag_ret.need_to_be_under then
        index_diag = 1
      end
      return orig(blend_factor, diag_ret, curline, index_diag)
    end
  end,
}
