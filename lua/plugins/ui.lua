return {
  {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    opts = {},
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
      local colors = {
        pine           = '#31748f',
        foam           = '#9ccfd8',
        base           = '#191724',
        text           = '#e0def4',
        love           = '#eb6f92',
        iris           = '#c4a7e7',
        hightlight_med = '#403d5200',
      }

      local rose_pine = {
        normal = {
          a = { fg = colors.base, bg = colors.pine },
          b = { fg = colors.pine, bg = colors.hightlight_med },
          c = { fg = colors.pine, bg = colors.hightlight_med },
          x = { bg = colors.hightlight_med, fg = colors.pine },
          y = { bg = colors.pine, fg = colors.base },
          z = { bg = colors.pine, fg = colors.base },
        },

        insert = { a = { fg = colors.base, bg = colors.pine } },
        visual = { a = { fg = colors.base, bg = colors.love }, b = { fg = colors.love }, y = { bg = colors.love, fg = colors.base }, z = { bg = colors.love, fg = colors.base } },
        replace = { a = { fg = colors.base, bg = colors.love } },

        inactive = {
          a = { fg = colors.text, bg = colors.base },
          b = { fg = colors.text, bg = colors.base },
          c = { fg = colors.text },
        },
      }
      require('lualine').setup {
        options = {
          component_separators = '',
          theme = rose_pine,
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { right = '' }, right_padding = 2 },
            {
              function()
                local devicons = require('nvim-web-devicons')
                local filename = vim.fn.expand('%:t') -- Get the filename
                local ext = vim.fn.expand('%:e')      -- Get the file extension
                local icon, _ = devicons.get_icon(filename, ext, { default = true })
                return vim.trim(icon or '')
              end,
            },
            { 'filename', separator = { right = '' }, right_padding = 2 },
          },

          lualine_b = { 'branch', 'diagnostics' },
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
