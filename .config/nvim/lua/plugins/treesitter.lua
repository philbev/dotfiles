-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'python', 'bash', 'fish', 'markdown', 'markdown_inline' },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
      },
    }
  end
}
