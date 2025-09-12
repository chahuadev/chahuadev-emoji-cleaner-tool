/**
 * @fileoverview Universal Emoji Cleaner - Main Module
 * @author Chahuadev
 * @version 2.1.0
 * 
 * Main entry point for npm package
 * สำหรับใช้เป็น library ในโปรเจ็กต์อื่นๆ
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
 * ตรวจสอบและลบอิโมจิจากข้อความ
 * @param {string} text - ข้อความที่ต้องการลบอิโมจิ
 * @returns {Object} ผลลัพธ์การลบอิโมจิ
 */
function removeEmojis(text) {
    if (typeof text !== 'string') {
        throw new Error('Input must be a string');
    }

    let cleanText = text;
    let emojiCount = 0;

    // นับและลบอิโมจิ
    EMOJI_PATTERNS.forEach(pattern => {
        const matches = cleanText.match(pattern);
        if (matches) {
            emojiCount += matches.length;
            cleanText = cleanText.replace(pattern, '');
        }
    });

    return {
        text: cleanText,
        emojiCount,
        changed: emojiCount > 0,
        originalLength: text.length,
        newLength: cleanText.length
    };
}

/**
 * ลบบล็อกคอมเมนต์ที่มีแต่อิโมจิ
 * @param {string} content - เนื้อหาไฟล์
 * @param {string} fileExt - นามสกุลไฟล์
 * @returns {Object} ผลลัพธ์การลบคอมเมนต์
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

    return {
        content: cleanContent,
        commentCount
    };
}

/**
 * วิเคราะห์และประมวลผลไฟล์
 * @param {string} filePath - path ไฟล์
 * @param {Object} options - ตัวเลือกการประมวลผล
 * @returns {Object} ผลลัพธ์การประมวลผล
 */
function processFile(filePath, options = {}) {
    const {
        dryRun = false,
        createBackup = false,
        backupDir = null
    } = options;

    try {
        if (!fs.existsSync(filePath)) {
            throw new Error(`File not found: ${filePath}`);
        }

        const content = fs.readFileSync(filePath, 'utf8');
        const fileExt = path.extname(filePath).toLowerCase();

        // ลบอิโมจิ
        const emojiResult = removeEmojis(content);

        // ลบคอมเมนต์ที่มีอิโมจิ
        const commentResult = removeEmojiComments(emojiResult.text, fileExt);

        const totalChanges = emojiResult.emojiCount + commentResult.commentCount;
        const finalContent = commentResult.content;

        // สำรองและบันทึกไฟล์ (ถ้าไม่ใช่ dry-run)
        if (!dryRun && totalChanges > 0) {
            // สำรองไฟล์ถ้าต้องการ
            if (createBackup && backupDir) {
                const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
                const backupFilePath = path.join(backupDir, `${path.basename(filePath)}.${timestamp}.bak`);

                if (!fs.existsSync(backupDir)) {
                    fs.mkdirSync(backupDir, { recursive: true });
                }

                fs.copyFileSync(filePath, backupFilePath);
            }

            fs.writeFileSync(filePath, finalContent, 'utf8');
        }

        return {
            success: true,
            filePath,
            emojiCount: emojiResult.emojiCount,
            commentCount: commentResult.commentCount,
            totalChanges,
            changed: totalChanges > 0,
            originalSize: content.length,
            newSize: finalContent.length
        };

    } catch (error) {
        return {
            success: false,
            filePath,
            error: error.message,
            emojiCount: 0,
            commentCount: 0,
            totalChanges: 0,
            changed: false
        };
    }
}

/**
 * ประมวลผลไฟล์หลายไฟล์ในโฟลเดอร์
 * @param {string} dirPath - path โฟลเดอร์
 * @param {Object} options - ตัวเลือกการประมวลผล
 * @returns {Object} สถิติการประมวลผล
 */
function processDirectory(dirPath, options = {}) {
    const {
        dryRun = false,
        extensions = ['.js', '.ts', '.jsx', '.tsx', '.html'],
        createBackup = false,
        excludeDirs = ['node_modules', '.git', 'dist', 'build', 'coverage']
    } = options;

    const startTime = Date.now();
    const results = [];
    let totalFiles = 0;
    let filesWithChanges = 0;
    let totalEmojis = 0;
    let totalComments = 0;
    let errors = 0;

    // สร้างโฟลเดอร์สำรองถ้าต้องการ
    let backupDir = null;
    if (createBackup && !dryRun) {
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
        backupDir = path.join(path.dirname(dirPath), `emoji-backup-${timestamp}`);
    }

    function walkDir(dir) {
        try {
            const items = fs.readdirSync(dir);

            for (const item of items) {
                const itemPath = path.join(dir, item);

                try {
                    const stat = fs.statSync(itemPath);

                    if (stat.isDirectory()) {
                        // ข้าม excluded directories
                        if (excludeDirs.includes(item) || item.startsWith('emoji-backup-')) {
                            continue;
                        }
                        walkDir(itemPath);
                    } else if (stat.isFile()) {
                        const fileExt = path.extname(itemPath).toLowerCase();
                        if (extensions.includes(fileExt)) {
                            totalFiles++;
                            const result = processFile(itemPath, {
                                dryRun,
                                createBackup,
                                backupDir
                            });

                            results.push(result);

                            if (result.success) {
                                if (result.changed) {
                                    filesWithChanges++;
                                }
                                totalEmojis += result.emojiCount;
                                totalComments += result.commentCount;
                            } else {
                                errors++;
                            }
                        }
                    }
                } catch (error) {
                    errors++;
                }
            }
        } catch (error) {
            errors++;
        }
    }

    if (!fs.existsSync(dirPath)) {
        throw new Error(`Directory not found: ${dirPath}`);
    }

    walkDir(dirPath);

    const endTime = Date.now();
    const duration = ((endTime - startTime) / 1000).toFixed(2);

    return {
        success: true,
        totalFiles,
        filesWithChanges,
        totalEmojis,
        totalComments,
        errors,
        duration: parseFloat(duration),
        results,
        backupDir
    };
}

// Export functions for use as library
module.exports = {
    removeEmojis,
    removeEmojiComments,
    processFile,
    processDirectory,
    EMOJI_PATTERNS
};