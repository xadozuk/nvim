return {
  -- { import = "lazyvim.plugins.extras.ai.copilot-chat" },
  -- { import = "lazyvim.plugins.extras.ai.copilot" },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<S-CR>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
  },
}
