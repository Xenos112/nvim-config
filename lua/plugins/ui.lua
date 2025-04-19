return {
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup {}
      vim.cmd [[colorscheme rose-pine]]
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
          theme = 'tokyonight',
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
