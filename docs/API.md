# API Reference

## Chahuadev Emoji Cleaner Tool API

### Command Line Interface

#### Basic Usage

```bash
npx @chahuadev/emoji-cleaner@latest [directory] [options]
```

#### Options

| Option | Short | Description | Default |
|--------|-------|-------------|---------|
| `--help` | `-h` | Show help information | |
| `--version` | `-v` | Show version number | |
| `--dry-run` | `-d` | Preview changes without applying | `false` |
| `--backup` | `-b` | Create backup before processing | `false` |
| `--verbose` | | Enable verbose logging | `false` |
| `--quiet` | `-q` | Suppress non-error output | `false` |
| `--recursive` | `-r` | Process directories recursively | `true` |
| `--extensions` | `-e` | File extensions to process | Auto-detect |
| `--exclude` | | Patterns to exclude | `node_modules,dist` |
| `--output` | `-o` | Output format (text/json) | `text` |
| `--log-file` | | Log output to file | |

#### Examples

```bash
# Clean current directory with backup
npx @chahuadev/emoji-cleaner@latest . --backup

# Dry run on specific directory
npx @chahuadev/emoji-cleaner@latest src/ --dry-run --verbose

# Process specific file types
npx @chahuadev/emoji-cleaner@latest . --extensions js,ts,jsx,tsx

# Exclude specific patterns
npx @chahuadev/emoji-cleaner@latest . --exclude "*.min.js,dist/**"

# JSON output for CI/CD
npx @chahuadev/emoji-cleaner@latest . --output json > results.json
```

### Programmatic API

#### Installation

```bash
npm install @chahuadev/emoji-cleaner
```

#### Basic Usage

```javascript
const { EmojiCleaner } = require('@chahuadev/emoji-cleaner');

const cleaner = new EmojiCleaner({
    backup: true,
    verbose: true
});

// Clean a single file
await cleaner.cleanFile('./example.js');

// Clean a directory
await cleaner.cleanDirectory('./src', {
    recursive: true,
    extensions: ['.js', '.ts', '.jsx', '.tsx']
});
```

#### Constructor Options

```typescript
interface EmojiCleanerOptions {
    backup?: boolean;          // Create backup files
    verbose?: boolean;         // Enable verbose logging
    dryRun?: boolean;         // Preview only mode
    extensions?: string[];     // File extensions to process
    exclude?: string[];       // Patterns to exclude
    logFile?: string;         // Log output to file
}
```

#### Methods

##### `cleanFile(filePath: string, options?: FileOptions): Promise<CleanResult>`

Clean a single file.

**Parameters:**
- `filePath`: Path to the file to clean
- `options`: Optional file-specific options

**Returns:** Promise resolving to `CleanResult`

##### `cleanDirectory(dirPath: string, options?: DirOptions): Promise<CleanResult[]>`

Clean all files in a directory.

**Parameters:**
- `dirPath`: Path to the directory to clean
- `options`: Optional directory-specific options

**Returns:** Promise resolving to array of `CleanResult`

##### `validateFile(filePath: string): Promise<ValidationResult>`

Validate file without making changes.

**Parameters:**
- `filePath`: Path to the file to validate

**Returns:** Promise resolving to `ValidationResult`

#### Types

##### `CleanResult`

```typescript
interface CleanResult {
    file: string;              // File path
    processed: boolean;        // Whether file was processed
    emojisRemoved: number;     // Number of emojis removed
    backupCreated: boolean;    // Whether backup was created
    errors: string[];          // Any errors encountered
    warnings: string[];        // Any warnings
}
```

##### `ValidationResult`

```typescript
interface ValidationResult {
    file: string;              // File path
    isValid: boolean;          // Whether file is valid
    emojisFound: number;       // Number of emojis found
    issues: Issue[];           // List of issues found
}
```

##### `Issue`

```typescript
interface Issue {
    type: 'emoji' | 'warning' | 'error';
    line: number;              // Line number
    column: number;            // Column number
    message: string;           // Issue description
    suggestion?: string;       // Suggested fix
}
```

#### Events

The EmojiCleaner class extends EventEmitter and emits the following events:

```javascript
const cleaner = new EmojiCleaner();

// File processing started
cleaner.on('fileStart', (filePath) => {
    console.log(`Processing: ${filePath}`);
});

// File processing completed
cleaner.on('fileComplete', (result) => {
    console.log(`Completed: ${result.file}`);
});

// Error occurred
cleaner.on('error', (error, filePath) => {
    console.error(`Error in ${filePath}:`, error);
});

// Progress update
cleaner.on('progress', (current, total) => {
    console.log(`Progress: ${current}/${total}`);
});
```

### Error Handling

#### Common Errors

| Error Code | Description | Solution |
|------------|-------------|----------|
| `ENOENT` | File not found | Check file path exists |
| `EACCES` | Permission denied | Check file permissions |
| `EMFILE` | Too many open files | Reduce concurrent operations |
| `INVALID_FORMAT` | Unsupported file format | Check file extension |
| `BACKUP_FAILED` | Backup creation failed | Check disk space and permissions |

#### Error Example

```javascript
try {
    const result = await cleaner.cleanFile('./example.js');
    console.log('Success:', result);
} catch (error) {
    console.error('Error:', error.message);
    console.error('Code:', error.code);
    console.error('File:', error.filePath);
}
```

### Configuration File

Create `.emojicleanerrc.json` for project-specific settings:

```json
{
    "extensions": [".js", ".ts", ".jsx", ".tsx", ".vue"],
    "exclude": ["node_modules/**", "dist/**", "*.min.js"],
    "backup": true,
    "verbose": false,
    "output": "text"
}
```

### Integration Examples

#### GitHub Actions

```yaml
name: Clean Emojis
on: [push, pull_request]

jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - name: Clean Emojis
        run: npx @chahuadev/emoji-cleaner@latest . --output json
```

#### Pre-commit Hook

```bash
#!/bin/sh
# .git/hooks/pre-commit
npx @chahuadev/emoji-cleaner@latest --dry-run --quiet .
if [ $? -ne 0 ]; then
    echo "Emoji cleaning failed. Run: npx @chahuadev/emoji-cleaner@latest ."
    exit 1
fi
```

### Performance Considerations

- **Batch Processing**: Process files in batches for large projects
- **Caching**: Results are cached to avoid reprocessing unchanged files
- **Memory Usage**: Tool uses streaming for large files
- **Concurrent Operations**: Limit concurrent file operations to prevent system overload

### Troubleshooting

#### Common Issues

1. **Out of Memory**: Use `--batch-size` option for large projects
2. **Permission Errors**: Run with appropriate permissions or use `--skip-errors`
3. **Encoding Issues**: Tool auto-detects encoding, specify with `--encoding` if needed
4. **Performance**: Use `--exclude` to skip unnecessary files

#### Debug Mode

```bash
DEBUG=emoji-cleaner npx @chahuadev/emoji-cleaner@latest . --verbose
```

---

For more examples and advanced usage, see the [project repository](https://github.com/chahuadev/chahuadev-emoji-cleaner-tool).