require('config.options')
require('config.keybinds')
require('config.lazy')
require('nvim-autopairs').setup {}
--require('config.lsp')
-- require('config.cmp')
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Icon before message
    source = "if_many", -- Show LSP source if multiple
    format = function(diag)
      return string.format("%s: %s", diag.source or "diag", diag.message)
    end,
  },
  signs = false, -- Hide sidebar icons completely
  float = { border = "rounded" }, -- Optional: Better popup style
  underline = true, -- Keep underlines for quick visual cues
})
