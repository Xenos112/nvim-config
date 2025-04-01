vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#3d59a1", fg = "#191724" })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight",
      timeout = 200,
    })
  end,
})

-- remove the ~ sumbol inthe the lines
vim.opt.fillchars:append({ eob = " " })

vim.o.signcolumn = "yes"
vim.o.numberwidth = 2
