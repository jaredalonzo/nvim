return {
  "echasnovski/mini.animate",
  opts = function(_, opts)
    local animate = require("mini.animate")
    opts.cursor = vim.tbl_deep_extend("force", opts.cursor or {}, {
      path = animate.gen_path.line({
        predicate = function(destination)
          -- animate if moving 2+ lines or 2+ columns
          return math.abs(destination[1]) > 1 or math.abs(destination[2]) > 1
        end,
      }),
    })
  end,
}
