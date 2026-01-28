-- Custom keymaps (separated from kickstart defaults)

-- Save keymap
vim.keymap.set('n', '<leader>ww', '<cmd>w<cr>', { desc = '[W]rite file' })

-- Quit keymaps
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit all' })
vim.keymap.set('n', '<leader>qQ', '<cmd>qa!<cr>', { desc = '[Q]uit all (force)' })
vim.keymap.set('n', '<leader>qw', '<cmd>q<cr>', { desc = '[Q]uit [W]indow' })
vim.keymap.set('n', '<leader>wq', '<cmd>wqa<cr>', { desc = '[W]rite all and [Q]uit' })

-- Tab keymaps
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = '[T]ab [N]ew' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = '[T]ab [C]lose' })
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>', { desc = '[T]ab [O]nly (close others)' })

-- Reload config
vim.keymap.set('n', '<leader>rl', '<cmd>source $MYVIMRC<cr>', { desc = '[R]e[l]oad config' })
vim.keymap.set('n', '<leader>ls', '<cmd>Lazy sync<cr>', { desc = '[L]azy [S]ync' })
vim.keymap.set('n', '<leader>re', '<cmd>e!<cr>', { desc = '[R]efresh buffer from disk' })
