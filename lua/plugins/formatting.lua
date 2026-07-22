return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "ruff_organize_imports" },
      -- prefer dprint when the project configures it, else fall back to prettier
      javascript = { "dprint", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "dprint", "prettierd", "prettier", stop_after_first = true },
      typescript = { "dprint", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "dprint", "prettierd", "prettier", stop_after_first = true },
    },
    formatters = {
      dprint = {
        -- only run dprint in projects that actually configure it
        condition = function(_, ctx)
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1] ~= nil
        end,
      },
    },
  },
}
