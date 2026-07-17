return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    win = {
      wo = {
        wrap = true,
      },
    },
    preview = {
      type = "float",
      relative = "editor",
      border = "rounded",
      title = " 󰛐 Preview ",
      title_pos = "center",
      position = { 0, -2 },
      size = { width = 0.3, height = 0.3 },
      zindex = 200,
    },
  },
}
