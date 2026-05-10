# GitHub 仓库创建指南

## 方法 1：在浏览器中手动创建（推荐）

### 步骤 1：创建新仓库

1. 打开浏览器，访问：https://github.com/new
2. 填写信息：
   - **Repository name**: `CountdownTimer`
   - **Description**: `⏱️ macOS 桌面倒计时小助手 - 追踪目标日期和坚持天数`
   - **选择 Public**（公开仓库）
   - ❌ **不要勾选** "Initialize this repository with a README"
3. 点击 **"Create repository"**

### 步骤 2：复制仓库 URL

创建成功后，页面会显示仓库 URL，类似：
```
https://github.com/shawn_jia/CountdownTimer.git
```

### 步骤 3：运行推送命令

回到终端，运行以下命令：

```bash
cd ~/Documents/work/localcode/AiLearning/CountdownTimer

# 设置远程仓库
git remote set-url origin https://github.com/shawn_jia/CountdownTimer.git

# 推送代码
git push -u origin main
```

当提示输入用户名时，输入：`shawn_jia`
当提示输入密码时，输入你的 **Personal Access Token**

---

## 方法 2：直接打开创建页面

👉 **点击这里直接创建仓库：**
https://github.com/new

填写名称为 `CountdownTimer`，选择 Public，然后点击创建！

---

## 验证成功

上传成功后，访问：
- **仓库地址**: https://github.com/shawn_jia/CountdownTimer
