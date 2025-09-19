# 📅 CHANGELOG | บันทึกการเปลี่ยนแปลง

**Universal Emoji Cleaner - เครื่องมือลบอิโมจิสากล**  
**Security-Enhanced Multi-Language Emoji Removal Tool**

---

## 🇹🇭 ภาษาไทย | 🇺🇸 English

All notable changes to this project will be documented in this file.  
การเปลี่ยนแปลงที่สำคัญทั้งหมดของโปรเจ็กต์นี้จะถูกบันทึกไว้ในไฟล์นี้

---

## [2.3.0] - 2025-09-19 - **🧹 CLEAN REGISTRY RELEASE**

### 🔄 Registry Management | การจัดการ Registry
- **🗑️ Legacy Version Cleanup** | ทำความสะอาดเวอร์ชันเก่า
  - Removed legacy versions 2.2.3 and 2.2.4 from npm registry | ลบเวอร์ชันเก่า 2.2.3 และ 2.2.4 ออกจาก npm registry
  - Clean registry with only stable releases | ทำความสะอาด registry ให้มีเฉพาะรีลีสที่เสถียร
  - Simplified version history | ประวัติเวอร์ชันที่เรียบง่าย

### ✨ Features Maintained | คุณสมบัติที่คงไว้
- **🔧 Single-File CLI Architecture** | สถาปัตยกรรม CLI ไฟล์เดียว
  - All CLI functionality in emoji-cleaner.js | ฟังก์ชัน CLI ทั้งหมดใน emoji-cleaner.js
  - No bin/ directory dependencies | ไม่มีการพึ่งพาโฟลเดอร์ bin/
  - Simplified package structure | โครงสร้าง package ที่เรียบง่าย

- **🛡️ Security Features** | คุณสมบัติด้านความปลอดภัย
  - Complete FORTRESS security system | ระบบความปลอดภัย FORTRESS แบบสมบูรณ์
  - Path traversal protection | ป้องกัน path traversal
  - System directory blocking | บล็อกไดเรกทอรี่ระบบ
  - Command injection prevention | ป้องกันการฉีด command

- **🎯 Enhanced Emoji Detection** | การตรวจจับอิโมจิที่ปรับปรุง
  - Unicode 15.1+ support | รองรับ Unicode 15.1+
  - Comprehensive emoji patterns | รูปแบบอิโมจิที่ครอบคลุม
  - Context-aware processing | การประมวลผลที่เข้าใจบริบท
  - 50+ programming languages supported | รองรับ 50+ ภาษาโปรแกรมมิ่ง

### 📦 Package Quality | คุณภาพแพ็กเกจ
- **🧼 Clean Installation** | การติดตั้งที่สะอาด
  - Only essential files included | รวมเฉพาะไฟล์ที่จำเป็น
  - Optimized package size | ขนาดแพ็กเกจที่ปรับให้เหมาะสม
  - Clear dependency structure | โครงสร้างการพึ่งพาที่ชัดเจน

---

## [2.2.7] - 2025-09-19 - **🔧 SINGLE-FILE CLI ARCHITECTURE**

### 🏗️ Architectural Changes | การเปลี่ยนแปลงสถาปัตยกรรม
- **📁 Single-File CLI Structure** | โครงสร้าง CLI ไฟล์เดียว
  - Merged bin/cli.js functionality into emoji-cleaner.js | รวมฟังก์ชัน bin/cli.js เข้ากับ emoji-cleaner.js
  - Removed bin/ directory completely | ลบโฟลเดอร์ bin/ ออกทั้งหมด
  - Simplified package structure | ลดความซับซ้อนของ package
  - Single entry point for all operations | จุดเข้าใช้งานเดียวสำหรับทุกการดำเนินการ

### 📦 Package Configuration | การกำหนดค่า Package
- **📝 Updated package.json** | อัพเดท package.json
  - Changed bin entries to point to emoji-cleaner.js | เปลี่ยน bin entries ให้ชี้ไปที่ emoji-cleaner.js
  - Removed bin/ from files array | ลบ bin/ ออกจาก files array
  - Simplified package structure | ลดความซับซ้อนของโครงสร้าง package

- **🚫 Updated .npmignore** | อัพเดท .npmignore
  - Removed emoji-cleaner.js from ignore list | ลบ emoji-cleaner.js ออกจาก ignore list
  - Kept only emoji-cleaner.bat and .sh in ignore | เก็บเฉพาะ emoji-cleaner.bat และ .sh ใน ignore

