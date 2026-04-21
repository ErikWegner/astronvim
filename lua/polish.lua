-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.o.guifont = "FiraCode Nerd Font:12"

-- Detect if running inside WSL
local is_wsl = vim.fn.has "wsl" == 1

if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "/mnt/c/work/tools/win32yank.exe -i --crlf",
      ["*"] = "/mnt/c/work/tools/win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "/mnt/c/work/tools/win32yank.exe -o --lf",
      ["*"] = "/mnt/c/work/tools/win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
