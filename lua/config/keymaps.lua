-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal toggle for snacks
vim.keymap.set({ "n", "t" }, "<C-q>", function()
  Snacks.terminal.toggle(nil, { cwd = LazyVim.root() })
end, { desc = "Toggle Terminal (root)" })

-- LSP references -> location list (window-local), viewed in Trouble
vim.keymap.set("n", "grl", function()
  vim.lsp.buf.references(nil, { loclist = true })
  vim.cmd("Trouble loclist toggle")
end, { desc = "References -> Loclist (Trouble)" })
