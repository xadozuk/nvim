return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>am", "<cmd>MCPHub<cr>", desc = "MCPHub" },
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup({
        extensions = {
          avante = {
            make_slash_commands = true, -- Enable slash commands for Avante
          },
          copilotchat = {
            enabled = true,
            convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
            convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
            add_mcp_prefix = false, -- Add "mcp_" prefix to function names
          },
        },
      })
    end,
  },
  { import = "lazyvim.plugins.extras.ai.copilot-chat" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "claude-3.7-sonnet", -- Default model to use
      mappings = {
        complete = {
          insert = "<Tab>",
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   keys = {
  --     { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion Chat" }, -- Toggle the Code Companion Chat window
  --     { "<leader>ac", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion Action" }, -- Open Code Companion actions menu
  --     { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "Send selected text to Code Companion Chat" }, -- Send visually selected text to chat
  --   },
  --   opts = {
  --     strategies = {
  --       chat = {
  --         adapter = {
  --           name = "copilot",
  --           model = "claude-3.7-sonnet",
  --         },
  --       },
  --     },
  --     display = {
  --       diff = {
  --         enabled = true,
  --         provider = "mini_diff",
  --       },
  --     },
  --     extensions = {
  --       mcphub = {
  --         callback = "mcphub.extensions.codecompanion",
  --         opts = {
  --           make_vars = true,
  --           make_slash_commands = true,
  --           show_result_in_chat = true,
  --         },
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "ravitemer/mcphub.nvim",
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       ft = { "markdown", "codecompanion" },
  --     },
  --   },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     provider = "copilot",
  --     providers = {
  --       copilot = {
  --         model = "claude-3.7-sonnet",
  --       },
  --     },
  --     selector = {
  --       provider = "snacks",
  --       provider_opts = {},
  --     },
  --     input = {
  --       provider = "snacks",
  --       provider_opts = {
  --         -- Additional snacks.input options
  --         title = "Avante Input",
  --         icon = " ",
  --       },
  --     },
  --     windows = {
  --       input = {
  --         height = 16,
  --       },
  --     },
  --     system_prompt = function()
  --       local hub = require("mcphub").get_hub_instance()
  --       return hub and hub:get_active_servers_prompt() or ""
  --     end,
  --     -- Using function prevents requiring mcphub before it's loaded
  --     custom_tools = function()
  --       return {
  --         require("mcphub.extensions.avante").mcp_tool(),
  --       }
  --     end,
  --   },
  --   build = "make",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --     {
  --       "folke/which-key.nvim",
  --       opts = {
  --         spec = {
  --           { "<leader>a", group = "ai" },
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "saghen/blink.compat",
  --   lazy = true,
  --   opts = {},
  --   config = function()
  --     -- monkeypatch cmp.ConfirmBehavior for Avante
  --     require("cmp").ConfirmBehavior = {
  --       Insert = "insert",
  --       Replace = "replace",
  --     }
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    lazy = true,
    opts = {
      sources = {
        compat = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
      },
    },
  },
  --     sources = {
  --       default = { "avante_commands", "avante_mentions", "avante_files" },
  --       providers = {
  --         avante_commands = {
  --           name = "avante_commands",
  --           module = "blink.compat.source",
  --           score_offset = 90, -- show at a higher priority than lsp
  --           opts = {},
  --         },
  --         avante_files = {
  --           name = "avante_commands",
  --           module = "blink.compat.source",
  --           score_offset = 100, -- show at a higher priority than lsp
  --           opts = {},
  --         },
  --         avante_mentions = {
  --           name = "avante_mentions",
  --           module = "blink.compat.source",
  --           score_offset = 1000, -- show at a higher priority than lsp
  --           opts = {},
  --         },
  --       },
  --     },
  --   },
  -- },
}
