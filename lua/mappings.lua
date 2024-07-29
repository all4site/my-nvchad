require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
map("n", "<leader>q", ":q|q<CR>", { desc = "Quit" })
map("v", "<Tab>", ">gv", { silent = true, desc = "Indent" })
map("v", "<S-Tab>", "<gv", { silent = true, desc = "Dedent" })

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

-- Trouble

map("n", "<leader>qx", "<cmd>TroubleToggle<CR>", { desc = "Open Trouble" })
map("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open Document Trouble" })

map("n", "<leader>qq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>ql", "<cmd>TroubleToggle loclist<CR>", { desc = "Open Location List" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git File History" })

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

-- Basic

map("i", "jk", "<ESC>")
-- map("i", "<C-g>", function()
--   return vim.fn["codeium#Accept"]()
-- end, { expr = true })
