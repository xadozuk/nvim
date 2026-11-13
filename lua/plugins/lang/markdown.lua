local HOME = os.getenv("HOME")

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      pipe_table = {
        cell = "trimmed",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = {
            "--config",
            vim.fn.expand("~/.markdownlint.yaml"),
            "--",
          },
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")

      -- Disable none-ls's markdownlint_cli2 since nvim-lint handles it better
      local markdownlint_cli2_original = nls.builtins.diagnostics.markdownlint_cli2

      opts.sources = opts.sources or {}

      -- Remove any existing markdownlint_cli2 sources
      opts.sources = vim.tbl_filter(function(source)
        return source ~= markdownlint_cli2_original
      end, opts.sources)

      return opts
    end,
  },
}
