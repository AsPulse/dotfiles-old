local function fzf_keymap(key, command)
  vim.keymap.set('n', '<leader>' .. key, function ()
    vim.cmd('FzfPreview' .. command)
  end, { noremap = true, silent = true })
end
return {
  'yuki-yano/fzf-preview.vim',
  branch = 'release/rpc',
  dependencies = {
    {
      'junegunn/fzf',
      config = function ()
        vim.fn['fzf#install']()
      end,
    },
  },
  lazy = true,
  event = 'VeryLazy',
  cmd = {
    'FzfPreviewDirectoryFilesRpc',
    'FzfPreviewProjectGrepRpc',
  },
  init = function()
    fzf_keymap('ff', 'GitFilesRpc')
    fzf_keymap('fw', 'DirectoryFilesRpc')
    fzf_keymap('fb', 'BuffersRpc')
    fzf_keymap('fl', 'BufferLinesRpc')
    fzf_keymap('lg', 'NvimLspDefinitionRpc')
    fzf_keymap('lr', 'NvimLspReferencesRpc')
    fzf_keymap('ld', 'NvimLspDiagnosticsRpc')
    vim.keymap.set('n', '<leader>fg', function ()
      require('util.command').command_assist(':FzfPreviewProjectGrepRpc ')
    end, { noremap = true, silent = true })
  end
}
