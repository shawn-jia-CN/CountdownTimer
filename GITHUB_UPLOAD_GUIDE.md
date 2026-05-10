# GitHub 上传指南

## 🚀 快速上传到 GitHub

### 步骤 1：安装 GitHub CLI（如果还没有）

打开终端，运行：

```bash
/bin/bash -c "$(curl -fsSL https://github.com/cli/cli/blob/trunk/docs/install.sh)"
```

### 步骤 2：登录 GitHub

```bash
gh auth login
```

按照提示选择：
- GitHub.com
- HTTPS
- Login with web browser
- 按照指示在浏览器中授权

### 步骤 3：创建仓库并上传

在 `CountdownTimer` 文件夹中运行：

```bash
cd /Users/jiaxuebin/Documents/work/localcode/AiLearning/CountdownTimer
gh repo create CountdownTimer --public --source=. --push
```

### 步骤 4：验证上传

访问 https://github.com/shawn_jia/CountdownTimer 查看你的仓库！

---

## 📋 或者手动方式（不使用 gh CLI）

如果你不想安装 GitHub CLI，也可以手动操作：

### 1. 在 GitHub 网站上创建仓库

1. 访问 https://github.com/new
2. Repository name: `CountdownTimer`
3. 选择 Public
4. 不要勾选 "Initialize this repository with a README"
5. 点击 "Create repository"

### 2. 在终端运行以下命令

```bash
cd /Users/jiaxuebin/Documents/work/localcode/AiLearning/CountdownTimer

# 添加远程仓库
git remote add origin https://github.com/shawn_jia/CountdownTimer.git

# 推送代码
git push -u origin master
```

### 3. 输入凭据

根据提示输入你的 GitHub 用户名和密码（或 Personal Access Token）

---

## ✅ 验证成功

上传成功后，你应该能在 GitHub 上看到：
- 📄 完整的项目文件
- 📖 README.md 自动渲染
- 🔗 index.html 可以直接在 GitHub Pages 上预览

---

## 🎉 恭喜！

你的 Countdown Timer 项目现在已经：
- ✅ 使用 Git 版本控制
- ✅ 推送到 GitHub
- ✅ 公开分享给全世界

快去 https://github.com/shawn_jia/CountdownTimer 看看吧！

需要我帮你运行上传命令吗？
