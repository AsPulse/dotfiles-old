function Material_colortheme_customMap()
  vim.cmd [[highlight @field guifg=#a6accd]]
  vim.cmd [[highlight @property guifg=#ffcd6b]]
  vim.cmd [[highlight ModeMsg guifg=#303030]]

  vim.cmd [[highlight Normal guibg=none]]
  vim.cmd [[highlight NormalFloat guibg=none]]
  vim.cmd [[highlight FloatBorder guibg=none]]
  vim.cmd [[highlight NormalNC guibg=none]]
  vim.cmd [[highlight NonText guibg=none]]
  vim.cmd [[highlight LineNr guibg=none]]
  vim.cmd [[highlight Folded guibg=none]]
  vim.cmd [[highlight EndOfBuffer guibg=none]]

  vim.cmd [[highlight CmpFloating guifg=#8b90a6 guibg=#2d2d3f]]
  vim.cmd [[highlight CmpItemAbbrMatchDefault gui=bold]]

  vim.cmd [[highlight CmpItemKindText guifg=#676e95 gui=bold]]
  vim.cmd [[highlight CmpItemKindInterface guifg=#ffcb3b gui=bold]]

  vim.cmd [[highlight CmpItemKindFunction guifg=#c792ea gui=bold]]
  vim.cmd [[highlight! link CmpItemKindMethod CmpItemKindFunction]]

  vim.cmd [[highlight CmpItemKindVariable guifg=#89ddff gui=bold]]
  vim.cmd [[highlight! link CmpItemKindField CmpItemKindVariable ]]

  vim.cmd [[highlight CmpItemKindKeyword guifg=#80cbc4 gui=bold]]
  vim.cmd [[highlight CmpItemKindSnippet guifg=#ff5370 gui=bold]]

  vim.cmd [[highlight TreesitterContext guibg=#665e8f]]

  vim.cmd [[highlight BufferLineFill guibg=none]]
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


