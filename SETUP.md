# Initial Setup Guide

## Quick Start

After installing stow, run these commands to activate your ghostty configuration:

```bash
cd ~/omarchy-dotfiles

# Backup your existing config (just in case)
cp ~/.config/ghostty/config ~/.config/ghostty/config.backup

# Remove the old config
rm ~/.config/ghostty/config

# Create symlink with stow
stow -v ghostty
```

The `-v` flag shows verbose output so you can see what stow is doing.

## Verification

Check that the symlink was created correctly:

```bash
ls -la ~/.config/ghostty/config
```

You should see output like:
```
lrwxrwxrwx 1 luke luke 52 Nov 11 18:45 /home/luke/.config/ghostty/config -> ../../../omarchy-dotfiles/ghostty/.config/ghostty/config
```

## What Just Happened?

Stow created a symbolic link from `~/.config/ghostty/config` pointing to your dotfiles repository at `~/omarchy-dotfiles/ghostty/.config/ghostty/config`.

Now when you edit the file in either location, you're editing the same file. Your actual config lives in your version-controlled dotfiles repo!

## Next Steps

1. **Initialize git repository** (if not already done):
   ```bash
   cd ~/omarchy-dotfiles
   git init
   git add .
   git commit -m "Initial commit: Add ghostty configuration"
   ```

2. **Add more configurations** following the same pattern:
   - Create package directory structure
   - Move config files
   - Stow the package
   - Commit to git

3. **Push to GitHub** (optional but recommended):
   ```bash
   git remote add origin https://github.com/yourusername/omarchy-dotfiles.git
   git branch -M main
   git push -u origin main
   ```

## Common Omarchy Configs to Add

Consider adding these Omarchy configurations to your dotfiles:

```bash
# Hyprland configs
mkdir -p hypr/.config/hypr
cp ~/.config/hypr/hyprland.conf hypr/.config/hypr/
cp ~/.config/hypr/monitors.conf hypr/.config/hypr/
stow hypr

# Waybar
mkdir -p waybar/.config/waybar
cp ~/.config/waybar/config.jsonc waybar/.config/waybar/
stow waybar

# Walker launcher
mkdir -p walker/.config/walker
cp ~/.config/walker/config.toml walker/.config/walker/
stow walker

# Alacritty terminal (if you use it)
mkdir -p alacritty/.config/alacritty
cp ~/.config/alacritty/alacritty.toml alacritty/.config/alacritty/
stow alacritty

# Bash config
mkdir -p bash
cp ~/.bashrc bash/
stow bash

# XCompose (emoji and autocomplete)
mkdir -p xcompose
cp ~/.XCompose xcompose/
stow xcompose
```

## Troubleshooting

**Error: "WARNING! stowing ghostty would cause conflicts"**

This means a file already exists where stow wants to create a symlink. Remove or backup the existing file first:

```bash
mv ~/.config/ghostty/config ~/.config/ghostty/config.backup
stow ghostty
```

**How do I unstow a package?**

```bash
stow -D packagename
```

**How do I restow (useful after file reorganization)?**

```bash
stow -R packagename
```

**Can I see what stow will do without actually doing it?**

```bash
stow -n -v packagename  # -n for "no" (dry-run)
```

