#!/bin/bash

set -e

echo "========================================="
echo "  CountdownTimer 一键安装脚本"
echo "========================================="
echo ""

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

echo "📁 项目目录: $PROJECT_DIR"
echo ""

echo "🔍 检查系统环境..."
echo ""

if [ ! -d "/Applications/Xcode.app" ]; then
    echo "❌ Xcode 未安装"
    echo ""
    echo "请先安装 Xcode："
    echo "1. 打开 Mac App Store"
    echo "2. 搜索 'Xcode'"
    echo "3. 点击安装（免费）"
    echo "4. 安装完成后运行此脚本"
    echo ""
    echo "或者下载 Command Line Tools for Xcode："
    echo "https://developer.apple.com/download/more/"
    echo ""
    exit 1
fi

echo "✅ Xcode 已安装"
echo ""

echo "🔍 检查 XcodeGen..."
if ! command -v xcodegen &> /dev/null; then
    echo "⚠️  XcodeGen 未安装"
    echo ""
    echo "正在尝试安装 XcodeGen..."
    echo ""
    
    if command -v brew &> /dev/null; then
        brew install xcodegen
        if [ $? -eq 0 ]; then
            echo "✅ XcodeGen 安装成功"
        else
            echo "❌ XcodeGen 安装失败"
            echo ""
            echo "请手动运行以下命令："
            echo "  brew install xcodegen"
            exit 1
        fi
    else
        echo "❌ Homebrew 未安装"
        echo ""
        echo "请先安装 Homebrew："
        echo "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        echo ""
        echo "然后运行：brew install xcodegen"
        exit 1
    fi
else
    echo "✅ XcodeGen 已安装"
fi

echo ""
echo "🚀 正在生成 Xcode 项目..."
xcodegen generate

if [ ! -f "CountdownTimer.xcodeproj" ]; then
    echo "❌ 项目生成失败"
    exit 1
fi

echo "✅ Xcode 项目已生成"
echo ""
echo "🎉 准备完成！"
echo ""
echo "📋 下一步操作："
echo ""
echo "1. 在 Finder 中打开项目："
echo "   open CountdownTimer.xcodeproj"
echo ""
echo "2. 在 Xcode 中："
echo "   - 按 ⌘B 构建项目"
echo "   - 按 ⌘R 运行项目"
echo ""
echo "3. 使用应用："
echo "   - 点击菜单栏的 ⏱️ 图标查看倒计时"
echo "   - 右键点击图标设置目标日期"
echo ""
echo "========================================="
echo "💡 提示："
echo "   应用会显示在菜单栏，不会在 Dock 中显示"
echo "   如果需要自启动，请在系统设置中添加"
echo "========================================="
