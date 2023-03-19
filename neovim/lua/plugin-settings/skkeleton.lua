return {
  {
    'vim-skk/skkeleton',
    event = { 'InsertEnter', 'CmdlineEnter' },
    cmd = { 'Telescope' },
    dependencies = { 'vim-denops/denops.vim', 'rcarriga/nvim-notify', 'yuki-yano/denops-lazy.nvim' },
    config = function()
      require('denops-lazy').load('skkeleton', { wait_load = false })
      vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-toggle)', { remap = true })
      vim.keymap.set('c', '<C-j>', '<Plug>(skkeleton-toggle)', { remap = true })
      vim.fn['skkeleton#config']({
        eggLikeNewline = true,
        globalDictionaries = {
          '~/.skk/SKK-JISYO.L',
          '~/.skk/SKK-JISYO.propernoun',
          '~/.skk/SKK-JISYO.law',
          '~/.skk/SKK-JISYO.zipcode',
          '~/.skk/CorvusSKK/userdict.txt',
        },
        userJisyo = '~/.skk/neovim-userdict.txt'
      })
      vim.fn['skkeleton#register_kanatable']('rom', {
        xn = { 'ん' }
      })
    end
  },
  {
    'delphinus/skkeleton_indicator.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    cmd = { 'Telescope' },
    config = function()
      require('skkeleton_indicator').setup({})
    end
  }
}
