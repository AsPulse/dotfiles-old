vim.g.clipboard = {
  name = 'CopyQ',
  copy = {
    ['+'] = 'copyq copy',
    ['*'] = 'copyq copy',
  },
  paste = {
    ['+'] = 'copyq read',
    ['*'] = 'copyq read',
  },
};
