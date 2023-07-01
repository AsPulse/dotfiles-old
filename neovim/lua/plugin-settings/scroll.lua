return {
  {
    'lewis6991/satellite.nvim',
    event = 'BufEnter *.*',
    config = function ()
      require('satellite').setup()
    end
  },
  -- {
  --   'psliwka/vim-smoothie',
  --   event = 'VeryLazy',
  -- }
}