### ✨ Features | คุณสมบัติ
- **🔧 Improved CLI Integration** | การรวม CLI ที่ดีขึ้น
  - All CLI functionality now in main file | ฟังก์ชัน CLI ทั้งหมดอยู่ในไฟล์หลัก
  - Better command-line argument processing | ประมวลผล command-line arguments ดีขึ้น
  - Enhanced help and version displays | แสดงผล help และ version ดีขึ้น
  - More intuitive usage patterns | รูปแบบการใช้งานที่เข้าใจง่ายขึ้น

### 📚 Documentation | เอกสาร
- **📖 Updated README.md** | อัพเดท README.md
  - Added direct node usage examples | เพิ่มตัวอย่างการใช้งาน node โดยตรง
  - Documented new single-file architecture | เอกสารสถาปัตยกรรมไฟล์เดียวใหม่
  - Enhanced usage instructions | คำแนะนำการใช้งานที่ดีขึ้น

### 🔄 Migration | การย้าย
- **♻️ Backward Compatibility** | ความเข้ากันได้ย้อนหลัง
  - All existing npx commands work unchanged | คำสั่ง npx ที่มีอยู่ทำงานเหมือนเดิม
  - Same CLI interface and options | อินเทอร์เฟซ CLI และตัวเลือกเหมือนเดิม
  - No breaking changes for end users | ไม่มีการเปลี่ยนแปลงที่ทำลายสำหรับผู้ใช้

### 🧹 Code Cleanup | ทำความสะอาดโค้ด
- **🗑️ Removed Legacy Files** | ลบไฟล์เก่า
  - Deleted bin/cli.js (functionality merged) | ลบ bin/cli.js (ฟังก์ชันถูกรวมแล้ว)
  - Removed bin/ directory structure | ลบโครงสร้างโฟลเดอร์ bin/
  - Cleaner project organization | การจัดระเบียบโปรเจ็กต์ที่สะอาดขึ้น

### ✅ Testing | การทดสอบ
- **🔬 Verified Functionality** | ตรวจสอบฟังก์ชันการทำงาน
  - All CLI commands tested and working | คำสั่ง CLI ทั้งหมดทดสอบและทำงานได้
  - Help and version commands functional | คำสั่ง help และ version ทำงานได้
  - Emoji detection accuracy maintained | ความแม่นยำของการตรวจจับอิโมจิคงเดิม
  - No performance regression | ไม่มีการลดลงของประสิทธิภาพ

---

## [2.2.6] - 2025-09-19 - **🛡️ FORTRESS SECURITY UPDATE**

###  Added | เพิ่มใหม่
- **🛡️ Advanced Security System** | ระบบความปลอดภัยขั้นสูง
  - Path traversal protection | ป้องกัน path traversal
  - System directory access prevention | ป้องกันการเข้าถึงโฟลเดอร์ระบบ
  - Dangerous character filtering | กรองอักขระอันตราย
  - File permission validation | ตรวจสอบสิทธิ์ไฟล์
  - File size limits (10MB) | จำกัดขนาดไฟล์ (10MB)

- **🔍 Syntax Validation System** | ระบบตรวจสอบไวยากรณ์
  - Pre-processing syntax check | ตรวจสอบไวยากรณ์ก่อนประมวลผล
  - Post-processing validation | ตรวจสอบหลังประมวลผล
  - JavaScript, Python, HTML, CSS support | รองรับ JavaScript, Python, HTML, CSS
  - Automatic rollback on syntax errors | คืนค่าอัตโนมัติเมื่อไวยากรณ์ผิด

- **🛡️ Self-Protection Mechanism** | กลไกป้องกันตัวเอง
  - Prevents processing of tool files | ป้องกันการประมวลผลไฟล์เครื่องมือ
  - Allows test files for development | อนุญาตไฟล์ทดสอบสำหรับการพัฒนา
  - Smart file detection | ตรวจจับไฟล์อย่างชาญฉลาด

- **📊 Enhanced CLI Interface** | อินเทอร์เฟซ CLI ปรับปรุง
  - Better error handling | จัดการข้อผิดพลาดดีขึ้น
  - Security status indicators | ตัวบ่งชี้สถานะความปลอดภัย
  - Improved progress reporting | รายงานความคืบหน้าดีขึ้น
  - Emoji icons for better UX | ไอคอนอิโมจิเพื่อ UX ที่ดีขึ้น

