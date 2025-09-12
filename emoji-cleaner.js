#!/usr/bin/env node

/**
 * @fileoverview Universal Emoji Cleaner Tool
 * @author Chahuadev
 * @version 2.0.0
 * 
 * ตัวลบอิโมจิสากล สำหรับโปรเจ็กต์ JavaScript, TypeScript และ HTML
 * ใช้งานได้กับโปรเจ็กต์ไหนก็ได้โดยไม่จำเป็นต้องอยู่ในโฟลเดอร์เดียวกัน
 */

const fs = require('fs');
const path = require('path');

// Enhanced emoji patterns รองรับ Unicode 15.0
const EMOJI_PATTERNS = [
    // Emoticons and Symbols
    /[\u{1F600}-\u{1F64F}]/gu,  // Emoticons
    /[\u{1F300}-\u{1F5FF}]/gu,  // Misc Symbols and Pictographs  
    /[\u{1F680}-\u{1F6FF}]/gu,  // Transport and Map Symbols
    /[\u{1F700}-\u{1F77F}]/gu,  // Alchemical Symbols
    /[\u{1F780}-\u{1F7FF}]/gu,  // Geometric Shapes Extended
    /[\u{1F800}-\u{1F8FF}]/gu,  // Supplemental Arrows-C
    /[\u{1F900}-\u{1F9FF}]/gu,  // Supplemental Symbols and Pictographs
    /[\u{1FA00}-\u{1FA6F}]/gu,  // Chess Symbols
    /[\u{1FA70}-\u{1FAFF}]/gu,  // Symbols and Pictographs Extended-A
    /[\u{2600}-\u{26FF}]/gu,    // Misc symbols
    /[\u{2700}-\u{27BF}]/gu,    // Dingbats
    /[\u{1F1E0}-\u{1F1FF}]/gu,  // Regional indicators (flags)
    /[\u{1F100}-\u{1F1FF}]/gu,  // Enclosed characters
    /[\u{2B00}-\u{2BFF}]/gu,    // Miscellaneous Symbols and Arrows
    /[\u{3030}]/gu,             // Wavy dash
    /[\u{303D}]/gu,             // Part alternation mark
    /[\u{3297}]/gu,             // Japanese symbol
    /[\u{3299}]/gu,             // Japanese symbol
    /[\u{FE00}-\u{FE0F}]/gu,    // Variation selectors
    /[\u{200D}]/gu,             // Zero-width joiner
    /[\u{20E3}]/gu,             // Combining enclosing keycap
];

/**
 * ตรวจสอบและสร้างโฟลเดอร์สำรอง
 */
function createBackupDir(targetPath) {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
    const backupDir = path.join(path.dirname(targetPath), `emoji-backup-${timestamp}`);
    
    if (!fs.existsSync(backupDir)) {
        fs.mkdirSync(backupDir, { recursive: true });
    }
    return backupDir;
}

/**
 * คัดลอกไฟล์ไปยังโฟลเดอร์สำรอง
 */
function backupFile(filePath, backupDir, originalRoot) {
    try {
        const relativePath = path.relative(originalRoot, filePath);
        const backupFilePath = path.join(backupDir, relativePath);
        const backupFileDir = path.dirname(backupFilePath);
        
        // สร้างโฟลเดอร์สำรองถ้าไม่มี
        if (!fs.existsSync(backupFileDir)) {
            fs.mkdirSync(backupFileDir, { recursive: true });
        }
        
        fs.copyFileSync(filePath, backupFilePath);
        return backupFilePath;
    } catch (error) {
        console.warn(`⚠️ Cannot backup ${filePath}: ${error.message}`);
        return null;
    }
}

/**
 * ตรวจสอบและลบอิโมจิจากเนื้อหาไฟล์
 */
function removeEmojis(content) {
    let cleanContent = content;
    let emojiCount = 0;
    
    // นับและลบอิโมจิ
    EMOJI_PATTERNS.forEach(pattern => {
        const matches = cleanContent.match(pattern);
        if (matches) {
            emojiCount += matches.length;
            cleanContent = cleanContent.replace(pattern, '');
        }
    });
    
    return { 
        content: cleanContent, 
        emojiCount,
        changed: emojiCount > 0 
    };
}

