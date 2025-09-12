# 🧹 Universal Emoji Cleaner

**เครื่องมือลบอิโมจิสากลสำหรับโปรเจ็กต์ JavaScript, TypeScript และ HTML**

[![npm version](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner.svg)](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

เครื่องมือที่ช่วยทำความสะอาดอิโมจิในโค้ดอย่างรวดเร็วและปลอดภัย เหมาะสำหรับการเตรียมโค้ดเพื่อขึ้น production หรือการทำ code review

## 🎯 ทำไมต้องใช้?

- **🚀 เพิ่มความเป็นมืออาชีพ**: โค้ดที่ไม่มีอิโมจิดูเป็นมืออาชีพมากกว่า
- **📦 ลดขนาดไฟล์**: ประหยัดเนื้อที่และ bandwidth
- **🔍 ผ่าน Code Review**: หลายบริษัทไม่อนุญาตให้ใช้อิโมจิในโค้ด
- **⚡ รองรับหลายภาษา**: JS, TS, JSX, TSX, HTML
- **🛡️ ปลอดภัย**: มี dry-run mode และ backup

## ✨ คุณสมบัติ

- 🎯 **สแกนและลบอิโมจิอัตโนมัติ** จากไฟล์ JS, TS, JSX, TSX, HTML
- 🔍 **Dry-run mode** ดูตัวอย่างก่อนลบจริง
- 💾 **สำรองไฟล์อัตโนมัติ** ป้องกันการสูญหาย
- 🌍 **ใช้งานได้ทุกที่** ไม่ต้องอยู่ในโปรเจ็กต์เดียวกัน
- ⚡ **ประมวลผลเร็ว** รองรับโฟลเดอร์ขนาดใหญ่
- 🛡️ **ข้ามโฟลเดอร์ระบบ** (node_modules, .git, dist, build)
- 📚 **ใช้เป็น Library** สำหรับโปรเจ็กต์ Node.js
- 🗨️ **ลบคอมเมนต์อิโมจิ** คอมเมนต์ที่มีแต่อิโมจิ

## 📦 การติดตั้ง

### ใช้งานครั้งเดียว (แนะนำ)
```bash
npx @chahuadev/emoji-cleaner
```

### ติดตั้งแบบ Global
```bash
npm install -g @chahuadev/emoji-cleaner
```

### ติดตั้งในโปรเจ็กต์
```bash
npm install @chahuadev/emoji-cleaner --save-dev
```

## 🚀 วิธีใช้งานในโปรเจ็กต์

### 1. ใช้งานพื้นฐาน

```bash
# ดูตัวอย่างก่อน (แนะนำ)
npx @chahuadev/emoji-cleaner . --dry-run

# ลบอิโมจิจริง
npx @chahuadev/emoji-cleaner .

# ลบพร้อมสำรองไฟล์
npx @chahuadev/emoji-cleaner . --backup
```

### 2. ใช้กับโฟลเดอร์เฉพาะ

```bash
# ลบอิโมจิในโฟลเดอร์ src
npx @chahuadev/emoji-cleaner ./src

# ลบอิโมจิในไฟล์เดียว
npx @chahuadev/emoji-cleaner ./components/App.jsx
```

### 3. ปรับแต่งการทำงาน

```bash
# เลือกประเภทไฟล์
npx @chahuadev/emoji-cleaner . -e js,ts,html

# ข้ามโฟลเดอร์เฉพาะ
npx @chahuadev/emoji-cleaner . -x node_modules,dist,build

# แสดงรายละเอียด
npx @chahuadev/emoji-cleaner . --verbose
```

## 🔧 ตัวอย่างการใช้งานจริง

### สำหรับโปรเจ็กต์ React
```bash
# ตรวจสอบก่อน
npx @chahuadev/emoji-cleaner ./src --dry-run --verbose

# ลบอิโมจิจริง
npx @chahuadev/emoji-cleaner ./src --backup
```

### สำหรับโปรเจ็กต์ Node.js
```bash
# ลบอิโมจิทั้งโปรเจ็กต์
npx @chahuadev/emoji-cleaner . --backup --verbose
```

### สำหรับโปรเจ็กต์ TypeScript
```bash
# ลบเฉพาะไฟล์ TS
npx @chahuadev/emoji-cleaner . -e ts,tsx --dry-run
```

## ⚙️ ตัวเลือกคำสั่งทั้งหมด

| ตัวเลือก | คำอธิบาย | ตัวอย่าง |
|---------|----------|----------|
| `target` | เส้นทางไฟล์หรือโฟลเดอร์ | `./src` |
| `-d, --dry-run` | ดูตัวอย่างโดยไม่แก้ไขจริง | `--dry-run` |
| `-v, --verbose` | แสดงรายละเอียดขณะประมวลผล | `--verbose` |
| `-b, --backup` | สร้างไฟล์สำรองก่อนแก้ไข | `--backup` |
| `-e, --extensions` | ระบุประเภทไฟล์ | `-e js,ts,html` |
| `-x, --exclude` | ข้ามโฟลเดอร์เฉพาะ | `-x node_modules,dist` |
| `-h, --help` | แสดงคำแนะนำ | `--help` |
| `--version` | แสดงเวอร์ชัน | `--version` |

## 📋 ตัวอย่างผลลัพธ์

```
🔧 Processing directory: ./src
🔍 Dry-run mode: previewing changes...
📁 Extensions: .js, .ts, .jsx, .tsx, .html
🚫 Excluding: node_modules, .git, dist, build

🔍 components/Header.jsx
   15 emojis, 2 comments

🔍 pages/Home.tsx  
   8 emojis, 0 comments

📊 Summary:
   📁 Files processed: 25
   🔄 Files with changes: 2
   🧹 Total emojis removed: 23
   💬 Total comments cleaned: 2
   ⏱️  Processing time: 0.05s

🔍 Dry-run completed. Use without --dry-run to apply changes.
```

## 🛠️ การใช้งานใน package.json

เพิ่ม scripts ใน `package.json` เพื่อใช้งานสะดวก:

```json
{
  "scripts": {
    "clean:emojis": "emoji-cleaner . --dry-run",
    "clean:emojis:apply": "emoji-cleaner . --backup",
    "clean:src": "emoji-cleaner ./src --verbose",
    "prebuild": "emoji-cleaner ./src",
    "postinstall": "emoji-cleaner . --dry-run"
  }
}
```

แล้วใช้งานผ่าน npm:
```bash
npm run clean:emojis        # ดูตัวอย่าง
npm run clean:emojis:apply  # ลบจริงพร้อมสำรอง
npm run clean:src           # ลบใน src พร้อมรายละเอียด
```

## 📚 การใช้งานเป็น Library

สำหรับการพัฒนา Node.js application:

```javascript
const { 
  removeEmojis, 
  processFile, 
  processDirectory 
} = require('@chahuadev/emoji-cleaner');

// ลบอิโมจิจากข้อความ
const result = removeEmojis('Hello 😊 World! 🎉');
console.log(result.text); // "Hello  World! "
console.log(result.emojiCount); // 2

// ประมวลผลไฟล์เดียว
const fileResult = processFile('./App.js', {
  dryRun: true,
  createBackup: false
});

// ประมวลผลทั้งโฟลเดอร์
const dirResult = processDirectory('./src', {
  dryRun: false,
  extensions: ['.js', '.ts', '.jsx', '.tsx'],
  createBackup: true
});
```

## 🔄 การใช้งานกับ Git

### ตรวจสอบก่อน commit
```bash
# เช็คอิโมจิในไฟล์ที่เปลี่ยนแปลง
git diff --name-only | xargs npx @chahuadev/emoji-cleaner --dry-run
```

### Pre-commit Hook
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "npx @chahuadev/emoji-cleaner . --dry-run"
    }
  }
}
```

### การกู้คืนหากผิดพลาด
```bash
# กู้คืนไฟล์ทั้งหมด
git restore .

