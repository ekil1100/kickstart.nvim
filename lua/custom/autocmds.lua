-- Custom autocommands (separated from kickstart defaults)

-- Detect bash files without .sh extension
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Detect bash files',
  group = vim.api.nvim_create_augroup('custom-detect-bash-files', { clear = true }),
  pattern = { '.bashrc', '.bash_profile', '.bash_logout', '.bash_aliases', 'bashrc', 'bash_profile', '*.bash' },
  callback = function()
    vim.bo.filetype = 'bash'
  end,
})

-- Auto reload files changed outside of Neovim
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'CursorHold' }, {
  desc = 'Check for file changes outside of Neovim',
  group = vim.api.nvim_create_augroup('custom-autoread', { clear = true }),
  command = 'checktime',
})

-- Auto restore session on startup (only when no args passed)
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('custom-restore-session', { clear = true }),
  callback = function()
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      require('persistence').load()
    end
  end,
  nested = true,
})
