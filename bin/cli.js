#!/usr/bin/env node

/**
 * @fileoverview Universal Emoji Cleaner - CLI Tool
 * @author Chahuadev
 * @version 2.1.0
 * 
 * Command Line Interface for Emoji Cleaner
 * ตัวลบอิโมจิสากล สำหรับใช้งานผ่าน Command Line
 */

const fs = require('fs');
const path = require('path');
const { processFile, processDirectory } = require('../src/index');

/**
 * แสดงข้อมูลการใช้งาน
 */
function showHelp() {
    console.log(`
📖 Universal Emoji Cleaner v2.1.0 - Usage Guide

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
        console.log('🧹 Universal Emoji Cleaner v2.1.0');
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
 * Main CLI function
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

    // Check if target exists
    if (!fs.existsSync(options.target)) {
        console.error(`❌ Error: Target path does not exist: ${options.target}`);
        process.exit(1);
    }

    const stat = fs.statSync(options.target);

    try {
        if (stat.isFile()) {
            // Process single file
            console.log(`🔧 Processing file: ${path.relative(process.cwd(), options.target)}`);

            const result = processFile(options.target, {
                dryRun: options.dryRun,
                createBackup: options.backup
            });

            displayFileResult(result, options);

            if (!result.success) {
                process.exit(1);
            }

        } else if (stat.isDirectory()) {
            // Process directory
            console.log(`🔧 Processing directory: ${path.relative(process.cwd(), options.target)}`);
            if (options.dryRun) {
                console.log(`🔍 Dry-run mode: previewing changes...`);
            }
            console.log(`📁 Extensions: ${options.extensions.join(', ')}`);
            console.log(`🚫 Excluding: ${options.excludeDirs.join(', ')}`);
            console.log('');

            const stats = processDirectory(options.target, {
                dryRun: options.dryRun,
                extensions: options.extensions,
                createBackup: options.backup,
                excludeDirs: options.excludeDirs
            });

            // Display individual file results if verbose
            if (options.verbose) {
                stats.results.forEach(result => {
                    displayFileResult(result, options);
                });
            } else {
                // Display only files with changes
                stats.results.filter(r => r.changed).forEach(result => {
                    displayFileResult(result, options);
                });
            }

            displaySummary(stats, options);

            if (stats.errors > 0) {
                process.exit(1);
            }
        }

    } catch (error) {
        console.error(`❌ Error: ${error.message}`);
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