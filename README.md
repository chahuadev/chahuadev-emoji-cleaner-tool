# Universal Emoji Cleaner v2.5.0

**เครื่องมือลบอิโมจิสำหรับ 50+ ภาษาโปรแกรมมิ่ง พร้อม Smart File Analysis - ปลอดภัย รวดเร็ว ครบครัน**  
**Universal emoji removal tool for 50+ programming languages with Smart File Analysis - Secure, Fast, Comprehensive**

[![npm version](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner.svg)](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Unicode Support](https://img.shields.io/badge/Unicode-15.1%2B-blue.svg)](https://unicode.org/emoji/)
[![Security](https://img.shields.io/badge/Security-FORTRESS-red.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)
[![Anti-Hack](https://img.shields.io/badge/Anti--Hack-PROTECTED-darkred.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)
[![Smart Analysis](https://img.shields.io/badge/Smart-Analysis-brightgreen.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)

** Languages:** [🇹🇭 ไทย](#-thai) | [🇺🇸 English](#-english)

---

## 🇹🇭 Thai

##  คำเตือนสำคัญ - CRITICAL SECURITY WARNING

###  ความปลอดภัยระดับสูงสุด - FORTRESS SECURITY
- **ใช้เวอร์ชันล่าสุดเสมอ**: เวอร์ชันเก่า (< 2.4.0) มีช่องโหว่ด้านความปลอดภัย
- **หลีกเลี่ยงเวอร์ชันเก่า**: เวอร์ชัน 2.1.x-2.2.4 ไม่มี anti-hack protection
- **ใช้ `@latest` flag**: `npx @chahuadev/emoji-cleaner@latest` เพื่อความปลอดภัยสูงสุด
- ** VERSION 2.2.5+ REQUIRED**: เวอร์ชันเก่าไม่มีระบบป้องกันการแฮก

###  ระบบป้องกันการแฮก - ANTI-HACK PROTECTION
Tool มีระบบป้องกันการโจมตีทุกรูปแบบ:

####  Command Injection Protection
```bash
#  BLOCKED - การฉีด Command ถูกบล็อกโดยระบบ
eval()
exec()
spawn() 
require('child_process')
fs.unlinkSync('/')
rm -rf /
del /f /s /q C:\*
```

####  Path Traversal Protection  
```bash
#  BLOCKED - การโจมตี Path Traversal ถูกปฏิเสธ
../../../etc/passwd
..\\..\\..\\Windows\\System32
/etc/../../../bin/
C:\\Windows\\..\\..\\..\
```

####  System Critical File Protection
```bash
#  BLOCKED - ไฟล์ระบบสำคัญถูกป้องกัน
/etc/passwd
/etc/shadow  
C:\Windows\System32\
C:\Program Files\
/usr/bin/
/bin/sh
/root/
/boot/
```

###  การป้องกันระบบ
Tool จะปฏิเสธการเข้าถึง:
-  Windows System directories (`C:\Windows\`, `C:\Program Files\`, `C:\System Volume Information\`)
-  Linux System directories (`/etc/`, `/usr/`, `/bin/`, `/root/`, `/boot/`, `/proc/`, `/sys/`)
-  MacOS System directories (`/System/`, `/usr/bin/`, `/bin/`, `/sbin/`)
-  ไฟล์ที่มี null bytes หรือ dangerous characters
-  ไฟล์ขนาดใหญ่เกิน 10MB
-  Path traversal attempts (`../`, `..\\`, etc.)
-  Command injection patterns
-  Script execution attempts
-  Binary executable files

###  การใช้งานปลอดภัย - SECURE USAGE ONLY
- **ใช้ `--dry-run` ก่อนเสมอ** เพื่อดูผลลัพธ์
- **ใช้ `--backup` สำหรับไฟล์สำคัญ**
- **ทดสอบโค้ดหลังลบอิโมจิ** เพื่อให้แน่ใจว่าทำงานปกติ
- **ตรวจสอบ Git status** ก่อน commit
- **ใช้เฉพาะในโปรเจ็กต์ของคุณ** อย่าใช้กับไฟล์ระบบ
- **ตรวจสอบ output** ก่อนยืนยันการดำเนินการ

###  สัญญาณเตือนการโจมตี - ATTACK DETECTION
Tool จะแสดงข้อความเตือนเมื่อตรวจพบ:
```bash
 SECURITY ALERT: Path traversal detected
 SECURITY ALERT: System directory access denied  
 SECURITY ALERT: Command injection attempt blocked
 SECURITY ALERT: Dangerous file operation prevented
 SECURITY ALERT: Binary execution attempt blocked
```

##  ทำไมต้องใช้?

 **ลบอิโมจิออกจากโค้ดอย่างปลอดภัยและมีประสิทธิภาพ พร้อม Smart File Analysis**
-  ** Smart File Analysis**: วิเคราะห์ไฟล์ซับซ้อนอัตโนมัติ
-  ** Complex File Detection**: ตรวจจับไฟล์ใหญ่และซับซ้อน  
-  ** Structural Health Scoring**: คะแนนสุขภาพโครงสร้างโค้ด
-  ** Performance Optimization**: chunk processing สำหรับไฟล์ใหญ่
-  ** Context-Aware Processing**: รู้จักประเภทและความซับซ้อนของไฟล์
-  **ตรวจจับอย่างชาญฉลาด**: รูปแบบอิโมจิ Unicode 15.1+
-  **เร็วปานสายฟ้า**: ประมวลผล 1000+ ไฟล์ในไม่กี่วินาที
-  **ปลอดภัยสูงสุด**: ระบบสำรองและโหมด dry-run
-  **รองรับครอบจักรวาล**: 50+ ภาษาโปรแกรมมิ่ง

##   NEW in v2.5.0: Smart File Analysis System

###   Intelligent Complex File Detection
- **อัตโนมัติ**: ตรวจจับไฟล์ซับซ้อน (5+ classes, 20+ functions, inheritance)
- **ขนาดใหญ่**: รองรับไฟล์เกิน 200KB โดยไม่มีปัญหา
- **โครงสร้าง**: วิเคราะห์ classes, functions, async operations
- **ความปลอดภัย**: tokenization อัจฉริยะป้องกัน syntax errors

###   Structural Health Analysis
```bash
 Running smart analysis...
 Smart Analysis Results: Structural Health: 100/100, Context: class-based
 Processing time: 0.16s (ultra-fast!)
 Found: 4 emojis detected and removed
```

###   Context-Aware Detection
- **class-based**: ไฟล์ที่มี classes หลายตัว
- **function-heavy**: ไฟล์ที่เน้น functions
- **framework**: React, Vue, Angular detection
- **utility**: Helper และ utility files

###   Performance Features
- **Chunk Processing**: แบ่งไฟล์ใหญ่เป็นส่วน ๆ
- **Smart Timeouts**: timeout ยืดหยุ่นตามความซับซ้อน  
- **Memory Optimization**: ใช้ memory อย่างมีประสิทธิภาพ
- **Tolerance Mode**: ยอมรับความซับซ้อนระดับสูง
-  **อัจฉริยะ**: ทำความสะอาดแบบเข้าใจบริบท
-  **ประสิทธิภาพสูง**: รองรับโปรเจ็กต์ขนาดใหญ่
-  **ข้ามโฟลเดอร์ระบบ** (node_modules, .git, dist, build) อัตโนมัติ
-  **ใช้เป็น Library** สำหรับ Node.js

##  การติดตั้งและถอนการติดตั้ง

### วิธีที่ 1: ใช้งานทันที (ไม่ต้องติดตั้ง) - แนะนำ
```bash
# ใช้เวอร์ชันล่าสุดเสมอ (ปลอดภัยที่สุด)
npx @chahuadev/emoji-cleaner@latest

# หรือระบุเวอร์ชันเฉพาะ
npx @chahuadev/emoji-cleaner@2.5.0
```

### วิธีที่ 2: ติดตั้งในโปรเจ็กต์
```bash
# ติดตั้ง
npm install @chahuadev/emoji-cleaner@latest --save-dev

# ถอนการติดตั้ง
npm uninstall @chahuadev/emoji-cleaner
```

### วิธีที่ 3: ติดตั้งแบบ Global
```bash
# ติดตั้ง
npm install -g @chahuadev/emoji-cleaner@latest

# ถอนการติดตั้ง
npm uninstall -g @chahuadev/emoji-cleaner

# ตรวจสอบการติดตั้ง Global
npm list -g @chahuadev/emoji-cleaner
```

### 🧹 ล้าง Cache NPX
```bash
# ล้าง cache ทั้งหมด
npm cache clean --force

# ล้าง cache เฉพาะ npx (Windows)
Remove-Item -Path "$env:LOCALAPPDATA\npm-cache\_npx" -Recurse -Force

# ล้าง cache เฉพาะ npx (Linux/Mac)
rm -rf ~/.npm/_npx
```

##  เริ่มต้นใช้งาน

###  NEW: Smart File Analysis ในการใช้งาน
```bash
# ตัวอย่างไฟล์ซับซ้อน - Smart Analysis จะทำงานอัตโนมัติ
npx @chahuadev/emoji-cleaner@latest complex-file.js --verbose

# Output:
#  Complex file detected - using Smart File Analysis...
#  Running smart analysis...
#  Smart Analysis Results: Structural Health: 100/100, Context: class-based
#  Processing time: 0.16s
#  Found: 4 emojis detected and removed
```

### การใช้งานพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลง (แนะนำให้ทำก่อน)
npx @chahuadev/emoji-cleaner@latest --dry-run

# ล้างไดเรกทอรี่ปัจจุบันพร้อมสำรอง + Smart Analysis
npx @chahuadev/emoji-cleaner@latest --backup --verbose

# ล้างโปรเจ็กต์เฉพาะ
npx @chahuadev/emoji-cleaner@latest /path/to/project --backup

# ล้างไฟล์เดียวพร้อม Smart Analysis
npx @chahuadev/emoji-cleaner@latest myfile.js --dry-run --verbose
```

### การใช้งานแบบ Direct (หลังติดตั้งแล้ว)
```bash
# หลังติดตั้ง global หรือในโปรเจ็กต์
emoji-cleaner --dry-run
emoji-cleaner ./src --backup
emoji-cleaner myfile.js --verbose

# หรือเรียกใช้โดยตรงด้วย node (ในโฟลเดอร์เครื่องมือ)
node emoji-cleaner.js --help
node emoji-cleaner.js --dry-run
```

### ตัวเลือกขั้นสูง
```bash
# แสดงรายละเอียดพร้อมสำรอง
npx @chahuadev/emoji-cleaner@latest --verbose --backup

# เฉพาะส่วนขยายไฟล์ที่ระบุ
npx @chahuadev/emoji-cleaner@latest --ext .js,.ts,.jsx

# เป้าหมายกำหนดเองพร้อม dry-run
npx @chahuadev/emoji-cleaner@latest ./src --dry-run --verbose
```

## 🔧 ตัวเลือกคำสั่ง

| ตัวเลือก | แบบสั้น | คำอธิบาย |
|---------|---------|----------|
| `--dry-run` | `-d` | ดูตัวอย่างการเปลี่ยนแปลงโดยไม่แก้ไขไฟล์ |
| `--verbose` | `-v` | แสดงข้อมูลการประมวลผลโดยละเอียด |
| `--backup` | `-b` | สร้างสำรองก่อนทำการเปลี่ยนแปลง |
| `--help` | `-h` | แสดงข้อความช่วยเหลือ |
| `--version` | | แสดงข้อมูลเวอร์ชัน |
| `--ext <list>` | | ระบุส่วนขยายไฟล์ (คั่นด้วยจุลภาค) |

##  ฟีเจอร์

###  **ตรวจจับอิโมจิอย่างชาญฉลาด**
- **รองรับ Unicode 15.1+**: รูปแบบอิโมจิล่าสุด
- **ครอบคลุมครบถ้วน**: อิโมจิทุกหมวดหมู่
- **เข้าใจบริบท**: รักษา Unicode ที่ไม่ใช่อิโมจิ
- **HTML Entities**: ลบ HTML entities ของอิโมจิ

###  **ความปลอดภัยระดับองค์กร**
- **ป้องกัน Path Traversal**: ป้องกันการโจมตี directory traversal
- **บล็อคไดเรกทอรี่ระบบ**: บล็อคการเข้าถึง system paths สำคัญ
- **ตรวจสอบ Input**: ตรวจสอบและทำความสะอาด user inputs ทั้งหมด
- **จำกัดขนาดไฟล์**: ป้องกันการประมวลผลไฟล์ขนาดใหญ่เกินไป
- **ตรวจสอบสิทธิ์**: ตรวจสอบสิทธิ์การเข้าถึงไฟล์

###  **ประสิทธิภาพสูง**
- **ประมวลผลเร็ว**: 1000+ ไฟล์ในไม่กี่วินาที
- **ประหยัดหน่วยความจำ**: ปรับให้เหมาะสำหรับ codebase ขนาดใหญ่
- **กรองอย่างชาญฉลาด**: ข้ามไฟล์ที่ไม่เกี่ยวข้องอัตโนมัติ
- **ประมวลผลแบบขนาน**: Multi-threaded เมื่อเป็นไปได้

###  **รองรับ 50+ ภาษา**

**ภาษาโปรแกรมมิ่ง:**
- JavaScript (.js), TypeScript (.ts), JSX (.jsx), TSX (.tsx)
- Python (.py), Java (.java), C++ (.cpp), C# (.cs)
- PHP (.php), Ruby (.rb), Go (.go), Rust (.rs)
- Swift (.swift), Kotlin (.kt), Dart (.dart), Scala (.scala)
- และอีก 35+ ภาษา...

**เว็บและมาร์กอัป:**
- HTML (.html), CSS (.css), SCSS (.scss), SASS (.sass)
- XML (.xml), SVG (.svg), Vue (.vue), Angular (.component.html)

**การกำหนดค่าและข้อมูล:**
- JSON (.json), YAML (.yml/.yaml), TOML (.toml)
- INI (.ini), ENV (.env), Config (.conf)

**สคริปต์และอื่นๆ:**
- Shell (.sh/.bash/.zsh), PowerShell (.ps1), Batch (.bat/.cmd)
- SQL (.sql), Markdown (.md), Text (.txt)

##  ตัวอย่างการใช้งาน

### ตัวอย่างด้านความปลอดภัย
```bash
# ✅ ปลอดภัย: ล้างโปรเจ็กต์ของคุณพร้อมสำรอง
npx @chahuadev/emoji-cleaner@latest ./my-project --backup --dry-run

#  ถูกบล็อค: การเข้าถึงไดเรกทอรี่ระบบถูกปฏิเสธ
npx @chahuadev/emoji-cleaner@latest C:\Windows\System32
# ผลลัพธ์:  Security Error: Access to system directories is not allowed

#  ถูกบล็อค: การพยายาม path traversal ถูกปฏิเสธ
npx @chahuadev/emoji-cleaner@latest "../../../etc/passwd"
# ผลลัพธ์:  Security Error: Path traversal detected
```

### ตัวอย่างการใช้งานจริง
```bash
# ล้างโปรเจ็กต์ JavaScript
npx @chahuadev/emoji-cleaner@latest ./src --ext .js,.jsx,.ts,.tsx --backup

# ล้างโปรเจ็กต์ Python
npx @chahuadev/emoji-cleaner@latest . --ext .py --verbose

# ล้างไฟล์ที่รองรับทั้งหมดในไดเรกทอรี่ปัจจุบัน
npx @chahuadev/emoji-cleaner@latest --dry-run

# ล้างไฟล์เดียวพร้อมสำรอง
npx @chahuadev/emoji-cleaner@latest app.js --backup
```

### การใช้งานเป็น Node.js Library
```javascript
const emojiCleaner = require('@chahuadev/emoji-cleaner');

// วิเคราะห์ไฟล์เดียว
const result = emojiCleaner.analyzeFile('myfile.js', true); // dry-run
console.log(`พบอิโมจิ ${result.emojiCount} ตัว`);

// ประมวลผลไดเรกทอรี่
const stats = emojiCleaner.processDirectory('./src', false, true, ['.js', '.ts']);
console.log(`ประมวลผล ${stats.totalFiles} ไฟล์`);
```

##  ประสิทธิภาพ

- **เร็ว**: ประมวลผล 1000+ ไฟล์ใน < 0.1 วินาที
- **ประหยัด**: ลดขนาดไฟล์ 1-5%
- **ปลอดภัย**: ไม่ทำลายโครงสร้างโค้ด และรักษา formatting
- **รองรับ Unicode 15.1+**: ลบอิโมจิใหม่ล่าสุดทั้งหมด
- **Multi-language**: รู้จักและประมวลผล 50+ ภาษาโปรแกรมมิ่ง
- **Security First**: ป้องกันช่องโหว่ความปลอดภัยระดับ enterprise

##  การสนับสนุน

---

<div align="center">

[![Issues](https://img.shields.io/badge/รายงานปัญหา-GitHub_Issues-red?style=for-the-badge&logo=github)]([[https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/issues](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/issues)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/issues))
[![Discussions](https://img.shields.io/badge/ขอฟีเจอร์ใหม่-GitHub_Discussions-blue?style=for-the-badge&logo=github)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/discussions)
[![Contact](https://img.shields.io/badge/ติดต่อ-chahuadev@gmail.com-green?style=for-the-badge&logo=gmail)](mailto:chahuadev@gmail.com)

</div>

---

## 🇺🇸 English

##  CRITICAL SECURITY WARNING - FORTRESS PROTECTION

###  Maximum Security - FORTRESS SECURITY
- **Always use latest version**: Older versions (< 2.5.0) have security vulnerabilities  
- **Avoid legacy versions**: Versions 2.1.x-2.4.x lack Smart File Analysis
- **Use `@latest` flag**: `npx @chahuadev/emoji-cleaner@latest` for maximum safety
- **VERSION 2.5.0+ RECOMMENDED**: Latest version includes Smart File Analysis system

###  Anti-Hack Protection System - FORTRESS SHIELD
Tool has comprehensive protection against all attack vectors:

####  Command Injection Protection
```bash
#  BLOCKED - Command injection attempts blocked by system
eval()
exec()
spawn() 
require('child_process')
fs.unlinkSync('/')
rm -rf /
del /f /s /q C:\*
```

####  Path Traversal Protection  
```bash
#  BLOCKED - Path traversal attacks rejected
../../../etc/passwd
..\\..\\..\\Windows\\System32
/etc/../../../bin/
C:\\Windows\\..\\..\\..\
```

####  System Critical File Protection
```bash
#  BLOCKED - System critical files protected
/etc/passwd
/etc/shadow  
C:\Windows\System32\
C:\Program Files\
/usr/bin/
/bin/sh
/root/
/boot/
```

###  System Protection
Tool will reject access to:
-  Windows System directories (`C:\Windows\`, `C:\Program Files\`, `C:\System Volume Information\`)
-  Linux System directories (`/etc/`, `/usr/`, `/bin/`, `/root/`, `/boot/`, `/proc/`, `/sys/`)
-  MacOS System directories (`/System/`, `/usr/bin/`, `/bin/`, `/sbin/`)
-  Files with null bytes or dangerous characters
-  Files larger than 10MB
-  Path traversal attempts (`../`, `..\\`, etc.)
-  Command injection patterns
-  Script execution attempts
-  Binary executable files

###  Secure Usage Only - FORTRESS COMPLIANCE
- **Always use `--dry-run` first** to preview results
- **Use `--backup` for important files**
- **Test code after emoji removal** to ensure functionality
- **Check Git status** before committing
- **Use only on your projects** - never on system files
- **Verify output** before confirming operations

###  Attack Detection Alerts - FORTRESS MONITORING
Tool displays warnings when attacks are detected:
```bash
 SECURITY ALERT: Path traversal detected
 SECURITY ALERT: System directory access denied  
 SECURITY ALERT: Command injection attempt blocked
 SECURITY ALERT: Dangerous file operation prevented
 SECURITY ALERT: Binary execution attempt blocked
```

###  System Protection
Tool will deny access to:
-  Windows System directories (`C:\Windows\`, `C:\Program Files\`)
-  Linux System directories (`/etc/`, `/usr/`, `/bin/`, `/root/`)
-  Files with null bytes or path traversal attempts
-  Files larger than 10MB
-  Dangerous operations

###  Safe Usage
- **Always use `--dry-run` first** to preview results
- **Use `--backup` for important files**
- **Test code after emoji removal** to ensure functionality
- **Check Git status** before committing

##  Why Use This Tool?

 **Remove emojis from source code safely and efficiently with Smart File Analysis**
-  ** Smart File Analysis**: Intelligent complex file detection and processing
-  ** Structural Health**: Advanced code structure analysis and scoring  
-  ** Performance Optimized**: Chunk processing for large files (200KB+)
-  ** Context-Aware**: Recognizes file types and complexity automatically
-  **Smart Detection**: Unicode 15.1+ emoji patterns
-  **Lightning Fast**: Process 1000+ files in seconds
-  **Ultra Safe**: Backup system and dry-run mode
-  **Universal**: 50+ programming languages supported
-  **Intelligent**: Context-aware cleaning
-  **High Performance**: Handle large projects effortlessly
-  **Skip system folders** (node_modules, .git, dist, build) automatically
-  **Use as Library** for Node.js integration

##   NEW in v2.5.0: Smart File Analysis Features

###   Intelligent Analysis
- **Complex File Detection**: Automatically detects files with 5+ classes, 20+ functions
- **Structural Health Scoring**: Analyzes code quality and structure (0-100 score)
- **Context Recognition**: Identifies file types (class-based, function-heavy, framework)
- **Performance Optimization**: Smart chunk processing for files >200KB

###   Advanced Capabilities  
```bash
# Smart Analysis Example Output:
 Complex file detected - using Smart File Analysis...
 Running smart analysis...
 Smart Analysis Results: Structural Health: 100/100, Context: class-based
 Processing time: 0.16s (ultra-fast!)
 Found: 4 emojis detected and removed
```

###  ⚡ Performance Features
- **Memory Efficient**: Optimized for large codebases
- **Intelligent Timeouts**: Adaptive timeout based on file complexity  
- **Error Tolerance**: Graceful handling of complex file structures
- **Chunk Processing**: Divide large files for optimal performance

##  Installation & Uninstallation

### Method 1: Use Immediately (No Installation) - Recommended
```bash
# Always use latest version (safest) - includes Smart File Analysis
npx @chahuadev/emoji-cleaner@latest

# Or specify exact version
npx @chahuadev/emoji-cleaner@2.5.0
```

### Method 2: Project Installation
```bash
# Install
npm install @chahuadev/emoji-cleaner@latest --save-dev

# Uninstall
npm uninstall @chahuadev/emoji-cleaner
```

### Method 3: Global Installation
```bash
# Install
npm install -g @chahuadev/emoji-cleaner@latest

# Uninstall
npm uninstall -g @chahuadev/emoji-cleaner

# Check global installation
npm list -g @chahuadev/emoji-cleaner
```

###  Clear NPX Cache
```bash
# Clear all cache
npm cache clean --force

# Clear npx cache (Windows)
Remove-Item -Path "$env:LOCALAPPDATA\npm-cache\_npx" -Recurse -Force

# Clear npx cache (Linux/Mac)
rm -rf ~/.npm/_npx
```

##  Quick Start

### Basic Usage
```bash
# Preview changes (recommended first step)
npx @chahuadev/emoji-cleaner@latest --dry-run

# Clean current directory with backup
npx @chahuadev/emoji-cleaner@latest --backup

# Clean specific project
npx @chahuadev/emoji-cleaner@latest /path/to/project --backup

# Clean single file
npx @chahuadev/emoji-cleaner@latest myfile.js --dry-run
```

### Direct Usage (After Installation)
```bash
# After global or project installation
emoji-cleaner --dry-run
emoji-cleaner ./src --backup
emoji-cleaner myfile.js --verbose

# Or run directly with node (in tool directory)
node emoji-cleaner.js --help
node emoji-cleaner.js --dry-run
```

### Advanced Options
```bash
# Verbose output with backup
npx @chahuadev/emoji-cleaner@latest --verbose --backup

# Specific file extensions only
npx @chahuadev/emoji-cleaner@latest --ext .js,.ts,.jsx

# Custom target with dry-run
npx @chahuadev/emoji-cleaner@latest ./src --dry-run --verbose
```

##  Command Options

| Option | Short | Description |
|--------|-------|-------------|
| `--dry-run` | `-d` | Preview changes without modifying files |
| `--verbose` | `-v` | Show detailed processing information |
| `--backup` | `-b` | Create backup before making changes |
| `--help` | `-h` | Show help message |
| `--version` | | Show version information |
| `--ext <list>` | | Specify file extensions (comma-separated) |

##  Features

###  **Smart Emoji Detection**
- **Unicode 15.1+ Support**: Latest emoji patterns
- **Comprehensive Coverage**: All emoji categories
- **Context Aware**: Preserves non-emoji Unicode
- **HTML Entities**: Removes emoji HTML entities

###  **Enterprise Security**
- **Path Traversal Protection**: Prevents directory traversal attacks
- **System Directory Blocking**: Blocks access to critical system paths
- **Input Validation**: Sanitizes all user inputs
- **File Size Limits**: Prevents processing of oversized files
- **Permission Checks**: Validates file access permissions

###  **High Performance**
- **Fast Processing**: 1000+ files in seconds
- **Memory Efficient**: Optimized for large codebases
- **Smart Filtering**: Automatic exclusion of irrelevant files
- **Parallel Processing**: Multi-threaded when possible

### **50+ Languages Supported**

**Programming Languages:**
- JavaScript (.js), TypeScript (.ts), JSX (.jsx), TSX (.tsx)
- Python (.py), Java (.java), C++ (.cpp), C# (.cs)
- PHP (.php), Ruby (.rb), Go (.go), Rust (.rs)
- Swift (.swift), Kotlin (.kt), Dart (.dart), Scala (.scala)
- And 35+ more...

**Web & Markup:**
- HTML (.html), CSS (.css), SCSS (.scss), SASS (.sass)
- XML (.xml), SVG (.svg), Vue (.vue), Angular (.component.html)

**Configuration & Data:**
- JSON (.json), YAML (.yml/.yaml), TOML (.toml)
- INI (.ini), ENV (.env), Config (.conf)

**Scripts & Others:**
- Shell (.sh/.bash/.zsh), PowerShell (.ps1), Batch (.bat/.cmd)
- SQL (.sql), Markdown (.md), Text (.txt)

##  Usage Examples

### Security Examples
```bash
#  Safe: Clean your project with backup
npx @chahuadev/emoji-cleaner@latest ./my-project --backup --dry-run

#  Blocked: System directory access denied
npx @chahuadev/emoji-cleaner@latest C:\Windows\System32
# Output:  Security Error: Access to system directories is not allowed

#  Blocked: Path traversal attempt denied
npx @chahuadev/emoji-cleaner@latest "../../../etc/passwd"
# Output:  Security Error: Path traversal detected
```

### Practical Examples
```bash
# Clean JavaScript project
npx @chahuadev/emoji-cleaner@latest ./src --ext .js,.jsx,.ts,.tsx --backup

# Clean Python project
npx @chahuadev/emoji-cleaner@latest . --ext .py --verbose

# Clean all supported files in current directory
npx @chahuadev/emoji-cleaner@latest --dry-run

# Clean single file with backup
npx @chahuadev/emoji-cleaner@latest app.js --backup
```

### Node.js Library Usage
```javascript
const emojiCleaner = require('@chahuadev/emoji-cleaner');

// Analyze single file
const result = emojiCleaner.analyzeFile('myfile.js', true); // dry-run
console.log(`Found ${result.emojiCount} emojis`);

// Process directory
const stats = emojiCleaner.processDirectory('./src', false, true, ['.js', '.ts']);
console.log(`Processed ${stats.totalFiles} files`);
```

##  Performance

- **Speed**: Process 1000+ files in < 0.1 seconds
- **Efficiency**: Reduce file sizes by 1-5%
- **Safety**: No code structure damage, preserves formatting
- **Unicode 15.1+ Support**: Removes all latest emojis
- **Multi-language**: Recognizes and processes 50+ programming languages
- **Security First**: Enterprise-grade vulnerability protection

##  Support

-  **Report Issues**: [GitHub Issues](https://github.com/chahuadev/emoji-cleaner/issues)
-  **Feature Requests**: [GitHub Discussions](https://github.com/chahuadev/emoji-cleaner/discussions)
-  **Contact**: chahuadev@gmail.com

##  Changelog

### v2.3.0 (2025-09-19) - **🧹 CLEAN REGISTRY RELEASE**
-  **Clean Registry**: Removed legacy versions for clean npm registry
-  **Single-File CLI**: Consolidated architecture with emoji-cleaner.js
-  **Security Features**: Complete FORTRESS protection system maintained
-  **Enhanced Detection**: Unicode 15.1+ emoji patterns
-  **Optimized Package**: Clean structure with essential files only
-  **Enhanced CLI**: Better error handling and security indicators
-  **Zone Architecture**: 6-zone organization with consistent headers
-  **Path Protection**: Comprehensive system directory blocking
-  **Command Injection Shield**: Complete protection against code injection
-  **Performance**: Faster processing with memory optimization

### v2.2.4 (2025-09-18) - Previous Secure Version
-  **Complete Security Protection**: Full security implementation
-  **Fixed CLI Security Gap**: CLI now uses full security features
-  **Removed Legacy Files**: Deleted unused src/index.js
-  **NPX Security Tested**: Verified security protection works
-  **Complete Documentation**: Added uninstall instructions and best practices

### v2.2.3 (2025-09-18)
-  **Fixed package.json main file reference**
-  **Added Security to main processing**

### v2.2.2 (2025-09-18)
- **First Security features implementation**
-  **Updated README with Security information**

### v2.1.x and earlier ( SECURITY RISK - Deprecated)
-  **Legacy versions with critical security vulnerabilities**
-  **DO NOT USE - No protection against attacks**
-  **Removed from NPM registry for safety**

---

##  SECURITY COMMITMENT - การรับรองความปลอดภัย

###  Our Security Promise
**This tool is designed with SECURITY FIRST principles:**

 **NO SYSTEM FILE ACCESS** - ไม่เข้าถึงไฟล์ระบบ  
 **NO COMMAND EXECUTION** - ไม่รันคำสั่งอันตราย  
 **NO PATH TRAVERSAL** - ไม่อนุญาต path traversal  
 **NO BINARY EXECUTION** - ไม่รันไฟล์ executable  
 **SYNTAX PROTECTION** - ป้องกันการทำลายไวยากรณ์  
 **SELF-PROTECTION** - ป้องกันการแก้ไขตัวเอง  

###  Security Reporting - รายงานช่องโหว่
**Found a security issue? Report it privately:**
-  **Security Email**: chahuadev@gmail.com
-  **Encrypted Contact**: Use GPG key on our GitHub
-  **Response Time**: < 24 hours for critical issues
-  **Recognition**: Security researchers credited

###  Security Audits - การตรวจสอบความปลอดภัย
-  **Automated Security Scanning**: GitHub CodeQL
-  **Manual Code Review**: Expert security review
-  **Penetration Testing**: Regular security testing
-  **Dependency Scanning**: npm audit integration

---

## License - สัญญาอนุญาต

MIT License - See [LICENSE](LICENSE) for details

## Authors - ผู้พัฒนา

**Chahua Development Co., Ltd. (บริษัท ชาหัว ดีเวลลอปเมนต์ จำกัด)**
- Website: https://chahuadev.com
- Email: chahuadev@gmail.com
- GitHub: [@chahuadev](https://github.com/chahuadev)

### Contributors
- Lead Developer: Chahua Development Team
- Security Consultant: Internal Security Team
- Documentation: Technical Writing Team

---

<div align="center">

**If you find this project useful, please give it a star!**
**หากคุณคิดว่าโปรเจ็กต์นี้มีประโยชน์ กรุณา Star ให้ด้วยนะครับ!**

**บริษัท ชาหัว ดีเวลลอปเมนต์ จำกัด** 
**Chahua Development Co., Ltd.** 
**เครื่องมือที่ปลอดภัยที่สุดสำหรับลบอิโมจิ - The Most Secure Emoji Removal Tool**
