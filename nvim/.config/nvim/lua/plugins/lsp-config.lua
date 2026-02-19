return {
     {
	  "williamboman/mason.nvim",
	  config = function()
	       require("mason").setup()
	  end
     },
     {
	  "williamboman/mason-lspconfig.nvim",
	  config = function()
	       require("mason-lspconfig").setup({
		    ensure_installed = {"lua_ls","pyright","codebook"}
	       })
	  end
     },
     {
	  "neovim/nvim-lspconfig",
	  config = function()
	       vim.lsp.enable("lua_ls")
	       vim.lsp.enable("pyright")
	       vim.lsp.enable("codebook")
	       vim.keymap.set('n','K',vim.lsp.buf.hover, {})
	       vim.keymap.set('n','gD',vim.lsp.buf.declaration, {})
	       vim.keymap.set({ 'n','v' }, '<leader>ca', vim.lsp.buf.code_action, {})
	  end
     }

}
