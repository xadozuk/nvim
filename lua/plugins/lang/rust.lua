return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },
}