### � Enhanced | ปรับปรุง
- **🏗️ Code Architecture** | สถาปัตยกรรมโค้ด
  - Zone-based organization (6 zones) | จัดระเบียบแบบโซน (6 โซน)
  - Consistent function headers | หัวข้อฟังก์ชันที่สอดคล้องกัน
  - Thai language documentation | เอกสารภาษาไทย
  - validation_gateway.js style formatting | รูปแบบตาม validation_gateway.js

- **⚡ Performance** | ประสิทธิภาพ
  - Faster file processing | ประมวลผลไฟล์เร็วขึ้น
  - Memory optimization | เพิ่มประสิทธิภาพหน่วยความจำ
  - Better error recovery | กู้คืนข้อผิดพลาดดีขึ้น

### 🔒 Security | ความปลอดภัย
- **🚫 FORBIDDEN PATHS** | เส้นทางต้องห้าม
  ```
  ❌ C:\Windows\*
  ❌ C:\Program Files\*
  ❌ /etc/*
  ❌ /usr/bin/*
  ❌ /System/*
  ❌ /bin/*
  ❌ /sbin/*
  ```

- **✅ ALLOWED OPERATIONS** | การดำเนินการที่อนุญาต
  ```
  ✅ User directories only
  ✅ Project folders
  ✅ Test files (test-*.js)
  ✅ Files under 10MB
  ✅ Supported extensions only
  ```

### 🐛 Fixed | แก้ไข
- **CLI Integration Issues** | ปัญหาการรวม CLI
  - Fixed function import errors | แก้ไขข้อผิดพลาดการ import ฟังก์ชัน
  - Improved error propagation | ปรับปรุงการส่งผ่านข้อผิดพลาด
  - Better result handling | จัดการผลลัพธ์ดีขึ้น

- **File Processing** | การประมวลผลไฟล์
  - Fixed syntax validation integration | แก้ไขการรวมระบบตรวจสอบไวยากรณ์
  - Improved backup system | ระบบสำรองดีขึ้น
  - Better self-protection logic | ตรรกะป้องกันตัวเองดีขึ้น

- **Self-Protection Mechanism** | กลไกป้องกันตัวเอง
  - Fixed recursive self-modification bug | แก้ไขบั๊กการแก้ไขตัวเองแบบวนซ้ำ
  - Resolved script errors in tool directory | แก้ไขข้อผิดพลาดสคริปต์ในโฟลเดอร์เครื่องมือ
  - Eliminated false positive detections | กำจัดการตรวจจับผิดพลาด

### ⚠️ Breaking Changes | การเปลี่ยนแปลงที่ทำลาย
- **Security Enforcement** | การบังคับใช้ความปลอดภัย
  - System directories are now completely blocked | โฟลเดอร์ระบบถูกบล็อกสมบูรณ์
  - Dangerous files are rejected | ไฟล์อันตรายถูกปฏิเสธ
  - Path traversal attempts fail immediately | การพยายาม path traversal ล้มเหลวทันที

### 📊 Testing Results | ผลการทดสอบ
- ✅ Tool skips its own 99 emojis correctly | เครื่องมือข้ามอิโมจิ 99 ตัวของตัวเองได้ถูกต้อง
- ✅ Successfully tested with external projects | ทดสอบกับโปรเจ็กต์ภายนอกสำเร็จ
- ✅ Zero errors in tool directory | ข้อผิดพลาดศูนย์ในโฟลเดอร์เครื่องมือ
- ✅ Maintains full functionality | รักษาการทำงานเต็มรูปแบบ

---

## [2.2.6] - 2025-09-18 | **🌟 UNICODE 15.1+ SUPPORT**

### Added | เพิ่มใหม่
- Enhanced Unicode 15.1+ emoji detection | การตรวจจับอิโมจิ Unicode 15.1+ ปรับปรุง
- Improved CLI interface with better options | อินเทอร์เฟซ CLI ปรับปรุงพร้อมตัวเลือกดีขึ้น
- Cross-platform compatibility | ความเข้ากันได้ข้ามแพลตฟอร์ม
- Support for 50+ programming languages | รองรับภาษาโปรแกรมมิ่ง 50+ ภาษา

### Fixed | แก้ไข
- Various stability improvements | ปรับปรุงความเสถียรต่างๆ
- Better file handling | จัดการไฟล์ดีขึ้น

