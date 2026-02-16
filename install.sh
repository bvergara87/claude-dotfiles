#!/bin/bash

set -e

echo "🚀 Installing Claude Code configuration..."

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLAUDE_DIR="$HOME/.claude"

# Create .claude directory if it doesn't exist
mkdir -p "$CLAUDE_DIR"

# Backup existing config if it exists and isn't a symlink
backup_if_exists() {
    local file=$1
    if [ -f "$CLAUDE_DIR/$file" ] && [ ! -L "$CLAUDE_DIR/$file" ]; then
        echo "📦 Backing up existing $file to $file.backup"
        mv "$CLAUDE_DIR/$file" "$CLAUDE_DIR/$file.backup"
    fi
}

# Create symlinks
create_symlink() {
    local source=$1
    local target=$2

    # Remove existing symlink if it exists
    if [ -L "$target" ]; then
        rm "$target"
    fi

    ln -sf "$source" "$target"
    echo "✅ Linked $source -> $target"
}

# Backup existing files
backup_if_exists "settings.json"
backup_if_exists "agents"

# Create symlinks
create_symlink "$DOTFILES_DIR/settings.json" "$CLAUDE_DIR/settings.json"
create_symlink "$DOTFILES_DIR/agents" "$CLAUDE_DIR/agents"

# Handle settings.local.json
if [ ! -f "$CLAUDE_DIR/settings.local.json" ]; then
    echo "📝 Creating settings.local.json from example..."
    cp "$DOTFILES_DIR/settings.local.example.json" "$CLAUDE_DIR/settings.local.json"
    echo "⚠️  Please edit ~/.claude/settings.local.json with your machine-specific settings"
else
    echo "ℹ️  settings.local.json already exists, keeping your version"
fi

echo ""
echo "✨ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Review ~/.claude/settings.local.json for machine-specific settings"
echo "  2. Restart Claude Code or start a new session"
echo ""
