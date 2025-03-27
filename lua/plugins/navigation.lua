return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>e", ":Neotree toggle<CR>" },
    },
    opts = {
      window = {
        width = 25,
      }
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = function()
      local pine_border_color = "#31748f"
      local pine_background_color = "#191724"
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = pine_border_color, bg = pine_background_color })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = pine_border_color, bg = pine_background_color })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = pine_border_color, bg = pine_background_color })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = pine_border_color, bg = pine_background_color })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = pine_background_color })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = pine_background_color })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = pine_background_color })
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
      { "<leader>ff", ":Telescope find_files<CR>", { silent = true } },
      { "<leader>fw", ":Telescope live_grep<CR>",  { silent = true } },
      { "<leader>fg", ":Telescope git_files<CR>",  { silent = true } },
      { "<leader>fh", ":Telescope help_tags<CR>",  { silent = true } },
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
