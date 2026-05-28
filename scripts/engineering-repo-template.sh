#!/usr/bin/env bash

set -euo pipefail

REPO_NAME=${1:-}

if [[ -z "$REPO_NAME" ]]; then
  echo "Usage: ./engineering-repo-template.sh <repo-name>"
  exit 1
fi

echo ""
echo "Creating engineering repository: ${REPO_NAME}"
echo ""

mkdir -p "$REPO_NAME"

cd "$REPO_NAME"

# -----------------------------------------------------------------------------
# Directory Structure
# -----------------------------------------------------------------------------

echo "Creating directory structure..."

mkdir -p \
  .github/workflows \
  .github/ISSUE_TEMPLATE \
  docs \
  diagrams \
  examples \
  references \
  scripts

# -----------------------------------------------------------------------------
# Preserve Empty Directories
# -----------------------------------------------------------------------------

touch docs/.gitkeep
touch diagrams/.gitkeep
touch examples/.gitkeep
touch references/.gitkeep

# -----------------------------------------------------------------------------
# Root Files
# -----------------------------------------------------------------------------

echo "Creating root files..."

touch \
  README.md \
  LICENSE \
  CHANGELOG.md \
  TODO.md \
  CONTRIBUTING.md \
  SECURITY.md \
  .gitignore \
  .editorconfig \
  .markdownlint.json \
  .yamllint.yml

# -----------------------------------------------------------------------------
# README.md
# -----------------------------------------------------------------------------

cat > README.md <<EOF
# ${REPO_NAME}

Production-aware, engineering-focused repository.

---

# Repository Philosophy

This repository focuses on:

- Engineering thinking
- Production awareness
- Operational understanding
- Tradeoff analysis
- Real-world systems
- Interview-focused learning
- Revision-friendly documentation

Target feeling:

> Engineer explaining to engineer.

---

# Repository Structure

