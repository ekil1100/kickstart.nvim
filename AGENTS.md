# AGENTS.md

## 协作规则

- **新增快捷键前必须征得用户同意。** 建议快捷键或配置变更时，先询问：“有 xxx 的最佳实践，是否要应用？”
- **推荐快捷键前先检查冲突。** 如果按键已有映射，先说明它当前的功能。
- 优先解释现有功能和命令的用法，不擅自将配置建议写入文件。

需要了解快捷键和插件用法时，查阅 [help.md](help.md)。

## 配置结构

本仓库基于 **Kickstart.nvim**，使用 Neovim 内置的 **vim.pack** 管理插件。

```text
init.lua                      主配置，包含 Kickstart 默认设置和详细注释
lua/
├── kickstart/
│   ├── health.lua            :checkhealth 检查模块
│   └── plugins/              可选插件模块，如 debug、lint、neo-tree
└── custom/                   与 Kickstart 默认配置分离的自定义配置
    ├── plugins/
    │   ├── init.lua          自定义插件模块加载器
    │   └── personal.lua      个人插件配置
    ├── keymaps.lua           自定义快捷键
    └── autocmds.lua          自定义自动命令
```

新增自定义配置时，按职责放入上述 `lua/custom/` 文件或目录，与 Kickstart 默认配置保持分离，便于同步上游更新和执行 rebase。

## 语言支持与格式化

- **LSP 组件：** mason.nvim → mason-lspconfig.nvim → nvim-lspconfig；补全使用 blink.cmp。
- **语言服务器：** clangd（C/C++）、rust_analyzer（Rust）、zls（Zig）、ts_ls（TypeScript）、stylua 和 lua_ls（Lua）。
- **保存时格式化：** conform.nvim 负责 Lua 和 JavaScript/TypeScript 的保存时格式化；Lua 使用 Stylua 语言服务器，JavaScript/TypeScript 使用 Biome。
- **C/C++ 格式化：** 通过 lsp-format-modifications.nvim 调用 clang-format，仅格式化修改过的行。

## 外部依赖

- 必需：Neovim 0.12+、git、make 或 cmake、unzip、ripgrep、C 编译器。
- 可选：fd-find、Nerd Font 字体。
