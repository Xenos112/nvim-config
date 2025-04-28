return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {
      keymaps = {
        accept_suggestion = "<C-y>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>" },
    },
  },
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
    end
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'vimpostor/vim-tpipeline',
    dependencies = { 'nvim-lualine/lualine.nvim' },
    lazy = false,
    opts = {},
    config = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_clearstl = 1
    end
  }
}
