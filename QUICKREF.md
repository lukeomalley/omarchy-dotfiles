# Quick Reference Card

## Daily Commands

```bash
# Check status of all packages
./status.sh

# Add a new config to dotfiles
./add-config.sh <package-name> <path-to-config>

# Stow a package (activate config)
stow <package-name>

# Unstow a package (deactivate config)
stow -D <package-name>

# Restow (useful after editing)
stow -R <package-name>
```

## Git Workflow

```bash
# Check what changed
git status

# Add changes
git add .

# Commit changes
git commit -m "Description of changes"

# Push to remote (after setting up)
git push
```

## Adding New Omarchy Configs

### Hyprland (window manager)
```bash
./add-config.sh hypr ~/.config/hypr/hyprland.conf
./add-config.sh hypr ~/.config/hypr/monitors.conf
```

### Waybar (status bar)
```bash
mkdir -p waybar/.config/waybar
cp -r ~/.config/waybar/* waybar/.config/waybar/
rm -rf ~/.config/waybar
stow waybar
```

### Walker (launcher)
```bash
./add-config.sh walker ~/.config/walker/config.toml
```

### Bash
```bash
./add-config.sh bash ~/.bashrc
```

### XCompose (emoji/autocomplete)
```bash
./add-config.sh xcompose ~/.XCompose
```

## Troubleshooting

**Conflicts when stowing?**
```bash
# Backup existing file
mv ~/.config/app/config ~/.config/app/config.backup

# Then stow
stow app
```

**Want to see what stow will do?**
```bash
# Dry run with verbose output
stow -n -v package-name
```

**Need to update after moving files?**
```bash
# Restow to recreate symlinks
stow -R package-name
```

## Important Omarchy Notes

- ✅ DO edit files in `~/.config/`
- ❌ DON'T edit files in `~/.local/share/omarchy/`
- 🔄 After editing `~/.config/uwsm/default`, relaunch Hyprland
- 🔄 After editing `~/.XCompose`, run `omarchy-restart-xcompose`
- 📝 Most configs can be edited via Omarchy menu: `Super + Alt + Space` → Setup → Configs

## File Structure

```
~/omarchy-dotfiles/           # Your dotfiles repo
├── ghostty/                  # Each app is a "package"
│   └── .config/
│       └── ghostty/
│           └── config        # Actual config file
├── add-config.sh             # Helper to add configs
├── status.sh                 # Check stow status
└── README.md                 # Full documentation
```

When you run `stow ghostty`, it creates:
```
~/.config/ghostty/config → ~/omarchy-dotfiles/ghostty/.config/ghostty/config
```

This symlink means editing either location edits the same file!

