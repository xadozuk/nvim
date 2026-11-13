-- your LSP file: ./after/lsp/yamlls.lua
return require("schema-companion").setup_client(
  require("schema-companion").adapters.yamlls.setup({
    sources = {
      -- your sources for the language server
      require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
      require("schema-companion").sources.lsp.setup(),
    },
  }),
  {
    --- your yaml language server configuration
  }
)
