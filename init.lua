local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space>z", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<space>z", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<space>z", function()
	require("telescope").extensions.file_browser.file_browser()
end)

require "plugins/lazy_setup"
require "plugins/polish"
require "plugins/community"
require "plugins/mason"
