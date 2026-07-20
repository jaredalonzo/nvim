-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Remove background colors for floating windows to make them fully clear
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "LazyNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TermFloatNormal", { fg = "#ffffff", bg = "none" })
    vim.api.nvim_set_hl(0, "SidekickChat", { fg = "#ffffff", bg = "none" })
  end,
})

-- Force white foreground in the snacks terminal floating window
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "snacks_terminal" },
  callback = function(ev)
    vim.schedule(function()
      for _, win in ipairs(vim.fn.win_findbuf(ev.buf)) do
        -- start from the plugin's own winhighlight so WinBar/Title/etc. survive
        local current = vim.api.nvim_get_option_value("winhighlight", { win = win })
        local map = {}
        for _, pair in ipairs(vim.split(current, ",", { trimempty = true })) do
          local from, to = pair:match("^(%w+):(%w+)$")
          if from then
            map[from] = to
          end
        end
        -- override only the "body" groups
        map.Normal = "TermFloatNormal"
        map.NormalNC = "TermFloatNormal"
        map.NormalFloat = "TermFloatNormal"
        local parts = {}
        for from, to in pairs(map) do
          parts[#parts + 1] = from .. ":" .. to
        end
        vim.api.nvim_set_option_value("winhighlight", table.concat(parts, ","), { win = win })
      end
    end)
  end,
})

-- Ensure .venv is correctly set for Python projects
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    local root = vim.fs.root(args.buf, { ".venv" })
    if not root then
      return
    end
    local py = root .. "/.venv/bin/python"
    if vim.fn.executable(py) == 1 then
      local ok, vs = pcall(require, "venv-selector")
      if ok then
        vs.activate_from_path(py)
      end
    end
  end,
})
