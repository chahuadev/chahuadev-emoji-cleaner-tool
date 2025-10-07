# Contributing to Chahuadev Emoji Cleaner

**ยินดีต้อนรับสู่ชุมชนนักพัฒนา Chahuadev Emoji Cleaner!**

เราขอขอบคุณที่คุณสนใจจะมาช่วยพัฒนาเครื่องมือลบอิโมจินี้ให้ดีขึ้น การมีส่วนร่วมของคุณจะช่วยให้โปรเจกต์นี้เติบโตและเป็นประโยชน์กับนักพัฒนาทั่วโลก

We welcome contributions from developers of all skill levels! This document will guide you through the process of contributing to our emoji cleaning project.

## Table of Contents - สารบัญ

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Contributing Guidelines](#contributing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Documentation](#documentation)
- [Community Support](#community-support)

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [contact@chahuadev.com](mailto:contact@chahuadev.com).

## Getting Started - เริ่มต้น

### Prerequisites - ข้อกำหนดเบื้องต้น

- **Node.js**: Version 22.0.0 or higher
- **npm**: Version 7.0.0 or higher
- **Git**: Latest stable version
- **Text Editor**: VS Code recommended with extensions:
  - ESLint
  - Prettier
  - GitLens

### Quick Start
```bash
# 1. Fork และ Clone repository
git clone https://github.com/YOUR_USERNAME/chahuadev-emoji-cleaner.git
cd chahuadev-emoji-cleaner

# 2. เพิ่ม upstream remote
git remote add upstream https://github.com/chahuadev/chahuadev-emoji-cleaner.git

# 3. ติดตั้ง dependencies
npm install

# 4. ทดสอบเครื่องมือ
node emoji-cleaner.js --help

# 5. เริ่มพัฒนา!
git checkout -b feature/your-amazing-feature
```

## Development Setup - การตั้งค่าการพัฒนา

### Environment Configuration
```bash
# Install development dependencies
npm install --include=dev

# Verify installation
node emoji-cleaner.js --version
```

### Project Structure - โครงสร้างโปรเจกต์
```
chahuadev-emoji-cleaner-tool/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
├── test-chahuadev-emoji-cleaner-tool/  # Test files
├── emoji-cleaner.js        # Main CLI tool
├── package.json
├── README.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── CHANGELOG.md
└── LICENSE
```

### Development Commands
```bash
# รันเครื่องมือในโหมด development
npm run clean ./test-samples

# ทดสอบ CLI
node emoji-cleaner.js --help
node emoji-cleaner.js --version

# ทดสอบกับไฟล์ตัวอย่าง
node emoji-cleaner.js ./test-samples --dry-run
```

## Contributing Guidelines - แนวทางการมีส่วนร่วม

### Types of Contributions - ประเภทการมีส่วนร่วม

1. **Bug Reports** - รายงานปัญหา
2. **Feature Requests** - ขอฟีเจอร์ใหม่
3. **Documentation** - ปรับปรุงเอกสาร
4. **Tests** - เพิ่มการทดสอบ
5. **Code Improvements** - ปรับปรุงโค้ด
6. **Translations** - แปลภาษา
7. **Unicode Support** - รองรับ Unicode ใหม่

### Before You Start - ก่อนเริ่มงาน

1. **ค้นหา Issues ที่มีอยู่** เพื่อหลีกเลี่ยงการทำงานซ้ำซ้อน
2. **สร้าง Issue ใหม่** หากเป็นการเปลี่ยนแปลงใหญ่
3. **แจ้งในความคิดเห็น** ว่าคุณกำลังทำงานใน Issue นั้น
4. **อ่าน Code of Conduct** และ Contributing Guidelines

### Issue Guidelines - แนวทางการสร้าง Issue

#### Bug Report Template
```markdown
## Bug Description - คำอธิบายปัญหา
[อธิบายปัญหาอย่างชัดเจน]

## Steps to Reproduce - ขั้นตอนการทำซ้ำ
1. รันคำสั่ง: `npx @chahuadev/emoji-cleaner ...`
2. ใช้กับไฟล์: `...`
3. เห็นปัญหา: `...`

## Expected Behavior - ผลลัพธ์ที่คาดหวัง
[อธิบายสิ่งที่ควรจะเกิดขึ้น]

## Actual Behavior - ผลลัพธ์ที่เกิดขึ้นจริง
[อธิบายสิ่งที่เกิดขึ้นจริง]

## Sample File - ไฟล์ตัวอย่าง
```javascript
// Paste your test file here with emojis
console.log("Hello 🌍 World");
```

## Environment - สภาพแวดล้อม
- OS: [e.g., Windows 11, macOS 13, Ubuntu 22.04]
- Node.js: [e.g., 18.17.0]
- Package Version: [e.g., 2.3.1]

## Additional Context - บริบทเพิ่มเติม
[ข้อมูลอื่นๆ ที่เกี่ยวข้อง]
```

#### Feature Request Template
```markdown
## Feature Description - คำอธิบายฟีเจอร์
[อธิบายฟีเจอร์ที่ต้องการ]

## Problem Statement - ปัญหาที่ต้องการแก้ไข
[อธิบายปัญหาที่ฟีเจอร์นี้จะช่วยแก้ไข]

## Proposed Solution - วิธีการที่เสนอ
[อธิบายวิธีการที่คิดว่าจะใช้แก้ปัญหา]

## Use Case Examples - ตัวอย่างการใช้งาน
[แสดงตัวอย่างการใช้งานจริง]

## Implementation Ideas - แนวคิดการพัฒนา
[แนวคิดเบื้องต้นสำหรับการพัฒนา]
```

## Pull Request Process - ขั้นตอนการส่ง Pull Request

### 1. Preparation - การเตรียมตัว
```bash
# อัพเดต branch ของคุณให้ตรงกับ upstream
git checkout main
git pull upstream main
git checkout your-feature-branch
git rebase main
```

### 2. Code Quality Check - ตรวจสอบคุณภาพโค้ด
```bash
# ทดสอบฟังก์ชันการทำงาน
node emoji-cleaner.js --help
node emoji-cleaner.js --version

# ทดสอบกับไฟล์ตัวอย่าง
node emoji-cleaner.js ./test-samples --dry-run

# ตรวจสอบ security
npm audit
```

### 3. Commit Guidelines - แนวทางการ Commit

#### Commit Message Format
```
<type>(<scope>): <description>

<body>

<footer>
```

#### Commit Types
- `feat`: ฟีเจอร์ใหม่
- `fix`: แก้ไขปัญหา
- `docs`: อัพเดตเอกสาร
- `style`: ปรับปรุง code style
- `refactor`: ปรับปรุงโค้ดโดยไม่เปลี่ยนฟังก์ชัน
- `test`: เพิ่มหรือปรับปรุงการทดสอบ
- `chore`: งานบำรุงรักษา

#### Example Commits
```bash
feat(unicode): add support for Unicode 15.1 emojis

- Add new emoji patterns for 2023 release
- Update detection algorithms
- Improve performance for large files

Closes #45

fix(security): prevent path traversal attacks

- Add comprehensive path validation
- Block access to system directories
- Improve error messages for security violations

docs(readme): update installation instructions

- Add npx usage examples
- Update Node.js version requirements
- Add troubleshooting section
```

### 4. Pull Request Template

เมื่อสร้าง Pull Request กรุณาใช้ template นี้:

```markdown
## Summary - สรุป
[อธิบายการเปลี่ยนแปลงอย่างกระชับ]

## Type of Change - ประเภทการเปลี่ยนแปลง
- [ ] Bug fix (การแก้ไขที่ไม่ทำลาย existing functionality)
- [ ] New feature (การเพิ่มฟีเจอร์ที่ไม่ทำลาย existing functionality)
- [ ] Breaking change (การเปลี่ยนแปลงที่อาจส่งผลต่อ existing functionality)
- [ ] Documentation update (การอัพเดตเอกสาร)
- [ ] Unicode update (การอัพเดต Unicode support)

## Changes Made - การเปลี่ยนแปลงที่ทำ
- [x] เพิ่ม feature A
- [x] แก้ไข bug B
- [x] อัพเดต documentation C

## Testing - การทดสอบ
- [ ] ทดสอบ CLI functionality
- [ ] ทดสอบกับไฟล์ตัวอย่าง
- [ ] ทดสอบ edge cases
- [ ] ทดสอบ backward compatibility
- [ ] ทดสอบ security features

## Test Files - ไฟล์ทดสอบ
```javascript
// Example test file used
console.log("Hello 🌍 World 🚀");
function test() { return "Success ✅"; }
```

## Related Issues - Issues ที่เกี่ยวข้อง
Closes #[issue_number]
Related to #[issue_number]

## Checklist - รายการตรวจสอบ
- [ ] โค้ดของฉันเป็นไปตาม style guidelines ของโปรเจกต์
- [ ] ฉันได้ review โค้ดของตัวเองแล้ว
- [ ] ฉันได้เพิ่ม comments ในส่วนที่ซับซ้อน
- [ ] ฉันได้อัพเดต documentation ที่เกี่ยวข้อง
- [ ] การเปลี่ยนแปลงของฉันไม่ทำให้เกิด warnings ใหม่
- [ ] ฉันได้ทดสอบ CLI functionality
- [ ] ฉันได้ทดสอบกับไฟล์ที่มีอิโมจิหลากหลาย
- [ ] ฉันได้ตรวจสอบว่าไม่มี breaking changes ที่ไม่จำเป็น
```

## Coding Standards - มาตรฐานการเขียนโค้ด

### JavaScript Style Guide

```javascript
// ใช้ const สำหรับค่าที่ไม่เปลี่ยนแปลง
const EMOJI_PATTERNS = {
    BASIC: /[\u{1F600}-\u{1F64F}]/gu,
    SYMBOLS: /[\u{1F300}-\u{1F5FF}]/gu,
    TRANSPORT: /[\u{1F680}-\u{1F6FF}]/gu
};

// ใช้ descriptive variable names
const emojiMatches = findEmojiPatterns(fileContent);
const cleanedContent = removeEmojis(emojiMatches);

// เพิ่ม JSDoc comments สำหรับ functions
/**
 * ลบอิโมจิออกจากเนื้อหาไฟล์
 * Remove emojis from file content
 * 
 * @param {string} content - เนื้อหาไฟล์
 * @param {Object} options - ตัวเลือกการลบ
 * @param {boolean} options.preserveSpaces - รักษาช่องว่าง
 * @returns {string} เนื้อหาที่ลบอิโมจิแล้ว
 */
function removeEmojis(content, options = {}) {
    // Implementation here
}

// Error handling pattern
function validateFile(filePath) {
    if (!filePath) {
        throw new Error('File path is required');
    }
    
    if (!fs.existsSync(filePath)) {
        throw new Error(`File not found: ${filePath}`);
    }
    
    // Continue validation...
}
```

### File Naming Conventions
- **Source files**: `kebab-case.js` (e.g., `emoji-cleaner.js`)
- **Test files**: `test-*.js` (e.g., `test-emoji-cleaner.js`)
- **Documentation**: `UPPER_CASE.md` (e.g., `CONTRIBUTING.md`)
- **Configuration**: `lowercase.json` (e.g., `package.json`)

## Testing Guidelines - แนวทางการทดสอบ

### Manual Testing
```bash
# สร้างไฟล์ทดสอบ
echo "console.log('Hello 🌍 World 🚀');" > test-emoji.js

# ทดสอบ dry-run
node emoji-cleaner.js test-emoji.js --dry-run

# ทดสอบจริง
node emoji-cleaner.js test-emoji.js --backup

# ทดสอบ verbose mode
node emoji-cleaner.js test-emoji.js --verbose --dry-run
```

### Test Coverage Areas
- **Basic emoji removal**: Standard Unicode emojis
- **Advanced emojis**: Newer Unicode versions
- **File types**: JS, TS, HTML, CSS, etc.
- **Edge cases**: Empty files, binary files, large files
- **Error handling**: Invalid paths, permissions
- **Security**: Path traversal, system files

## Documentation - เอกสาร

### Documentation Standards
1. **README.md**: ข้อมูลภาพรวมและการใช้งานพื้นฐาน
2. **CLI Help**: รายละเอียด commands และ options
3. **Examples**: ตัวอย่างการใช้งานจริง
4. **Changelog**: บันทึกการเปลี่ยนแปลงแต่ละเวอร์ชัน

### Writing Guidelines
- **ใช้ภาษาที่เข้าใจง่าย** และหลีกเลี่ยง jargon
- **เพิ่มตัวอย่าง** ให้มากที่สุด
- **รองรับสองภาษา** (ไทย/อังกฤษ) เมื่อเป็นไปได้
- **อัพเดตเอกสาร** ทุกครั้งที่มีการเปลี่ยนแปลง CLI

## Community Support - การสนับสนุนชุมชน

### Communication Channels
- **GitHub Issues**: สำหรับ bug reports และ feature requests
- **GitHub Discussions**: สำหรับคำถามและการสนทนาทั่วไป
- **Email**: contact@chahuadev.com สำหรับปัญหาเร่งด่วน

### Getting Help - การขอความช่วยเหลือ
1. **ค้นหาใน existing issues** ก่อน
2. **อ่าน documentation** และ CLI help
3. **ทดสอบ --dry-run** เพื่อดูผลลัพธ์
4. **สร้าง issue ใหม่** พร้อมข้อมูลครบถ้วน

### Helping Others - การช่วยเหลือผู้อื่น
- **ตอบคำถามใน issues** และ discussions
- **Review pull requests** จากสมาชิกอื่น
- **ปรับปรุงเอกสาร** เมื่อเจอจุดที่ไม่ชัด
- **แชร์ประสบการณ์** การใช้งาน

## Unicode and Emoji Standards - มาตรฐาน Unicode และอิโมจิ

### Current Support
- **Unicode 15.1+**: Latest emoji standards
- **50+ Programming Languages**: Comprehensive file type support
- **Intelligent Detection**: Context-aware emoji removal

### Contributing New Unicode Support
1. **Research**: Study new Unicode release
2. **Patterns**: Add new emoji patterns
3. **Testing**: Test with sample files
4. **Documentation**: Update supported emoji list

## Recognition - การยอมรับ

เราให้เกียรติและขอบคุณผู้มีส่วนร่วมทุกคนโดย:

- **Contributors section** ใน README.md
- **Changelog mentions** สำหรับ significant contributions
- **Special thanks** ใน release notes
- **Community spotlights** ใน project discussions

## License - สัญญาอนุญาต

By contributing to this project, you agree that your contributions will be licensed under the same [MIT License](LICENSE) that covers the project.

---

## Contact - ติดต่อ

หากมีคำถามเกี่ยวกับการมีส่วนร่วม กรุณาติดต่อ:

- **Email**: contact@chahuadev.com
- **GitHub**: [@chahuadev](https://github.com/chahuadev)
- **Website**: https://chahuadev.com

**ขอบคุณสำหรับการมีส่วนร่วมของคุณ! Together, we clean the code world! 🧹✨**