#!/usr/bin/env node

/**
 * @fileoverview Universal Emoji Cleaner - CLI Tool
 * @author Chahuadev
 * @version 2.2.3
 * 
 * Command Line Interface for Emoji Cleaner with Enhanced Security
 * ตัวลบอิโมจิสากล สำหรับใช้งานผ่าน Command Line พร้อมระบบความปลอดภัยขั้นสูง
 */

const fs = require('fs');
const path = require('path');

// เรียกใช้ฟังก์ชันจาก main file ที่มี security features
const emojiCleaner = require('../emoji-cleaner');

// ใช้ฟังก์ชันจาก main file แทน
const processFile = emojiCleaner.processFile || emojiCleaner.analyzeFile;
const processDirectory = emojiCleaner.processDirectory;

/**
 * แสดงข้อมูลการใช้งาน
 */
function showHelp() {
    console.log(`
📖 Universal Emoji Cleaner v2.2.3 - Usage Guide

SYNTAX:
  emoji-cleaner [target] [options]
  npx @chahuadev/emoji-cleaner [target] [options]

ARGUMENTS:
  target                Path to file or directory (default: current directory)

OPTIONS:
  -d, --dry-run        Preview changes without modifying files
  -v, --verbose        Show detailed information during processing
  -b, --backup         Create backup before making changes
  -e, --extensions     File extensions to process (default: js,ts,jsx,tsx,html)
  -x, --exclude        Directories to exclude (default: node_modules,.git,dist,build)
  -h, --help           Show this help message
  --version            Show version information

EXAMPLES:
  emoji-cleaner                          # Clean current directory
  emoji-cleaner ./src                    # Clean specific directory
  emoji-cleaner file.js                  # Clean specific file
  emoji-cleaner . --dry-run             # Preview changes
  emoji-cleaner . --backup              # Create backup before cleaning
  emoji-cleaner . -e js,ts,html         # Process only specific extensions
  emoji-cleaner . -x node_modules,dist  # Exclude specific directories

SUPPORTED FILES:
  ✅ JavaScript (.js, .jsx)
  ✅ TypeScript (.ts, .tsx) 
  ✅ HTML (.html)
  ✅ And more text-based files

FEATURES:
  🧹 Remove emojis from code and text
  🗨️  Remove emoji-only comments
  💾 Optional backup before changes
  🔍 Dry-run mode for preview
  📊 Detailed statistics and reporting
  🚀 Fast processing of large codebases

For more information, visit: https://github.com/chahuadev/emoji-cleaner
`);
}

/**
 * แสดงข้อมูลเวอร์ชัน
 */
function showVersion() {
    const packagePath = path.join(__dirname, '..', 'package.json');
    try {
        const packageInfo = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
        console.log(`🧹 Universal Emoji Cleaner v${packageInfo.version}`);
        console.log(`📦 npm package: ${packageInfo.name}`);
        console.log(`👨‍💻 Author: ${packageInfo.author.name}`);
        console.log(`🔗 Repository: ${packageInfo.repository.url}`);
    } catch (error) {
        console.log('🧹 Universal Emoji Cleaner v2.2.3');
    }
}

/**
 * Parse command line arguments
 */
function parseArguments(args) {
    const options = {
        target: process.cwd(),
        dryRun: false,
        verbose: false,
        backup: false,
        extensions: ['.js', '.ts', '.jsx', '.tsx', '.html'],
        excludeDirs: ['node_modules', '.git', 'dist', 'build', 'coverage'],
        help: false,
        version: false
    };

    for (let i = 0; i < args.length; i++) {
        const arg = args[i];

        if (arg === '-h' || arg === '--help') {
            options.help = true;
        } else if (arg === '--version') {
            options.version = true;
        } else if (arg === '-d' || arg === '--dry-run') {
            options.dryRun = true;
        } else if (arg === '-v' || arg === '--verbose') {
            options.verbose = true;
        } else if (arg === '-b' || arg === '--backup') {
            options.backup = true;
        } else if (arg === '-e' || arg === '--extensions') {
            if (i + 1 < args.length) {
                const exts = args[i + 1].split(',').map(ext => ext.trim().startsWith('.') ? ext.trim() : '.' + ext.trim());
                options.extensions = exts;
                i++;
            }
        } else if (arg === '-x' || arg === '--exclude') {
            if (i + 1 < args.length) {
                options.excludeDirs = args[i + 1].split(',').map(dir => dir.trim());
                i++;
            }
        } else if (!arg.startsWith('-')) {
            // This is the target path
            options.target = path.resolve(arg);
        }
    }

    return options;
}

/**
 * แสดงผลลัพธ์สำหรับไฟล์เดียว
 */
function displayFileResult(result, options) {
    const fileName = path.basename(result.filePath);
    const relativePath = path.relative(process.cwd(), result.filePath);

    if (result.success) {
        if (result.changed) {
            const icon = options.dryRun ? '🔍' : '✅';
            console.log(`${icon} ${relativePath}`);
            if (options.verbose) {
                console.log(`   📝 Emojis removed: ${result.emojiCount}`);
                console.log(`   💬 Comments cleaned: ${result.commentCount}`);
                console.log(`   📏 Size: ${result.originalSize} → ${result.newSize} bytes`);
            } else {
                console.log(`   ${result.emojiCount} emojis, ${result.commentCount} comments`);
            }
        } else if (options.verbose) {
            console.log(`✨ ${relativePath} - No emojis found`);
        }
    } else {
        console.log(`❌ ${relativePath} - Error: ${result.error}`);
    }
}

