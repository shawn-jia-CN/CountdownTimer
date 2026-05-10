#!/bin/bash

set -e

echo "========================================="
echo "  CountdownTimer Swift 编译脚本"
echo "========================================="

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

echo ""
echo "📁 项目目录: $PROJECT_DIR"
echo ""

SWIFT_SOURCES="Sources"
OUTPUT_DIR="build"
PRODUCT_NAME="CountdownTimer"
FRAMEWORKS="-F /System/Library/Frameworks -F /System/Library/PrivateFrameworks"

echo "🔨 正在编译 Swift 代码..."
echo ""

mkdir -p "$OUTPUT_DIR"

swiftc \
    "$SWIFT_SOURCES/main.swift" \
    "$SWIFT_SOURCES/AppDelegate.swift" \
    "$SWIFT_SOURCES/DataManager.swift" \
    "$SWIFT_SOURCES/CountdownWindow.swift" \
    -o "$OUTPUT_DIR/$PRODUCT_NAME" \
    -sdk $(xcrun --show-sdk-path --sdk macosx) \
    -target x86_64-apple-macosx12.0 \
    -parseable-output \
    $FRAMEWORKS

if [ $? -eq 0 ]; then
    echo "✅ Swift 代码编译成功"
    echo ""
    echo "📦 创建应用包结构..."
    
    mkdir -p "$OUTPUT_DIR/$PRODUCT_NAME.app/Contents/MacOS"
    mkdir -p "$OUTPUT_DIR/$PRODUCT_NAME.app/Contents/Resources"
    
    cp "$OUTPUT_DIR/$PRODUCT_NAME" "$OUTPUT_DIR/$PRODUCT_NAME.app/Contents/MacOS/"
    cp Resources/Info.plist "$OUTPUT_DIR/$PRODUCT_NAME.app/Contents/"
    cp -R Resources/Assets.xcassets "$OUTPUT_DIR/$PRODUCT_NAME.app/Contents/Resources/"
    
    echo "✅ 应用包创建成功"
    echo ""
    echo "🎉 构建完成！"
    echo ""
    echo "应用位置: $PROJECT_DIR/$OUTPUT_DIR/$PRODUCT_NAME.app"
    echo ""
    echo "📋 使用方法:"
    echo "  1. 打开 Finder"
    echo "  2. 进入 ./build/"
    echo "  3. 双击 CountdownTimer.app"
    echo "  4. 应用会显示在菜单栏（顶部状态栏）⏱️ 图标"
    echo "  5. 点击图标查看倒计时和坚持天数"
    echo ""
    echo "💡 提示:"
    echo "  - 右键点击图标可以设置目标日期"
    echo "  - 可以将应用拖到 Dock 栏方便访问"
    echo "  - 数据会自动保存在本地"
    echo ""
    echo "========================================="
else
    echo "❌ 编译失败"
    exit 1
fi
