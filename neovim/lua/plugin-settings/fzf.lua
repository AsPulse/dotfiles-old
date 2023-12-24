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
    fzf_keymap('ff', 'DirectoryFilesRpc')
    fzf_keymap('fb', 'BuffersRpc')
    fzf_keymap('fl', 'BufferLinesRpc')
    fzf_keymap('fg', 'NvimLspDefinitionRpc')
    fzf_keymap('fr', 'NvimLspReferencesRpc')
    fzf_keymap('fd', 'NvimLspDiagnosticsRpc')
    vim.keymap.set('n', '<leader>fg', function ()
      require('util.command').command_assist(':FzfPreviewProjectGrepRpc ')
    end, { noremap = true, silent = true })
  end
}
