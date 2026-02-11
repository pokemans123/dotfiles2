-- lua/config/lsp.lua (FULLY modern, no warnings)

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "pyright" },
}

-- Capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure AND enable pyright
vim.lsp.config("pyright", {
  capabilities = capabilities,
})

-- Auto-enable on Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function() vim.lsp.enable("pyright") end,
})
