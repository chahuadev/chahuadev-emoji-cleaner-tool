@echo off
echo 🧹 Universal Emoji Cleaner v2.0
echo =================================
echo 📁 Standalone tool for any project
echo.

REM ตรวจสอบ Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js not found! Please install Node.js first.
    pause
    exit /b 1
)

REM ตรวจสอบไฟล์ emoji-cleaner.js
if not exist "emoji-cleaner.js" (
    echo ❌ emoji-cleaner.js not found!
    echo Make sure you're running this from the emoji-cleaner-tool directory
    pause
    exit /b 1
)

echo 🎯 Choose operation:
echo 1. Show help
echo 2. Test tool (run tests)
echo 3. Scan current directory (dry-run)
echo 4. Scan specific project (dry-run)
echo 5. Clean current directory (with backup)
echo 6. Clean specific project (with backup)
echo 7. Custom command
echo 8. Exit
echo.

set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" (
    echo 📖 Showing help...
    node emoji-cleaner.js --help
    goto :end
)

if "%choice%"=="2" (
    echo 🧪 Running tests...
    node test/test-emoji-cleaner.js
    goto :end
)

if "%choice%"=="3" (
    echo 🔍 Scanning current directory...
    node emoji-cleaner.js --dry-run --verbose
    goto :end
)

if "%choice%"=="4" (
    set /p project_path="Enter project path: "
    if "!project_path!"=="" (
        echo ❌ No path provided!
        goto :end
    )
    echo 🔍 Scanning !project_path!...
    node emoji-cleaner.js "!project_path!" --dry-run --verbose
    goto :end
)

if "%choice%"=="5" (
    echo ⚠️ This will clean the current directory with backup
    set /p confirm="Are you sure? (y/N): "
    if /i "!confirm!"=="y" (
        echo 🧹 Cleaning current directory...
        node emoji-cleaner.js --backup --verbose
    ) else (
        echo ❌ Operation cancelled
    )
    goto :end
)

if "%choice%"=="6" (
    set /p project_path="Enter project path: "
    if "!project_path!"=="" (
        echo ❌ No path provided!
        goto :end
    )
    echo ⚠️ This will clean !project_path! with backup
    set /p confirm="Are you sure? (y/N): "
    if /i "!confirm!"=="y" (
        echo 🧹 Cleaning !project_path!...
        node emoji-cleaner.js "!project_path!" --backup --verbose
    ) else (
        echo ❌ Operation cancelled
    )
    goto :end
)

if "%choice%"=="7" (
    echo 🔧 Custom command mode
    echo Available options: --dry-run, --verbose, --backup, --ext
    set /p custom_args="Enter arguments: "
    echo Running: node emoji-cleaner.js !custom_args!
    node emoji-cleaner.js !custom_args!
    goto :end
)

if "%choice%"=="8" (
    echo 👋 Goodbye!
    exit /b 0
)

echo ❌ Invalid choice! Please try again.

:end
echo.
pause