/**
 * ลบบล็อกคอมเมนต์ที่มีแต่อิโมจิ
 */
function removeEmojiComments(content, fileExt) {
    let commentCount = 0;
    let cleanContent = content;
    
    if (['.js', '.ts', '.jsx', '.tsx'].includes(fileExt)) {
        // ลบ single-line comments ที่มีแต่อิโมจิ
        const singleLinePattern = /\/\/\s*[\u{1F000}-\u{1FAFF}\u{2600}-\u{27BF}\u{1F100}-\u{1F1FF}\u{2B00}-\u{2BFF}\s]*$/gmu;
        const singleMatches = cleanContent.match(singleLinePattern);
        if (singleMatches) {
            commentCount += singleMatches.length;
            cleanContent = cleanContent.replace(singleLinePattern, '');
        }
        
        // ลบ multi-line comments ที่มีแต่อิโมจิ
        const multiLinePattern = /\/\*[\s\u{1F000}-\u{1FAFF}\u{2600}-\u{27BF}\u{1F100}-\u{1F1FF}\u{2B00}-\u{2BFF}]*\*\//gmu;
        const multiMatches = cleanContent.match(multiLinePattern);
        if (multiMatches) {
            commentCount += multiMatches.length;
            cleanContent = cleanContent.replace(multiLinePattern, '');
        }
    } else if (fileExt === '.html') {
        // ลบ HTML comments ที่มีแต่อิโมจิ
        const htmlCommentPattern = /<!--[\s\u{1F000}-\u{1FAFF}\u{2600}-\u{27BF}\u{1F100}-\u{1F1FF}\u{2B00}-\u{2BFF}]*-->/gmu;
        const htmlMatches = cleanContent.match(htmlCommentPattern);
        if (htmlMatches) {
            commentCount += htmlMatches.length;
            cleanContent = cleanContent.replace(htmlCommentPattern, '');
        }
    }
    
    return { content: cleanContent, commentCount };
}

/**
 * วิเคราะห์และประมวลผลไฟล์
 */
function analyzeFile(filePath, isDryRun = false, verbose = false, createBackup = false, backupDir = null, originalRoot = null) {
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        const fileExt = path.extname(filePath).toLowerCase();
        
        // ลบอิโมจิ
        const emojiResult = removeEmojis(content);
        
        // ลบคอมเมนต์ที่มีอิโมจิ
        const commentResult = removeEmojiComments(emojiResult.content, fileExt);
        
        const totalChanges = emojiResult.emojiCount + commentResult.commentCount;
        const finalContent = commentResult.content;
        
        if (verbose || totalChanges > 0) {
            const fileName = path.basename(filePath);
            if (isDryRun) {
                console.log(`🔍 Analyzing: ${path.relative(process.cwd(), filePath)}`);
                if (totalChanges > 0) {
                    console.log(`📋 ${fileName}: ${emojiResult.emojiCount} emojis, ${commentResult.commentCount} comments`);
                    if (verbose) {
                        console.log(`   Emojis: ${emojiResult.emojiCount}`);
                        console.log(`   Comments: ${commentResult.commentCount}`);
                    }
                } else {
                    console.log(`✨ No emojis found in ${fileName}`);
                }
            } else {
                console.log(`🔧 Processing: ${path.relative(process.cwd(), filePath)}`);
                console.log(`✅ ${fileName}: ${emojiResult.emojiCount} emojis, ${commentResult.commentCount} comments`);
            }
        }
        
        // บันทึกการเปลี่ยนแปลง (ถ้าไม่ใช่ dry-run)
        if (!isDryRun && totalChanges > 0) {
            // สำรองไฟล์ถ้าต้องการ
            if (createBackup && backupDir && originalRoot) {
                backupFile(filePath, backupDir, originalRoot);
            }
            
            fs.writeFileSync(filePath, finalContent, 'utf8');
        }
        
        return {
            processed: true,
            emojiCount: emojiResult.emojiCount,
            commentCount: commentResult.commentCount,
            changed: totalChanges > 0
        };
        
    } catch (error) {
        console.error(`❌ Error analyzing ${filePath}: ${error.message}`);
        return {
            processed: false,
            emojiCount: 0,
            commentCount: 0,
            changed: false,
            error: error.message
        };
    }
}

