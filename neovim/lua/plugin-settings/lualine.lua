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
      local show_macro_recording = function()
        local recording_register = vim.fn.reg_recording()
        if recording_register == '' then
            return ''
        else
            return 'Recording @' .. recording_register
        end
      end

      local lualine = require('lualine')
      lualine.setup {
        sections = {
          lualine_a = {
            'mode',
            {
              'macro-recording',
              fmt = show_macro_recording,
            },
          },
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

      local lualine_refresh = function()
        lualine.refresh({
          place = { "statusline" },
        })
      end

      vim.api.nvim_create_autocmd("RecordingEnter", {
        callback = lualine_refresh,
      })

      vim.api.nvim_create_autocmd("RecordingLeave", {
        callback = function()
          local timer = vim.loop.new_timer()
          timer:start(50, 0, vim.schedule_wrap(lualine_refresh))
        end,
      })
    end


  }
}
