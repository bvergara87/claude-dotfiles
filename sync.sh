#!/bin/bash

set -e

echo "🔄 Syncing Claude Code configuration from ~/.claude/ to dotfiles repo..."

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLAUDE_DIR="$HOME/.claude"

# Check if .claude directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "❌ Error: ~/.claude/ directory not found"
    exit 1
fi

# Copy settings files
if [ -f "$CLAUDE_DIR/settings.json" ]; then
    cp "$CLAUDE_DIR/settings.json" "$DOTFILES_DIR/settings.json"
    echo "✅ Copied settings.json"
else
    echo "⚠️  settings.json not found in ~/.claude/"
fi

if [ -f "$CLAUDE_DIR/settings.local.json" ]; then
    cp "$CLAUDE_DIR/settings.local.json" "$DOTFILES_DIR/settings.local.example.json"
    echo "✅ Copied settings.local.json as example"
fi

# Copy agents directory
if [ -d "$CLAUDE_DIR/agents" ]; then
    rm -rf "$DOTFILES_DIR/agents"
    cp -r "$CLAUDE_DIR/agents" "$DOTFILES_DIR/agents"
    echo "✅ Copied agents directory"
else
    echo "⚠️  agents directory not found in ~/.claude/"
fi

echo ""
echo "✨ Sync complete!"
echo ""
echo "Changes ready to commit:"
git -C "$DOTFILES_DIR" status --short
echo ""
echo "Next steps:"
echo "  cd $DOTFILES_DIR"
echo "  git add ."
echo "  git commit -m 'Update Claude config'"
echo "  git push"
echo ""
