return {
  { import = "lazyvim.plugins.extras.lang.terraform" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          settings = {
            root_marlers = { ".terraform", "main.tf", "terraform.tf" },
          },
        },
      },
    },
  },
}
