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
}
