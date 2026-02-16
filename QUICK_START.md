# Quick Start Guide

## ✅ What's Been Configured

### Auto-Approvals (No Prompts)
- All file operations (Read, Edit, Write, Glob, Grep)
- Safe git commands (status, diff, log, add, commit)
- Build, test, dev commands
- Prisma operations

### Agents Running Automatically
| Agent | When It Runs |
|-------|--------------|
| **code-integration-reviewer** | After any code changes |
| **build-validator** | After 3+ file changes, dependency updates |
| **performance-optimizer** | After query/API/component changes |

### After Task Completion
You'll see prompts like:
```
✅ Feature complete!

Recommended checks:
  → Run build-validator to verify no errors?
  → Run performance-optimizer to check queries?
  → Ready to commit?
```

## 🚀 Common Workflows

### Building a Feature
```
You: "Add user profile editing"
→ I build it
→ code-integration-reviewer checks consistency
→ build-validator verifies it builds
→ performance-optimizer checks queries
→ I prompt you: "Ready to commit?"
```

### Manual Agent Use
```
You: "Use build-validator before I commit"
You: "Use performance-optimizer on the dashboard"
You: "Use refactoring-specialist to extract UserForm"
```

## 🔄 Syncing Across Machines

### On This Machine (Already Done)
```bash
cd ~/Developer/claude-dotfiles
./sync.sh  # Copy from ~/.claude/ to repo
git push   # Push changes
```

### On New Machine
```bash
git clone https://github.com/bvergara87/claude-dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 📍 File Locations

**Dotfiles Repo:** `~/Developer/claude-dotfiles/`
**Active Config:** `~/.claude/` (symlinked to dotfiles)
**GitHub Repo:** https://github.com/bvergara87/claude-dotfiles

## 🎯 Quick Commands

```bash
# Update agents/settings
cd ~/Developer/claude-dotfiles
./sync.sh
git add .
git commit -m "Update config"
git push

# Pull changes on another machine
cd ~/dotfiles
git pull
./install.sh
```

## 💡 Tips

1. **Speed mode**: All safe operations auto-approved
2. **Quality checks**: Agents run automatically on complex work
3. **Stay in control**: Prompted for destructive operations
4. **Sync anywhere**: Push changes, pull on other machines
