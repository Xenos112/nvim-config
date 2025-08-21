return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = false,
        ensure_installed = {
          "lua",
          "typescript",
          "javascript",
          "tsx",
          "jsdoc",
        },
        highlight = {
          enable = true,

          disable = function(_lang, buf)
            local max_filesize = 50 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        textobjects = { enable = false },
        playground = { enable = false },
      })
    end,
  },
}
