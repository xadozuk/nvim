return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          settings = {
            root_markers = { ".terraform", "main.tf", "terraform.tf" },
          },
        },
      },
    },
  },
}
