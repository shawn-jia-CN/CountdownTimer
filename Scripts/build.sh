#!/bin/bash

set -e

echo "========================================="
echo "  CountdownTimer 构建脚本"
echo "========================================="

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

echo ""
echo "📁 项目目录: $PROJECT_DIR"
echo ""

echo "🔍 检查 XcodeGen..."
if ! command -v xcodegen &> /dev/null; then
    echo "❌ XcodeGen 未安装"
    echo "请运行: brew install xcodegen"
    exit 1
fi

echo "✅ XcodeGen 已安装"
echo ""

echo "🚀 步骤 1: 生成 Xcode 项目..."
xcodegen generate

if [ ! -f "CountdownTimer.xcodeproj" ]; then
    echo "❌ Xcode 项目生成失败"
    exit 1
fi

echo "✅ Xcode 项目已生成"
echo ""

echo "🔨 步骤 2: 编译项目..."
xcodebuild -project CountdownTimer.xcodeproj \
    -scheme CountdownTimer \
    -configuration Debug \
    -derivedDataPath ./build \
    build

if [ $? -eq 0 ]; then
    echo "✅ 编译成功"
    echo ""
    echo "📦 正在安装应用到 /Applications..."
    cp -R "$PROJECT_DIR/build/Build/Products/Debug/CountdownTimer.app" /Applications/
    if [ $? -eq 0 ]; then
        echo "✅ 应用已成功安装到 /Applications"
    else
        echo "⚠️  安装失败，请检查权限"
    fi
else
    echo "❌ 编译失败"
    exit 1
fi

echo ""
echo "🎉 构建完成！"
echo ""
echo "✅ 应用已自动安装到 /Applications"
echo ""
echo "📋 使用方法:"
echo "  1. 从 Launchpad 或应用程序文件夹启动 CountdownTimer"
echo "  2. 应用会显示在菜单栏（顶部状态栏）"
echo "  3. 点击图标查看倒计时"
echo ""
echo "💡 提示: 如果应用已在运行，可以直接退出旧版本，新版本会自动生效"
echo "========================================="
