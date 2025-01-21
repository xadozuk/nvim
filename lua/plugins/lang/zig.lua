return {
  { import = "lazyvim.plugins.extras.lang.zig" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          settings = {
            zls = {
              enable_build_on_save = true,
              build_on_save_step = "check",
            },
          },
        },
      },
    },
  },
}
