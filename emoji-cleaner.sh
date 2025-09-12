#!/bin/bash

# Universal Emoji Cleaner v2.0 - Linux/macOS Launch Script

echo "🧹 Universal Emoji Cleaner v2.0"
echo "================================="
echo "📁 Standalone tool for any project"
echo

# ตรวจสอบ Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found! Please install Node.js first."
    exit 1
fi

# ตรวจสอบไฟล์ emoji-cleaner.js
if [ ! -f "emoji-cleaner.js" ]; then
    echo "❌ emoji-cleaner.js not found!"
    echo "Make sure you're running this from the emoji-cleaner-tool directory"
    exit 1
fi

echo "🎯 Choose operation:"
echo "1. Show help"
echo "2. Test tool (run tests)"
echo "3. Scan current directory (dry-run)"
echo "4. Scan specific project (dry-run)"
echo "5. Clean current directory (with backup)"
echo "6. Clean specific project (with backup)"
echo "7. Custom command"
echo "8. Exit"
echo

read -p "Enter your choice (1-8): " choice

case $choice in
    1)
        echo "📖 Showing help..."
        node emoji-cleaner.js --help
        ;;
    2)
        echo "🧪 Running tests..."
        node test/test-emoji-cleaner.js
        ;;
    3)
        echo "🔍 Scanning current directory..."
        node emoji-cleaner.js --dry-run --verbose
        ;;
    4)
        read -p "Enter project path: " project_path
        if [ -z "$project_path" ]; then
            echo "❌ No path provided!"
            exit 1
        fi
        echo "🔍 Scanning $project_path..."
        node emoji-cleaner.js "$project_path" --dry-run --verbose
        ;;
    5)
        echo "⚠️ This will clean the current directory with backup"
        read -p "Are you sure? (y/N): " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            echo "🧹 Cleaning current directory..."
            node emoji-cleaner.js --backup --verbose
        else
            echo "❌ Operation cancelled"
        fi
        ;;
    6)
        read -p "Enter project path: " project_path
        if [ -z "$project_path" ]; then
            echo "❌ No path provided!"
            exit 1
        fi
        echo "⚠️ This will clean $project_path with backup"
        read -p "Are you sure? (y/N): " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            echo "🧹 Cleaning $project_path..."
            node emoji-cleaner.js "$project_path" --backup --verbose
        else
            echo "❌ Operation cancelled"
        fi
        ;;
    7)
        echo "🔧 Custom command mode"
        echo "Available options: --dry-run, --verbose, --backup, --ext"
        read -p "Enter arguments: " custom_args
        echo "Running: node emoji-cleaner.js $custom_args"
        node emoji-cleaner.js $custom_args
        ;;
    8)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid choice! Please try again."
        exit 1
        ;;
esac

echo
read -p "Press Enter to continue..."
