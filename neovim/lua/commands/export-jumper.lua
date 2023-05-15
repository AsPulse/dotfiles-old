vim.keymap.set(
  'n',
  '<F9>',
  '^<cmd>set<space>nowrapscan<cr>?\\v^export\\s<cr><cmd>noh<cr>f<space>f<space>f<space>zz<cmd>set<space>wrapscan<cr>',
  { remap = false, silent = true }
)
vim.keymap.set(
  'n',
  '<F10>',
  '<cmd>set<space>nowrapscan<cr>/\\v^export\\s<cr><cmd>noh<cr>f<space>f<space>f<space>zz<cmd>set<space>wrapscan<cr>',
  { remap = false, silent = true }
)


return nil
