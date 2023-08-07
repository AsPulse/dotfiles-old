function Material_colortheme_customMap()
  local color = '#2b2541';
  vim.api.nvim_set_hl(0, '@field', { fg='#a6accd' })
  vim.api.nvim_set_hl(0, '@property', { fg='#ffcd6b' })
  vim.api.nvim_set_hl(0, 'ModeMsg', { fg='#303030' })

  vim.api.nvim_set_hl(0, 'Normal', { bg=color })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg=color })
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg=color })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg=color })
  vim.api.nvim_set_hl(0, 'NonText', { bg=color })
  vim.api.nvim_set_hl(0, 'LineNr', { bg=color })
  vim.api.nvim_set_hl(0, 'Folded', { bg=color })
  vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg=color })

  vim.api.nvim_set_hl(0, 'CmpFloating', { bg='#2b2541' })
  vim.api.nvim_set_hl(0, 'CmpFloatingCursor', { bg='#434267' })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchDefault', { bold=true })

  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg='#676e95', bold=true })
  vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg='#ffcb3b', bold=true })

  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg='#c792ea', bold=true })
  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg='#c792ea', bold=true })

  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg='#89ddff', bold=true })
  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg='#89ddff', bold=true })

  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg='#80cbc4', bold=true })
  vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg='#ff5370', bold=true })

  vim.api.nvim_set_hl(0, 'TreesitterContext', { bg='#665e8f' })

  vim.api.nvim_set_hl(0, 'BufferLineFill', { bg=color })
end

return {
  {
    'marko-cerovac/material.nvim',
    config = function ()
      require('material').setup({
        lualine_style = 'default',
        async_loading = false,
        custom_colors = function(colors)
          colors.editor.accent = '#c792ea'
          colors.editor.line_numbers = '#6562a3'
          colors.editor.bg = "#1e1e2e"
        end
      })
      vim.g.material_style = 'palenight'
      vim.cmd [[colorscheme material]]
      Material_colortheme_customMap()
      vim.api.nvim_create_autocmd({ 'VimEnter' }, {
        callback = vim.schedule_wrap(Material_colortheme_customMap)
      })
    end
  }
}


