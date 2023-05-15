vim.api.nvim_create_user_command('ShowHiGroup',
  [[echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')]]
, {})
