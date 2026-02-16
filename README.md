# Claude Code Configuration

Personal Claude Code settings optimized for fast CRUD application development with quality safeguards.

## 🚀 Features

### Auto-Approval Settings
No prompts for safe operations to maximize development speed:
- ✅ All file operations (Read, Edit, Write, Glob, Grep)
- ✅ Safe git commands (status, diff, log, add, commit)
- ✅ Build and test commands
- ✅ Database operations (Prisma)
- 🛡️ Still prompts for destructive operations (push, force-push, rm -rf, etc.)

### Intelligent Agents

| Agent | Auto-Run | Purpose |
|-------|----------|---------|
| **code-integration-reviewer** | ✅ Always | Checks code consistency after changes |
| **build-validator** | ✅ Auto | Validates builds on complex projects |
| **performance-optimizer** | ✅ Auto | Identifies performance issues proactively |
| **refactoring-specialist** | 🎯 On-demand | Handles complex refactoring tasks |

## 📦 Installation

### Fresh Install
```bash
# Clone this repo
git clone git@github.com:YOUR_USERNAME/claude-dotfiles.git ~/dotfiles

# Run install script
cd ~/dotfiles
./install.sh
```

### Update Existing Config
```bash
cd ~/dotfiles
git pull
./install.sh
```

## 🔧 Configuration Files

### `settings.json`
Global settings including:
- Effort level: `high` for better quality
- Enabled plugins (GitHub, Context7)
- Agent configurations

### `settings.local.example.json`
Template for machine-specific settings:
- Auto-approved command patterns
- Local tool paths (customize for your machine)

**Note:** Copy to `~/.claude/settings.local.json` and customize for each machine.

### `agents/`
Custom agent definitions:

#### code-integration-reviewer
Automatically runs after code changes to ensure consistency with existing patterns.

#### build-validator
Validates builds and catches errors before commit. Auto-runs on:
- Multi-file changes
- Dependency updates
- Configuration changes
- Before complex refactors

**Manual trigger:** "Use build-validator to check my changes"

#### performance-optimizer
Identifies and fixes performance bottlenecks. Auto-runs when detecting:
- Database query patterns
- Large component changes
- API endpoint modifications

**Manual trigger:** "Use performance-optimizer to check this query"

#### refactoring-specialist
Handles complex refactoring tasks. Manual only to give you full control.

**Manual trigger:** "Use refactoring-specialist to extract this component"

## 💡 Usage Examples

### Automatic Workflow
```bash
# You work on a feature
$ "Add user management CRUD"

# Claude creates the feature
# → code-integration-reviewer automatically checks consistency
# → build-validator runs to ensure no build errors
# → performance-optimizer checks for common issues

# Claude prompts you:
# "✅ Feature complete. Would you like me to run build-validator
#     and performance-optimizer to verify everything?"
```

### Manual Agent Invocation
```bash
# Trigger specific agents
$ "Use build-validator before I commit"
$ "Use performance-optimizer on the user list query"
$ "Use refactoring-specialist to split this component"
```

### Task Completion Prompts
After completing a set of tasks, Claude will automatically prompt:
```
✅ Tasks complete! Recommended next steps:
   [ ] Run build-validator to check for errors?
   [ ] Run performance-optimizer to check for issues?
   [ ] Review changes and commit?
```

## 🔄 Syncing Across Machines

### Initial Setup on New Machine
```bash
# Clone your dotfiles
git clone git@github.com:YOUR_USERNAME/claude-dotfiles.git ~/dotfiles

# Install
cd ~/dotfiles
./install.sh

# Customize local settings
cp settings.local.example.json ~/.claude/settings.local.json
# Edit ~/.claude/settings.local.json with machine-specific paths
```

### Updating Settings
```bash
# On any machine - make changes in ~/.claude/
# Then sync to repo:
cd ~/dotfiles
./sync.sh

# On other machines:
cd ~/dotfiles
git pull
./install.sh
```

## 📝 Customization

### Adding Machine-Specific Commands
Edit `~/.claude/settings.local.json`:
```json
{
  "permissions": {
    "allow": [
      "Bash(your-custom-command:*)"
    ]
  }
}
```

### Creating Custom Agents
```bash
# Create new agent file
nano ~/.claude/agents/my-agent.md

# Enable in settings.json
# Then sync:
cd ~/dotfiles
./sync.sh
```

### Adjusting Auto-Run Behavior
Edit `settings.json`:
```json
{
  "agents": {
    "agent-name": {
      "enabled": true,
      "runProactively": false  // Change to true/false
    }
  }
}
```

## 🛠️ Maintenance

### Update from Remote
```bash
cd ~/dotfiles
git pull
./install.sh
```

### Backup Current Settings
```bash
cd ~/dotfiles
./sync.sh  # Copies from ~/.claude/ to repo
git add .
git commit -m "Update settings"
git push
```

### Remove Symlinks (Uninstall)
```bash
cd ~/dotfiles
./uninstall.sh
```

## 📂 File Structure
```
~/dotfiles/
├── README.md                      # This file
├── settings.json                  # Global settings
├── settings.local.example.json    # Machine-specific template
├── agents/                        # Custom agents
│   ├── code-integration-reviewer.md
│   ├── build-validator.md
│   ├── performance-optimizer.md
│   └── refactoring-specialist.md
├── install.sh                     # Install script
├── sync.sh                        # Sync from ~/.claude/
└── uninstall.sh                   # Remove symlinks
```

## 🎯 Philosophy

**Balance speed with quality:**
- Auto-approve safe operations (no friction)
- Auto-run quality checks (catch issues early)
- Prompt for verification (stay in control)
- Manual refactoring (deliberate changes)

**Optimized for:**
- CRUD applications
- Rapid iteration
- Team consistency
- Performance-conscious development

## 🆘 Troubleshooting

### Settings not applying
```bash
# Restart Claude Code or reload config
# Check symlinks
ls -la ~/.claude/settings.json
```

### Agents not running
Check `settings.json`:
```json
{
  "agents": {
    "agent-name": {
      "enabled": true  // Make sure this is true
    }
  }
}
```

### Machine-specific paths failing
Update `~/.claude/settings.local.json` with correct paths for your machine.

## 📜 License

MIT - Use however you want!
