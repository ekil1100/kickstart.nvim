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

-- Auto switch to English input method (ABC) in Normal mode (macOS only)
if vim.fn.has('macunix') == 1 then
  local im_english = 'com.apple.keylayout.ABC'
  local im_prev = im_english

  vim.api.nvim_create_autocmd('InsertLeave', {
    desc = 'Switch to English input method when leaving Insert mode',
    group = vim.api.nvim_create_augroup('custom-im-switch', { clear = true }),
    callback = function()
      im_prev = vim.fn.system('im-select'):gsub('%s+', '')
      vim.fn.jobstart({ 'im-select', im_english }, { detach = true })
    end,
  })

  vim.api.nvim_create_autocmd('InsertEnter', {
    desc = 'Restore previous input method when entering Insert mode',
    group = vim.api.nvim_create_augroup('custom-im-restore', { clear = true }),
    callback = function()
      vim.fn.jobstart({ 'im-select', im_prev }, { detach = true })
    end,
  })

  vim.api.nvim_create_autocmd('FocusGained', {
    desc = 'Switch to English input method when Neovim gains focus',
    group = vim.api.nvim_create_augroup('custom-im-focus', { clear = true }),
    callback = function()
      if vim.fn.mode() ~= 'i' then
        vim.fn.jobstart({ 'im-select', im_english }, { detach = true })
      end
    end,
  })
end

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