/**
 * ประมวลผลโฟลเดอร์
 */
function processDirectory(dirPath, isDryRun = false, verbose = false, extensions = ['.js', '.ts', '.jsx', '.tsx', '.html'], createBackup = false) {
    const startTime = Date.now();
    let totalFiles = 0;
    let filesWithEmojis = 0;
    let totalEmojis = 0;
    let totalComments = 0;
    let errors = 0;
    
    // สร้างโฟลเดอร์สำรองถ้าต้องการ
    let backupDir = null;
    if (createBackup && !isDryRun) {
        backupDir = createBackupDir(dirPath);
        console.log(`💾 Backup directory: ${backupDir}`);
    }
    
    function walkDir(dir) {
        try {
            const items = fs.readdirSync(dir);
            
            for (const item of items) {
                const itemPath = path.join(dir, item);
                
                try {
                    const stat = fs.statSync(itemPath);
                    
                    if (stat.isDirectory()) {
                        // ข้าม backup folders
                        if (item.startsWith('backup-') || item.startsWith('emoji-backup-') || 
                            item === 'node_modules' || item === '.git' || item === 'dist' || item === 'build') {
                            if (verbose) {
                                console.log(`⏭️ Skipping: ${path.relative(process.cwd(), itemPath)}`);
                            }
                            continue;
                        }
                        walkDir(itemPath);
                    } else if (stat.isFile()) {
                        const fileExt = path.extname(itemPath).toLowerCase();
                        if (extensions.includes(fileExt)) {
                            totalFiles++;
                            const result = analyzeFile(itemPath, isDryRun, verbose, createBackup, backupDir, dirPath);
                            
                            if (result.processed) {
                                if (result.changed) {
                                    filesWithEmojis++;
                                }
                                totalEmojis += result.emojiCount;
                                totalComments += result.commentCount;
                            } else {
                                errors++;
                            }
                        }
                    }
                } catch (error) {
                    if (verbose) {
                        console.warn(`⚠️ Cannot access ${itemPath}: ${error.message}`);
                    }
                    errors++;
                }
            }
        } catch (error) {
            console.error(`❌ Cannot read directory ${dir}: ${error.message}`);
            errors++;
        }
    }
    
    walkDir(dirPath);
    
    const endTime = Date.now();
    const duration = ((endTime - startTime) / 1000).toFixed(2);
    
    return {
        totalFiles,
        filesWithEmojis,
        totalEmojis,
        totalComments,
        errors,
        duration,
        backupDir
    };
}

/**
 * แสดงข้อมูลการใช้งาน
 */
function showHelp() {
    console.log(`
📖 Universal Emoji Cleaner v2.0 - Usage Guide

SYNTAX:
  emoji-cleaner [target] [options]
  npx @chahuadev/emoji-cleaner [target] [options]

ARGUMENTS:
  target                Path to file or directory (default: current directory)

OPTIONS:
  -d, --dry-run        Preview changes without modifying files
  -v, --verbose        Show detailed information during processing
  -b, --backup         Create backup before making changes
  -h, --help           Show this help message
  --ext <extensions>   Specify file extensions (default: .js,.ts,.jsx,.tsx,.html)

EXAMPLES:
  emoji-cleaner                                    # Clean current directory
  emoji-cleaner /path/to/project                   # Clean specific project
  emoji-cleaner ./src --dry-run                    # Preview changes only
  emoji-cleaner --verbose --backup                 # Clean with backup and details
  emoji-cleaner --ext .js,.html                    # Only process specific files
  emoji-cleaner /path/to/file.js                   # Clean single file

FEATURES:
  ✅ Unicode emoji detection and removal
  ✅ Comment block cleanup (JS/TS/HTML)
  ✅ Dry-run mode for safe preview
  ✅ Automatic backup creation
  ✅ Cross-platform compatibility
  ✅ Works with any project structure

SUPPORTED FILES:
  📄 .js   - JavaScript files
  📄 .ts   - TypeScript files  
  📄 .jsx  - React JSX files
  📄 .tsx  - React TypeScript files
  📄 .html - HTML files

GLOBAL INSTALLATION:
  npm install -g @chahuadev/emoji-cleaner
  emoji-cleaner --help

PROJECT-SPECIFIC USAGE:
  npx @chahuadev/emoji-cleaner ./my-project
    `);
}

