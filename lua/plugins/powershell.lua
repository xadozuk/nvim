return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "powershell",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "powershell-editor-services",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        powershell_es = {
          settings = {
            powershell = {
              codeFormatting = {
                Preset = "Allman",
              },
            },
          },
        },
      },
    },
  },
  {
    "Willem-J-an/nvim-dap-powershell",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      {
        "m00qek/baleia.nvim",
        lazy = true,
        tag = "v1.4.0",
      },
    },
    config = function()
      require("dap-powershell").setup()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
        require("dap-powershell").correct_repl_colors()
      end
    end,
  },
}
