return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = "BufRead",
    config = function(_opts)
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "typescript", "javascript", "go", "c", "tsx", "gomod", "gosum" },
        highlight = {
          enable = true,

          disable = function(_lang, buf)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
}
