#!/bin/bash

echo "========================================="
echo "  GitHub 上传脚本"
echo "========================================="
echo ""

echo "📝 需要执行以下步骤："
echo ""
echo "1️⃣  安装 GitHub CLI（如果未安装）"
echo "   /bin/bash -c \"\$(curl -fsSL https://github.com/cli/cli/blob/trunk/docs/install.sh)\""
echo ""
echo "2️⃣  登录 GitHub"
echo "   gh auth login"
echo ""
echo "3️⃣  创建仓库并推送"
echo ""

REPO_NAME="CountdownTimer"
echo "   创建仓库: $REPO_NAME"
echo "   gh repo create $REPO_NAME --public --source=. --push"
echo ""
echo "   或者如果仓库已存在："
echo "   gh repo create $REPO_NAME --public"
echo "   git remote add origin https://github.com/shawn_jia/$REPO_NAME.git"
echo "   git push -u origin master"
echo ""
echo "========================================="

read -p "是否已安装 gh CLI？(y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo ""
    echo "🚀 开始创建 GitHub 仓库..."
    gh repo create $REPO_NAME --public --source=. --push
else
    echo ""
    echo "📌 请先安装 GitHub CLI："
    echo "/bin/bash -c \"\$(curl -fsSL https://github.com/cli/cli/blob/trunk/docs/install.sh)\""
    echo ""
    echo "安装后运行以下命令："
    echo "1. gh auth login"
    echo "2. gh repo create $REPO_NAME --public --source=. --push"
fi
