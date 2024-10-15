return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", LazyVim.pick("files", { no_ignore = true }), desc = "Find Files (Root Dir)" },
      { "<leader>ff", LazyVim.pick("files", { no_ignore = true }), desc = "Find Files (Root Dir)" },
      { "<leader>fF", LazyVim.pick("files", { root = false, no_ignore = true }), desc = "Find Files (cwd)" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "%.terraform/" },
      },
    },
  },
}
