return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    lazy = true,
    event = { 'BufEnter *.*' },
    tag = '0.1.4',
    init = function()
      local builtin = function(name)
        return function ()
          require('telescope.builtin')[name]()
        end
      end

      vim.keymap.set('n', '<leader>ff', builtin('find_files'), {})
      vim.keymap.set('n', '<leader>fg', builtin('live_grep'), {})
      vim.keymap.set('n', '<leader>fb', builtin('buffers'), {})
      vim.keymap.set('n', '<leader>fh', builtin('help_tags'), {})
      vim.keymap.set('n', '<leader>fd', builtin('diagnostics'), {})
    end,
    config = function ()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { '.git/*', '*/.git/*', '*/tmp/*', '*node_modules/*' },
        },
      })
    end
  }
}
