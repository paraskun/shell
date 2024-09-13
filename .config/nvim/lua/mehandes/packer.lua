vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

  -- Theme

  use { "catppuccin/nvim", as = "catppuccin" }

  -- Syntax

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  -- Navigation

	use { "nvim-telescope/telescope.nvim", tag = "0.1.8" }

  -- Language Support

  use("mfussenegger/nvim-jdtls")
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("lervag/vimtex")

  -- Completion
  
  use("danymat/neogen") 

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  -- Other

  use("rcarriga/nvim-notify")
  use("nvim-lua/plenary.nvim")
end)

