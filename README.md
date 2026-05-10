# Countdown Timer - macOS 桌面倒计时小助手

一个简洁实用的 macOS 菜单栏倒计时工具，帮助你追踪目标日期和坚持天数。

## 功能特点

✅ **菜单栏应用** - 轻量不占桌面空间，显示在顶部状态栏
⏱️ **实时倒计时** - 显示距离目标日期的精确时间（天/时/分/秒）
💪 **坚持追踪** - 记录每次点击，追踪你的坚持天数
🎯 **自定义目标** - 轻松设置你的目标日期
🔒 **本地存储** - 数据安全存储在本地，无需网络

## 快速开始

### 方法一：使用命令行构建（推荐）

#### 步骤 1：安装必要的工具

首先需要安装 XcodeGen（用于生成 Xcode 项目）：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install xcodegen
```

#### 步骤 2：生成 Xcode 项目并构建

```bash
cd CountdownTimer
xcodegen generate
```

#### 步骤 3：在 Xcode 中打开项目

```bash
open CountdownTimer.xcodeproj
```

在 Xcode 中：
1. 选择 **Product** → **Build** (或按 ⌘B)
2. 选择 **Product** → **Run** (或按 ⌘R)

### 方法二：手动使用 Swift 编译器

如果你熟悉 Swift 编译器，可以直接使用：

```bash
cd CountdownTimer
swift Sources/main.swift
```

## 使用方法

1. **启动应用**
   - 双击 `CountdownTimer.app`
   - 应用图标 ⏱️ 会显示在顶部菜单栏

2. **查看倒计时**
   - 点击菜单栏图标
   - 窗口会显示距离目标日期的倒计时

3. **追踪坚持天数**
   - 每次点击菜单栏图标都会记录一次
   - 自动计算你已坚持的天数

4. **设置目标日期**
   - 右键点击菜单栏图标
   - 选择"设置目标日期"
   - 选择你想要的日期并确认

5. **退出应用**
   - 右键点击菜单栏图标
   - 选择"退出"

## 项目结构

```
CountdownTimer/
├── Sources/
│   ├── main.swift              # 应用入口
│   ├── AppDelegate.swift       # 应用代理（菜单栏设置）
│   ├── DataManager.swift       # 数据管理（存储/读取）
│   └── CountdownWindow.swift   # 倒计时窗口UI
├── Resources/
│   ├── Info.plist              # 应用配置
│   └── Assets.xcassets/        # 应用图标
├── Scripts/
│   ├── build.sh                # XcodeGen 构建脚本
│   └── build_swift.sh          # Swift 编译器脚本
├── project.yml                 # XcodeGen 配置
├── Package.swift               # Swift Package 配置
└── README.md                   # 本文档
```

## 技术栈

- **语言**: Swift 5.9
- **框架**: AppKit (原生 macOS)
- **最低版本**: macOS 12.0 (Monterey)
- **构建工具**: XcodeGen 或 Swift Package Manager
- **数据存储**: UserDefaults

## 数据存储

所有数据都存储在本地 `UserDefaults` 中：

- `targetDate` - 目标日期
- `lastClickDate` - 上次点击时间
- `streakStartDate` - 坚持开始日期

## 界面预览

```
┌─────────────────────────────────┐
│      ⏱️ Countdown Timer        │
│                                 │
│   距离目标日期还有：            │
│                                 │
│      126 天 5 小时 32 分钟       │
│                                 │
│   ─────────────────────────     │
│                                 │
│   💪 你已坚持：                  │
│                                 │
│        45 天                    │
│                                 │
│   ─────────────────────────     │
│                                 │
│   上次记录：2024-01-15 09:30    │
│                                 │
└─────────────────────────────────┘
```

## 开发说明

如果你想修改或扩展功能：

### 修改目标日期默认设置

编辑 [AppDelegate.swift](file:///Users/jiaxuebin/Documents/work/localcode/AiLearning/CountdownTimer/Sources/AppDelegate.swift#L51) 中的 `setupDefaultTargetDate()` 方法。

### 修改界面样式

编辑 [CountdownWindow.swift](file:///Users/jiaxuebin/Documents/work/localcode/AiLearning/CountdownTimer/Sources/CountdownWindow.swift#L42) 中的 `setupUI()` 方法。

### 修改数据存储逻辑

编辑 [DataManager.swift](file:///Users/jiaxuebin/Documents/work/localcode/AiLearning/CountdownTimer/Sources/DataManager.swift) 中的相关方法。

## 常见问题

### Q: 应用启动后没有看到图标？
A: 请检查菜单栏（屏幕顶部状态栏），可能需要向右滚动查找 ⏱️ 图标。

### Q: 如何设置多个目标日期？
A: 当前版本只支持单个目标日期。后续版本会支持多目标功能。

### Q: 数据会丢失吗？
A: 数据存储在本地，重启应用不会丢失。除非删除应用或清除用户数据。

### Q: 如何开机自启动？
A: macOS 系统偏好设置 → 用户与群组 → 登录项 → 添加 CountdownTimer.app

## 版本历史

### v1.0.0 (当前版本)
- ✅ 菜单栏应用基础功能
- ✅ 实时倒计时显示
- ✅ 坚持天数追踪
- ✅ 目标日期设置
- ✅ 本地数据持久化

## 贡献与反馈

如果你有任何问题、建议或想要贡献代码，欢迎在项目页面提出 Issue 或 Pull Request。

## 许可证

本项目仅供个人学习和使用。

---

**祝你使用愉快！坚持就是胜利 💪**
