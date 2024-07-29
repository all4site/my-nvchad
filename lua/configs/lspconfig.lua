-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "tsserver",
  "somesass_ls",
  "css_variables",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
      cssls = {
        filetypes = { "css", "scss", "sass" },
      },
    },
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}