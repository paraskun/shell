require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "rust", "java", "lua", "markdown" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex", "markdown" },
  },
}

