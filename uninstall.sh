#!/bin/bash

set -e

echo "🗑️  Uninstalling Claude Code dotfiles..."

CLAUDE_DIR="$HOME/.claude"

# Remove symlinks
remove_symlink() {
    local target=$1
    if [ -L "$target" ]; then
        rm "$target"
        echo "✅ Removed symlink: $target"
    fi
}

remove_symlink "$CLAUDE_DIR/settings.json"
remove_symlink "$CLAUDE_DIR/agents"

# Restore backups if they exist
restore_backup() {
    local file=$1
    if [ -f "$CLAUDE_DIR/$file.backup" ]; then
        mv "$CLAUDE_DIR/$file.backup" "$CLAUDE_DIR/$file"
        echo "✅ Restored backup: $file"
    fi
}

restore_backup "settings.json"
restore_backup "agents"

echo ""
echo "✨ Uninstall complete!"
echo ""
echo "Note: settings.local.json was not removed (machine-specific settings)"
echo ""
