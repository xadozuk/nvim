-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_check_order = false

-- Ruby specific options
-- vim.g.lazyvim_ruby_lsp = "solargraph"
-- vim.g.lazyvim_ruby_formatter = "rubocop"
vim.cmd("autocmd FileType ruby setlocal indentkeys-=.")

-- vim.o.shell = "bash"
-- vim.o.shellcmdflag = "-NoProfile -NoLogo -Command"

vim.o.scrolloff = 12

vim.o.clipboard = ""
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "/mnt/c/ProgramData/chocolatey/bin/win32yank.exe -i",
    ["*"] = "/mnt/c/ProgramData/chocolatey/bin/win32yank.exe -i",
  },
  paste = {
    ["+"] = "/mnt/c/ProgramData/chocolatey/bin/win32yank.exe -o",
    ["*"] = "/mnt/c/ProgramData/chocolatey/bin/win32yank.exe -o",
  },
  cache_enabled = 1,
}
-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "/mnt/c/Windows/System32/clip.exe",
--     ["*"] = "/mnt/c/Windows/System32/clip.exe",
--   },
--   paste = {
--     ["+"] = {
--       "/mnt/c/Program Files/PowerShell/7/pwsh.exe",
--       "-NoLogo",
--       "-NoProfile",
--       "-c",
--       '[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     ["*"] = {
--       "/mnt/c/Program Files/PowerShell/7/pwsh.exe",
--       "-NoLogo",
--       "-NoProfile",
--       "-c",
--       '[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--   },
--   cache_enabled = 1,
-- }

vim.lsp.set_log_level("off")

vim.g.lazyvim_python_lsp = "basedpyright"
