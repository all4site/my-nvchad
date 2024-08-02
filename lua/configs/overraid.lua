local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", "<cmd>TSToolsGoToSourceDefinition<CR>", opts "Go to definition")
  map({ "n", "v" }, "gi", vim.lsp.buf.code_action, opts "Lsp code action")
  map({ "n", "v" }, "ui", "<cmd>TSToolsRemoveUnusedImports<CR>", opts "Remove unused imports")
  map({ "n", "v" }, "ru", "<cmd>TSToolsRemoveUnused<CR>", opts "Remove unused variables and functions")

  map({ "n", "v" }, "mi", "<cmd>TSToolsAddMissingImports<CR>", opts "Add missing imports")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<S-k>", vim.lsp.buf.hover, opts "Lsp hover")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map("n", "<leader>r", function()
    require "nvchad.lsp.renamer"()
  end, opts "NvRenamer")

  map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

return M
