return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      separator_style = "thin",
      show_buffer_close_icons = true,
      indicator = { style = "underline" },
      hover = {
        enabled = true,
        delay = 150,
        reveal = { "close" },
      },
      highlights = {
        fill = { bg = "none" },
        separator = { bg = "none" },
        separator_visible = { bg = "none" },
        separator_selected = { bg = "none" },
      },
    },
  },
}
