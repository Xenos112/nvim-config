return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    keys = {
      { "<leader>e", ":Oil<CR>" }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = {},
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
