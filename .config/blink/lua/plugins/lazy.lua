-- ~/.config/blink/lua/plugins/lazy.lua

return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
--   { -- optional cmp completion source for require statements and module annotations
--     "hrsh7th/nvim-cmp",
--     opts = function(_, opts)
--       opts.sources = opts.sources or {}
--       table.insert(opts.sources, {
--         name = "lazydev",
--         group_index = 0, -- set group index to 0 to skip loading LuaLS completions
--       })
--     end,
--   },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ['<Enter>'] = { 'select_and_accept' },
    },
    },
  },
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
