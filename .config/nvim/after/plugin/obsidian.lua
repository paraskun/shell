require("obsidian").setup({
  workspaces = {
    {
      name = "notes",
      path = "~/notes"
    }
  },

  daily_notes = {
    folder = "pages"
  },

  picker = {
    name = "telescope.nvim"
  }
})

