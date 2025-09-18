return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- vim.list_extend(opts.ensure_installed, { "blade", "php_only" })
      opts.endwise = { enable = true }
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise",
  },
}
