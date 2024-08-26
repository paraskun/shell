vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

require("mason").setup()
require("mason-lspconfig").setup()

require('lspconfig').clangd.setup{}
require('lspconfig').rust_analyzer.setup{}

local function get_paths()
  local path = {}
  local jdtls = "/home/mehandes/.local/share/nvim/mason/packages/jdtls"

  path.data_dir = vim.fn.stdpath("cache") .. "/nvim-jdtls"
  path.java_agent = jdtls .. "/lombok.jar"
  path.launcher_jar = vim.fn.glob(jdtls .. "/plugins/org.eclipse.equinox.launcher_*.jar")
  path.platform_config = jdtls .. "/config_linux"

  return path
end

local function setup(event)
  local path = get_paths()
  local data_dir = path.data_dir .. '/' ..  vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local config = {
    cmd = {
      'java',

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-javaagent:' .. path.java_agent,
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      '-jar', path.launcher_jar,
      '-configuration', path.platform_config,
      '-data', data_dir,
    },

    settings = {
      java = {
        format = {
          settings = {
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml",
            profile = "GoogleStyle"
          }
        }
      }
    },

    root_dir = vim.fs.root(0, {".git"}),

    init_options = {
      bundles = {}
    },

    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }

  require("jdtls").start_or_attach(config)
end

vim.api.nvim_create_autocmd('FileType', {
  group = java_cmds,
  pattern = {'java'},
  desc = 'Setup Java LSP',
  callback = setup,
})

