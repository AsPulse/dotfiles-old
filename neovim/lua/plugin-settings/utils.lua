return {
  {
    'vim-denops/denops.vim',
    lazy = true,
    init = function ()
      vim.api.nvim_set_var('denops#debug', 0)
    end
  },
  {
    'deris/vim-duzzle',
    cmd = 'DuzzleStart'
  },
  {
    'kkharji/sqlite.lua',
    lazy = true,
    init = function ()
      vim.g.sqlite_clib_path = vim.fn.expand('$HOME') .. '/bin/sqlite3/sqlite3.dll'
    end
  },
  {
    'tyru/capture.vim',
    cmd = 'Capture'
  },
  {
    'jghauser/mkdir.nvim',
    event = { 'FileType fern', 'CmdlineEnter' }
  },
  {
    'editorconfig/editorconfig-vim',
    event = 'BufEnter *.*'
  },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  },
  {
    'tpope/vim-surround',
    event = 'BufEnter *.*',
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function ()
      require('nvim-web-devicons').setup({
        override = {
          ts = {
            icon = 'ﯤ',
            color = '#3178c6',
            name = 'TypeScript'
          }
        }
      })
    end
  }
}
