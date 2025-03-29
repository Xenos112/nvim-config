return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    keys = {
      { "<leader>e", "<cmd>Oil<CR>" }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = function()
      local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.bg, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.bg, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.bg, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.bg, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = colors.bg_dark })
      return {
        defaults = {
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          layout_config = {
            prompt_position = "bottom",
            preview_width = 0.0,
            preview_cutoff = 9999,
          },

          previewer = false,
        },
      }
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true } },
      { "<leader>fw", "<cmd>Telescope live_grep<CR>",  { silent = true } },
      { "<leader>fg", "<cmd>Telescope git_files<CR>",  { silent = true } },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",  { silent = true } },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>h", ":lua require(\"harpoon.mark\").add_file()<CR>",        { silent = true } },
      { "<leader>H", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", { silent = true } },
    }
  }
}
