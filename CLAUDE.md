# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Interaction Guidelines

- **Do not add keymaps without asking.** When suggesting keymaps or configuration changes, first ask: "有 xxx 的最佳实践，是否要应用？"
- **Check for keymap conflicts before recommending.** Before suggesting any keymaps, verify they don't conflict with existing mappings. If the proposed key already has a function, inform the user what it currently does.
- Explain how to use features/commands instead of automatically adding them to config.

## Overview

This is a **Kickstart.nvim** configuration - a well-documented single-file Neovim setup that serves as both a learning resource and functional IDE. It uses **lazy.nvim** for plugin management.

## Structure

```
init.lua                      # Main config (kickstart defaults, heavily commented)
lua/
├── kickstart/
│   ├── health.lua           # :checkhealth module
│   └── plugins/             # Optional modules (debug, gitsigns, lint, neo-tree, etc.)
└── custom/                  # User customizations (decoupled from kickstart)
    ├── plugins/init.lua     # Custom plugin specs
    ├── keymaps.lua          # Custom keymaps
    └── autocmds.lua         # Custom autocommands
```

## Key Architecture Patterns

**Plugin Management:** lazy.nvim with lazy-loading via events, commands, and filetypes.

**LSP Stack:**
- `mason.nvim` → installs language servers
- `mason-lspconfig.nvim` → bridges mason and lspconfig
- `nvim-lspconfig` → configures LSP
- `blink.cmp` → completion engine (modern alternative to nvim-cmp)

**Currently Enabled Language Servers:** `clangd` (C/C++), `zls` (Zig), `lua_ls` (Lua)

**Formatting:** `conform.nvim` handles formatting. Lua uses stylua with format-on-save. C/C++ uses clang-format with format-on-save for modified lines only (via `lsp-format-modifications.nvim`).

## Keymap Conventions

- **Leader:** `<space>`
- **`<leader>s*`** - Search/Telescope (`sf` files, `sg` grep, `sk` keymaps, `sd` diagnostics)
- **`gr*`** - LSP actions (`grn` rename, `gra` code action, `grr` references, `grd` definition)
- **`<leader>f`** - Format buffer
- **`<leader>q*`** - Quit/Session (`qq` quit all, `qw` quit window, `qs` restore session)
- **`<leader>w*`** - Write (`ww` save, `wq` save all and quit)
- **`<leader>t*`** - Tabs (`tn` new, `tc` close, `to` only)
- **`<leader>x*`** - Trouble/diagnostics (`xx` diagnostics, `xQ` quickfix)

## Enabling Optional Plugins

Uncomment the relevant `require` line in init.lua (around line 1021-1028):
- `require 'kickstart.plugins.debug'` - DAP debugging
- `require 'kickstart.plugins.indent_line'` - Indentation guides
- `require 'kickstart.plugins.lint'` - nvim-lint

**Already enabled:** autopairs, neo-tree, gitsigns (with keymaps)

## Adding Customizations

**Plugins:** Add to `lua/custom/plugins/init.lua`
**Keymaps:** Add to `lua/custom/keymaps.lua`
**Autocmds:** Add to `lua/custom/autocmds.lua`

This keeps custom config decoupled from kickstart for easier upstream merges.

## Custom Plugins (lua/custom/plugins/init.lua)

Current custom plugins beyond kickstart defaults:
- `zig.vim` - Zig language support
- `persistence.nvim` - Session management (`<leader>qs` restore, `<leader>ql` last session, auto-restore on startup)
- `telescope.nvim` overrides - hidden files, `C-j/k` navigation, `<leader>s'` marks
- `harpoon` - Quick file navigation (`<leader>a`, `<C-e>`, `<leader>1-4`)
- `undotree` - Undo history visualization (`<leader>u`)
- `flash.nvim` - Quick jump navigation (`s`, `S`)
- `trouble.nvim` - Better diagnostics list (`<leader>xx`)
- `oil.nvim` - File manager as buffer (`-`)
- `vim-fugitive` - Git commands (`<leader>gs/gd/gb/gl`)
- `toggleterm.nvim` - Floating terminal (`<C-\>`)
- `diffview.nvim` - Git diff review mode (`<leader>gv/gc/gh/gH`)
- `lsp-format-modifications.nvim` - Format only modified lines (C/C++)

## Custom Keymaps (lua/custom/keymaps.lua)

- `<leader>ww` - Write file
- `<leader>qq` - Quit all
- `<leader>qQ` - Quit all (force)
- `<leader>qw` - Quit window
- `<leader>wq` - Write all and quit
- `<leader>tn/tc/to` - Tab new/close/only
- `<leader>rl` - Reload config
- `<leader>ls` - Lazy sync
- `<leader>re` - Refresh buffer from disk

## Custom Autocmds (lua/custom/autocmds.lua)

- Detect bash files without `.sh` extension
- Auto restore session on startup (when no args passed)

## External Dependencies

Required: git, make (or cmake), unzip, ripgrep, a C compiler
Optional: fd-find, Nerd Font (for icons)