\`\`\`text
.
├── .github/
├── docs/
├── diagrams/
├── examples/
├── references/
├── scripts/
├── CONTRIBUTING.md
├── SECURITY.md
\`\`\`
EOF

# -----------------------------------------------------------------------------
# CHANGELOG.md
# -----------------------------------------------------------------------------

cat > CHANGELOG.md <<EOF
# Changelog

All notable changes to this repository will be documented in this file.

---

## [1.0.0] - $(date +%Y-%m-%d)

### Added

- Initial repository structure
- Repository governance foundation
- GitHub workflow structure
- Engineering repository standards
EOF

# -----------------------------------------------------------------------------
# TODO.md
# -----------------------------------------------------------------------------

cat > TODO.md <<EOF
# TODO

## High Priority

## Medium Priority

## Low Priority

## Future Ideas
EOF

# -----------------------------------------------------------------------------
# CONTRIBUTING.md
# -----------------------------------------------------------------------------

cat > CONTRIBUTING.md <<EOF
# Contributing

Contributions and improvements are welcome.

Please ensure:

- Content remains engineering-focused
- Production examples are preferred
- Content stays concise and revision-friendly
- Avoid unnecessary filler
EOF

# -----------------------------------------------------------------------------
# SECURITY.md
# -----------------------------------------------------------------------------

cat > SECURITY.md <<EOF
# Security Policy

Please report security vulnerabilities responsibly.

Avoid publicly disclosing vulnerabilities before fixes are available.

---

# Supported Versions

| Version | Supported |
|---|---|
| Latest | Yes |

---

# Reporting a Vulnerability

Please open a private security report or contact the repository maintainer directly.
EOF

# -----------------------------------------------------------------------------
# LICENSE
# -----------------------------------------------------------------------------

cat > LICENSE <<EOF
MIT License

Copyright (c) $(date +%Y)-present Abhijit Roy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# -----------------------------------------------------------------------------
# .gitignore
# -----------------------------------------------------------------------------

cat > .gitignore <<EOF
# -----------------------------------------------------------------------------
# Operating System
# -----------------------------------------------------------------------------

# macOS
.DS_Store
.AppleDouble
.LSOverride

# Linux
*~

# Windows
Thumbs.db
Desktop.ini

# -----------------------------------------------------------------------------
# Logs
# -----------------------------------------------------------------------------

*.log
logs/

# -----------------------------------------------------------------------------
# IDE / Editor
# -----------------------------------------------------------------------------

.vscode/
.idea/
*.swp
*.swo

# -----------------------------------------------------------------------------
# Environment Files
# -----------------------------------------------------------------------------

.env
.env.*
*.local

# -----------------------------------------------------------------------------
# Python
# -----------------------------------------------------------------------------

__pycache__/
*.pyc
*.pyo
*.pyd
.venv/
venv/

# -----------------------------------------------------------------------------
# Node.js
# -----------------------------------------------------------------------------

node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# -----------------------------------------------------------------------------
# Terraform
# -----------------------------------------------------------------------------

.terraform/
*.tfstate
*.tfstate.*

# -----------------------------------------------------------------------------
# Build / Distribution
# -----------------------------------------------------------------------------

build/
dist/
out/
coverage/

# -----------------------------------------------------------------------------
# Temporary Files
# -----------------------------------------------------------------------------

.tmp/
.temp/
tmp/

# -----------------------------------------------------------------------------
# Security
# -----------------------------------------------------------------------------

*.pem
*.key
*.crt
*.p12
secrets/

# -----------------------------------------------------------------------------
# Misc
# -----------------------------------------------------------------------------

.cache/
EOF

# -----------------------------------------------------------------------------
# .editorconfig
# -----------------------------------------------------------------------------

cat > .editorconfig <<EOF
root = true

# -----------------------------------------------------------------------------
# Global Defaults
# -----------------------------------------------------------------------------

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
indent_style = space
indent_size = 2
trim_trailing_whitespace = true
max_line_length = 160

# -----------------------------------------------------------------------------
# Markdown Files
# -----------------------------------------------------------------------------

[*.md]
trim_trailing_whitespace = false

# -----------------------------------------------------------------------------
# YAML Files
# -----------------------------------------------------------------------------

[*.{yml,yaml}]
indent_size = 2

# -----------------------------------------------------------------------------
# Shell Scripts
# -----------------------------------------------------------------------------

[*.sh]
indent_size = 2

# -----------------------------------------------------------------------------
# JSON Files
# -----------------------------------------------------------------------------

[*.json]
indent_size = 2

# -----------------------------------------------------------------------------
# Makefiles
# -----------------------------------------------------------------------------

[Makefile]
indent_style = tab
EOF

# -----------------------------------------------------------------------------
# .markdownlint.json
# -----------------------------------------------------------------------------

cat > .markdownlint.json <<EOF
{
  "default": true,

  "MD013": false,
  "MD033": false,
  "MD041": false,

  "MD003": {
    "style": "atx"
  },

  "MD004": {
    "style": "dash"
  },

  "MD007": {
    "indent": 2
  },

  "MD024": {
    "allow_different_nesting": true
  },

  "MD029": {
    "style": "ordered"
  },

  "MD035": {
    "style": "---"
  }
}
EOF

# -----------------------------------------------------------------------------
# .yamllint.yml
# -----------------------------------------------------------------------------

cat > .yamllint.yml <<EOF
extends: default

ignore: |
  .git/
  node_modules/

rules:
  line-length:
    max: 160
    level: warning

  document-start:
    present: false

  truthy:
    allowed-values:
      - "true"
      - "false"
      - "on"

  comments:
    min-spaces-from-content: 1

  indentation:
    spaces: 2
    indent-sequences: consistent

  trailing-spaces: enable

  empty-lines:
    max: 2
    max-start: 0
    max-end: 1
EOF

# -----------------------------------------------------------------------------
# cspell.json
# -----------------------------------------------------------------------------

cat > .github/cspell.json <<EOF
{
  "version": "0.2",
  "language": "en",
  "ignorePaths": [
    "CHANGELOG.md",
    ".git",
    "node_modules"
  ]
}
EOF

# -----------------------------------------------------------------------------
# CODEOWNERS
# -----------------------------------------------------------------------------

cat > .github/CODEOWNERS <<EOF
# -----------------------------------------------------------------------------
# Global Repository Ownership
# -----------------------------------------------------------------------------

* @abroy77

# -----------------------------------------------------------------------------
# GitHub Workflows
# -----------------------------------------------------------------------------

.github/workflows/ @abroy77

# -----------------------------------------------------------------------------
# Documentation & Standards
# -----------------------------------------------------------------------------

README.md @abroy77
CHANGELOG.md @abroy77
CONTRIBUTING.md @abroy77
SECURITY.md @abroy77
TODO.md @abroy77

# -----------------------------------------------------------------------------
# Repository Automation
# -----------------------------------------------------------------------------

scripts/ @abroy77
EOF

# -----------------------------------------------------------------------------
# markdown-lint.yml
# -----------------------------------------------------------------------------

cat > .github/workflows/markdown-lint.yml <<EOF
name: Enterprise Markdown Lint

on:
  push:
    branches:
      - main
      - develop

  pull_request:
    branches:
      - main
      - develop

  workflow_dispatch:

permissions:
  contents: read

jobs:
  markdown-lint:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install markdownlint-cli
        run: npm install -g markdownlint-cli

      - name: Run markdownlint
        run: markdownlint "**/*.md"
EOF

# -----------------------------------------------------------------------------
# spell-check.yml
# -----------------------------------------------------------------------------

cat > .github/workflows/spell-check.yml <<EOF
name: Enterprise Spell Check

on:
  push:
    branches:
      - main
      - develop

  pull_request:
    branches:
      - main
      - develop

  workflow_dispatch:

permissions:
  contents: read

jobs:
  spell-check:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install cspell
        run: npm install -g cspell

      - name: Run cspell
        run: cspell "**/*.md" --config .github/cspell.json
EOF

# -----------------------------------------------------------------------------
# yaml-lint.yml
# -----------------------------------------------------------------------------

cat > .github/workflows/yaml-lint.yml <<EOF
name: Enterprise YAML Lint

on:
  push:
    branches:
      - main
      - develop

  pull_request:
    branches:
      - main
      - develop

  workflow_dispatch:

permissions:
  contents: read

jobs:
  yaml-lint:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Install yamllint
        run: sudo apt-get update && sudo apt-get install -y yamllint

      - name: Run yamllint
        run: yamllint .
EOF

# -----------------------------------------------------------------------------
# pull_request_template.md
# -----------------------------------------------------------------------------

cat > .github/pull_request_template.md <<EOF
# Summary

Provide a short summary of the changes introduced in this pull request.

---

# Changes

Describe the major changes included:

- 
- 
- 

---

# Motivation

Why are these changes needed?

- Bug fix
- Repository improvement
- Documentation enhancement
- Workflow update
- Security improvement
- Engineering governance update
- Automation enhancement

---

# Validation

Please confirm the following before requesting review:

- [ ] Workflows are passing
- [ ] Markdown validated
- [ ] YAML validated
- [ ] Documentation updated
- [ ] No unnecessary files added
- [ ] Repository structure remains clean
- [ ] Links verified (if applicable)
- [ ] Security-sensitive information excluded

---

# Engineering Impact

Describe any important engineering considerations:

- Production impact
- Reliability considerations
- Security implications
- Workflow changes
- Repository governance impact
- Scalability considerations

---

# Additional Notes

Add any additional context, references, screenshots, or follow-up items here.
EOF

# -----------------------------------------------------------------------------
# dependabot.yml
# -----------------------------------------------------------------------------

cat > .github/dependabot.yml <<EOF
version: 2

updates:
  # ---------------------------------------------------------------------------
  # GitHub Actions
  # ---------------------------------------------------------------------------

  - package-ecosystem: "github-actions"
    directory: "/"

    schedule:
      interval: "weekly"
      day: "monday"
      time: "06:00"
      timezone: "Asia/Kolkata"

    open-pull-requests-limit: 10

    labels:
      - "dependencies"
      - "github-actions"
      - "automation"

    commit-message:
      prefix: "deps"
      include: "scope"

  # ---------------------------------------------------------------------------
  # Docker (Future Support)
  # ---------------------------------------------------------------------------

  - package-ecosystem: "docker"
    directory: "/"

    schedule:
      interval: "weekly"

    open-pull-requests-limit: 5

    labels:
      - "dependencies"
      - "docker"

  # ---------------------------------------------------------------------------
  # Terraform (Future Support)
  # ---------------------------------------------------------------------------

  - package-ecosystem: "terraform"
    directory: "/"

    schedule:
      interval: "weekly"

    open-pull-requests-limit: 5

    labels:
      - "dependencies"
      - "terraform"
EOF

# -----------------------------------------------------------------------------
# Final Output
# -----------------------------------------------------------------------------

echo ""
echo "Repository created successfully."
echo ""
echo "Next Steps:"
echo "  cd ${REPO_NAME}"
echo "  git init"
echo "  git add ."
echo "  git commit -m 'chore: initialize repository structure'"
echo ""
