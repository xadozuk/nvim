return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<c-\>]],
      shell = "pwsh",
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return math.max(50, vim.o.columns * 0.4)
        end
      end,
    },
  },
}
