local lsp = vim.g.lazyvim_ruby_lsp or "ruby_lsp"
local formatter = vim.g.lazyvim_ruby_formatter or "rubocop"

return {
  -- Check treesitter config for blade support
  { import = "lazyvim.plugins.extras.lang.ruby" },
  -- Avoid using mason because of ruby version management with ASDF
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_lsp = {
          enabled = lsp == "ruby_lsp",
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        },
        solargraph = {
          enabled = lsp == "solargraph",
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/solargrap") },
        },
        rubocop = {
          -- If Solargraph and Rubocop are both enabled as an LSP,
          -- diagnostics will be duplicated because Solargraph
          -- already calls Rubocop if it is installed
          enabled = formatter == "rubocop" and lsp ~= "solargraph",
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/rubocop"), "--lsp" },
        },
        standardrb = {
          enabled = formatter == "standardrb",
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/standardrb") },
        },
      },
    },
  },
}
