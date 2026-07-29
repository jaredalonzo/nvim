return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      mux = {
        enabled = true,
        backend = "tmux",
      },
      tools = {
        claude = { native_scroll = true },
      },
      win = {
        layout = "float",
        float = {
          border = "rounded",
          width = 0.7,
          height = 0.7,
          title = "   Sidekick ",
          title_pos = "center",
        },
      },
    },
  },
}
