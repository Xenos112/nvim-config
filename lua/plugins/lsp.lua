return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        }
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "gopls",
          "tailwindcss",
          "html",
          "jsonls",
          "lua_ls",
          "eslint",
          "cssls",
          "clangd",
          "vuels",
          "jdtls",
          "prismals",
          "pyright",
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'saghen/blink.cmp',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local opts = { noremap = false, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end
      local capabilities = require('blink.cmp').get_lsp_capabilities({})
      local servers = { "ts_ls", "gopls", "tailwindcss", "html", "jsonls", "lua_ls", "eslint", "cssls", "clangd", "vuels",
        "jdtls", "prismals", "pyright" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end
  },
  {
    'saghen/blink.cmp',
    event = { "InsertEnter" },
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },

        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require("conform").setup({
        format_on_save = {
          timeout_ms = 3000,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          markdown = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          javascript = { "prettier", "eslint" },
          javascriptreact = { "prettier", "eslint" },
          typescriptreact = { "prettier", "eslint" },
          json = { "prettier" },
          yaml = { "prettier" },
          lua = { "stylua" },
          vue = { "prettier", "eslint" },
          java = { "google-java-format" },
        },
        formatters_by_ft_with_sync = {
          markdown = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          javascript = { "prettier", "eslint" },
          javascriptreact = { "prettier", "eslint" },
          typescript = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          lua = { "stylua" },
          vue = { "prettier", "eslint" },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
