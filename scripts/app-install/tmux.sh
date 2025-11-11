#!/bin/bash

# Tmux Installation Script
# Installs tmux and Tmux Plugin Manager (TPM)

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}📦 Installing Tmux...${NC}"

# Check if tmux is already installed
if command -v tmux &> /dev/null; then
    echo -e "${GREEN}✓${NC} Tmux is already installed"
    tmux -V
else
    # Check if yay is installed
    if ! command -v yay &> /dev/null; then
        echo -e "${RED}Error: yay is not installed${NC}"
        echo "Please install yay first:"
        echo "  git clone https://aur.archlinux.org/yay.git"
        echo "  cd yay"
        echo "  makepkg -si"
        exit 1
    fi
    
    # Install tmux via yay (works for official repos too, no sudo needed)
    echo -e "${YELLOW}→${NC} Installing tmux via yay..."
    yay -S --noconfirm tmux
    
    if command -v tmux &> /dev/null; then
        echo -e "${GREEN}✓${NC} Tmux installed successfully!"
        tmux -V
    else
        echo -e "${RED}✗${NC} Tmux installation failed"
        exit 1
    fi
fi

# Install Tmux Plugin Manager (TPM)
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
    echo -e "${GREEN}✓${NC} TPM is already installed"
else
    echo -e "${YELLOW}→${NC} Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    
    if [ -d "$TPM_DIR" ]; then
        echo -e "${GREEN}✓${NC} TPM installed successfully!"
    else
        echo -e "${RED}✗${NC} TPM installation failed"
        exit 1
    fi
fi

echo ""
echo -e "${GREEN}======================================"
echo "Tmux Installation Complete! 🎉"
echo -e "======================================${NC}"
echo ""
echo "Next steps:"
echo "  1. Make sure tmux config is stowed (run: cd ~/omarchy-dotfiles && stow tmux)"
echo "  2. Start tmux: tmux"
echo "  3. Install plugins: Press Ctrl+Space + I (capital i)"
echo ""

