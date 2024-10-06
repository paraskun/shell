return {
  "folke/tokyonight.nvim",

  lazy = false,
  priority = 1000,

  config = function()
    require("tokyonight").setup({
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        floats = { transparent = true }
      },
    })

    vim.cmd("colorscheme tokyonight")
  end
}