# กู้คืนไฟล์เฉพาะ
git restore src/App.js

# หรือใช้ backup ที่สร้างไว้
cp emoji-backup-2025-09-12T10-30-00/* ./src/
```

## 📁 ไฟล์ที่รองรับ

- 📄 **JavaScript** (.js) - รองรับ ES5, ES6+, CommonJS, ESM
- 📄 **TypeScript** (.ts) - รองรับทุกเวอร์ชัน
- 📄 **React JSX** (.jsx) - รองรับ React 16+
- 📄 **React TypeScript** (.tsx) - รองรับ React + TypeScript
- 📄 **HTML** (.html) - รองรับ HTML5, Web Components

## 🛡️ ความปลอดภัย

- **✅ Dry-run mode**: ตรวจสอบผลลัพธ์ก่อนลบจริง
- **✅ Auto backup**: สำรองไฟล์อัตโนมัติ (เมื่อใช้ --backup)
- **✅ Smart skipping**: ข้ามโฟลเดอร์ระบบอัตโนมัติ
- **✅ Error handling**: จัดการข้อผิดพลาดอย่างปลอดภัย
- **✅ Non-destructive**: ไม่แก้ไข logic หรือ structure ของโค้ด

## 🎯 Use Cases ที่เหมาะสม

- **Pre-production cleanup**: ทำความสะอาดก่อนขึ้น production
- **Code review preparation**: เตรียมโค้ดสำหรับการรีวิว
- **CI/CD pipeline**: รวมเข้ากับ build process
- **Team collaboration**: รักษามาตรฐานการเขียนโค้ดในทีม
- **Legacy code migration**: ทำความสะอาดโปรเจ็กต์เก่า

## 🚨 ข้อควรระวัง

1. **สำรองไฟล์เสมอ**: ใช้ `--backup` หรือ commit ใน git ก่อน
2. **ทดสอบก่อน**: ใช้ `--dry-run` เพื่อดูผลลัพธ์ก่อน
3. **ตรวจสอบหลังใช้**: รันเทสต์เพื่อมั่นใจว่าโค้ดยังทำงานได้
4. **อิโมจิใน string**: อิโมจิที่อยู่ในข้อความ (string) ก็จะถูกลบ

## 🤝 การสนับสนุน

- 🐛 **Report bugs**: [GitHub Issues](https://github.com/chahuadev/emoji-cleaner/issues)
- 💡 **Feature requests**: [GitHub Discussions](https://github.com/chahuadev/emoji-cleaner/discussions)
- 📧 **Contact**: contact@chahuadev.com

## 📄 License

MIT License - ดู [LICENSE](LICENSE) สำหรับรายละเอียด

---

**Made with ❤️ by [Chahuadev](https://github.com/chahuadev)**

*ทดสอบแล้วกับโปรเจ็กต์จริง - ลบอิโมจิได้มากกว่า 1,880 ตัวใน 0.08 วินาที!*
emoji-cleaner --verbose
```

### ตัวอย่างการใช้งานจริง

```bash
# สแกนโปรเจ็กต์ React
emoji-cleaner /Users/john/my-react-app --dry-run

# ลบอิโมจิในโฟลเดอร์ src พร้อมสำรอง
emoji-cleaner ./src --backup --verbose

# ประมวลผลเฉพาะไฟล์ JavaScript และ HTML
emoji-cleaner --ext .js,.html

# ลบอิโมจิในไฟล์เดียว
emoji-cleaner ./components/Header.jsx
```

## ⚙️ ตัวเลือกคำสั่ง

| ตัวเลือก | คำอธิบาย |
|---------|----------|
| `target` | เส้นทางไฟล์หรือโฟลเดอร์ (default: โฟลเดอร์ปัจจุบัน) |
| `-d, --dry-run` | ดูตัวอย่างการเปลี่ยนแปลงโดยไม่แก้ไขไฟล์จริง |
| `-v, --verbose` | แสดงรายละเอียดขณะประมวลผล |
| `-b, --backup` | สร้างไฟล์สำรองก่อนทำการแก้ไข |
| `-h, --help` | แสดงคำแนะนำการใช้งาน |
| `--ext <extensions>` | ระบุประเภทไฟล์ (default: .js,.ts,.jsx,.tsx,.html) |

## 📁 ไฟล์ที่รองรับ

- 📄 **JavaScript** (.js)
- 📄 **TypeScript** (.ts)
- 📄 **React JSX** (.jsx)
- 📄 **React TypeScript** (.tsx)
- 📄 **HTML** (.html)

## 🛡️ ความปลอดภัย

- **Dry-run mode**: ตรวจสอบผลลัพธ์ก่อนลบจริง
- **Auto backup**: สำรองไฟล์อัตโนมัติ (เมื่อใช้ --backup)
- **Smart skipping**: ข้ามโฟลเดอร์ระบบอัตโนมัติ
- **Error handling**: จัดการข้อผิดพลาดอย่างปลอดภัย

## 📊 ตัวอย่างผลลัพธ์

```
🧹 Universal Emoji Cleaner v2.0
================================
🔍 DRY RUN MODE - No files will be modified
🎯 Target: /Users/john/my-project
📁 Extensions: .js, .ts, .jsx, .tsx, .html

🔍 Analyzing: src/components/Header.jsx
📋 Header.jsx: 15 emojis, 2 comments

🔍 Analyzing: src/pages/Home.tsx  
📋 Home.tsx: 8 emojis, 0 comments

================================
🔍 Analysis Complete!
📊 Files with emojis: 2
🔧 Total emojis found: 23
💬 Comments with emojis: 2

💡 Use without --dry-run to apply changes
⏱️ Time taken: 0.12s
```

## � การใช้งานเป็น Library

สามารถนำ `@chahuadev/emoji-cleaner` มาใช้เป็น library ในโปรเจ็กต์ Node.js ได้

### ติดตั้งเป็น dependency

```bash
npm install @chahuadev/emoji-cleaner
```

### การใช้งานพื้นฐาน

```javascript
const { 
  removeEmojis, 
  removeEmojiComments, 
  processFile, 
  processDirectory 
} = require('@chahuadev/emoji-cleaner');

// ลบอิโมจิจากข้อความ
const result = removeEmojis('Hello 😊 World! 🎉');
console.log(result);
// {
//   text: 'Hello  World! ',
//   emojiCount: 2,
//   changed: true,
//   originalLength: 19,
//   newLength: 15
// }

// ประมวลผลไฟล์เดียว
const fileResult = processFile('./src/App.js', {
  dryRun: true,
  createBackup: false
});
console.log(fileResult);

// ประมวลผลทั้งโฟลเดอร์
const dirResult = processDirectory('./src', {
  dryRun: true,
  extensions: ['.js', '.ts', '.jsx', '.tsx'],
  createBackup: true,
  excludeDirs: ['node_modules', '.git']
});
console.log(dirResult);
```

### ตัวอย่างการใช้งานขั้นสูง

```javascript
const emojiCleaner = require('@chahuadev/emoji-cleaner');

// สร้างฟังก์ชันแบบ async
async function cleanProject() {
  try {
    // ทดสอบก่อนด้วย dry-run
    const preview = emojiCleaner.processDirectory('./src', {
      dryRun: true,
      verbose: true
    });
    
    console.log(`Found ${preview.totalEmojis} emojis in ${preview.filesWithChanges} files`);
    
    // ถ้าผลลัพธ์ดูโอเค ก็ทำจริง
    if (preview.totalEmojis > 0) {
      const result = emojiCleaner.processDirectory('./src', {
        dryRun: false,
        createBackup: true
      });
      
      console.log(`✅ Cleaned ${result.totalEmojis} emojis successfully!`);
      console.log(`💾 Backup created at: ${result.backupDir}`);
    }
  } catch (error) {
    console.error('Error cleaning project:', error.message);
  }
}

cleanProject();
```

### ใช้งานใน Build Scripts

```javascript
// build.js
const { processDirectory } = require('@chahuadev/emoji-cleaner');

async function buildProject() {
  console.log('🧹 Cleaning emojis...');
  
  const result = processDirectory('./src', {
    dryRun: false,
    createBackup: true,
    extensions: ['.js', '.ts', '.jsx', '.tsx']
  });
  
  if (result.success) {
    console.log(`✅ Removed ${result.totalEmojis} emojis from ${result.filesWithChanges} files`);
  }
  
  // ต่อด้วย build process อื่นๆ
  console.log('🔨 Building project...');
  // ... your build logic
}

buildProject();
```

## 🔧 การใช้งานในสคริปต์

### package.json scripts

```json
{
  "scripts": {
    "clean:emojis": "emoji-cleaner --dry-run",
    "clean:emojis:apply": "emoji-cleaner --backup",
    "clean:src": "emoji-cleaner ./src --verbose",
    "prebuild": "emoji-cleaner ./src",
    "lint:emojis": "emoji-cleaner --dry-run || echo 'Found emojis in code!'"
  }
}
```

### Pre-commit Hook (Husky)

```json
{
  "husky": {
    "hooks": {
      "pre-commit": "emoji-cleaner --dry-run && echo 'No emojis found ✅'"
    }
  }
}
```

## 🌟 Use Cases

- **Pre-commit hooks**: ตรวจสอบอิโมจิก่อน commit
- **CI/CD pipelines**: ทำความสะอาดโค้ดอัตโนมัติ
- **Code review**: เตรียมโค้ดสำหรับการรีวิว
- **Production builds**: ลบอิโมจิก่อน deploy
- **Code migration**: ทำความสะอาดโปรเจ็กต์เก่า

## 🤝 การสนับสนุน

- 🐛 **Report bugs**: [GitHub Issues](https://github.com/chahuadev/emoji-cleaner/issues)
- 💡 **Feature requests**: [GitHub Discussions](https://github.com/chahuadev/emoji-cleaner/discussions)
- 📧 **Contact**: support@chahuadev.com

## 📄 License

MIT License - ดู [LICENSE](LICENSE) สำหรับรายละเอียด

---

Made with ❤️ by [Chahuadev](https://github.com/chahuadev)
