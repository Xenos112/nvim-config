return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
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
