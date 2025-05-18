-- ~/.config/blink/lua/plugins/lazy.lua

return {
  'folke/neodev.nvim',
{
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern',
    delay = 1200,
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
},
  { 'folke/neoconf.nvim', cmd = 'Neoconf' },
}
