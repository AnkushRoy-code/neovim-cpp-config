return {
  { "numToStr/Comment.nvim", opts = {} },
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  {                  -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
}
