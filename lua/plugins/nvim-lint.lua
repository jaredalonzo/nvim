return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
      python = { "mypy" },
    },
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.expand("~/.config/nvim/markdownlint.jsonc"), "--" },
      },
      mypy = {
        -- resolve imports/stubs from the project's .venv
        args = function()
          local args = {
            "--show-column-numbers",
            "--hide-error-context",
            "--no-color-output",
            "--no-error-summary",
            "--no-pretty",
          }
          local root = vim.fs.root(0, { ".venv" })
          if root then
            local py = root .. "/.venv/bin/python"
            if vim.fn.executable(py) == 1 then
              table.insert(args, "--python-executable")
              table.insert(args, py)
            end
          end
          return args
        end,
      },
    },
  },
}
