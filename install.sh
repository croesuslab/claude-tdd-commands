#!/bin/bash
#
# Claude TDD Commands Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/mxdumas/claude-tdd-commands/master/install.sh | bash
#

set -e

REPO_URL="https://github.com/mxdumas/claude-tdd-commands"
BRANCH="master"
TARGET_DIR=".claude/commands/tdd"

echo "Installing Claude TDD Commands..."

# Check if we're in a project directory
if [ ! -d ".git" ] && [ ! -f "package.json" ] && [ ! -f "*.csproj" ] && [ ! -f "pyproject.toml" ]; then
    echo "Warning: This doesn't look like a project root. Continue anyway? (y/N)"
    read -r response
    if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
        echo "Aborted."
        exit 1
    fi
fi

# Create target directory
mkdir -p "$TARGET_DIR"

# Download commands using git sparse checkout or curl
if command -v git &> /dev/null; then
    # Use git to clone only the commands folder
    TEMP_DIR=$(mktemp -d)
    git clone --depth 1 --filter=blob:none --sparse "$REPO_URL" "$TEMP_DIR" 2>/dev/null
    cd "$TEMP_DIR"
    git sparse-checkout set commands/tdd
    cd - > /dev/null
    cp -r "$TEMP_DIR/commands/tdd/"* "$TARGET_DIR/"
    rm -rf "$TEMP_DIR"
else
    # Fallback: download files individually with curl
    BASE_URL="https://raw.githubusercontent.com/mxdumas/claude-tdd-commands/$BRANCH/commands/tdd"

    mkdir -p "$TARGET_DIR/init"
    mkdir -p "$TARGET_DIR/flow"

    # Download init commands
    curl -fsSL "$BASE_URL/init/1-project.md" -o "$TARGET_DIR/init/1-project.md"
    curl -fsSL "$BASE_URL/init/2-architecture.md" -o "$TARGET_DIR/init/2-architecture.md"
    curl -fsSL "$BASE_URL/init/3-standards.md" -o "$TARGET_DIR/init/3-standards.md"
    curl -fsSL "$BASE_URL/init/4-readme.md" -o "$TARGET_DIR/init/4-readme.md"

    # Download flow commands
    curl -fsSL "$BASE_URL/flow/status.md" -o "$TARGET_DIR/flow/status.md"
    curl -fsSL "$BASE_URL/flow/next.md" -o "$TARGET_DIR/flow/next.md"
    curl -fsSL "$BASE_URL/flow/1-analyze.md" -o "$TARGET_DIR/flow/1-analyze.md"
    curl -fsSL "$BASE_URL/flow/2-test.md" -o "$TARGET_DIR/flow/2-test.md"
    curl -fsSL "$BASE_URL/flow/3-dev.md" -o "$TARGET_DIR/flow/3-dev.md"
    curl -fsSL "$BASE_URL/flow/4-review.md" -o "$TARGET_DIR/flow/4-review.md"
    curl -fsSL "$BASE_URL/flow/5-docs.md" -o "$TARGET_DIR/flow/5-docs.md"
    curl -fsSL "$BASE_URL/flow/6-done.md" -o "$TARGET_DIR/flow/6-done.md"

    # Download README
    curl -fsSL "$BASE_URL/README.md" -o "$TARGET_DIR/README.md"
fi

echo ""
echo "Done! TDD commands installed to $TARGET_DIR"
echo ""
echo "Available commands:"
echo "  /tdd:init:1-project    - Initialize project with epics"
echo "  /tdd:init:2-architecture - Define architecture"
echo "  /tdd:init:3-standards  - Define code standards"
echo "  /tdd:init:4-readme     - Generate README"
echo ""
echo "  /tdd:flow:status       - Show current status"
echo "  /tdd:flow:next         - Run next step"
echo "  /tdd:flow:1-analyze    - Analyze task"
echo "  /tdd:flow:2-test       - Write tests (RED)"
echo "  /tdd:flow:3-dev        - Implement (GREEN)"
echo "  /tdd:flow:4-review     - Review"
echo "  /tdd:flow:5-docs       - Document"
echo "  /tdd:flow:6-done       - Commit"
echo ""
echo "Get started with: /tdd:init:1-project"
