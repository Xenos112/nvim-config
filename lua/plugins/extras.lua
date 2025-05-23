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
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
