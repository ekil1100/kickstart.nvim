# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

For detailed keymaps and plugin usage, see [help.md](help.md).

## Rules

- **Do not add keymaps without asking.** When suggesting keymaps or configuration changes, first ask: "有 xxx 的最佳实践，是否要应用？"
- **Check for keymap conflicts before recommending.** Before suggesting any keymaps, verify they don't conflict with existing mappings. If the proposed key already has a function, inform the user what it currently does.
- Explain how to use features/commands instead of automatically adding them to config.

## Architecture

This is a **Kickstart.nvim** configuration using **lazy.nvim** for plugin management.

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

**Adding customizations:** plugins → `lua/custom/plugins/init.lua`, keymaps → `lua/custom/keymaps.lua`, autocmds → `lua/custom/autocmds.lua`. This keeps custom config decoupled from kickstart for easier upstream merges.

**LSP Stack:** mason.nvim → mason-lspconfig.nvim → nvim-lspconfig, with blink.cmp for completion.

**Formatting:** conform.nvim with format-on-save. Lua uses stylua (full file). C/C++ uses clang-format (modified lines only via lsp-format-modifications.nvim).

**Language Servers:** clangd (C/C++), zls (Zig), lua_ls (Lua).

**External Dependencies:** git, make (or cmake), unzip, ripgrep, a C compiler. Optional: fd-find, Nerd Font.
