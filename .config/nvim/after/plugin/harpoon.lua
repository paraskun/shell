local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>fa", mark.add_file)
vim.keymap.set("n", "<leader>pe", ui.toggle_quick_menu)

