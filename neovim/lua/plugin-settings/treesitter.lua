return {
  {
    'yioneko/nvim-yati',
    event = { 'BufEnter *.*', 'VeryLazy' },
    version = '*',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
      },
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require('treesitter-context').setup ({})
        end
      }
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'typescript', 'tsx',
          'diff',
          'dockerfile',
          'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
          'html', 'json5', 'lua', 'markdown', 'yaml',
          'cpp'
        },
        highlight = { enable = true },
        indent = { enable = false },
        yati = {
          enable = true,
          disable = { 'python' },

          default_lazy = true,

          default_fallback = 'auto'
        }
      }
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = { 'BufAdd *.*', 'VeryLazy' },
    config = function()
      require('colorizer').setup()
    end
  }
}
