return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    require("lspconfig").clangd.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    })

    require("lspconfig").gopls.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    })

    require("lspconfig").pylsp.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    })

    require("lspconfig").cmake.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
  end
}
