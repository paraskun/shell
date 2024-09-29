return {
  "nvim-neo-tree/neo-tree.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim"
  },

  config = function()
    vim.keymap.set("n", "<leader>pe", "<cmd>Neotree<cr>")
  end
}
