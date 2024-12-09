-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

function Remove_qf_item()
  local current_qf_item = vim.fn.line(".")
  local qf_list = vim.fn.getqflist()

  if #qf_list == 0 then
    return
  end

  table.remove(qf_list, current_qf_item)
  vim.fn.setqflist(qf_list, "r")

  -- Reopen QF list to refresh
  vim.cmd("copen")

  -- If not at the end, keep pos otherwise go up
  local new_pos = current_qf_item < #qf_list and current_qf_item or math.max(current_qf_item - 1, 1)

  local win_id = vim.fn.win_getid()
  vim.api.nvim_win_set_cursor(win_id, { new_pos, 0 })
end

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "ps1" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf" },
  callback = function()
    vim.keymap.set("n", "dd", Remove_qf_item, { noremap = true, buffer = true })
  end,
})