---

## [2.1.0] - 2025-09-15 | **🚀 INITIAL RELEASE**

### Added | เพิ่มใหม่
- Initial release | เวอร์ชันแรก
- Basic emoji removal functionality | ฟังก์ชันลบอิโมจิพื้นฐาน
- Support for major programming languages | รองรับภาษาโปรแกรมมิ่งหลัก

---

## 🔐 Security Guidelines | แนวทางความปลอดภัย

### ✅ Safe Usage | การใช้งานปลอดภัย
```bash
# ✅ SAFE - ปลอดภัย
npx @chahuadev/emoji-cleaner@latest ./my-project --dry-run
npx @chahuadev/emoji-cleaner@latest ./src --backup
npx @chahuadev/emoji-cleaner@latest ./components

# ✅ SAFE - Project directories
./src/
./components/
./pages/
./assets/
./docs/
./test/
```

### ❌ Dangerous Usage | การใช้งานอันตราย
```bash
# ❌ BLOCKED BY SYSTEM - ถูกบล็อกโดยระบบ
npx @chahuadev/emoji-cleaner C:\Windows\
npx @chahuadev/emoji-cleaner /etc/
npx @chahuadev/emoji-cleaner "C:\Program Files\"
npx @chahuadev/emoji-cleaner /usr/bin/

# ❌ DANGEROUS PATTERNS - รูปแบบอันตราย
../../../etc/passwd
..\..\..\..\Windows\System32
/etc/../../../bin/
C:\Windows\..\..\..\
```

### 🛡️ Protection Features | ฟีเจอร์ป้องกัน

1. **Path Validation** | การตรวจสอบเส้นทาง
   - ✅ Blocks system directories | บล็อกโฟลเดอร์ระบบ
   - ✅ Prevents path traversal | ป้องกัน path traversal
   - ✅ Validates file permissions | ตรวจสอบสิทธิ์ไฟล์

2. **Syntax Protection** | การป้องกันไวยากรณ์
   - ✅ Pre-process validation | ตรวจสอบก่อนประมวลผล
   - ✅ Post-process verification | ยืนยันหลังประมวลผล
   - ✅ Automatic rollback | คืนค่าอัตโนมัติ

3. **Self-Protection** | การป้องกันตัวเอง
   - ✅ Skips tool files | ข้ามไฟล์เครื่องมือ
   - ✅ Prevents corruption | ป้องกันความเสียหาย
   - ✅ Smart detection | การตรวจจับอย่างชาญฉลาด

### 🚨 Anti-Hacking Measures | มาตรการป้องกันการแฮก

#### 🛡️ Command Injection Prevention | ป้องกันการฉีด Command
```javascript
// ❌ BLOCKED - These patterns are automatically rejected
eval();
exec();
spawn();
require('child_process');
fs.unlinkSync('/');
rm -rf /
del /f /s /q C:\*
```

#### 🔒 Path Traversal Protection | ป้องกัน Path Traversal
```javascript
// ❌ BLOCKED - Path traversal attempts
"../../../etc/passwd"
"..\\..\\..\\Windows\\System32"
"/etc/../../../bin/"
"C:\\Windows\\..\\..\\..\\"
```

#### 🚫 System File Protection | ป้องกันไฟล์ระบบ
```javascript
// ❌ AUTOMATICALLY BLOCKED - System critical paths
/etc/passwd
/etc/shadow
C:\Windows\System32\
C:\Program Files\
/usr/bin/
/bin/sh
```

---

<div align="center">

[![Issues](https://img.shields.io/badge/รายงานปัญหา-GitHub_Issues-red?style=for-the-badge&logo=github)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/issues)
[![Discussions](https://img.shields.io/badge/ขอฟีเจอร์ใหม่-GitHub_Discussions-blue?style=for-the-badge&logo=github)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/discussions)
[![Contact](https://img.shields.io/badge/ติดต่อ-chahuadev@gmail.com-green?style=for-the-badge&logo=gmail)](mailto:chahuadev@gmail.com)

</div>

**⚠️ SECURITY FIRST DESIGN | การออกแบบที่ให้ความสำคัญกับความปลอดภัยเป็นอันดับแรก**  
**เครื่องมือนี้ถูกพัฒนาด้วยความใส่ใจในความปลอดภัยเป็นหลัก**  
**This tool is developed with security as the primary concern**