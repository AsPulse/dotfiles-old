return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'marko-cerovac/material.nvim' },
      { 'SmiteshP/nvim-navic' }
    },
    config = function ()
      local navic = require('nvim-navic')
      navic.setup({
        highlight = false,
      })
      require('lualine').setup {
        sections = {
          lualine_c = {
            {
              function()
                local loc = navic.get_location()
                return (loc or '')
              end,
              condition = navic.is_available
            },
          },
        },
        options = {
          theme = 'material-nvim',
        },
        extensions = {
          'fern',
          'quickfix',
          'toggleterm'
        }
      }
    end
  }
}