/**
 * แสดงสถิติรวม
 */
function displaySummary(stats, options) {
    console.log(`\n📊 Summary:`);
    console.log(`   📁 Files processed: ${stats.totalFiles}`);
    console.log(`   🔄 Files with changes: ${stats.filesWithChanges}`);
    console.log(`   🧹 Total emojis removed: ${stats.totalEmojis}`);
    console.log(`   💬 Total comments cleaned: ${stats.totalComments}`);
    console.log(`   ⏱️  Processing time: ${stats.duration}s`);

    if (stats.errors > 0) {
        console.log(`   ⚠️  Errors: ${stats.errors}`);
    }

    if (stats.backupDir) {
        console.log(`   💾 Backup directory: ${path.relative(process.cwd(), stats.backupDir)}`);
    }

    if (options.dryRun) {
        console.log(`\n🔍 Dry-run completed. Use without --dry-run to apply changes.`);
    } else if (stats.filesWithChanges > 0) {
        console.log(`\n✅ Cleaning completed successfully!`);
    } else {
        console.log(`\n✨ No emojis found in processed files.`);
    }
}

/**
 * Main CLI function with Security
 */
async function main() {
    const args = process.argv.slice(2);
    const options = parseArguments(args);

    // Show help or version
    if (options.help) {
        showHelp();
        return;
    }

    if (options.version) {
        showVersion();
        return;
    }

    console.log('🧹 Universal Emoji Cleaner v2.2.3');
    console.log('================================');
    
    if (options.dryRun) {
        console.log(' DRY RUN MODE - No files will be modified');
    }
    
    console.log(` Target: ${path.relative(process.cwd(), options.target) || '.'}`);
    console.log(` Extensions: ${options.extensions.join(', ')}`);

    try {
        const targetStats = fs.statSync(options.target);
        
        if (targetStats.isFile()) {
            // ใช้ analyzeFile จาก main emoji-cleaner.js ที่มี security
            if (typeof emojiCleaner.analyzeFile === 'function') {
                console.log(' Processing single file with security checks...');
                const result = emojiCleaner.analyzeFile(options.target, options.dryRun, options.verbose, options.backup);
                
                if (result.securityError) {
                    console.log('🚨 Security check failed!');
                    process.exit(1);
                }
                
                console.log('================================');
                if (options.dryRun) {
                    console.log(' Analysis Complete!');
                } else {
                    console.log(' Cleaning Complete!');
                }
                
                console.log(` Emojis ${options.dryRun ? 'found' : 'removed'}: ${result.emojiCount}`);
                console.log(` Comments ${options.dryRun ? 'found' : 'removed'}: ${result.commentCount}`);
                
            } else {
                console.error('🚨 Security functions not available!');
                process.exit(1);
            }
        } else if (targetStats.isDirectory()) {
            // ใช้ processDirectory จาก main emoji-cleaner.js ที่มี security  
            if (typeof emojiCleaner.processDirectory === 'function') {
                console.log(' Processing directory with security checks...');
                const result = emojiCleaner.processDirectory(options.target, options.dryRun, options.verbose, options.extensions, options.backup);
                
                if (result.securityError) {
                    console.log('🚨 Security check failed!');
                    process.exit(1);
                }
                
                console.log('================================');
                if (options.dryRun) {
                    console.log(' Analysis Complete!');
                } else {
                    console.log(' Cleaning Complete!');
                }
                
                console.log(` Files processed: ${result.totalFiles}`);
                console.log(` Files with emojis: ${result.filesWithEmojis}`);
                console.log(` Total emojis ${options.dryRun ? 'found' : 'removed'}: ${result.totalEmojis}`);
                console.log(` Comments ${options.dryRun ? 'found' : 'removed'}: ${result.totalComments}`);
                
                if (result.securityErrors > 0) {
                    console.log(` 🚨 Security errors: ${result.securityErrors}`);
                }
                
                if (result.errors > 0) {
                    console.log(` ⚠️ Other errors: ${result.errors - result.securityErrors}`);
                }
                
                console.log(` ⏱️ Time taken: ${result.duration}s`);
                
            } else {
                console.error('🚨 Security functions not available!');
                process.exit(1);
            }
        }
        
        if (options.dryRun) {
            console.log('\n💡 Use without --dry-run to apply changes');
        }
        
    } catch (error) {
        if (error.message.includes('ENOENT')) {
            console.error(`❌ Target not found: ${options.target}`);
        } else if (error.message.includes('Permission denied') || 
                   error.message.includes('system directories') ||
                   error.message.includes('Path traversal')) {
            console.error(`🚨 Security Error: ${error.message}`);
        } else {
            console.error(`❌ Error: ${error.message}`);
        }
        process.exit(1);
    }
}

// Run CLI if this file is executed directly
if (require.main === module) {
    main().catch(error => {
        console.error(`❌ Unexpected error: ${error.message}`);
        process.exit(1);
    });
}

module.exports = { main, parseArguments, showHelp, showVersion };