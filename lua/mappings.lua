require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

--Некоторые настройки лежат в lspconfig.lua потому тчо они должны запускаться после lspconfig
-- Basic

nomap("n", "<leader>x")
nomap("n", "<C-n>")

map("i", "jk", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "ww", "<cmd>w<CR>", { desc = "Save" })
map("n", "wa", "<cmd>wa<CR>", { desc = "Save All" })
map("n", "cx", "<cmd>bp|sp|bn|bd<CR>", { desc = "Buffer close", silent = true })
map("n", "<leader>cw", "<cmd>q<CR>", { desc = "Close current window", silent = true })
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })
map("n", "<esc>", "<cmd>nohlsearch<CR>", { desc = "No highlight" })

map("n", "<leader>q", ":q|q<CR>", { desc = "Quit" })
map("v", "<Tab>", ">gv", { silent = true, desc = "Indent" })
map("v", "<S-Tab>", "<gv", { silent = true, desc = "Dedent" })

-- Trouble

map("n", "<leader>se", vim.diagnostic.open_float, { desc = "Open Diagnostics Float" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open Trouble" })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>xl", "<cmd>Trouble loclist<CR>", { desc = "Open Location List" })
map("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Comment line" })
map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Comment multiple line" }
)

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })

-- Codeium
map("i", "cc", function()
  return vim.fn["codeium#Accept"]()
end, { desc = "Codeium Accept", expr = true, silent = true })

-- NvimTree
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "NvimTree focus" })

-- Hop
map("n", "<leader>h", "<cmd>HopWord<cr>", { desc = "Hop word" })

-- Terminal
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toogle Terminal Vertical" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Toogle Terminal Horizontal" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float", size = 0.5 }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float", dir = ":set autochdir" }
end, { desc = "Toogle Terminal Float" })

-- LSP
map("n", "gd", "<cmd>TSToolsGoToSourceDefinition<CR>", { desc = "Go to definition" })
map({ "n", "v" }, "ui", "<cmd>TSToolsRemoveUnusedImports<CR>", { desc = "Remove unused imports" })
map({ "n", "v" }, "ru", "<cmd>TSToolsRemoveUnused<CR>", { desc = "Remove unused variables and functions" })
map({ "n", "v" }, "mi", "<cmd>TSToolsAddMissingImports<CR>", { desc = "Add missing imports" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts, { desc = "Go to declaration" })
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format()
    end, { desc = "Format file" })
    vim.keymap.set("n", "<leader>la", function()
      vim.lsp.buf.code_action()
    end, { desc = "Code action" })
  end,
})
