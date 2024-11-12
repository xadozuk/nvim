vim.api.nvim_create_user_command("ConformToggle", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("Conform " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, {
  desc = "Toggle format on save",
})

return {
  "stevearc/conform.nvim",
  opts = {},
}
