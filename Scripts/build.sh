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
else
    echo "❌ 编译失败"
    exit 1
fi

echo ""
echo "🎉 构建完成！"
echo ""
echo "应用位置: ./build/Build/Products/Debug/CountdownTimer.app"
echo ""
echo "📋 使用方法:"
echo "  1. 打开 Finder"
echo "  2. 进入 ./build/Build/Products/Debug/"
echo "  3. 双击 CountdownTimer.app"
echo "  4. 应用会显示在菜单栏（顶部状态栏）"
echo "  5. 点击图标查看倒计时"
echo ""
echo "💡 提示: 可以将 CountdownTimer.app 拖到 Dock 栏方便访问"
echo "========================================="
