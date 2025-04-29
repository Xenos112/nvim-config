return {
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          -- h5 = "pine",
          -- h6 = "foam",
        },

        highlight_groups = {
          Comment = { fg = "foam" },
          StatusLine = { fg = "love", bg = "love", blend = 15 },
          VertSplit = { fg = "muted", bg = "muted" },
          Visual = { fg = "base", bg = "text", inherit = false },
        },
      })

      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
      require('lualine').setup {
        options = {
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { right = '' }, right_padding = 2 },
            {
              function()
                local devicons = require('nvim-web-devicons')
                local filename = vim.fn.expand('%:t')
                local ext = vim.fn.expand('%:e')
                local icon, _ = devicons.get_icon(filename, ext, { default = true })
                return vim.trim(icon or '')
              end,
            },
            { 'filename', separator = { right = '' }, right_padding = 2 },
          },

          lualine_b = { { 'branch', separator = { right = "" } }, { 'diagnostics', separator = { right = "" } } },
          lualine_c = {
            '%=',
          },
          lualine_x = { { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } } },
          lualine_y = { 'location' },
          lualine_z = {
            { 'progress', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
    end
  }
}
