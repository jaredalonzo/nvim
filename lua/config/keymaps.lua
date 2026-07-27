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

-- Restart all LSP clients attached to the current buffer, then reattach.
-- Handy when generated files change on disk and tsserver holds a stale copy.
vim.keymap.set("n", "<leader>cL", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  if vim.tbl_isempty(clients) then
    vim.notify("No LSP clients attached to this buffer", vim.log.levels.WARN)
    return
  end
  for _, client in ipairs(clients) do
    client:stop()
  end
  vim.defer_fn(function()
    vim.cmd("edit") -- reload buffer to trigger reattach
    vim.notify("LSP restarted", vim.log.levels.INFO)
  end, 200)
end, { desc = "Restart LSP (buffer)" })
