return {
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
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "InsertEnter",
    keys = {
      { "<leader>gh", "<cmd>Gitsig preview_hunk<cr>" },
      { "<leader>gs", "<cmd>Gitsig stage_hunk<cr>" },
      { "<leader>gu", "<cmd>Gitsig undo_stage_hunk<cr>" },
      { "<leader>gb", "<cmd>Gitsig blame_line<cr>" },
    },
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "InsertEnter",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
    },
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', lazy = true },
    },
    ft = { 'sql', 'mysql', 'plsql' },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }
}
