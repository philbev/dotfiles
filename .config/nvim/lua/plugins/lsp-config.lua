-- ~/.config/nvim/lua/plugins/lsp-config.lua

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').lua_ls.setup {}
      require('lspconfig').bashls.setup {}
      require('lspconfig').pyright.setup {}
    end
  },
}
