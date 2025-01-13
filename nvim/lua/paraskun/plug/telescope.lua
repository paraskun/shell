return {
  "nvim-telescope/telescope.nvim",
  
  dependecies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },

  config = function()
    local telescope = require("telescope.builtin")

    require("telescope").setup{
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
      },
    }

    require("telescope").load_extension "file_browser"

    vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
    vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})
    vim.keymap.set("n", "<leader>pe", ":Telescope file_browser<CR>")
  end
}
