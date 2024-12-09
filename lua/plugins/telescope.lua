return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", LazyVim.pick("files", { no_ignore = true, root = false }), desc = "Find Files (cwd)" },
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
      { "<leader>fF", false },
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
