-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- Remove root keymap for lazygit
vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit (cwd)" })
vim.keymap.set("n", "<leader>gl", function()
  Snacks.lazygit.log()
end, { desc = "Lazygit Log" })
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gL")

vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

-- rezise splits
vim.keymap.set("n", "<A-Left>", require("smart-splits").resize_left, { desc = "Resize pane to left" })
vim.keymap.set("n", "<A-Down>", require("smart-splits").resize_down, { desc = "Resize pane down" })
vim.keymap.set("n", "<A-Up>", require("smart-splits").resize_up, { desc = "Resize pane up" })
vim.keymap.set("n", "<A-Right>", require("smart-splits").resize_right, { desc = "Resize pane to right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left pane" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to down pane" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to up pane" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right pane" })

-- Toggleterm
wk.add({
  {
    "<leader>r",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "terminals",
    mode = { "n", "v" },
  },
})

vim.keymap.set("n", "<leader>rh", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Open horizontal terminal" })
vim.keymap.set("n", "<leader>rv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Open vertical terminal" })
vim.keymap.set("n", "<leader>rf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open float terminal" })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "term://*toggleterm*" },
  callback = function()
    local opts = { buffer = 0 }

    -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", require("smart-splits").move_cursor_left, opts)
    vim.keymap.set("t", "<C-j>", require("smart-splits").move_cursor_down, opts)
    vim.keymap.set("t", "<C-k>", require("smart-splits").move_cursor_up, opts)
    vim.keymap.set("t", "<C-l>", require("smart-splits").move_cursor_right, opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  end,
})

vim.keymap.set("n", "<leader>rr", "<cmd>ToggleTermSetName<cr>", { desc = "Rename terminals" })

vim.keymap.set("n", "<leader>r,", "<cmd>TermSelect<cr>", { desc = "Select terminals" })

vim.keymap.set({ "n", "v" }, "<leader>rl", function()
  require("toggleterm").send_lines_to_terminal("single_line", true, { args = vim.v.count })
end, { desc = "Send current line to terminal" })

vim.keymap.set("v", "<leader>rs", function()
  require("toggleterm").send_lines_to_terminal("visual_selection", true, { args = vim.v.count })
end, { desc = "Send selected text to terminal" })

vim.keymap.set("v", "<leader>rS", function()
  require("toggleterm").send_lines_to_terminal("visual_lines", true, { args = vim.v.count })
end, { desc = "Send selected lines to terminal" })
