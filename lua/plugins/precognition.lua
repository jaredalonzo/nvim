return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    -- show hints as soon as you enter a buffer (toggle off if it feels noisy)
    startVisible = true,
    showBlankVirtLine = true,
    highlightColor = { link = "Comment" },
    hints = {
      Caret = { text = "^", prio = 2 },
      Dollar = { text = "$", prio = 1 },
      MatchingPair = { text = "%", prio = 5 },
      Zero = { text = "0", prio = 1 },
      w = { text = "w", prio = 10 },
      b = { text = "b", prio = 9 },
      e = { text = "e", prio = 8 },
      W = { text = "W", prio = 7 },
      B = { text = "B", prio = 6 },
      E = { text = "E", prio = 5 },
    },
  },
  keys = {
    { "<leader>uP", function() require("precognition").toggle() end, desc = "Toggle Precognition" },
  },
}