/**
 * ฟังก์ชันหลัก
 */
function main() {
    const args = process.argv.slice(2);
    
    // ตรวจสอบ help
    if (args.includes('-h') || args.includes('--help')) {
        showHelp();
        return;
    }
    
    let targetPath = process.cwd();
    let isDryRun = false;
    let verbose = false;
    let createBackup = false;
    let extensions = ['.js', '.ts', '.jsx', '.tsx', '.html'];
    
    // วิเคราะห์ arguments
    for (let i = 0; i < args.length; i++) {
        const arg = args[i];
        
        if (arg === '-d' || arg === '--dry-run') {
            isDryRun = true;
        } else if (arg === '-v' || arg === '--verbose') {
            verbose = true;
        } else if (arg === '-b' || arg === '--backup') {
            createBackup = true;
        } else if (arg === '--ext') {
            if (i + 1 < args.length) {
                extensions = args[i + 1].split(',').map(ext => ext.trim());
                i++; // ข้าม argument ถัดไป
            }
        } else if (!arg.startsWith('-')) {
            // Path argument
            const inputPath = path.resolve(arg);
            if (fs.existsSync(inputPath)) {
                targetPath = inputPath;
            } else {
                console.error(`❌ Path not found: ${inputPath}`);
                process.exit(1);
            }
        }
    }
    
    console.log('🧹 Universal Emoji Cleaner v2.0');
    console.log('================================');
    if (isDryRun) {
        console.log('🔍 DRY RUN MODE - No files will be modified');
    }
    console.log(`🎯 Target: ${path.relative(process.cwd(), targetPath)}`);
    console.log(`📁 Extensions: ${extensions.join(', ')}`);
    
    if (createBackup && !isDryRun) {
        console.log('💾 Backup mode enabled');
    }
    
    console.log('');
    
    // ตรวจสอบว่าเป็นไฟล์หรือโฟลเดอร์
    const stat = fs.statSync(targetPath);
    
    if (stat.isFile()) {
        // ประมวลผลไฟล์เดียว
        const fileExt = path.extname(targetPath).toLowerCase();
        if (!extensions.includes(fileExt)) {
            console.error(`❌ File extension ${fileExt} not supported`);
            console.log(`Supported extensions: ${extensions.join(', ')}`);
            process.exit(1);
        }
        
        const result = analyzeFile(targetPath, isDryRun, verbose, createBackup);
        
        console.log('================================');
        if (isDryRun) {
            console.log('🔍 Analysis Complete!');
        } else {
            console.log('🎉 Cleaning Complete!');
        }
        console.log(`📊 Emojis ${isDryRun ? 'found' : 'removed'}: ${result.emojiCount}`);
        console.log(`💬 Comments ${isDryRun ? 'found' : 'removed'}: ${result.commentCount}`);
        
    } else {
        // ประมวลผลโฟลเดอร์
        const results = processDirectory(targetPath, isDryRun, verbose, extensions, createBackup);
        
        console.log('================================');
        if (isDryRun) {
            console.log('🔍 Analysis Complete!');
        } else {
            console.log('🎉 Cleaning Complete!');
        }
        console.log(`📊 Files ${isDryRun ? 'with emojis' : 'processed'}: ${results.filesWithEmojis}`);
        console.log(`🔧 Total emojis ${isDryRun ? 'found' : 'removed'}: ${results.totalEmojis}`);
        console.log(`💬 Comments ${isDryRun ? 'with emojis' : 'removed'}: ${results.totalComments}`);
        
        if (results.errors > 0) {
            console.log(`⚠️ Errors encountered: ${results.errors}`);
        }
        
        if (results.backupDir) {
            console.log(`💾 Backup saved to: ${path.relative(process.cwd(), results.backupDir)}`);
        }
        
        if (isDryRun) {
            console.log('💡 Use without --dry-run to apply changes');
        }
        console.log(`⏱️ Time taken: ${results.duration}s`);
    }
}

// เรียกใช้งานถ้าไม่ใช่การ import
if (require.main === module) {
    main();
}

module.exports = {
    removeEmojis,
    analyzeFile,
    processDirectory,
    main
};
