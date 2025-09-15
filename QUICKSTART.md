# 🚀 Quick Start Guide

เริ่มใช้งาน Universal Emoji Cleaner ใน 5 นาที!

## ⚡ การติดตั้งและใช้งานแบบเร็ว

### วิธีที่ 1: ใช้งานทันที (ไม่ต้องติดตั้ง)
```bash
# สแกนโปรเจ็กต์ปัจจุบัน
npx @chahuadev/emoji-cleaner --dry-run

# ลบอิโมจิพร้อมสำรอง
npx @chahuadev/emoji-cleaner --backup
```

### วิธีที่ 2: ติดตั้งแบบ Global
```bash
# ติดตั้ง
npm install -g @chahuadev/emoji-cleaner

# ใช้งาน
emoji-cleaner --dry-run
emoji-cleaner --backup
```

## 🎯 สถานการณ์การใช้งานทั่วไป

### 1. ตรวจสอบโปรเจ็กต์ใหม่
```bash
# ก่อนเริ่มทำงาน ตรวจสอบดูว่ามีอิโมจิหรือไม่
emoji-cleaner /path/to/new/project --dry-run --verbose
```

### 2. ทำความสะอาดก่อน Commit
```bash
# ลบอิโมจิก่อน push โค้ด
emoji-cleaner ./src --backup
git add .
git commit -m "Clean emojis from source code"
```

### 3. ตรวจสอบไฟล์เฉพาะ
```bash
# ตรวจสอบ component ที่เพิ่งแก้ไข
emoji-cleaner ./components/Header.jsx --dry-run
```

### 4. ทำความสะอาดโปรเจ็กต์ขนาดใหญ่
```bash
# ประมวลผลทั้งโปรเจ็กต์พร้อมแสดงรายละเอียด
emoji-cleaner --backup --verbose
```

## 🛡️ เคล็ดลับความปลอดภัย

### ✅ สิ่งที่ควรทำ
- 🔍 **ใช้ --dry-run เสมอ** ก่อนลบจริง
- 💾 **ใช้ --backup** เมื่อลบจริง
- 📊 **ตรวจสอบผลลัพธ์** ก่อนยืนยัน
- 🔄 **ทดสอบใน branch แยก** สำหรับโปรเจ็กต์สำคัญ

### ❌ สิ่งที่ไม่ควรทำ
- 🚫 **ไม่ลบโดยไม่มีสำรอง** ในโปรเจ็กต์สำคัญ
- 🚫 **ไม่ข้าม dry-run** ในครั้งแรก
- 🚫 **ไม่รันในโฟลเดอร์ระบบ** (.git, node_modules)

## 📋 Checklist สำหรับการใช้งาน

### ก่อนเริ่มใช้งาน
- [ ] ตรวจสอบ Node.js version ≥ 12.0.0
- [ ] สำรองโปรเจ็กต์ (git commit หรือ backup)
- [ ] ทดสอบในโฟลเดอร์เล็กก่อน

### ขั้นตอนการใช้งาน
1. [ ] รัน `--dry-run` ก่อนเสมอ
2. [ ] ตรวจสอบผลลัพธ์และจำนวนไฟล์
3. [ ] รันจริงพร้อม `--backup`
4. [ ] ตรวจสอบไฟล์หลังประมวลผล
5. [ ] ทดสอบแอปพลิเคชันทำงานปกติ

## 🔧 การตั้งค่าใน package.json

เพิ่ม scripts เหล่านี้ใน package.json ของโปรเจ็กต์:

```json
{
  "scripts": {
    "clean:check": "npx @chahuadev/emoji-cleaner --dry-run --verbose",
    "clean:src": "npx @chahuadev/emoji-cleaner ./src --dry-run",
    "clean:apply": "npx @chahuadev/emoji-cleaner --backup",
    "clean:components": "npx @chahuadev/emoji-cleaner ./src/components --backup"
  }
}
```

จากนั้นใช้งาน:
```bash
npm run clean:check    # ตรวจสอบ
npm run clean:apply    # ลบจริง
```

## 🚨 แก้ปัญหาเบื้องต้น

### ปัญหา: Command not found
```bash
# แก้ไข: ติดตั้ง global หรือใช้ npx
npm install -g @chahuadev/emoji-cleaner
# หรือ
npx @chahuadev/emoji-cleaner
```

### ปัญหา: Permission denied
```bash
# Linux/macOS: ใช้ sudo สำหรับ global install
sudo npm install -g @chahuadev/emoji-cleaner

# Windows: รัน CMD/PowerShell as Administrator
```

### ปัญหา: ไฟล์หาย
```bash
# แก้ไข: กู้คืนจาก backup folder
# หา folder ชื่อ emoji-backup-[timestamp]
```

## 💡 Tips และ Tricks

### ใช้งานร่วมกับ Git Hooks
```bash
# .git/hooks/pre-commit
#!/bin/sh
npx @chahuadev/emoji-cleaner --dry-run
```

### ใช้งานใน CI/CD
```yaml
# GitHub Actions
- name: Clean emojis
  run: npx @chahuadev/emoji-cleaner --dry-run
```

### ตรวจสอบไฟล์เฉพาะประเภท
```bash
# เฉพาะ JavaScript
emoji-cleaner --ext .js

# เฉพาะ React files
emoji-cleaner --ext .jsx,.tsx
```

---

🎉 **พร้อมแล้ว!** ตอนนี้คุณสามารถใช้งาน Universal Emoji Cleaner ได้อย่างมีประสิทธิภาพและปลอดภัย
