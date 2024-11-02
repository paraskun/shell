return {
  {   
    "catppuccin/nvim",

    lazy = false,
    name = "catppuccin", 

    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        transparent_background = true,
        no_italic = true,

        integrations = {
          cmp = true,
          treesitter = true,
        },

        styles = {
          comments = { "italic" },
        },
      })

      vim.cmd.colorscheme "catppuccin"
    end
  },
}
