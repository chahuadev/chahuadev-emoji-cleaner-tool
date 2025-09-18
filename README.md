# 🧹 Universal Emoji Cleaner v2.2.4

**เครื่องมือลบอิโมจิสำหรับ 50+ ภาษาโปรแกรมมิ่ง - ปลอดภัย รวดเร็ว ครบครัน**

[![npm version](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner.svg)](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Unicode Support](https://img.shields.io/badge/Unicode-15.1%2B-blue.svg)](https://unicode.org/emoji## ⚠️ คำเตือนสำคัญ

### 🛡️ ความปลอดภัย
- **ใช้เวอร์ชันล่าสุดเสมอ**: เวอร์ชันเก่า (< 2.2.3) มีช่องโหว่ด้านความปลอดภัย
- **หลีกเลี่ยงเวอร์ชันเก่า**: เวอร์ชัน 2.1.x ไม่มี security protection
- **ใช้ `@latest` flag**: `npx @chahuadev/emoji-cleaner@latest` เพื่อความปลอดภัย

### 🔒 การป้องกันระบบ
Tool จะปฏิเสธการเข้าถึง:
- ✋ Windows System directories (`C:\Windows\`, `C:\Program Files\`)
- ✋ Linux System directories (`/etc/`, `/usr/`, `/bin/`, `/root/`)
- ✋ ไฟล์ที่มี null bytes หรือ path traversal
- ✋ ไฟล์ขนาดใหญ่เกิน 10MB
- ✋ การใช้งานที่อันตราย

### 📋 การใช้งานปลอดภัย
- **ใช้ `--dry-run` ก่อนเสมอ** เพื่อดูผลลัพธ์
- **ใช้ `--backup` สำหรับไฟล์สำคัญ**
- **ทดสอบโค้ดหลังลบอิโมจิ** เพื่อให้แน่ใจว่าทำงานปกติ
- **ตรวจสอบ Git status** ก่อน commit

## 📝 Changelog

### v2.2.3 (2025-09-18) - Latest Secure Version
- 🛡️ **เพิ่ม Security Protection แบบสมบูรณ์**
- 🚨 **แก้ไข CLI Security Gap** - CLI ใช้ security features เต็มรูปแบบ
- 🧹 **ลบไฟล์เก่าที่ไม่ใช้** (src/index.js)
- ✅ **ทดสอบ NPX Security สำเร็จ**

### v2.2.2 (2025-09-18)
- 🔧 **แก้ไข package.json main file reference**
- 🛡️ **เพิ่ม Security ใน main processing**

### v2.2.1 (2025-09-18)
- 🛡️ **เพิ่ม Security features ครั้งแรก**
- 📚 **อัพเดต README ด้วยข้อมูล Security**

### v2.1.x และก่อนหน้า (เลิกใช้แล้ว)
- ⚠️ **เวอร์ชันเก่าที่มีช่องโหว่ความปลอดภัย**
- 🚫 **ถูกลบออกจาก NPM registry แล้ว**s/)
[![Security](https://img.shields.io/badge/Security-Enhanced-green.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)

## 🎯 ทำไมต้องใช้?

เมื่อคุณพัฒนาโปรเจ็กต์และใช้อิโมจิในโค้ดระหว่างพัฒนา แต่ต้องการทำความสะอาดก่อนขึ้น production หรือส่งให้ลูกค้า

**ตัวอย่างปัญหา:**
```javascript
console.log("Hello World! 🌍"); // ❌ มีอิโมจิ
// TODO: Fix this bug 🐛 ⚠️  // ❌ Comment มีอิโมจิ
```

**หลังใช้ Universal Emoji Cleaner v2.2.1:**
```javascript
console.log("Hello World! "); // ✅ สะอาด แต่ไม่ทำลาย formatting
// TODO: Fix this bug  // ✅ Comment สะอาด รักษาโครงสร้างเดิม
```

## ✨ คุณสมบัติใหม่ v2.2.1

- 🛡️ **Enhanced Security** - ป้องกัน Path Traversal, System File Access และ Permission Bypass
- 🌟 **รองรับ 50+ ภาษาโปรแกรมมิ่ง** (.js, .ts, .py, .java, .cpp, .go, .rs, .php, .rb, .lua, .sql, .yml, .sh และอีกมากมาย)
- 🔰 **Unicode 15.1+ Support** ลบอิโมจิใหม่ล่าสุดทั้งหมด
- 🧠 **Intelligent Comment Cleanup** รู้จักภาษาแต่ละประเภทและลบอิโมจิในคอมเมนต์อย่างฉลาด
- 🛡️ **รักษา File Formatting** ไม่ทำลายโครงสร้างและการจัดรูปแบบไฟล์
- 🔍 **HTML Entity Removal** ลบ HTML entities และ named entities
- 💾 **Enhanced Backup System** ระบบสำรองไฟล์ที่ปรับปรุงใหม่
- 🚨 **Security Validation** ตรวจสอบ input, path และ permissions อย่างเข้มงวด

- 🎯 **ลบอิโมจิอัตโนมัติ** จากไฟล์ 50+ ภาษาโปรแกรมมิ่ง
- 🔍 **Dry-run mode** ดูผลลัพธ์ก่อนลบจริง (ปลอดภัย)
- 💾 **สำรองไฟล์** ป้องกันการสูญหาย
- ⚡ **ประมวลผลเร็ว** รองรับโฟลเดอร์ขนาดใหญ่
- 🛡️ **ข้ามโฟลเดอร์ระบบ** (node_modules, .git, dist, build) อัตโนมัติ
- 📚 **ใช้เป็น Library** สำหรับ Node.js

## 📦 การติดตั้งและถอนการติดตั้ง

### วิธีที่ 1: ใช้งานทันที (ไม่ต้องติดตั้ง) - แนะนำ
```bash
# ใช้เวอร์ชันล่าสุดเสมอ (ปลอดภัยที่สุด)
npx @chahuadev/emoji-cleaner@latest

# หรือระบุเวอร์ชันเฉพาะ
npx @chahuadev/emoji-cleaner@2.2.3
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

## � วิธีใช้งานในโปรเจ็กต์จริง

### 1. ตรวจสอบก่อนลบ (Dry-run) - **แนะนำ**

```bash
# ดูว่ามีอิโมจิอะไรบ้างในโปรเจ็กต์
npx @chahuadev/emoji-cleaner . --dry-run

# ดูรายละเอียด
npx @chahuadev/emoji-cleaner . --dry-run --verbose
```

### 2. ลบอิโมจิในโฟลเดอร์เฉพาะ

```bash
# ลบอิโมจิในโฟลเดอร์ src
npx @chahuadev/emoji-cleaner ./src

# ลบพร้อมสำรองไฟล์
npx @chahuadev/emoji-cleaner ./src --backup
```

### 3. ลบอิโมจิในไฟล์เดียว

```bash
# ลบอิโมจิในไฟล์เฉพาะ
npx @chahuadev/emoji-cleaner ./components/Header.jsx

# ตรวจสอบก่อน
npx @chahuadev/emoji-cleaner ./components/Header.jsx --dry-run
```

### 4. ลบอิโมจิทั้งโปรเจ็กต์

```bash
# ลบทั้งโปรเจ็กต์ (ข้าม node_modules อัตโนมัติ)
npx @chahuadev/emoji-cleaner . --backup --verbose
```

## ⚙️ ตัวเลือกคำสั่งทั้งหมด

| ตัวเลือก | คำอธิบาย | ตัวอย่างการใช้งาน |
|---------|----------|---------|
| `--dry-run, -d` | ดูผลลัพธ์โดยไม่แก้ไขไฟล์จริง | `npx @chahuadev/emoji-cleaner . --dry-run` |
| `--verbose, -v` | แสดงรายละเอียดขณะประมวลผล | `npx @chahuadev/emoji-cleaner . --verbose` |
| `--backup, -b` | สร้างไฟล์สำรองก่อนแก้ไข | `npx @chahuadev/emoji-cleaner . --backup` |
| `--ext, -e` | ระบุประเภทไฟล์ที่ต้องการ | `npx @chahuadev/emoji-cleaner . --ext .js,.py,.go` |
| `--help, -h` | แสดงคำแนะนำการใช้งาน | `npx @chahuadev/emoji-cleaner --help` |

### 🎯 คำสั่งขั้นสูง

**รวมหลายตัวเลือก:**
```bash
# ตรวจสอบเฉพาะไฟล์ Python และ JavaScript พร้อมรายละเอียด
npx @chahuadev/emoji-cleaner ./src --dry-run --verbose --ext .py,.js

# ลบอิโมจิ + สำรอง + แสดงรายละเอียด
npx @chahuadev/emoji-cleaner . --backup --verbose

# ประมวลผลหลายโฟลเดอร์
npx @chahuadev/emoji-cleaner ./src ./tests ./scripts --dry-run --verbose
```

**คำสั่งเฉพาะประเภทไฟล์:**
```bash
# เฉพาะไฟล์ Python
npx @chahuadev/emoji-cleaner . --ext .py --dry-run

# เฉพาะไฟล์ Go และ Rust
npx @chahuadev/emoji-cleaner . --ext .go,.rs --dry-run

# เฉพาะไฟล์ Web (JS, CSS, HTML)
npx @chahuadev/emoji-cleaner . --ext .js,.css,.html --dry-run

# เฉพาะไฟล์ Config (YAML, JSON)
npx @chahuadev/emoji-cleaner . --ext .yml,.json --dry-run
```

## 📁 ไฟล์ที่รองรับ (50+ ภาษา)

### 🌐 **Web Development**
- 📄 **JavaScript** (.js, .jsx, .mjs, .cjs)
- 📄 **TypeScript** (.ts, .tsx, .d.ts)  
- 📄 **HTML** (.html, .htm, .xhtml)
- 📄 **CSS** (.css, .scss, .sass, .less)

### 💻 **Programming Languages**
- 📄 **Python** (.py, .pyx, .pyi)
- 📄 **Java** (.java, .class)
- 📄 **C/C++** (.c, .cpp, .cxx, .cc, .h, .hpp)
- 📄 **C#** (.cs, .csx)
- 📄 **Go** (.go)
- 📄 **Rust** (.rs)
- 📄 **PHP** (.php, .phtml)
- 📄 **Ruby** (.rb, .gem)
- 📄 **Swift** (.swift)
- 📄 **Kotlin** (.kt, .kts)
- 📄 **Dart** (.dart)
- 📄 **Scala** (.scala, .sc)

### 🔧 **Scripting & Configuration**
- 📄 **Shell Scripts** (.sh, .bash, .zsh, .fish)
- 📄 **PowerShell** (.ps1, .psm1)
- 📄 **Perl** (.pl, .pm)
- 📄 **Lua** (.lua)
- 📄 **R** (.r, .R)
- 📄 **YAML** (.yml, .yaml)
- 📄 **JSON** (.json, .jsonc)
- 📄 **XML** (.xml, .xsd, .xsl)
- 📄 **SQL** (.sql, .mysql, .pgsql)

### 📋 **Documentation & Markup**
- 📄 **Markdown** (.md, .markdown, .mdown)
- 📄 **LaTeX** (.tex, .latex)
- 📄 **ReStructuredText** (.rst)
- 📄 **AsciiDoc** (.adoc, .asciidoc)

## 💡 ตัวอย่างการใช้งานจริง

### 🔥 สำหรับโปรเจ็กต์ Python
```bash
# ตรวจสอบ Python project ทั้งหมด
npx @chahuadev/emoji-cleaner ./src --ext .py --dry-run --verbose

# ลบอิโมจิใน Python modules
npx @chahuadev/emoji-cleaner ./src/modules --backup --verbose

# ลบอิโมจิใน tests และ scripts
npx @chahuadev/emoji-cleaner ./tests ./scripts --ext .py --backup
```

### 🦀 สำหรับโปรเจ็กต์ Rust
```bash
# ตรวจสอบ Rust project
npx @chahuadev/emoji-cleaner ./src --ext .rs --dry-run --verbose

# ลบอิโมจิใน Rust source files
npx @chahuadev/emoji-cleaner ./src --ext .rs --backup
```

### 🐹 สำหรับโปรเจ็กต์ Go
```bash
# ตรวจสอบ Go project
npx @chahuadev/emoji-cleaner . --ext .go --dry-run --verbose

# ลบอิโมจิใน Go files
npx @chahuadev/emoji-cleaner ./cmd ./pkg ./internal --ext .go --backup
```

### 🔥 สำหรับโปรเจ็กต์ React
```bash
# ตรวจสอบ React project ทั้งหมด
npx @chahuadev/emoji-cleaner ./src --ext .jsx,.tsx --dry-run --verbose

# ลบอิโมจิใน React components
npx @chahuadev/emoji-cleaner ./src/components --backup --verbose

# ลบอิโมจิใน pages และ components
npx @chahuadev/emoji-cleaner ./src/pages ./src/components --backup
```

### ⚡ สำหรับโปรเจ็กต์ Node.js
```bash
# ตรวจสอบ Node.js project (ข้าม node_modules อัตโนมัติ)
npx @chahuadev/emoji-cleaner . --ext .js,.ts --dry-run --verbose

# ลบอิโมจิใน server files
npx @chahuadev/emoji-cleaner ./routes ./controllers ./middleware --backup

# ลบอิโมจิทั้งโปรเจ็กต์
npx @chahuadev/emoji-cleaner . --backup --ext .js,.ts
```

### 🎯 สำหรับโปรเจ็กต์ TypeScript
```bash
# ตรวจสอบเฉพาะไฟล์ TypeScript
npx @chahuadev/emoji-cleaner . --ext .ts,.tsx --dry-run

# ลบอิโมจิในไฟล์ TypeScript พร้อมสำรอง
npx @chahuadev/emoji-cleaner ./src --ext .ts,.tsx --backup --verbose
```

### 📊 สำหรับโปรเจ็กต์ Data Science
```bash
# ตรวจสอบไฟล์ Python และ R
npx @chahuadev/emoji-cleaner . --ext .py,.r --dry-run

# ลบอิโมจิใน Jupyter notebooks (ถ้าเป็น .py)
npx @chahuadev/emoji-cleaner ./notebooks --ext .py --backup
```

### 🌐 สำหรับไฟล์ HTML และ CSS
```bash
# ตรวจสอบเฉพาะไฟล์ HTML และ CSS
npx @chahuadev/emoji-cleaner . --ext .html,.css --dry-run

# ลบอิโมจิในไฟล์ HTML ในโฟลเดอร์ public
npx @chahuadev/emoji-cleaner ./public --ext .html,.css --backup
```

### 🔧 สำหรับไฟล์ Configuration
```bash
# ตรวจสอบไฟล์ YAML และ JSON
npx @chahuadev/emoji-cleaner . --ext .yml,.yaml,.json --dry-run

# ลบอิโมจิใน config files
npx @chahuadev/emoji-cleaner ./config --ext .yml,.json --backup
```

### 📦 สำหรับการ Deploy
```bash
# ขั้นตอนก่อน build production
npx @chahuadev/emoji-cleaner . --dry-run --verbose  # ตรวจสอบก่อน
npx @chahuadev/emoji-cleaner . --backup            # ลบอิโมจิ
npm run build                                      # build production
```

### เพิ่มใน package.json scripts

```json
{
  "scripts": {
    "clean:emojis": "emoji-cleaner . --dry-run",
    "clean:emojis:apply": "emoji-cleaner . --backup",
    "prebuild": "emoji-cleaner src --backup"
  }
}
```

## 📊 ตัวอย่างผลลัพธ์

```
🧹 Universal Emoji Cleaner v2.2.1
================================
🔍 DRY RUN MODE - ไม่มีการแก้ไขไฟล์
🎯 Target: ./src
📁 Extensions: .js, .ts, .jsx, .tsx, .html, .css, .py, .java, .cpp, .go, .rs, .php, .rb, .lua, .sql, .yml, .sh และอีก 35+ ภาษา

✅ src/components/Header.jsx
   📝 Emojis removed: 15
   💬 Comments cleaned: 2
   📏 Size: 2.5KB → 2.4KB

✅ src/pages/Home.tsx  
   📝 Emojis removed: 8
   💬 Comments cleaned: 0
   📏 Size: 5.2KB → 5.1KB

✅ src/utils/helpers.py
   📝 Emojis removed: 12
   💬 Comments cleaned: 3
   📏 Size: 3.1KB → 3.0KB

================================
📊 สรุปผลลัพธ์:
   📁 Files processed: 47
   🔄 Files with changes: 23
   🧹 Total emojis removed: 234
   💬 Comments cleaned: 18
   🌍 Languages detected: 8
   🛡️ Security errors: 0
   ⏱️  Processing time: 0.08s

💡 ใช้คำสั่งโดยไม่มี --dry-run เพื่อลบจริง
```

## 🚨 Security Features ใหม่

### 🛡️ **ป้องกันการโจมตี**

**Path Traversal Protection:**
```bash
# ❌ จะถูกบล็อก
npx @chahuadev/emoji-cleaner "../../../etc/passwd"
# 🚨 Security Error: Path traversal is not allowed

# ❌ จะถูกบล็อก  
npx @chahuadev/emoji-cleaner "C:\Windows\System32"
# 🚨 Security Error: Access to system directories is not allowed
```

**Input Validation:**
```bash
# ❌ จะถูกบล็อก
npx @chahuadev/emoji-cleaner "file<script>alert('xss')</script>.js"
# 🚨 Security Error: Dangerous characters in path

# ❌ จะถูกบล็อก
npx @chahuadev/emoji-cleaner "/path/with/null\x00byte"
# 🚨 Security Error: Null bytes in path are not allowed
```

**File Size Protection:**
```bash
# ❌ ไฟล์ใหญ่เกิน 10MB จะถูกบล็อก
# 🚨 Security Error: File too large (15728640 bytes)
```

## 🔧 ใช้เป็น Library ในโค้ด

```javascript
const { removeEmojis, processFile, processDirectory } = require('@chahuadev/emoji-cleaner');

// ลบอิโมจิจากข้อความ
const result = removeEmojis('Hello 😊 World! 🎉');
console.log(result.text); // "Hello  World! "
console.log(result.emojiCount); // 2

// ประมวลผลไฟล์
const fileResult = processFile('./src/App.js', {
  dryRun: true,
  createBackup: false
});

// ประมวลผลโฟลเดอร์
const dirResult = processDirectory('./src', {
  dryRun: false,
  createBackup: true,
  extensions: ['.js', '.ts', '.jsx', '.tsx', '.py', '.go', '.rs'] // รองรับหลายภาษา
});
```

## 🛡️ ความปลอดภัย

- **Enhanced Security v2.2.1**: ป้องกันการเข้าถึงไฟล์ระบบและ path traversal attacks
- **Input Validation**: ตรวจสอบ input อย่างเข้มงวด ป้องกัน malicious paths
- **Permission Checks**: ตรวจสอบสิทธิ์การเข้าถึงไฟล์ก่อนประมวลผล
- **Path Sanitization**: ป้องกัน directory escaping และ null byte injection
- **File Size Limits**: จำกัดขนาดไฟล์ (10MB) เพื่อป้องกัน DoS attacks
- **System Directory Protection**: ป้องกันการเข้าถึง Windows System, Program Files, และ Unix system directories
- **Dry-run mode**: ตรวจสอบผลลัพธ์ก่อนลบจริง
- **Auto backup**: สำรองไฟล์อัตโนมัติ (เมื่อใช้ --backup)
- **Smart language detection**: รู้จักและประมวลผลแต่ละภาษาอย่างเหมาะสม
- **Preserve formatting**: รักษาโครงสร้างและการจัดรูปแบบไฟล์
- **Error handling**: จัดการข้อผิดพลาดอย่างปลอดภัย
- **Git integration**: ใช้ร่วมกับ Git ได้ดี

## 🎯 Use Cases จริง

### 1. ก่อนขึ้น Production
```bash
# ตรวจสอบก่อน
npx @chahuadev/emoji-cleaner . --dry-run

# ลบอิโมจิพร้อมสำรอง
npx @chahuadev/emoji-cleaner . --backup

# Build production
npm run build
```

### 2. Pre-commit Hook
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "emoji-cleaner src --dry-run"
    }
  }
}
```

### 3. CI/CD Pipeline
```yaml
# .github/workflows/build.yml
- name: Clean emojis
  run: npx @chahuadev/emoji-cleaner src --backup
  
