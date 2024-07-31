require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

--Некоторые настройки лежат в lspconfig.lua потому тчо они должны запускаться после lspconfig
-- Basic

nomap('n', '<leader>x')

map("i", "jk", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
-- map("n", "<leader>c", "<cmd>bp|sp|bn|bd<CR>", { desc = 'Buffer close', silent = true })
map("n", "<leader>cx", function()
    require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

map("n", "<leader>q", ":q|q<CR>", { desc = "Quit" })
map("n", "<leader>c", "<cmd>q<CR>", { desc = "Close current window", silent = true })
map("v", "<Tab>", ">gv", { silent = true, desc = "Indent" })
map("v", "<S-Tab>", "<gv", { silent = true, desc = "Dedent" })

-- Trouble

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open Trouble" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Open Location List" })
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
    require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
    require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
    require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
    require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
