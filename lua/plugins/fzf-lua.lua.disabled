return {
  {
    import = "lazyvim.plugins.extras.editor.fzf",
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      files = {
        rg_opts = [[--color=never --files --follow -g "!.git"]],
        fd_opts = [[--color=never --type f --follow --exclude .git]],
      },
    },
    keys = {
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_cword", { root = false }), desc = "Word (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (cwd)" },
      { "<leader>sG", false },
      { "<leader>sW", false },
    },
  },
}
