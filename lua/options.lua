require "nvchad.options"
vim.g.snipmate_snippets_path = "~/.config/nvim/snippets"

local signs = { Error = " ", Warn = " ", Hint = "󰁪", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.opt.timeoutlen = 500
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true
vim.o.cursorlineopt = "both"

vim.cmd(
  [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]]
)
