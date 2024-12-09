local lspconfig = require("lspconfig")
local azdo_pipelines_schema =
  "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"
local azdo_patterns = {
  "/azure-pipelines.y*l",
  ".azdo/*.y*l",
  "Pipelines/*.y*l",
  "azure-pipelines-templates/*.y*l",
  "azure-pipeline-templates/*.y*l",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "powershell",
        "yaml",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "powershell-editor-services",
        "azure-pipelines-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        powershell_es = {},
        azure_pipelines_ls = {
          root_dir = lspconfig.util.root_pattern(azdo_patterns),
          settings = {
            yaml = {
              schemas = {
                [azdo_pipelines_schema] = azdo_patterns,
              },
            },
          },
        },
      },
    },
  },
}