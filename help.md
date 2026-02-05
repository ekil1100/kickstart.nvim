# Neovim 快捷键参考

Leader 键: `<Space>`

---

## 基础操作

| 快捷键 | 功能 |
|--------|------|
| `<Esc>` | 清除搜索高亮 |
| `<C-h/j/k/l>` | 窗口间移动 |
| `<Esc><Esc>` | 退出终端模式 |
| `<leader>ww` | 保存文件 |
| `<leader>qq` | 退出全部 |
| `<leader>qQ` | 强制退出全部 |
| `<leader>qw` | 退出当前窗口 |
| `<leader>wq` | 保存全部并退出 |
| `<leader>tc` | 关闭当前 Tab |
| `<leader>to` | 只保留当前 Tab |
| `<leader>rl` | 重新加载配置 |
| `<leader>ls` | Lazy 同步插件 |

## 搜索 (Telescope)

| 快捷键 | 功能 |
|--------|------|
| `<leader>sf` | 搜索文件 |
| `<leader>sg` | 全局搜索 (grep) |
| `<leader>ss` | 选择 Telescope 功能 |
| `<leader>sw` | 搜索当前单词 |
| `<leader>sh` | 搜索帮助文档 |
| `<leader>sk` | 搜索快捷键 |
| `<leader>sd` | 搜索诊断信息 |
| `<leader>sr` | 恢复上次搜索 |
| `<leader>s.` | 搜索最近文件 |
| `<leader>sn` | 搜索 Neovim 配置文件 |
| `<leader>s/` | 在打开的文件中搜索 |
| `<leader>/` | 当前 buffer 模糊搜索 |
| `<leader><leader>` | 切换 buffer |

**Telescope 使用技巧：**
- 在 Telescope 窗口中按 `<C-/>` (插入模式) 或 `?` (普通模式) 查看所有快捷键
- `<C-n>/<C-p>` 或 `<Up>/<Down>` 选择结果
- `<CR>` 打开选中项
- `<C-x>` 水平分割打开
- `<C-v>` 垂直分割打开
- `<C-t>` 新标签页打开
- `<Esc>` 或 `<C-c>` 关闭 Telescope

**Buffer 列表标志（`<leader><leader>` 中显示）：**
| 标志 | 含义 |
|------|------|
| `%` | 当前 buffer |
| `#` | 替代 buffer（`<C-^>` 切换） |
| `a` | active — 已加载且显示在窗口中 |
| `h` | hidden — 已加载但未显示 |
| `+` | 有未保存的修改 |

常见组合：`%a` 当前且活跃，`#h` 替代且隐藏

## LSP

| 快捷键 | 功能 |
|--------|------|
| `grn` | 重命名 |
| `gra` | 代码操作 |
| `grr` | 查找引用 |
| `gri` | 跳转到实现 |
| `grd` | 跳转到定义 |
| `grD` | 跳转到声明 |
| `grt` | 跳转到类型定义 |
| `gO` | 文档符号 |
| `gW` | 工作区符号 |
| `<leader>th` | 切换 inlay hints |
| `<C-t>` | 跳转回上一个位置 (定义跳转后) |

**LSP 技巧：**
- `K` 查看文档悬浮窗，再按 `K` 进入悬浮窗，`q` 退出
- 光标停留时自动高亮相同符号

## 补全 (blink.cmp)

| 快捷键 | 功能 |
|--------|------|
| `<Tab>` | 接受补全 |
| `<C-n>/<C-p>` | 下/上一个选项 |
| `<C-space>` | 打开补全菜单/文档 |
| `<C-e>` | 关闭补全菜单 |
| `<C-k>` | 切换签名帮助 |
| `<Tab>/<S-Tab>` | snippet 跳转 |

## AI 补全 (Supermaven)

AI 补全建议会出现在 blink.cmp 菜单中，用 `<Tab>` 接受。

| 命令 | 功能 |
|------|------|
| `:SupermavenUseFree` | 使用免费版（无需注册） |
| `:SupermavenUsePro` | 登录 Pro 版 |
| `:SupermavenStatus` | 查看状态 |
| `:SupermavenLogout` | 退出登录 |
| `:SupermavenStart` | 启动 |
| `:SupermavenStop` | 停止 |

**首次使用：** 启动 Neovim 后运行 `:SupermavenUseFree` 激活免费版。

## 格式化

| 快捷键 | 功能 |
|--------|------|
| `<leader>f` | 格式化 buffer |
| 保存时 | 自动格式化 (Lua 全文件, C/C++ 仅修改行) |

## Session

| 快捷键 | 功能 |
|--------|------|
| `<leader>qs` | 恢复当前目录 session |
| `<leader>ql` | 恢复上次 session |
| 启动时 | 自动恢复 session (无参数启动时) |

## 文本对象 (mini.ai)

