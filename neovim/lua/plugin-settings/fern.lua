return {
  {
    'lambdalisue/fern.vim',
    cmd = { 'Fern', 'FernDo' },
    dependencies = {
      { 'antoinemadec/FixCursorHold.nvim' },
      {
        'lambdalisue/fern-renderer-nerdfont.vim',
        dependencies = { 'lambdalisue/nerdfont.vim', 'lambdalisue/glyph-palette.vim' },
      },
      {
        'lambdalisue/fern-git-status.vim',
      }
    },
    init = function()
      vim.api.nvim_set_var('fern#renderer', 'nerdfont')
      vim.api.nvim_set_var('fern#renderer#nerdfont#indent_markers', true)
      vim.api.nvim_set_var('fern#default_hidden', true)
      vim.keymap.set('n', '<C-f>', '<cmd>Fern . -reveal=%<cr>', { noremap = true })
    end,
    config = function()
      vim.fn['fern_git_status#init']()
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = { 'fern' },
        callback = function()
          vim.keymap.set(
            'n', '<Plug>(fern-action-open)', '<Plug>(fern-action-open:select)',
            { buffer = true, remap = true}
          )
          vim.keymap.set(
            'n', 'cwd', 'gg<Plug>(fern-action-cd)',
            { buffer = true, silent = true, remap = false }
          )
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.fn['glyph_palette#apply']()
        end
      })

    end
  },
  {
    'lambdalisue/fern-hijack.vim',
  },
}