- name: Build
  run: npm run build
```

## � คำเตือน

- **ใช้ `--dry-run` ก่อนเสมอ** เพื่อดูผลลัพธ์
- **ใช้ `--backup` สำหรับไฟล์สำคัญ**
- **ทดสอบโค้ดหลังลบอิโมจิ** เพื่อให้แน่ใจว่าทำงานปกติ
- **ตรวจสอบ Git status** ก่อน commit

## 📈 ประสิทธิภาพ

- **เร็ว**: ประมวลผล 1000+ ไฟล์ใน < 0.1 วินาที  
- **ประหยัด**: ลดขนาดไฟล์ 1-5%
- **ปลอดภัย**: ไม่ทำลายโครงสร้างโค้ด และรักษา formatting
- **รองรับ Unicode 15.1+**: ลบอิโมจิใหม่ล่าสุดทั้งหมด
- **Multi-language**: รู้จักและประมวลผล 50+ ภาษาโปรแกรมมิ่ง
- **Security First**: ป้องกันช่องโหว่ความปลอดภัยระดับ enterprise

## 🤝 การสนับสนุน

- 🐛 **รายงานปัญหา**: [GitHub Issues](https://github.com/chahuadev/emoji-cleaner/issues)
- 💡 **ขอฟีเจอร์ใหม่**: [GitHub Discussions](https://github.com/chahuadev/emoji-cleaner/discussions)
- 📧 **ติดต่อ**: contact@chahuadev.com

## � Changelog

### v2.2.1 (2025-09-18) - Security Enhancement
- 🛡️ **Enhanced Security**: ป้องกัน Path Traversal และ System File Access
- 🚨 **Input Validation**: ตรวจสอบ dangerous characters และ null bytes
- 🔒 **Permission Checks**: ตรวจสอบสิทธิ์การเข้าถึงไฟล์
- 📏 **File Size Limits**: จำกัดขนาดไฟล์สูงสุด 10MB
- 🛡️ **System Directory Protection**: ป้องกันการเข้าถึง system directories

### v2.2.0 (2025-09-18) - Major Feature Update
- 🌟 **50+ Programming Languages**: รองรับภาษาโปรแกรมมิ่งมากขึ้น
- 🔰 **Unicode 15.1+ Support**: รองรับอิโมจิใหม่ล่าสุด
- 🧠 **Intelligent Comment Cleanup**: ลบคอมเมนต์ที่มีอิโมจิอย่างฉลาด
- 🔍 **HTML Entity Removal**: ลบ HTML entities
- 💾 **Enhanced Backup System**: ระบบสำรองไฟล์ที่ดีขึ้น

## �📄 License

MIT License - ดู [LICENSE](LICENSE) สำหรับรายละเอียด

---

**Made with ❤️ by [Chahuadev](https://github.com/chahuadev)**

