return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      mux = {
        enabled = true,
        backend = "tmux",
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
