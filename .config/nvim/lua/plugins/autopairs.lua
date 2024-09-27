-- ~/.config/nvim/lua/plugins/autopairs.lua

return {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    opts={
      cmap = false,
    },
}
