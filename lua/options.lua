require "nvchad.options"
vim.g.snipmate_snippets_path = "~/.config/nvim/snippets"

local signs = { Error = " ", Warn = " ", Hint = "󰁪", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--Base
vim.opt.timeoutlen = 500
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true
vim.o.cursorlineopt = "both"
vim.opt.scrolloff = 10

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]]
