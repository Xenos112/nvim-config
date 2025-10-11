return {
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      local is_transparent = true
      if vim.g.neovide then
        is_transparent = false
      end
      require("rose-pine").setup({
        styles = {
          transparency = is_transparent,
          italic = true,
        },

        groups = {
          border = "foam",
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
        },

        highlight_groups = {
          Comment = { fg = "muted", italic = true },
          StatusLine = { fg = "love", bg = "love", blend = 15 },
          VertSplit = { fg = "muted", bg = "muted" },
          Visual = { fg = "text", bg = "pine", inherit = false },

          -- telescope
          TelescopeBorder = { fg = "pine", bg = "none" },
          TelescopeNormal = { fg = "text", bg = "none" },
          TelescopeSelection = { fg = "pine", bg = "none" },
          TelescopeSelectionCaret = { fg = "love", bg = "none" },
          TelescopeMultiSelection = { fg = "text", bg = "none" },

          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },

          TelescopePromptNormal = { fg = "text", bg = "none" },
          TelescopePromptBorder = { fg = "pine", bg = "none" },

          FloatBorder = { fg = "pine", bg = "none" },

          -- nvim-cmp
          CmpItemAbbrDeprecated = { fg = "love", bg = "none", strikethrough = true },
          CmpItemKindVariable = { fg = "foam", bg = "none" },
          CmpItemKindFunction = { fg = "iris", bg = "none" },
          CmpItemKindProperty = { fg = "iris", bg = "none" },
          CmpItemKindMethod = { fg = "iris", bg = "none" },
          CmpItemKindField = { fg = "iris", bg = "none" },
          CmpItemKindText = { fg = "rose", bg = "none" },
          CmpItemKindKeyword = { fg = "gold", bg = "none" },
          CmpItemKindClass = { fg = "gold", bg = "none" },
          CmpItemAbbrMatch = { fg = "pine", bg = "none" },
          CmpItemAbbrMatchFuzzy = { fg = "pine", bg = "none" },

          -- treesitter
          ["@tag"] = { fg = "rose" },
          ["@function.builtin"] = { italic = true },
          ["@function.macro"] = { italic = true },

        },
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local rose_pine = require("rose-pine.palette")
      local rose_pine_theme = {
        normal = {
          a = { fg = rose_pine.base, bg = rose_pine.pine },
          b = { fg = rose_pine.pine, bg = rose_pine.base },
          c = { fg = rose_pine.pine, bg = rose_pine.base },
          x = { bg = rose_pine.base, fg = rose_pine.pine },
          y = { bg = rose_pine.pine, fg = rose_pine.base },
          z = { bg = rose_pine.pine, fg = rose_pine.base },
        },

        insert = { a = { fg = rose_pine.base, bg = rose_pine.pine } },
        visual = {
          a = { fg = rose_pine.base, bg = rose_pine.love },
          b = { fg = rose_pine.love, bg = rose_pine.base },
          y = { bg = rose_pine.love, fg = rose_pine.base },
          z = { bg = rose_pine.love, fg = rose_pine.base },
        },
        replace = { a = { fg = rose_pine.base, bg = rose_pine.love } },

        inactive = {
          a = { fg = rose_pine.text, bg = rose_pine.base },
          b = { fg = rose_pine.text, bg = rose_pine.base },
          c = { fg = rose_pine.text },
        },
      }

      require("lualine").setup({
        options = {
          component_separators = "",
          theme = rose_pine_theme,
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              function()
                local devicons = require("nvim-web-devicons")
                local filename = vim.fn.expand("%:t")
                local ext = vim.fn.expand("%:e")
                local icon, _ = devicons.get_icon(filename, ext, { default = true })
                return vim.trim((icon .. " " .. filename) or "")
              end,
              separator = { right = "" },
              right_padding = 2,
            },
          },

          lualine_b = {
            "branch",
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              sections = { "error", "warn", "info", "hint" },
              diagnostics_color = {
                error = { fg = rose_pine.love, bg = rose_pine.base },
                warn = { fg = rose_pine.gold, bg = rose_pine.base },
                info = { fg = rose_pine.foam, bg = rose_pine.base },
                hint = { fg = rose_pine.iris, bg = rose_pine.base },
              },
              symbols = { error = " ", warn = " ", info = "󰋼 ", hint = " " },
            },
          },
          lualine_c = {
            "%=",
          },
          lualine_x = { { "diff", symbols = { added = " ", modified = " ", removed = " " } } },
          lualine_y = { "location" },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
