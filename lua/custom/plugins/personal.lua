local function gh(repo) return 'https://github.com/' .. repo end

local supermaven_enabled = vim.fn.getenv 'DISABLE_SUPERMAVEN' ~= '1'

---@type (string|vim.pack.Spec)[]
local plugins = {
  gh 'ziglang/zig.vim',
  gh 'folke/persistence.nvim',
  gh 'folke/snacks.nvim',
  gh 'joechrisellis/lsp-format-modifications.nvim',
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
  gh 'mbbill/undotree',
  gh 'folke/flash.nvim',
  gh 'folke/trouble.nvim',
  gh 'stevearc/oil.nvim',
  gh 'tpope/vim-fugitive',
  { src = gh 'akinsho/toggleterm.nvim', version = vim.version.range '*' },
  gh 'sindrets/diffview.nvim',
}

if supermaven_enabled then vim.list_extend(plugins, {
  gh 'supermaven-inc/supermaven-nvim',
  gh 'huijiro/blink-cmp-supermaven',
}) end

vim.pack.add(plugins)

local function map(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { desc = desc }) end

-- Session management
require('persistence').setup {}
map('n', '<leader>qs', function() require('persistence').load() end, 'Restore Session')
map('n', '<leader>ql', function() require('persistence').load { last = true } end, 'Restore Last Session')

-- Quality-of-life helpers
require('snacks').setup {
  bigfile = { enabled = true },
}

-- AI completion
if supermaven_enabled then
  local log = require 'supermaven-nvim.logger'
  local original_warn = log.warn

  log.warn = function(self, message)
    if message and message:match 'nvim%-cmp is not available' then return end
    return original_warn(self, message)
  end

  require('supermaven-nvim').setup {
    disable_inline_completion = true,
    disable_keymaps = true,
    log_level = 'error',
  }
end

-- Format only modified C/C++ lines on save
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Format modified C/C++ lines',
  group = vim.api.nvim_create_augroup('custom-format-modifications', { clear = true }),
  pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
  callback = function() require('lsp-format-modifications').format_modifications(vim.api.nvim_get_current_buf()) end,
})

-- Quick file navigation
local harpoon = require 'harpoon'
harpoon:setup()
map('n', '<leader>a', function() harpoon:list():add() end, 'Harpoon: Add file')
map('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'Harpoon: Toggle menu')
for index = 1, 4 do
  local slot = index
  map('n', '<leader>' .. slot, function() harpoon:list():select(slot) end, 'Harpoon: File ' .. slot)
end
map('n', '<C-S-P>', function() harpoon:list():prev() end, 'Harpoon: Previous')
map('n', '<C-S-N>', function() harpoon:list():next() end, 'Harpoon: Next')

-- Undo history
map('n', '<leader>u', '<cmd>UndotreeToggle<cr>', 'Toggle Undotree')

-- Fast navigation
require('flash').setup {}
map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, 'Flash: Jump')
map({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, 'Flash: Treesitter')
map('o', 'r', function() require('flash').remote() end, 'Flash: Remote')
map({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, 'Flash: Treesitter Search')
map('c', '<C-s>', function() require('flash').toggle() end, 'Flash: Toggle Search')

-- Diagnostics and symbols
require('trouble').setup {}
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', 'Trouble: Diagnostics')
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', 'Trouble: Buffer Diagnostics')
map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', 'Trouble: Symbols')
map('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', 'Trouble: LSP Definitions/References')
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', 'Trouble: Location List')
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', 'Trouble: Quickfix List')

-- File management
require('oil').setup {
  view_options = {
    show_hidden = true,
  },
}
map('n', '-', '<cmd>Oil<cr>', 'Oil: Open parent directory')

-- Git commands
map('n', '<leader>gs', '<cmd>Git<cr>', 'Git: Status (Fugitive)')
map('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', 'Git: Diff split')
map('n', '<leader>gb', '<cmd>Git blame<cr>', 'Git: Blame')
map('n', '<leader>gl', '<cmd>Git log<cr>', 'Git: Log')

-- Terminal management
require('toggleterm').setup {
  open_mapping = [[<C-\>]],
  direction = 'float',
  float_opts = {
    border = 'curved',
  },
}

-- Git diff and history views
local diffview_actions = require 'diffview.actions'
require('diffview').setup {
  enhanced_diff_hl = true,
  file_panel = {
    listing_style = 'list',
    win_config = {
      position = 'right',
      width = 35,
    },
  },
  keymaps = {
    file_panel = {
      { 'n', '<leader>e', diffview_actions.focus_entry, { desc = 'Focus diff view' } },
    },
  },
}
map('n', '<leader>gv', '<cmd>DiffviewOpen<cr>', 'Git: Review mode (all changes)')
map('n', '<leader>gc', '<cmd>DiffviewClose<cr>', 'Git: Close review mode')
map('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', 'Git: File history')
map('n', '<leader>gH', '<cmd>DiffviewFileHistory<cr>', 'Git: Branch history')
