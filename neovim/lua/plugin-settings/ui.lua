return {
  {
    'MunifTanjim/nui.nvim',
    lazy = true
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    config = function()
      require('notify').setup {
        background_colour = '#1E1E2E'

      }
    end
  },
  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
  --   config = function ()
  --     require('noice').setup({
  --       messages = {
  --         view = 'mini'
  --       }
  --     })
  --   end
  -- },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufEnter *.*', 'VeryLazy' },
    config = function ()
      require('gitsigns').setup {
        signcolumn = false,
        numhl = true
      }
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    enabled = false,
    event = { 'BufEnter *.*', 'VeryLazy' },
    dependencies = { 'marko-cerovac/material.nvim' },
    config = function ()
      require('ibl') .setup {
        -- chat_highlight_list = { 'NonText' }
      }
    end
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufEnter *.*', 'VeryLazy' },
    config = function()
      require('hlchunk').setup {

      }
    end
  },
  {
    'j-hui/fidget.nvim',
    event = { 'BufEnter *.*' },
    tag = 'legacy',
    config = function()
      require('fidget').setup({
        text = {
          spinner = 'dots_pulse'
        }
      })
    end
  }
}
