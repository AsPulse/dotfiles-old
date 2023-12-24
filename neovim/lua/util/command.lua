local export = {}

function export.command_assist(command)
  return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), 'n', false)
end

return export;
