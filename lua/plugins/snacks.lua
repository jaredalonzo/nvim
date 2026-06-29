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
          wo = {
            winbar = "%#Title# 󰆍 %{get(b:, 'term_title', 'Terminal')} %*",
          },
        },
      },
    },
  },
}
