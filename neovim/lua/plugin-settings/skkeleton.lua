return {
  {
    'vim-skk/skkeleton',
    enabled = false,
    event = { 'InsertEnter', 'CmdlineEnter' },
    cmd = { 'Telescope' },
    dependencies = { 'vim-denops/denops.vim', 'rcarriga/nvim-notify', 'yuki-yano/denops-lazy.nvim' },
    config = function()
      require('denops-lazy').load('skkeleton', { wait_load = false })
      vim.keymap.set({ 'i', 't' }, '<C-j>', '<Plug>(skkeleton-enable)', { remap = true })
      vim.keymap.set({ 'i', 't' }, '<C-\\>', '<Plug>(skkeleton-disable)', { remap = true })
      vim.fn['skkeleton#config']({
        debug = false,
        eggLikeNewline = true,
        globalDictionaries = {
          '~/.skk/SKK-JISYO.L',
          '~/.skk/SKK-JISYO.propernoun',
          '~/.skk/SKK-JISYO.law',
          '~/.skk/SKK-JISYO.zipcode',
          { '~/.skk/skk-jisyo.utf8', 'utf8' },
        },
        globalKanaTableFiles = {
          { '~/.skk/azik_us.rule', 'euc-jp' },
        },
        userJisyo = '~/.skk/skkeleton.txt',
      })
      vim.fn['skkeleton#register_keymap']('input', '`', 'katakana');
      vim.fn['skkeleton#register_keymap']('henkan', '`', 'katakana');
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

