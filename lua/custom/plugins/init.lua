-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Zig language support
  'ziglang/zig.vim',

  -- Session management
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = {
      { '<leader>qs', function() require('persistence').load() end, desc = 'Restore Session' },
      { '<leader>ql', function() require('persistence').load { last = true } end, desc = 'Restore Last Session' },
    },
  },

  -- Telescope customizations (override kickstart defaults)
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      defaults = {
        file_ignore_patterns = {},
        mappings = {
          i = {
            ['<C-j>'] = function(...) return require('telescope.actions').move_selection_next(...) end,
            ['<C-k>'] = function(...) return require('telescope.actions').move_selection_previous(...) end,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        live_grep = {
          additional_args = { '--hidden', '--no-ignore' },
        },
      },
    },
    keys = {
      { "<leader>s'", function() require('telescope.builtin').marks() end, desc = '[S]earch Marks' },
    },
  },

  -- Snacks: Collection of small QoL plugins (bigfile optimization)
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
    },
  },

  -- Supermaven: AI code completion
  -- To disable: export DISABLE_SUPERMAVEN=1
  {
    'supermaven-inc/supermaven-nvim',
    cond = function()
      return vim.fn.getenv('DISABLE_SUPERMAVEN') ~= '1'
    end,
    event = 'InsertEnter',
    opts = {
      disable_inline_completion = true, -- Use blink.cmp instead
      disable_keymaps = true,
    },
  },
  {
    'huijiro/blink-cmp-supermaven',
    cond = function()
      return vim.fn.getenv('DISABLE_SUPERMAVEN') ~= '1'
    end,
  },

  -- Format only modified lines (git-based)
  {
    'joechrisellis/lsp-format-modifications.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Auto format modifications on save for C/C++
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
        callback = function()
          local lsp_format_modifications = require 'lsp-format-modifications'
          lsp_format_modifications.format_modifications(vim.api.nvim_get_current_buf())
        end,
      })
    end,
  },

  -- Harpoon: Quick file navigation
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: Add file' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: Toggle menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: File 1' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: File 2' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: File 3' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: File 4' })

      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon: Previous' })
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end, { desc = 'Harpoon: Next' })
    end,
  },

  -- Undotree: Visualize undo history
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle Undotree' },
    },
  },

  -- Flash: Quick navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash: Jump',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash: Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Flash: Remote',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Flash: Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Flash: Toggle Search',
      },
    },
  },

  -- Trouble: Better diagnostics list
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble: Diagnostics' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Trouble: Buffer Diagnostics' },
      { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Trouble: Symbols' },
      { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'Trouble: LSP Definitions/References' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Trouble: Location List' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble: Quickfix List' },
    },
  },

  -- Oil: File manager as buffer
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'Oil: Open parent directory' },
    },
  },

  -- Fugitive: Git commands
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gdiffsplit', 'Gread', 'Gwrite', 'Ggrep', 'GMove', 'GDelete', 'GBrowse' },
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = 'Git: Status (Fugitive)' },
      { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git: Diff split' },
      { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git: Blame' },
      { '<leader>gl', '<cmd>Git log<cr>', desc = 'Git: Log' },
    },
  },

  -- ToggleTerm: Better terminal management
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<C-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    },
  },

  -- Diffview: Git diff and merge tool (Review mode)
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gv', '<cmd>DiffviewOpen<cr>', desc = 'Git: Review mode (all changes)' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Git: Close review mode' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git: File history' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Git: Branch history' },
    },
    opts = function()
      local actions = require('diffview.actions')
      return {
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
            { 'n', '<leader>e', actions.focus_entry, { desc = 'Focus diff view' } },
          },
        },
      }
    end,
  },
}
