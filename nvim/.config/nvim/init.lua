require('config.options')
require('config.keybinds')
require('config.lazy')
require('nvim-autopairs').setup {}
require('colorizer').setup()
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
     virtual_text = {
	  prefix = '●', -- Icon before message
	  source = "if_many", -- Show LSP source if multiplied
	  format = function(diag)
	       return string.format("%s: %s", diag.source or "diag", diag.message)
	  end,
     },
     signs = false,
     float = {border = "rounded"}, 
     underline = true,
})
