require("obsidian").setup({
  workspaces = {
    {
      name = "notes",
      path = "~/Documents/notes"
    }
  },

  daily_notes = {
    folder = "pages"
  },

  picker = {
    name = "telescope.nvim"
  },

  ui = {
    enable = false
  }
})

