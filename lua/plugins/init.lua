return {
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "json",
        "prisma",
        'vuels'
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  },
}
