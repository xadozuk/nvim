return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "powershell",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "powershell-editor-services" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        powershell_es = {},
      },
    },
  },
}
