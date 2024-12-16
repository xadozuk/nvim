return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
      {
        "<leader>fF",
        LazyVim.pick("files", { root = false, no_ignore = true }),
        desc = "Find Files (cwd) [no_ignore]",
      },
      { "<leader>sG", false },
      { "<leader>sW", false },
      { "<leader>sW", false },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "%.terraform/" },
      },
    },
  },
}
