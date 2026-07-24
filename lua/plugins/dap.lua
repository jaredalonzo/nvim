return {
  -- The dap.core extra (enabled in lazyvim.json) configures nvim-dap. Without it,
  -- the lang.python / lang.typescript extras pull in nvim-dap with no `config` and
  -- an empty `opts`, so lazy.nvim falls back to `require("dap").setup({})` -- and
  -- nvim-dap has no `setup()` -- crashing on startup with
  -- "attempt to call field 'setup' (a nil value)".
  --
  -- mason-nvim-dap.nvim is not compatible with mason.nvim v2.x, so it never
  -- installs. dap.core still guards on `LazyVim.has("mason-nvim-dap.nvim")` and
  -- would call `require("mason-nvim-dap").setup()` on the missing module.
  -- Disabling it makes that guard short-circuit. Python/JS debugging still work
  -- via nvim-dap-python (debugpy) and the js-debug adapter.
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
}
