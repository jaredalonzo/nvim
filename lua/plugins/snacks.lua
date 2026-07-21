return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        preset = {
          header = [[
                                                                              
               ████ ██████           █████      ██                     
              ███████████             █████                             
              █████████ ███████████████████ ███   ███████████   
             █████████  ███    █████████████ █████ ██████████████   
            █████████ ██████████ █████████ █████ █████ ████ █████   
          ███████████ ███    ███ █████████ █████ █████ ████ █████  
         ██████  █████████████████████ ████ █████ █████ ████ ██████
          ]],
        },
      },
      explorer = {
        replace_netrw = true,
      },
      picker = {
        hidden = true, -- show hidden files
        ignored = true, -- show git-ignored files
        win = {
          input = {
            keys = {
              ["<c-q>"] = false, -- don't send-to-quickfix; free up C-q
            },
          },
          list = {
            keys = {
              ["<c-q>"] = false,
            },
          },
        },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
      terminal = {
        win = {
          position = "float",
          height = 0.8,
          width = 0.8,
          border = "rounded",
          title = " 󰆍 Terminal ",
          title_pos = "center",
          wo = {
            winbar = "%#Title# 󰆍 %{get(b:, 'term_title', 'Terminal')} %*",
          },
        },
      },
    },
  },
}
