# PathCopier 🖇️

> 点一下 Finder 工具栏图标 → 复制文件路径 → 搞定。

极简 macOS 工具栏工具，像 Go2Shell 一样轻量。**没后台进程、没菜单栏图标、没 Dock 图标。**

## 📦 安装

### 方式一：直接下载

从 [Releases](../../releases) 下载 `PathCopier.app`，放入 `/Applications`。

### 方式二：自己编译

```bash
git clone https://github.com/你的名字/PathCopier.git
cd PathCopier
make
```

需要 macOS 13+ 和 Xcode Command Line Tools。

## 🎯 使用

```
1. 打开访达
2. 按住 ⌘ 键
3. 把 /Applications/PathCopier.app 拖到 Finder 工具栏
   （搜索框右边）
```

| 操作 | 效果 |
|------|------|
| 选中文件 → 点图标 | 复制文件完整路径 |
| 没选中文件 → 点图标 | 复制当前文件夹路径 |
| 点完 → ⌘V | 粘贴路径 |

## 🏗 项目结构

```
PathCopier/
├── Sources/main.swift    ← 全部代码就一个文件
├── Info.plist            ← App 配置
├── Resources/AppIcon.png ← 简笔画图标
└── Makefile              ← 构建
```

整个 App 编译后 **~50KB**，极致轻量。

## 📝 License

MIT
