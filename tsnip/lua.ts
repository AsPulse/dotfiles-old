import { Snippet } from 'https://deno.land/x/tsnip_vim@v0.5/mod.ts';

const autocmd: Snippet = {
  name: 'Snippet of vim autocmd',
  params: [
    {
      name: 'type',
      type: 'single_line',
    },
    {
      name: 'pattern',
      type: 'single_line',
    }
  ],
  render: ({ type, pattern }) => [
    `vim.api.nvim_create_autocmd({ '${type?.text ?? 'BufEnter'}' }, {`,
      ...(pattern?.text !== undefined ? [`  pattern = { '${pattern.text}' },`] : []),
      '  callback = function()',
      '    -- your code',
      '  end',
    '})',
  ].join('\n')
}

const keymap: Snippet = {
  name: 'Snippet of vim keymap',
  params: [
    {
      name: 'mode',
      type: 'single_line',
    },
    {
      name: 'pattern',
      type: 'single_line',
    },
  ],
  render: ({ mode, pattern }) => `vim.api.nvim_set_keymap('${mode?.text ?? 'n'}', '${pattern?.text ?? '(pattern here)'}', , {})`
}

export default {
  autocmd, keymap
};
