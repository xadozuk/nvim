return {
  { import = "lazyvim.plugins.extras.lang.dotnet" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          cmd = {
            "OmniSharp",
            "-z",
            "--hostPID",
            tostring(vim.fn.getpid()),
            "DotNet:enablePackageRestore=false",
            "--encoding",
            "utf-8",
            "--languageserver",
            "Sdk:IncludePrereleases=true",
            "FormattingOptions:EnableEditorConfigSupport=true",
          },
        },
      },
    },
  },
}
