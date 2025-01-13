return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    local caps = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig").clangd.setup({
      capabilities = caps
    })

    require("lspconfig").gopls.setup({
      capabilities = caps
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
  end
}
