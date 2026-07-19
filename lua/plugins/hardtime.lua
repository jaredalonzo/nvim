return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    -- start gentle: hints instead of hard blocking
    restriction_mode = "hint",

    -- keep the mouse usable
    disable_mouse = false,

    -- keys that get rate-limited (nudges you toward better motions)
    restricted_keys = {
      ["h"] = { "n", "x" },
      ["j"] = { "n", "x" },
      ["k"] = { "n", "x" },
      ["l"] = { "n", "x" },
      ["-"] = { "n", "x" },
      ["+"] = { "n", "x" },
      ["gj"] = { "n", "x" },
      ["gk"] = { "n", "x" },
      ["<C-M>"] = { "n", "x" },
      ["<C-N>"] = { "n", "x" },
      ["<C-P>"] = { "n", "x" },
    },

    -- keys fully disabled (arrow-key crutches)
    disabled_keys = {
      ["<Up>"] = { "n", "i", "x" },
      ["<Down>"] = { "n", "i", "x" },
      ["<Left>"] = { "n", "i", "x" },
      ["<Right>"] = { "n", "i", "x" },
    },

    -- don't fire in these filetypes/buffers
    disabled_filetypes = {
      "qf",
      "netrw",
      "NvimTree",
      "lazy",
      "mason",
      "trouble",
      "help",
      "TelescopePrompt",
    },

    max_count = 4, -- allowed repeats before it kicks in
    max_time = 1000, -- window (ms) for counting repeats
  },
}
