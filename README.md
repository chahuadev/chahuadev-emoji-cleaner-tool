# Universal Emoji Cleaner  

---

<div align="center">

[![Version](https://img.shields.io/badge/version-2.5.3-blue?style=for-the-badge)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)
[![Issues](https://img.shields.io/badge/Report_Issues-GitHub_Issues-red?style=for-the-badge&logo=github)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/issues)
[![Discussions](https://img.shields.io/badge/Feature_Requests-GitHub_Discussions-blue?style=for-the-badge&logo=github)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool/discussions)
[![Contact](https://img.shields.io/badge/Contact-chahuadev@gmail.com-green?style=for-the-badge&logo=gmail)](mailto:chahuadev@gmail.com)

</div>

---

## CRITICAL SECURITY WARNING - FORTRESS PROTECTION

### Maximum Security - FORTRESS SECURITY
- **Always use latest version**: Older versions (< 2.5.3) have security vulnerabilities  
- **Avoid legacy versions**: Versions 2.1.x-2.5.2 lack latest Smart File Analysis
- **Use `@latest` flag**: `npx @chahuadev/emoji-cleaner@latest` for maximum safety
- **VERSION 2.5.3+ RECOMMENDED**: Latest version includes enhanced Smart File Analysis system

### Anti-Hack Protection System - FORTRESS SHIELD
Tool has comprehensive protection against all attack vectors:

####  Command Injection Protection
```bash
npm install -g @chahuadev/emoji-cleaner
```

### Usage

#### Basic Usage
```bash
# Clean current directory with backup (Recommended)
npx @chahuadev/emoji-cleaner@latest . --backup

# Preview changes first (Safe!)
npx @chahuadev/emoji-cleaner@latest . --dry-run --verbose

# Clean specific file types
npx @chahuadev/emoji-cleaner@latest src/ --extensions js,ts,jsx,tsx
```

#### Advanced Options
```bash
# JSON output for CI/CD
npx @chahuadev/emoji-cleaner@latest . --output json > results.json

# Exclude specific patterns
npx @chahuadev/emoji-cleaner@latest . --exclude "*.min.js,dist/**"

# Verbose logging
npx @chahuadev/emoji-cleaner@latest . --backup --verbose
```

## Security Features

### Multi-Layer Protection
- **Command Injection Protection** - Blocks dangerous functions and shell commands
- **Path Traversal Protection** - Validates file paths and prevents directory traversal
- **System File Protection** - Protects critical system files from modification
- **Input Sanitization** - Comprehensive input validation and sanitization

### Security Best Practices
- Always use version 2.5.3+ for latest security patches
- Use `--dry-run` flag to preview changes before applying
- Enable `--backup` flag to create safety backups
- Review output logs for any security warnings

### System Protection
Tool will reject access to:
- Windows System directories (`C:\Windows\`, `C:\Program Files\`, `C:\System Volume Information\`)
- Linux System directories (`/etc/`, `/usr/`, `/bin/`, `/root/`, `/boot/`, `/proc/`, `/sys/`)
- MacOS System directories (`/System/`, `/usr/bin/`, `/bin/`, `/sbin/`)
- Files with null bytes or dangerous characters
- Files larger than 10MB
- Path traversal attempts (`../`, `..\\`, etc.)
- Command injection patterns
- Script execution attempts
- Binary executable files

### Secure Usage Only - FORTRESS COMPLIANCE
- **Always use `--dry-run` first** to preview results
- **Use `--backup` for important files**
- **Test code after emoji removal** to ensure functionality
- **Check Git status** before committing
- **Use only on your projects** - never on system files
- **Verify output** before confirming operations

### Attack Detection Alerts - FORTRESS MONITORING
Tool displays warnings when attacks are detected:
```bash
SECURITY ALERT: Path traversal detected
SECURITY ALERT: System directory access denied  
SECURITY ALERT: Command injection attempt blocked
SECURITY ALERT: Dangerous file operation prevented
SECURITY ALERT: Binary execution attempt blocked
```

### System Protection
Tool will deny access to:
- Windows System directories (`C:\Windows\`, `C:\Program Files\`)
- Linux System directories (`/etc/`, `/usr/`, `/bin/`, `/root/`)
- Files with null bytes or path traversal attempts
- Files larger than 10MB
- Dangerous operations

### Safe Usage
- **Always use `--dry-run` first** to preview results
- **Use `--backup` for important files**
- **Test code after emoji removal** to ensure functionality
- **Check Git status** before committing

## Why Use This Tool?

**Remove emojis from source code safely and efficiently with Smart File Analysis**
- **Smart File Analysis**: Intelligent complex file detection and processing
- **Structural Health**: Advanced code structure analysis and scoring  
- **Performance Optimized**: Chunk processing for large files (200KB+)
- **Context-Aware**: Recognizes file types and complexity automatically
- **Smart Detection**: Unicode 15.1+ emoji patterns
- **Lightning Fast**: Process 1000+ files in seconds
- **Ultra Safe**: Backup system and dry-run mode
- **Universal**: 50+ programming languages supported
- **Intelligent**: Context-aware cleaning
- **High Performance**: Handle large projects effortlessly
- **Skip system folders** (node_modules, .git, dist, build) automatically
- **Use as Library** for Node.js integration

## NEW in v2.5.3: Smart File Analysis Features

### Intelligent Analysis
- **Complex File Detection**: Automatically detects files with 5+ classes, 20+ functions
- **Structural Health Scoring**: Analyzes code quality and structure (0-100 score)
- **Context Recognition**: Identifies file types (class-based, function-heavy, framework)
- **Performance Optimization**: Smart chunk processing for files >200KB

### Advanced Capabilities  
```bash
# Smart Analysis Example Output:
Complex file detected - using Smart File Analysis...
Running smart analysis...
Smart Analysis Results: Structural Health: 100/100, Context: class-based
Processing time: 0.16s (ultra-fast!)
Found: 4 emojis detected and removed
```

### Performance Features
- **Memory Efficient**: Optimized for large codebases
- **Intelligent Timeouts**: Adaptive timeout based on file complexity  
- **Error Tolerance**: Graceful handling of complex file structures
- **Chunk Processing**: Divide large files for optimal performance

##  Installation & Uninstallation

### Method 1: Use Immediately (No Installation) - Recommended
```bash
# Always use latest version (safest) - includes Smart File Analysis
npx @chahuadev/emoji-cleaner@latest

# Or specify exact version
npx @chahuadev/emoji-cleaner@2.5.3
```

### Method 2: Project Installation
```bash
# Install
npm install @chahuadev/emoji-cleaner@latest --save-dev

# Uninstall
npm uninstall @chahuadev/emoji-cleaner
```

### Method 3: Global Installation
```bash
# Install
npm install -g @chahuadev/emoji-cleaner@latest

# Uninstall
npm uninstall -g @chahuadev/emoji-cleaner

# Check global installation
npm list -g @chahuadev/emoji-cleaner
```

### Clear NPX Cache
```bash
# Clear all cache
npm cache clean --force

# Clear npx cache (Windows)
Remove-Item -Path "$env:LOCALAPPDATA\npm-cache\_npx" -Recurse -Force

# Clear npx cache (Linux/Mac)
rm -rf ~/.npm/_npx
```

## Quick Start

### Basic Usage
```bash
# Preview changes (recommended first step)
npx @chahuadev/emoji-cleaner@latest --dry-run

# Clean current directory with backup
npx @chahuadev/emoji-cleaner@latest --backup

# Clean specific project
npx @chahuadev/emoji-cleaner@latest /path/to/project --backup

# Clean single file
npx @chahuadev/emoji-cleaner@latest myfile.js --dry-run
```

### Direct Usage (After Installation)
```bash
# After global or project installation
emoji-cleaner --dry-run
emoji-cleaner ./src --backup
emoji-cleaner myfile.js --verbose

# Or run directly with node (in tool directory)
node emoji-cleaner.js --help
node emoji-cleaner.js --dry-run
```

### Advanced Options
```bash
# Verbose output with backup
npx @chahuadev/emoji-cleaner@latest --verbose --backup

# Specific file extensions only
npx @chahuadev/emoji-cleaner@latest --ext .js,.ts,.jsx

# Custom target with dry-run
npx @chahuadev/emoji-cleaner@latest ./src --dry-run --verbose
```

## Command Options

| Option | Short | Description |
|--------|-------|-------------|
| `--dry-run` | `-d` | Preview changes without modifying files |
| `--verbose` | `-v` | Show detailed processing information |
| `--backup` | `-b` | Create backup before making changes |
| `--help` | `-h` | Show help message |
| `--version` | | Show version information |
| `--ext <list>` | | Specify file extensions (comma-separated) |

## Features

### **Smart Emoji Detection**
- **Unicode 15.1+ Support**: Latest emoji patterns
- **Comprehensive Coverage**: All emoji categories
- **Context Aware**: Preserves non-emoji Unicode
- **HTML Entities**: Removes emoji HTML entities

### **Enterprise Security**
- **Path Traversal Protection**: Prevents directory traversal attacks
- **System Directory Blocking**: Blocks access to critical system paths
- **Input Validation**: Sanitizes all user inputs
- **File Size Limits**: Prevents processing of oversized files
- **Permission Checks**: Validates file access permissions

### **High Performance**
- **Fast Processing**: 1000+ files in seconds
- **Memory Efficient**: Optimized for large codebases
- **Smart Filtering**: Automatic exclusion of irrelevant files
- **Parallel Processing**: Multi-threaded when possible

### **50+ Languages Supported**

**Programming Languages:**
- JavaScript (.js), TypeScript (.ts), JSX (.jsx), TSX (.tsx)
- Python (.py), Java (.java), C++ (.cpp), C# (.cs)
- PHP (.php), Ruby (.rb), Go (.go), Rust (.rs)
- Swift (.swift), Kotlin (.kt), Dart (.dart), Scala (.scala)
- And 35+ more...

**Web & Markup:**
- HTML (.html), CSS (.css), SCSS (.scss), SASS (.sass)
- XML (.xml), SVG (.svg), Vue (.vue), Angular (.component.html)

**Configuration & Data:**
- JSON (.json), YAML (.yml/.yaml), TOML (.toml)
- INI (.ini), ENV (.env), Config (.conf)

**Scripts & Others:**
- Shell (.sh/.bash/.zsh), PowerShell (.ps1), Batch (.bat/.cmd)
- SQL (.sql), Markdown (.md), Text (.txt)

## Usage Examples

### Security Examples
```bash
# Safe: Clean your project with backup
npx @chahuadev/emoji-cleaner@latest ./my-project --backup --dry-run

# Blocked: System directory access denied
npx @chahuadev/emoji-cleaner@latest C:\Windows\System32
# Output: Security Error: Access to system directories is not allowed

# Blocked: Path traversal attempt denied
npx @chahuadev/emoji-cleaner@latest "../../../etc/passwd"
# Output: Security Error: Path traversal detected
```

### Practical Examples
```bash
# Clean JavaScript project
npx @chahuadev/emoji-cleaner@latest ./src --ext .js,.jsx,.ts,.tsx --backup

# Clean Python project
npx @chahuadev/emoji-cleaner@latest . --ext .py --verbose

# Clean all supported files in current directory
npx @chahuadev/emoji-cleaner@latest --dry-run

# Clean single file with backup
npx @chahuadev/emoji-cleaner@latest app.js --backup
```

### Node.js Library Usage
```javascript
const emojiCleaner = require('@chahuadev/emoji-cleaner');

// Analyze single file
const result = emojiCleaner.analyzeFile('myfile.js', true); // dry-run
console.log(`Found ${result.emojiCount} emojis`);

// Process directory
const stats = emojiCleaner.processDirectory('./src', false, true, ['.js', '.ts']);
console.log(`Processed ${stats.totalFiles} files`);
```

## Performance

- **Speed**: Process 1000+ files in < 0.1 seconds
- **Efficiency**: Reduce file sizes by 1-5%
- **Safety**: No code structure damage, preserves formatting
- **Unicode 15.1+ Support**: Removes all latest emojis
- **Multi-language**: Recognizes and processes 50+ programming languages
- **Security First**: Enterprise-grade vulnerability protection

## Support

- **Report Issues**: [GitHub Issues](https://github.com/chahuadev/emoji-cleaner/issues)
- **Feature Requests**: [GitHub Discussions](https://github.com/chahuadev/emoji-cleaner/discussions)
- **Contact**: chahuadev@gmail.com

## Changelog

### v2.5.3 (2025-10-07) - **DOCUMENTATION UPDATE**
- **Complete English Documentation**: All text converted to English language
- **No Emoji Policy**: Removed all emojis from documentation for professional presentation
- **Version Update**: Updated to v2.5.3 with consistent version references
- **Enhanced Readability**: Improved documentation structure and clarity
- **Professional Format**: Clean, business-appropriate documentation style

### v2.3.0 (2025-09-19) - **CLEAN REGISTRY RELEASE**
- **Clean Registry**: Removed legacy versions for clean npm registry
- **Single-File CLI**: Consolidated architecture with emoji-cleaner.js
- **Security Features**: Complete FORTRESS protection system maintained
- **Enhanced Detection**: Unicode 15.1+ emoji patterns
- **Optimized Package**: Clean structure with essential files only
- **Enhanced CLI**: Better error handling and security indicators
- **Zone Architecture**: 6-zone organization with consistent headers
- **Path Protection**: Comprehensive system directory blocking
- **Command Injection Shield**: Complete protection against code injection
- **Performance**: Faster processing with memory optimization

### v2.2.4 (2025-09-18) - Previous Secure Version
- **Complete Security Protection**: Full security implementation
- **Fixed CLI Security Gap**: CLI now uses full security features
- **Removed Legacy Files**: Deleted unused src/index.js
- **NPX Security Tested**: Verified security protection works
- **Complete Documentation**: Added uninstall instructions and best practices

### v2.2.3 (2025-09-18)
- **Fixed package.json main file reference**
- **Added Security to main processing**

### v2.2.2 (2025-09-18)
- **First Security features implementation**
- **Updated README with Security information**

### v2.1.x and earlier (SECURITY RISK - Deprecated)
- **Legacy versions with critical security vulnerabilities**
- **DO NOT USE - No protection against attacks**
- **Removed from NPM registry for safety**

---

## SECURITY COMMITMENT

### Our Security Promise
**This tool is designed with SECURITY FIRST principles:**

**NO SYSTEM FILE ACCESS** - No access to system files  
**NO COMMAND EXECUTION** - No dangerous command execution  
**NO PATH TRAVERSAL** - No path traversal allowed  
**NO BINARY EXECUTION** - No executable file execution  
**SYNTAX PROTECTION** - Protects against syntax destruction  
**SELF-PROTECTION** - Protects against self-modification  

### Security Reporting
**Found a security issue? Report it privately:**
- **Security Email**: chahuadev@gmail.com
- **Encrypted Contact**: Use GPG key on our GitHub
- **Response Time**: < 24 hours for critical issues
- **Recognition**: Security researchers credited

### Security Audits
- **Automated Security Scanning**: GitHub CodeQL
- **Manual Code Review**: Expert security review
- **Penetration Testing**: Regular security testing
- **Dependency Scanning**: npm audit integration

---

## License

MIT License - See [LICENSE](LICENSE) for details

## Authors

**Chahua Development Co., Ltd.**
- Website: https://chahuadev.com
- Email: chahuadev@gmail.com
- GitHub: [@chahuadev](https://github.com/chahuadev)

### Contributors
- Lead Developer: Chahua Development Team
- Security Consultant: Internal Security Team
- Documentation: Technical Writing Team

---

**Universal emoji removal tool for 50+ programming languages with Smart File Analysis - Secure, Fast, Comprehensive**

[![npm version](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner.svg)](https://badge.fury.io/js/%40chahuadev%2Femoji-cleaner)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Unicode Support](https://img.shields.io/badge/Unicode-15.1%2B-blue.svg)](https://unicode.org/emoji/)
[![Security](https://img.shields.io/badge/Security-FORTRESS-red.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)
[![Anti-Hack](https://img.shields.io/badge/Anti--Hack-PROTECTED-darkred.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)
[![Smart Analysis](https://img.shields.io/badge/Smart-Analysis-brightgreen.svg)](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool)

---

**If you find this project useful, please give it a star!**

**Chahua Development Co., Ltd.** 
**The Most Secure Emoji Removal Tool**
#