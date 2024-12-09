return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    opts = {
      open_mapping = [[<c-\>]],
      shell = "pwsh",
    },
    keys = {
      {
        "<leader>t",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "terminals",
      },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Open vertical terminal" },
    },
  },
}
