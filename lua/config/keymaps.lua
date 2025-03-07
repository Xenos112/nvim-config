local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("v", "<leader>/", "gc", {})
map("n", "<leader>?", "g?", {})
map("n", "<leader>/", "gcc", {})

map("n", "<tab>", ":bn<CR>", { silent = true })
map("n", "<S-tab>", ":bp<CR>", { silent = true })

map("n", "<leader>x", ":bd<CR>", {})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", {})

-- copy and paste from system clipboard
map({ "n", 'v' }, "y", "\"+y", {})
map({ "n", 'v' }, "p", "\"+p", {})