| 快捷键 | 功能 |
|--------|------|
| `va)` | 选中括号外部 |
| `vi)` | 选中括号内部 |
| `yinq` | 复制下一个引号内容 |
| `ci'` | 修改引号内容 |
| `daf` | 删除整个函数 |
| `vif` | 选中函数内部 |

## Surround (mini.surround)

| 快捷键 | 功能 |
|--------|------|
| `saiw)` | 给单词加括号 |
| `sa2w"` | 给两个单词加双引号 |
| `sd'` | 删除引号 |
| `sr)'` | 替换 ) 为 ' |
| `sf` | 查找右侧 surround |
| `sF` | 查找左侧 surround |
| `sh` | 高亮 surround |

---

## 文件树 (Neo-tree)

| 快捷键 | 功能 |
|--------|------|
| `\` | 打开/关闭文件树 |

**Neo-tree 内部操作：**
| 快捷键 | 功能 |
|--------|------|
| `<CR>` 或 `o` | 打开文件/展开目录 |
| `<Esc>` 或 `q` | 关闭 Neo-tree |
| `a` | 新建文件/目录 (以 `/` 结尾为目录) |
| `d` | 删除 |
| `r` | 重命名 |
| `c` | 复制 |
| `m` | 移动 |
| `y` | 复制路径 |
| `H` | 显示/隐藏隐藏文件 |
| `R` | 刷新 |
| `/` | 搜索 |
| `?` | 查看帮助 |

## Oil (文件管理)

| 快捷键 | 功能 |
|--------|------|
| `-` | 打开父目录 |

**Oil 使用方式：**
Oil 将目录显示为普通 buffer，你可以像编辑文本一样操作文件：
- 删除一行 = 删除文件
- 修改文件名 = 重命名
- 复制粘贴行 = 复制文件
- `dd` 然后到另一目录 `p` = 移动文件
- 保存 `:w` 执行所有更改
- `<C-c>` 放弃更改
- `-` 返回上级目录
- `<CR>` 进入目录/打开文件
- `g?` 查看帮助

## Harpoon (快速文件切换)

| 快捷键 | 功能 |
|--------|------|
| `<leader>a` | 添加当前文件到 Harpoon |
| `<C-e>` | 打开 Harpoon 菜单 |
| `<leader>1~4` | 跳转到标记的文件 1~4 |
| `<C-S-P>` | 上一个 Harpoon 文件 |
| `<C-S-N>` | 下一个 Harpoon 文件 |

**Harpoon 使用方式：**
Harpoon 用于在常用文件间快速跳转，适合同时编辑几个相关文件：
1. 打开一个常用文件，`<leader>a` 添加
2. 重复添加其他常用文件
3. `<C-e>` 打开菜单查看/编辑列表
4. 在菜单中可以删除行来移除文件，调整顺序
5. `<Esc>` 或 `q` 关闭菜单
6. `<leader>1` 到 `<leader>4` 快速跳转

## Undotree

| 快捷键 | 功能 |
|--------|------|
| `<leader>u` | 打开/关闭撤销树 |

**Undotree 使用方式：**
- 左侧显示撤销历史树，右侧显示 diff
- `j/k` 在历史中移动
- `<CR>` 跳转到该状态
- `q` 关闭 Undotree
- 可以恢复到任意历史状态，包括 redo 后丢失的分支

## Flash (快速跳转)

| 快捷键 | 功能 |
|--------|------|
| `s` | 跳转到任意位置 |
| `S` | 基于 Treesitter 选择 |
| `r` (operator mode) | 远程操作 |
| `R` (operator/visual) | Treesitter 搜索 |
| `<C-s>` (搜索时) | 切换 Flash 模式 |

**Flash 使用方式：**
1. 按 `s`，输入目标字符（如 `fo`）
2. 屏幕上所有匹配位置显示标签
3. 按对应标签字母跳转
4. `<Esc>` 取消

**Flash Treesitter (`S`)：**
- 选中代码块（函数、if 语句等）
- 按标签扩展/收缩选区

## Trouble (诊断列表)

| 快捷键 | 功能 |
|--------|------|
| `<leader>xx` | 全部诊断 |
| `<leader>xX` | 当前 buffer 诊断 |
| `<leader>cs` | 符号列表 |
| `<leader>cl` | LSP 定义/引用 |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

**Trouble 内部操作：**
| 快捷键 | 功能 |
|--------|------|
| `q` | 关闭 Trouble |
| `<CR>` | 跳转到问题位置 |
| `o` | 跳转并保持 Trouble 打开 |
| `j/k` | 上下移动 |
| `<Tab>` | 折叠/展开 |
| `r` | 刷新 |

## Terminal (ToggleTerm)

| 快捷键 | 功能 |
|--------|------|
| `<C-\>` | 打开/关闭浮动终端 |
| `1<C-\>` | 打开/切换到终端 1 |
| `2<C-\>` | 打开/切换到终端 2 |
| `3<C-\>` | 打开/切换到终端 3 |
| `<C-\><C-n>` | 终端内切换到 Normal 模式 |

**ToggleTerm 使用方式：**
- `<C-\>` 切换终端显示（终端内外都可用）
- 数字前缀 + `<C-\>` 切换到指定编号的终端
- `:ToggleTermToggleAll` 切换所有终端
- `:TermExec cmd="command"` 执行命令

## Git (Fugitive)

| 快捷键 | 功能 |
|--------|------|
| `<leader>gs` | Git status |
| `<leader>gd` | Git diff split |
| `<leader>gb` | Git blame |
| `<leader>gl` | Git log |

**Fugitive Status 窗口操作：**
| 快捷键 | 功能 |
|--------|------|
| `q` | 关闭 |
| `s` | Stage 文件/hunk |
| `u` | Unstage 文件/hunk |
| `=` | 展开 inline diff |
| `-` | Toggle stage/unstage |
| `cc` | 提交 |
| `ca` | 修改上次提交 |
| `<CR>` | 打开文件 |
| `dv` | 垂直 diff 分割 |
| `?` | 查看帮助 |

**Git Blame 窗口：**
- `q` 关闭
- `<CR>` 查看该 commit

## Git Signs (Hunk 操作)

**侧边栏符号：** `+` 新增, `~` 修改, `_` 删除

| 快捷键 | 功能 |
|--------|------|
| `]c` / `[c` | 跳转到下一个/上一个变更 |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage 整个 buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset 整个 buffer |
| `<leader>hp` | 预览 hunk |
| `<leader>hb` | 行级 blame |
| `<leader>hd` | Diff (对比 index) |
| `<leader>hD` | Diff (对比上次 commit) |
| `<leader>tb` | 切换行级 blame 显示 |
| `<leader>tD` | 切换删除行预览 |

**Visual 模式：**
| 快捷键 | 功能 |
|--------|------|
| `<leader>hs` | Stage 选中区域 |
| `<leader>hr` | Reset 选中区域 |

## Diffview (Review 模式)

| 快捷键 | 功能 |
|--------|------|
| `<leader>gv` | 进入 Review 模式（查看所有修改） |
| `<leader>gc` | 退出 Review 模式 |
| `<leader>gh` | 当前文件历史 |
| `<leader>gH` | 整个分支历史 |

**Review 模式内部操作（默认快捷键）：**
| 快捷键 | 功能 |
|--------|------|
| `<Tab>` / `<S-Tab>` | 下一个/上一个文件 |
| `]c` / `[c` | 下一个/上一个变更 (hunk) |
| `g<C-x>` | 循环切换布局（水平/垂直） |
| `<leader>e` | 聚焦文件面板 |
| `<leader>b` | 切换文件面板显示 |
| `gf` | 打开文件（退出 diff） |
| `<C-w>gf` | 新 tab 打开文件 |
| `q` | 退出 Review 模式 |
| `g?` | 查看帮助 |

**常用命令：**
```vim
" 查看 PR 修改（相对于 main 分支）
:DiffviewOpen origin/main...HEAD

" 查看最近 3 个 commit 的修改
:DiffviewOpen HEAD~3..HEAD

" 查看已 stage 的修改
:DiffviewOpen --staged

" 查看某个 commit
:DiffviewOpen abc1234

" 比较两个分支
:DiffviewOpen dev...main
```

**Merge Tool（冲突解决）：**

rebase/merge 遇到冲突时，打开 diffview 会进入三栏视图：

| 快捷键 | 功能 |
|--------|------|
| `]x` / `[x` | 跳转到下一个/上一个冲突 |
| `<leader>co` | 选择 OURS 版本（当前分支） |
| `<leader>ct` | 选择 THEIRS 版本（合入分支） |
| `<leader>cb` | 选择 BASE 版本（共同祖先） |
| `<leader>ca` | 保留所有版本 |
| `dx` | 删除冲突区域 |
| `<leader>cO` | 整个文件选择 OURS |
| `<leader>cT` | 整个文件选择 THEIRS |
| `<leader>cB` | 整个文件选择 BASE |

**文件面板操作：**
| 快捷键 | 功能 |
|--------|------|
| `i` | 切换 list/tree 视图 |
| `f` | 折叠空目录 |
| `R` | 刷新文件列表 |
| `[F` / `]F` | 跳到第一个/最后一个文件 |
| `gf` | 在原 tab 打开文件（退出 diff） |
| `<C-w>gf` | 新 tab 打开文件 |
| `za` | 展开/折叠目录 |
| `zo` / `zc` | 展开/折叠当前目录 |
| `zR` / `zM` | 展开/折叠所有目录 |
| `g<C-x>` | 循环切换布局 |
| `g?` | 打开帮助 |

**使用技巧：**
- 双栏 diff：左边是 HEAD 版本，右边是工作区版本
- 右边栏可直接编辑，修改后 `:w` 保存
- 文件面板显示所有修改的文件，按 `<CR>` 打开
- `]c` / `[c` 在 hunk 间快速跳转，配合 `X` 可选择性回退
- 冲突解决后记得 `:w` 保存，然后 `git add` 标记已解决

---

## 常用命令

| 命令 | 功能 |
|------|------|
| `:Lazy` | 插件管理 (`q` 退出) |
| `:Mason` | LSP/工具管理 (`q` 退出) |
| `:Telescope <tab>` | 查看所有 Telescope 功能 |
| `:ConformInfo` | 查看格式化配置 |
| `:checkhealth` | 检查系统健康状态 |
| `:TSUpdate` | 更新 Treesitter 解析器 |

## 插件加速配置（国内用户）

lazy.nvim 支持配置国内镜像加速插件下载：

### 当前配置
1. **默认使用 GitHub 直连**（镜像配置已注释）
2. **配置位置**：`init.lua` 中的 `config.git.url_format`
3. **超时时间**：已增加到 300-600 秒避免网络问题

### 镜像源（可切换）
如需使用镜像，取消注释 `init.lua` 中的 `url_format`：
```lua
-- gitclone.com 镜像（测试可用）
url_format = "https://gitclone.com/github.com/%s.git"

-- ghproxy 镜像（TLS 握手可能失败）
-- url_format = "https://mirror.ghproxy.com/https://github.com/%s.git"

-- CNPMJS 镜像（域名已失效）
-- url_format = "https://github.com.cnpmjs.org/%s.git"

-- FastGit 镜像（可能超时）
-- url_format = "https://hub.fastgit.org/%s.git"
```

### 重新安装插件
更改镜像后需要重新安装插件：
```vim
:Lazy clean
:Lazy install
```

### Git 代理方案（推荐）
如果使用代理工具（如 Clash、V2Ray）：
```bash
# HTTP 代理
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890

# SOCKS5 代理
git config --global http.proxy socks5://127.0.0.1:7890
git config --global https.proxy socks5://127.0.0.1:7890

# 取消代理
git config --global --unset http.proxy
git config --global --unset https.proxy
```

### 环境变量代理
```bash
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
```

### 注意事项
- 镜像服务可能不稳定，建议准备备用方案
- 某些插件子模块可能无法通过镜像下载
- 代理方案通常更稳定可靠

---

## 实用技巧

### 快速退出各种窗口
- 大多数浮动窗口/侧边栏: `q` 或 `<Esc>`
- Telescope: `<Esc>` 或 `<C-c>`
- 帮助文档: `:q` 或 `<C-w>q`
- 终端模式: `<Esc><Esc>` 然后 `:q`

### 多光标编辑替代方案
Neovim 没有原生多光标，但可以用：
- `*` 搜索当前单词，然后 `cgn` 修改，`.` 重复
- `:%s/old/new/gc` 交互式替换
- 宏录制: `qa` 开始录制到 a，操作，`q` 结束，`@a` 重放，`10@a` 重复 10 次

### 快速移动
- `{` / `}` 段落跳转
- `%` 匹配括号跳转
- `<C-d>` / `<C-u>` 半屏滚动
- `zz` 当前行居中
- `gg` / `G` 文件开头/结尾
- `<number>G` 跳转到指定行
- `gd` 跳转到局部定义
- `gf` 跳转到光标下的文件

### 快速编辑
- `ciw` 修改整个单词
- `ci"` 修改引号内内容
- `C` 修改到行尾
- `D` 删除到行尾
- `S` 删除整行并进入插入模式
- `J` 合并下一行
- `<C-a>` / `<C-x>` 数字增减

### 分屏
- `:sp` / `:vs` 水平/垂直分屏
- `<C-w>o` 只保留当前窗口
- `<C-w>=` 均分窗口大小
- `<C-w>_` / `<C-w>|` 最大化高度/宽度

### 标签页
- `:tabnew` 新建标签页
- `gt` / `gT` 下/上一个标签页
- `:tabclose` 关闭当前标签页

### 寄存器
- `"ayy` 复制到寄存器 a
- `"ap` 从寄存器 a 粘贴
- `"+y` 复制到系统剪贴板
- `:reg` 查看所有寄存器

### 标记
- `ma` 设置标记 a
- `'a` 跳转到标记 a 所在行
- `` `a `` 跳转到标记 a 精确位置
- `''` 跳回上一个位置

### Which-Key
忘记快捷键时，按 `<leader>` 等待片刻，会显示所有可用的后续按键。
