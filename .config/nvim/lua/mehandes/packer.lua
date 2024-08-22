vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

  -- Theme

  use { "catppuccin/nvim", as = "catppuccin" }

  -- Syntax

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  -- Navigation

	use { "nvim-telescope/telescope.nvim", tag = "0.1.8" }
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")

  -- Language Support

  use("mfussenegger/nvim-jdtls")
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- Completion
  
  use("danymat/neogen") 

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  -- Integration

	use("tpope/vim-fugitive")
  use("epwalsh/obsidian.nvim")

  -- Other

  use("rcarriga/nvim-notify")
  use("epwalsh/pomo.nvim")
  use("nvim-lua/plenary.nvim")
end)

