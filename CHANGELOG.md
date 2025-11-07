# CHANGELOG

**Universal Emoji Cleaner**  
**Security-Enhanced Multi-Language Emoji Removal Tool**

---

All notable changes to this project will be documented in this file.

---

## [2.5.3] - 2025-10-07 - **DOCUMENTATION UPDATE**

### Documentation Improvements
- **Complete English Documentation**: All text converted to English language
- **No Emoji Policy**: Removed all emojis from documentation for professional presentation
- **Enhanced Readability**: Improved documentation structure and clarity
- **Professional Format**: Clean, business-appropriate documentation style
- **Version Consistency**: Updated all version references to v2.5.3

### Technical Updates
- **Version Bump**: Updated package version to 2.5.3
- **Consistent Branding**: Standardized company information and contact details
- **Security Information**: Enhanced security documentation in English
- **Usage Examples**: Improved code examples with clear explanations

---

## [2.5.0] - 2025-09-24 - **SMART FILE ANALYSIS SYSTEM**

### Major New Features
- **Smart File Analysis System**: Intelligent file analysis system
  - Intelligent complex file detection
  - Structural health scoring (0-100)
  - Context-aware file processing
  - Advanced tokenization for code analysis

- **Complex File Support**: Support for complex files
  - Files with 5+ classes automatically detected
  - Files with 20+ functions intelligently processed
  - Large files (200KB+) with chunk processing
  - Inheritance and async operation detection

- **Performance Enhancements**: Improved performance
  - Ultra-fast processing (0.16s for 291KB files) | ประมวลผลเร็วมาก (0.16s สำหรับไฟล์ 291KB)
  - Memory-optimized chunk processing | chunk processing ที่เพิ่มประสิทธิภาพ memory
  - Intelligent timeout management | การจัดการ timeout อย่างชาญฉลาด
  - Graceful handling of complex structures | จัดการโครงสร้างซับซ้อนอย่างนุ่มนวล

###  Technical Improvements | การปรับปรุงทางเทคนิค
- **Smart Tokenizer Integration** | การรวม Smart Tokenizer
  - Borrowed advanced technology from chahuadev-fix-comments | ยืมเทคโนโลยีขั้นสูงจาก chahuadev-fix-comments
  - Keyword density analysis | วิเคราะห์ความหนาแน่นของ keyword
  - Comment-to-code ratio calculation | คำนวณอัตราส่วน comment ต่อ code
  - Framework detection (React, Vue, Angular) | ตรวจจับ framework

- **Enhanced Security** | ความปลอดภัยที่เพิ่มขึ้น
  - Increased file size limit to 50MB | เพิ่มขีดจำกัดขนาดไฟล์เป็น 50MB
  - Extended pattern execution timeout to 1000ms | ขยาย timeout การประมวลผล pattern เป็น 1000ms
  - Advanced ReDoS protection for complex patterns | ป้องกัน ReDoS ขั้นสูงสำหรับ pattern ซับซ้อน

