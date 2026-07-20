return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
      python = { "mypy", "ruff" },
    },
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.expand("~/.config/nvim/markdownlint.jsonc"), "--" },
      },
    },
  },
}
