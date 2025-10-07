# Commit Guidelines

## Professional Commit Message Standards

This document outlines the commit message standards for the Chahuadev Emoji Cleaner Tool project. Following these guidelines ensures clear project history and facilitates automated tooling.

## Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type

Must be one of the following:

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat(cli): add dry-run mode` |
| `fix` | Bug fix | `fix(security): prevent path traversal` |
| `docs` | Documentation only | `docs(api): update method signatures` |
| `style` | Code style changes | `style(core): fix indentation` |
| `refactor` | Code refactoring | `refactor(parser): improve performance` |
| `perf` | Performance improvement | `perf(engine): optimize file processing` |
| `test` | Adding/updating tests | `test(security): add injection tests` |
| `chore` | Maintenance tasks | `chore(deps): update dependencies` |
| `ci` | CI/CD changes | `ci(actions): add security scan` |
| `build` | Build system changes | `build(npm): update package scripts` |
| `revert` | Revert previous commit | `revert: remove unstable feature` |

### Scope

The scope should indicate the part of the codebase affected:

| Scope | Description |
|-------|-------------|
| `cli` | Command line interface |
| `core` | Core processing engine |
| `security` | Security layer |
| `parser` | File parsing logic |
| `backup` | Backup system |
| `config` | Configuration management |
| `docs` | Documentation |
| `tests` | Test files |
| `build` | Build configuration |

### Subject

- Use imperative mood: "add" not "added" or "adds"
- Don't capitalize first letter
- No period at the end
- Maximum 50 characters

### Body

- Wrap at 72 characters
- Explain the what and why, not how
- Use imperative mood
- Separate from subject with blank line

### Footer

- Reference issues and breaking changes
- Format: `Closes #123` or `Fixes #456`
- Breaking changes: `BREAKING CHANGE: description`

## Examples

### Feature Addition

```
feat(cli): add JSON output format option

Add --output json flag to enable structured output for CI/CD
integration. The JSON format includes file processing results,
error details, and performance metrics.

This enables better integration with automated tools and
provides machine-readable results for further processing.

Closes #45
```

### Bug Fix

```
fix(security): prevent command injection in file paths

Sanitize user input to block shell metacharacters that could
lead to command injection attacks. Add comprehensive validation
for file paths and command arguments.

The fix includes:
- Input sanitization for all user-provided paths
- Whitelist validation for allowed characters
- Escape sequence handling for special characters

Fixes #123
```

### Breaking Change

```
feat(api): update configuration file format

Change configuration file from .emojirc to .emojicleanerrc.json
to improve clarity and enable JSON schema validation.

The new format provides:
- Better IDE support with autocomplete
- JSON schema validation
- More intuitive naming convention

BREAKING CHANGE: Configuration file renamed from .emojirc to
.emojicleanerrc.json. Users must rename their config files.

Migration guide available in MIGRATION.md
```

### Documentation Update

```
docs(readme): clarify installation instructions

Update installation section with:
- Clearer npm commands
- Node.js version requirements
- Troubleshooting common issues
- Platform-specific notes

Improves user onboarding experience and reduces support requests.
```

### Performance Improvement

```
perf(core): optimize emoji detection algorithm

Replace regex-based detection with Unicode property-based
approach, improving performance by 40% on large files.

Changes:
- Use Unicode categories for emoji detection
- Implement caching for repeated patterns
- Add early termination for non-matching content

Benchmark results show 40% improvement in processing time
for files larger than 1MB.

Closes #78
```

### Test Addition

```
test(security): add comprehensive injection attack tests

Add test suite covering various injection attack vectors:
- Command injection attempts
- Path traversal attacks
- Script injection in file names
- Unicode bypass attempts

Tests ensure security layer blocks all known attack patterns
and provide regression protection for future changes.

Increases security test coverage to 100%.
```

## Commit Message Best Practices

### Do's

- ✅ Keep commits atomic (one logical change per commit)
- ✅ Write clear, descriptive subject lines
- ✅ Explain the reasoning behind changes in the body
- ✅ Reference relevant issues and pull requests
- ✅ Use consistent formatting and terminology
- ✅ Write commit messages for future maintainers

### Don'ts

- ❌ Don't write vague messages like "fix stuff" or "update code"
- ❌ Don't include file names in the subject (use scope instead)
- ❌ Don't exceed character limits (50 for subject, 72 for body)
- ❌ Don't commit unrelated changes together
- ❌ Don't use past tense ("fixed" instead of "fix")
- ❌ Don't commit commented-out code or debug logs

## Git Workflow Integration

### Commit Hooks

We recommend setting up commit hooks to enforce these standards:

```bash
# Install commitizen for guided commit messages
npm install -g commitizen cz-conventional-changelog

# Set up the adapter
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
```

### Usage with Commitizen

```bash
# Use commitizen for guided commits
git cz
```

### Automated Validation

Our CI pipeline includes commit message validation:

```yaml
# .github/workflows/validate-commits.yml
- name: Validate Commit Messages
  uses: wagoid/commitlint-github-action@v4
```

## Release Notes Generation

Following these guidelines enables automated release notes:

```bash
# Generate changelog from commits
conventional-changelog -p angular -i CHANGELOG.md -s
```

## Semantic Versioning Impact

Commit types automatically determine version bumps:

| Commit Type | Version Bump | Example |
|-------------|--------------|---------|
| `fix` | PATCH (1.0.1) | Bug fixes |
| `feat` | MINOR (1.1.0) | New features |
| `BREAKING CHANGE` | MAJOR (2.0.0) | Breaking changes |

## Examples by Project Area

### Security-Related Commits

```
fix(security): validate file extensions properly
feat(security): add rate limiting for API calls
perf(security): optimize path validation performance
```

### CLI Enhancement Commits

```
feat(cli): add progress bar for long operations
fix(cli): handle keyboard interrupts gracefully
docs(cli): update help text with new options
```

### Core Engine Commits

```
refactor(core): simplify file processing pipeline
perf(core): reduce memory usage during processing
fix(core): handle malformed Unicode sequences
```

## Tooling Support

### IDE Integration

Many IDEs support commit message templates:

```bash
# Set Git commit template
git config commit.template ~/.gitmessage
```

### VS Code Extensions

Recommended extensions:
- Conventional Commits
- GitLens
- Git Graph

### Command Line Tools

```bash
# Install helpful CLI tools
npm install -g @commitlint/cli @commitlint/config-conventional
```

## Review Process

During code review, commit messages are evaluated for:

1. **Clarity**: Is the change purpose clear?
2. **Completeness**: Does it explain what and why?
3. **Standards Compliance**: Does it follow our format?
4. **Technical Accuracy**: Does it accurately describe the change?

## Training and Resources

### Internal Resources

- [Commit Message Workshop Recording](internal-link)
- [Interactive Commit Message Tool](internal-link)
- [Project Style Guide](internal-link)

### External Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Git Commit Best Practices](https://chris.beams.io/posts/git-commit/)
- [Angular Commit Guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit)

---

Following these guidelines helps maintain a professional, clear, and useful project history. For questions about commit message standards, please contact the development team at chahuadev@gmail.com.