###  Bug Fixes | การแก้ไขข้อผิดพลาด
- **Single Quotes Detection** | การตรวจจับ single quotes
  - Fixed missing single quotes pattern in stringPatterns | แก้ไข pattern single quotes ที่หายไปใน stringPatterns
  - Added /'([^'\\]|\\.)*'/g for .js and .ts files | เพิ่ม /'([^'\\]|\\.)*'/g สำหรับไฟล์ .js และ .ts
  - Improved string literal detection accuracy | เพิ่มความแม่นยำในการตรวจจับ string literal

###  Documentation Updates | การอัพเดตเอกสาร
- **Comprehensive README.md** | README.md แบบครอบคลุม
  - Added Smart File Analysis documentation | เพิ่มเอกสาร Smart File Analysis
  - Updated installation instructions for v2.5.3 | อัพเดตคำแนะนำการติดตั้งสำหรับ v2.5.3
  - Added performance examples and use cases | เพิ่มตัวอย่างประสิทธิภาพและกรณีการใช้งาน
  - Enhanced bilingual documentation (Thai/English) | เอกสารสองภาษาที่เพิ่มขึ้น

---

## [2.4.0] - 2025-09-22 - **WORLD-CLASS DOCUMENTATION & CI/CD**

### New Features | ฟีเจอร์ใหม่
- **Professional CI/CD Integration** | การรวมระบบ CI/CD แบบมืออาชีพ
  - Added comprehensive GitHub Actions workflow | เพิ่ม workflow GitHub Actions แบบครอบคลุม
  - Multi-OS testing (Ubuntu, Windows, macOS) | ทดสอบบนหลาย OS
  - Multi-Node.js version support (22+) | รองรับ Node.js เวอร์ชัน 22 ขึ้นไป
  - Automated security audits | ตรวจสอบความปลอดภัยอัตโนมัติ
  - Performance benchmarking | การวัดประสิทธิภาพ

- **Community Documentation** | เอกสารชุมชน
  - Added comprehensive CONTRIBUTING.md | เพิ่ม CONTRIBUTING.md แบบครอบคลุม
  - Added CODE_OF_CONDUCT.md | เพิ่ม CODE_OF_CONDUCT.md
  - Professional contributor guidelines | แนวทางสำหรับผู้มีส่วนร่วมแบบมืออาชีพ
  - Issue and PR templates | เทมเพลตสำหรับ issue และ PR

- **Enhanced Package Configuration** | การกำหนดค่าแพ็กเกจที่ปรับปรุง
  - Updated package.json with professional standards | อัพเดต package.json ตามมาตรฐานมืออาชีพ
  - Added prepublishOnly script | เพิ่มสคริปต์ prepublishOnly
  - Enhanced keywords for better discoverability | ปรับปรุง keywords เพื่อให้ค้นหาได้ง่าย

### Improvements | การปรับปรุง
- **Documentation Quality** | คุณภาพเอกสาร
  - Updated README.md version references | อัพเดตเวอร์ชันใน README.md
  - Enhanced security warnings | ปรับปรุงคำเตือนด้านความปลอดภัย
  - Professional formatting throughout | การจัดรูปแบบแบบมืออาชีพทั้งหมด

- **Development Experience** | ประสบการณ์การพัฒนา
  - Improved development workflow | ปรับปรุงขั้นตอนการพัฒนา
  - Better testing procedures | ขั้นตอนการทดสอบที่ดีขึ้น
  - Enhanced contributor onboarding | การต้อนรับผู้มีส่วนร่วมที่ดีขึ้น

### Breaking Changes | การเปลี่ยนแปลงที่อาจกระทบ
- **None** - Fully backward compatible | ไม่มี - รองรับเวอร์ชันก่อนหน้าทั้งหมด

---

## [2.3.1] - 2025-09-19 - **SYNTAX VALIDATION IMPROVEMENTS**

###  Bug Fixes | การแก้ไขข้อผิดพลาด
- ** Python Syntax Validation** | การตรวจสอบไวยากรณ์ Python
  - Fixed overly strict Python syntax validation that was blocking valid code | แก้ไขการตรวจสอบไวยากรณ์ Python ที่เข้มงวดเกินไป
  - Improved colon (:) detection to allow decorators and comments | ปรับปรุงการตรวจจับเครื่องหมายโคลอนให้รองรับ decorators และ comments
  - Added flexible error tolerance for complex Python structures | เพิ่มความยืดหยุ่นในการจัดการข้อผิดพลาดสำหรับโครงสร้าง Python ที่ซับซ้อน

- ** HTML Syntax Validation** | การตรวจสอบไวยากรณ์ HTML
  - Relaxed HTML tag balance validation to handle modern HTML patterns | ผ่อนคลายการตรวจสอบความสมดุลของแท็ก HTML สำหรับรูปแบบ HTML ยุคใหม่
  - Improved compatibility with HTML5 and complex nested structures | ปรับปรุงความเข้ากันได้กับ HTML5 และโครงสร้างซ้อนที่ซับซ้อน
  - Enhanced processing of self-closing tags and void elements | เพิ่มประสิทธิภาพการประมวลผลแท็กปิดเองและ void elements

###  Testing Results | ผลการทดสอบ
- ** Comprehensive Testing** | การทดสอบครอบคลุม
  - Successfully processed 6,799 emojis across 16 test files | ประมวลผลอิโมจิ 6,799 ตัวใน 16 ไฟล์ทดสอบสำเร็จ
  - Verified emoji removal in Python, HTML, JavaScript, SQL, and 12+ other languages | ตรวจสอบการลบอิโมจิใน Python, HTML, JavaScript, SQL และอีก 12+ ภาษา
  - Perfect backup and restore functionality | ฟังก์ชันสำรองและกู้คืนทำงานได้อย่างสมบูรณ์แบบ
  - Zero data loss during processing | ไม่มีการสูญเสียข้อมูลระหว่างการประมวลผล

###  Security & Performance | ความปลอดภัยและประสิทธิภาพ
- ** Security Features Maintained** | คุณสมบัติด้านความปลอดภัยยังคงไว้
  - All FORTRESS security protections remain active | ระบบป้องกันความปลอดภัย FORTRESS ยังคงทำงาน
  - Path traversal and system directory blocking intact | การป้องกัน path traversal และการบล็อกไดเรกทอรี่ระบบยังคงไว้
  - Improved processing speed with relaxed validation | เพิ่มความเร็วในการประมวลผลด้วยการตรวจสอบที่ยืดหยุ่นขึ้น

---

## [2.3.0] - 2025-09-19 - ** CLEAN REGISTRY RELEASE**

###  Registry Management | การจัดการ Registry
- ** Legacy Version Cleanup** | ทำความสะอาดเวอร์ชันเก่า
  - Removed legacy versions 2.2.3 and 2.2.4 from npm registry | ลบเวอร์ชันเก่า 2.2.3 และ 2.2.4 ออกจาก npm registry
  - Clean registry with only stable releases | ทำความสะอาด registry ให้มีเฉพาะรีลีสที่เสถียร
  - Simplified version history | ประวัติเวอร์ชันที่เรียบง่าย

###  Features Maintained | คุณสมบัติที่คงไว้
- **🔧 Single-File CLI Architecture** | สถาปัตยกรรม CLI ไฟล์เดียว
  - All CLI functionality in emoji-cleaner.js | ฟังก์ชัน CLI ทั้งหมดใน emoji-cleaner.js
  - No bin/ directory dependencies | ไม่มีการพึ่งพาโฟลเดอร์ bin/
  - Simplified package structure | โครงสร้าง package ที่เรียบง่าย

- ** Security Features** | คุณสมบัติด้านความปลอดภัย
  - Complete FORTRESS security system | ระบบความปลอดภัย FORTRESS แบบสมบูรณ์
  - Path traversal protection | ป้องกัน path traversal
  - System directory blocking | บล็อกไดเรกทอรี่ระบบ
  - Command injection prevention | ป้องกันการฉีด command

- ** Enhanced Emoji Detection** | การตรวจจับอิโมจิที่ปรับปรุง
  - Unicode 15.1+ support | รองรับ Unicode 15.1+
  - Comprehensive emoji patterns | รูปแบบอิโมจิที่ครอบคลุม
  - Context-aware processing | การประมวลผลที่เข้าใจบริบท
  - 50+ programming languages supported | รองรับ 50+ ภาษาโปรแกรมมิ่ง

###  Package Quality | คุณภาพแพ็กเกจ
- ** Clean Installation** | การติดตั้งที่สะอาด
  - Only essential files included | รวมเฉพาะไฟล์ที่จำเป็น
  - Optimized package size | ขนาดแพ็กเกจที่ปรับให้เหมาะสม
  - Clear dependency structure | โครงสร้างการพึ่งพาที่ชัดเจน

---

## [2.2.7] - 2025-09-19 - **🔧 SINGLE-FILE CLI ARCHITECTURE**

###  Architectural Changes | การเปลี่ยนแปลงสถาปัตยกรรม
- ** Single-File CLI Structure** | โครงสร้าง CLI ไฟล์เดียว
  - Merged bin/cli.js functionality into emoji-cleaner.js | รวมฟังก์ชัน bin/cli.js เข้ากับ emoji-cleaner.js
  - Removed bin/ directory completely | ลบโฟลเดอร์ bin/ ออกทั้งหมด
  - Simplified package structure | ลดความซับซ้อนของ package
  - Single entry point for all operations | จุดเข้าใช้งานเดียวสำหรับทุกการดำเนินการ

###  Package Configuration | การกำหนดค่า Package
- ** Updated package.json** | อัพเดท package.json
  - Changed bin entries to point to emoji-cleaner.js | เปลี่ยน bin entries ให้ชี้ไปที่ emoji-cleaner.js
  - Removed bin/ from files array | ลบ bin/ ออกจาก files array
  - Simplified package structure | ลดความซับซ้อนของโครงสร้าง package

- ** Updated .npmignore** | อัพเดท .npmignore
  - Removed emoji-cleaner.js from ignore list | ลบ emoji-cleaner.js ออกจาก ignore list
  - Kept only emoji-cleaner.bat and .sh in ignore | เก็บเฉพาะ emoji-cleaner.bat และ .sh ใน ignore

###  Features | คุณสมบัติ
- ** Improved CLI Integration** | การรวม CLI ที่ดีขึ้น
  - All CLI functionality now in main file | ฟังก์ชัน CLI ทั้งหมดอยู่ในไฟล์หลัก
  - Better command-line argument processing | ประมวลผล command-line arguments ดีขึ้น
  - Enhanced help and version displays | แสดงผล help และ version ดีขึ้น
  - More intuitive usage patterns | รูปแบบการใช้งานที่เข้าใจง่ายขึ้น

###  Documentation | เอกสาร
- ** Updated README.md** | อัพเดท README.md
  - Added direct node usage examples | เพิ่มตัวอย่างการใช้งาน node โดยตรง
  - Documented new single-file architecture | เอกสารสถาปัตยกรรมไฟล์เดียวใหม่
  - Enhanced usage instructions | คำแนะนำการใช้งานที่ดีขึ้น

###  Migration | การย้าย
- ** Backward Compatibility** | ความเข้ากันได้ย้อนหลัง
  - All existing npx commands work unchanged | คำสั่ง npx ที่มีอยู่ทำงานเหมือนเดิม
  - Same CLI interface and options | อินเทอร์เฟซ CLI และตัวเลือกเหมือนเดิม
  - No breaking changes for end users | ไม่มีการเปลี่ยนแปลงที่ทำลายสำหรับผู้ใช้

###  Code Cleanup | ทำความสะอาดโค้ด
- ** Removed Legacy Files** | ลบไฟล์เก่า
  - Deleted bin/cli.js (functionality merged) | ลบ bin/cli.js (ฟังก์ชันถูกรวมแล้ว)
  - Removed bin/ directory structure | ลบโครงสร้างโฟลเดอร์ bin/
  - Cleaner project organization | การจัดระเบียบโปรเจ็กต์ที่สะอาดขึ้น

###  Testing | การทดสอบ
- **🔬 Verified Functionality** | ตรวจสอบฟังก์ชันการทำงาน
  - All CLI commands tested and working | คำสั่ง CLI ทั้งหมดทดสอบและทำงานได้
  - Help and version commands functional | คำสั่ง help และ version ทำงานได้
  - Emoji detection accuracy maintained | ความแม่นยำของการตรวจจับอิโมจิคงเดิม
  - No performance regression | ไม่มีการลดลงของประสิทธิภาพ

---

## [2.2.6] - 2025-09-19 - ** FORTRESS SECURITY UPDATE**

###  Added | เพิ่มใหม่
- ** Advanced Security System** | ระบบความปลอดภัยขั้นสูง
  - Path traversal protection | ป้องกัน path traversal
  - System directory access prevention | ป้องกันการเข้าถึงโฟลเดอร์ระบบ
  - Dangerous character filtering | กรองอักขระอันตราย
  - File permission validation | ตรวจสอบสิทธิ์ไฟล์
  - File size limits (10MB) | จำกัดขนาดไฟล์ (10MB)

- ** Syntax Validation System** | ระบบตรวจสอบไวยากรณ์
  - Pre-processing syntax check | ตรวจสอบไวยากรณ์ก่อนประมวลผล
  - Post-processing validation | ตรวจสอบหลังประมวลผล
  - JavaScript, Python, HTML, CSS support | รองรับ JavaScript, Python, HTML, CSS
  - Automatic rollback on syntax errors | คืนค่าอัตโนมัติเมื่อไวยากรณ์ผิด

- ** Self-Protection Mechanism** | กลไกป้องกันตัวเอง
  - Prevents processing of tool files | ป้องกันการประมวลผลไฟล์เครื่องมือ
  - Allows test files for development | อนุญาตไฟล์ทดสอบสำหรับการพัฒนา
  - Smart file detection | ตรวจจับไฟล์อย่างชาญฉลาด

- ** Enhanced CLI Interface** | อินเทอร์เฟซ CLI ปรับปรุง
  - Better error handling | จัดการข้อผิดพลาดดีขึ้น
  - Security status indicators | ตัวบ่งชี้สถานะความปลอดภัย
  - Improved progress reporting | รายงานความคืบหน้าดีขึ้น
  - Emoji icons for better UX | ไอคอนอิโมจิเพื่อ UX ที่ดีขึ้น

###  Enhanced | ปรับปรุง
- ** Code Architecture** | สถาปัตยกรรมโค้ด
  - Zone-based organization (6 zones) | จัดระเบียบแบบโซน (6 โซน)
  - Consistent function headers | หัวข้อฟังก์ชันที่สอดคล้องกัน
  - Thai language documentation | เอกสารภาษาไทย
  - validation_gateway.js style formatting | รูปแบบตาม validation_gateway.js

- ** Performance** | ประสิทธิภาพ
  - Faster file processing | ประมวลผลไฟล์เร็วขึ้น
  - Memory optimization | เพิ่มประสิทธิภาพหน่วยความจำ
  - Better error recovery | กู้คืนข้อผิดพลาดดีขึ้น

###  Security | ความปลอดภัย
- ** FORBIDDEN PATHS** | เส้นทางต้องห้าม
  ```
   C:\Windows\*
   C:\Program Files\*
   /etc/*
   /usr/bin/*
   /System/*
   /bin/*
   /sbin/*
  ```

- ** ALLOWED OPERATIONS** | การดำเนินการที่อนุญาต
  ```
   User directories only
   Project folders
   Test files (test-*.js)
   Files under 10MB
   Supported extensions only
  ```

###  Fixed | แก้ไข
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

###  Breaking Changes | การเปลี่ยนแปลงที่ทำลาย
- **Security Enforcement** | การบังคับใช้ความปลอดภัย
  - System directories are now completely blocked | โฟลเดอร์ระบบถูกบล็อกสมบูรณ์
  - Dangerous files are rejected | ไฟล์อันตรายถูกปฏิเสธ
  - Path traversal attempts fail immediately | การพยายาม path traversal ล้มเหลวทันที

###  Testing Results | ผลการทดสอบ
-  Tool skips its own 99 emojis correctly | เครื่องมือข้ามอิโมจิ 99 ตัวของตัวเองได้ถูกต้อง
-  Successfully tested with external projects | ทดสอบกับโปรเจ็กต์ภายนอกสำเร็จ
-  Zero errors in tool directory | ข้อผิดพลาดศูนย์ในโฟลเดอร์เครื่องมือ
-  Maintains full functionality | รักษาการทำงานเต็มรูปแบบ

---

## [2.2.6] - 2025-09-18 | ** UNICODE 15.1+ SUPPORT**

### Added | เพิ่มใหม่
- Enhanced Unicode 15.1+ emoji detection | การตรวจจับอิโมจิ Unicode 15.1+ ปรับปรุง
- Improved CLI interface with better options | อินเทอร์เฟซ CLI ปรับปรุงพร้อมตัวเลือกดีขึ้น
- Cross-platform compatibility | ความเข้ากันได้ข้ามแพลตฟอร์ม
- Support for 50+ programming languages | รองรับภาษาโปรแกรมมิ่ง 50+ ภาษา

### Fixed | แก้ไข
- Various stability improvements | ปรับปรุงความเสถียรต่างๆ
- Better file handling | จัดการไฟล์ดีขึ้น

---

## [2.1.0] - 2025-09-15 | ** INITIAL RELEASE**

### Added | เพิ่มใหม่
- Initial release | เวอร์ชันแรก
- Basic emoji removal functionality | ฟังก์ชันลบอิโมจิพื้นฐาน
- Support for major programming languages | รองรับภาษาโปรแกรมมิ่งหลัก

---

##  Security Guidelines | แนวทางความปลอดภัย

###  Safe Usage | การใช้งานปลอดภัย
```bash
#  SAFE - ปลอดภัย
npx @chahuadev/emoji-cleaner@latest ./my-project --dry-run
npx @chahuadev/emoji-cleaner@latest ./src --backup
npx @chahuadev/emoji-cleaner@latest ./components

#  SAFE - Project directories
./src/
./components/
./pages/
./assets/
./docs/
./test/
```

###  Dangerous Usage | การใช้งานอันตราย
```bash
#  BLOCKED BY SYSTEM - ถูกบล็อกโดยระบบ
npx @chahuadev/emoji-cleaner C:\Windows\
npx @chahuadev/emoji-cleaner /etc/
npx @chahuadev/emoji-cleaner "C:\Program Files\"
npx @chahuadev/emoji-cleaner /usr/bin/

#  DANGEROUS PATTERNS - รูปแบบอันตราย
../../../etc/passwd
..\..\..\..\Windows\System32
/etc/../../../bin/
C:\Windows\..\..\..\
```

###  Protection Features | ฟีเจอร์ป้องกัน

1. **Path Validation** | การตรวจสอบเส้นทาง
   -  Blocks system directories | บล็อกโฟลเดอร์ระบบ
   -  Prevents path traversal | ป้องกัน path traversal
   -  Validates file permissions | ตรวจสอบสิทธิ์ไฟล์

2. **Syntax Protection** | การป้องกันไวยากรณ์
   -  Pre-process validation | ตรวจสอบก่อนประมวลผล
   -  Post-process verification | ยืนยันหลังประมวลผล
   -  Automatic rollback | คืนค่าอัตโนมัติ

3. **Self-Protection** | การป้องกันตัวเอง
   -  Skips tool files | ข้ามไฟล์เครื่องมือ
   -  Prevents corruption | ป้องกันความเสียหาย
   -  Smart detection | การตรวจจับอย่างชาญฉลาด

###  Anti-Hacking Measures | มาตรการป้องกันการแฮก

####  Command Injection Prevention | ป้องกันการฉีด Command
```javascript
//  BLOCKED - These patterns are automatically rejected
eval();
exec();
spawn();
require('child_process');
fs.unlinkSync('/');
rm -rf /
del /f /s /q C:\*
```

####  Path Traversal Protection | ป้องกัน Path Traversal
```javascript
//  BLOCKED - Path traversal attempts
"../../../etc/passwd"
"..\\..\\..\\Windows\\System32"
"/etc/../../../bin/"
"C:\\Windows\\..\\..\\..\\"
```

####  System File Protection | ป้องกันไฟล์ระบบ
```javascript
//  AUTOMATICALLY BLOCKED - System critical paths
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

** SECURITY FIRST DESIGN | การออกแบบที่ให้ความสำคัญกับความปลอดภัยเป็นอันดับแรก**  
**เครื่องมือนี้ถูกพัฒนาด้วยความใส่ใจในความปลอดภัยเป็นหลัก**  
**This tool is developed with security as the primary concern**