return {
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>tc", "<cmd>TodoTelescope<cr>" },
      { "<leader>td", "<cmd>TodoTelescope<cr>" },
    },
  },
  {
    "echasnovski/mini.nvim",
    event = "InsertEnter",
    config = function()
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.ai").setup()
    end,
  },
  {
    'vimpostor/vim-tpipeline',
    event = "VeryLazy",
    config = function()
      vim.cmd [[
        set termguicolors
        let g:tpipeline_autoembed = 1
      ]]
    end
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
