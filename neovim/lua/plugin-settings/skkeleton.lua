return {
  {
    'vim-skk/skkeleton',
    enabled = false,
    event = { 'InsertEnter', 'CmdlineEnter' },
    cmd = { 'Telescope' },
    dependencies = { 'vim-denops/denops.vim', 'rcarriga/nvim-notify', 'yuki-yano/denops-lazy.nvim' },
    config = function()
      require('denops-lazy').load('skkeleton', { wait_load = false })
      vim.keymap.set({ 'i', 't' }, '<F13>', '<Plug>(skkeleton-enable)', { remap = true })
      vim.keymap.set({ 'i', 't' }, '<F14>', '<Plug>(skkeleton-disable)', { remap = true })
      vim.fn['skkeleton#config']({
        debug = false,
        eggLikeNewline = true,
        globalDictionaries = {
          '~/.skk/dicts/SKK-JISYO.fullname',
          '~/.skk/dicts/SKK-JISYO.assoc',
          '~/.skk/dicts/SKK-JISYO.geo',
          '~/.skk/dicts/SKK-JISYO.jinmei',
          '~/.skk/dicts/SKK-JISYO.zipcode',
          '~/.skk/dicts/SKK-JISYO.L',
          '~/.skk/dicts/SKK-JISYO.law',
          '~/.skk/dicts/SKK-JISYO.propernoun',
          '~/.skk/dicts/SKK-JISYO.station',
          { '~/.skk/userdict.txt', 'utf16' },
        },
        globalKanaTableFiles = {
          { '~/.skk/azik_us.rule', 'utf8' },
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
