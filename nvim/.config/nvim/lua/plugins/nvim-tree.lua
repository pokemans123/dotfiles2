return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local api = require("nvim-tree.api")
    require("nvim-tree").setup({
      git = { enable = true },  -- Shows branch icons/status
      view = { side = "left" },
      filters = { dotfiles = false },  -- Optional: show hidden files
      on_attach = function(bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts)
      end,
    })
    -- Keymaps
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<leader>f", ":NvimTreeFindFileToggle<CR>")  -- Reveal current file location
  end,
}
