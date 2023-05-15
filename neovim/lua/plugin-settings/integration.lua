return {
  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy'
  },
  {
    'Allianaab2m/vimskey',
    event = 'VeryLazy',
    dependencies = { 'vim-denops/denops.vim' }
  },
  {
    'AsPulse/presence.nvim',
    event = 'VeryLazy',
    config = function ()
      require('presence').setup({
        auto_update = true,
        buttons = true,
      })
    end
  },
  {
    'jbyuki/instant.nvim',
    event = 'VeryLazy',
    config = function()
      vim.g.instant_username = 'AsPulse'
    end
  }
}
