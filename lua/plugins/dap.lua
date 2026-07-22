return {
  -- mason-nvim-dap.nvim is not compatible with mason.nvim v2.x, so it never
  -- installs. LazyVim's dap spec still guards on `LazyVim.has("mason-nvim-dap.nvim")`,
  -- which returns true (the spec is registered) and then calls
  -- `require("mason-nvim-dap").setup()` on a module that isn't on disk ->
  -- "attempt to call field 'setup' (a nil value)" on startup.
  -- Disabling it here makes LazyVim.has() return false so the guard short-circuits.
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
}
