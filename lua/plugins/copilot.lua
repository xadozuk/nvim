return {
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
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
  },
}