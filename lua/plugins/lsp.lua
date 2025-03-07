return {
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
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
        },
      })

      local lspconfig = require("lspconfig")

      local servers = {
        lua_ls = {},
        ts_ls = {},
        gopls = {},
        tailwindcss = {},
        html = {},
        jsonls = {},
        eslint = {},
        cssls = {},
        clangd = {},
        jdtls = {},
        vuels = {
          filetypes = { "vue" },
        },
        prismals = {},
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup(config)
      end

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "BufRead",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "supermaven" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
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
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
