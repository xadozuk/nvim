local lsp = vim.g.lazyvim_ruby_lsp or "ruby_lsp"
local formatter = vim.g.lazyvim_ruby_formatter or "rubocop"

return {
  -- Check treesitter config for blade support
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  -- Avoid using mason because of ruby version management with mise
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_lsp = {
          enabled = lsp == "ruby_lsp",
          mason = false,
          cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
        },
        solargraph = {
          enabled = lsp == "solargraph",
          mason = false,
          cmd = { vim.fn.expand("~/.local/share/mise/shims/solargraph") },
        },
        rubocop = {
          -- If Solargraph and Rubocop are both enabled as an LSP,
          -- diagnostics will be duplicated because Solargraph
          -- already calls Rubocop if it is installed
          enabled = formatter == "rubocop" and lsp ~= "solargraph",
          mason = false,
          cmd = { vim.fn.expand("~/.local/share/mise/shims/rubocop"), "--lsp" },
        },
        standardrb = {
          enabled = formatter == "standardrb",
          mason = false,
          cmd = { vim.fn.expand("~/.local/share/mise/shims/standardrb") },
        },
      },
    },
  },
  {
    "slim-template/vim-slim",
  },
  {
    "zidhuss/neotest-minitest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "zidhuss/neotest-minitest",
    },
    opts = {
      adapters = {
        ["neotest-minitest"] = {},
      },
    },
  },
  {
    "tpope/vim-rails",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stimulus-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        stimulus_ls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = {
      opts = {
        "embedded_template",
      },
    },
  },
}
