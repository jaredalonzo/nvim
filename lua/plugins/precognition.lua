return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    -- show hints as soon as you enter a buffer (toggle off if it feels noisy)
    startVisible = true,
    showBlankVirtLine = true,
    -- bright yellow hints, bold, no background (transparent virt line)
    highlightColor = { fg = "#ffc777", bold = true, italic = true },
    targetedMotionHints = {
      enabled = false,
    },
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
    {
      "<leader>uP",
      function()
        require("precognition").toggle()
      end,
      desc = "Toggle Precognition",
    },
  },
  config = function(_, opts)
    require("precognition").setup(opts)

    -- Render the hint line ABOVE the cursor so it doesn't punch a gap
    -- through tiny-inline-diagnostic's multiline overlay below the cursor.
    local mt = getmetatable(require("precognition.renderer").new())
    mt.render_inline_hint_virt_line = function(self, bufnr, cursorline, virt_line)
      if self._extmark and self._extmark_buf ~= bufnr then
        if self._extmark_buf and vim.api.nvim_buf_is_valid(self._extmark_buf) then
          vim.api.nvim_buf_del_extmark(self._extmark_buf, self._ns, self._extmark)
        end
        self._extmark, self._extmark_buf = nil, nil
      end
      self._extmark = vim.api.nvim_buf_set_extmark(bufnr, self._ns, cursorline - 1, 0, {
        id = self._extmark,
        virt_lines = { virt_line },
        virt_lines_above = true, -- render above the cursor line
      })
      self._extmark_buf = bufnr
    end
  end,
}
