#!/bin/bash

# GNU Stow Installation Script
# Installs stow for managing dotfiles with symlinks

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}📦 Installing GNU Stow...${NC}"

# Check if stow is already installed
if command -v stow &> /dev/null; then
    echo -e "${GREEN}✓${NC} GNU Stow is already installed"
    stow --version | head -1
    exit 0
fi

# Install stow via yay (Omarchy comes with yay pre-installed)
echo -e "${YELLOW}→${NC} Installing stow via yay..."
yay -S --noconfirm stow

# Verify installation
if command -v stow &> /dev/null; then
    echo -e "${GREEN}✓${NC} GNU Stow installed successfully!"
    stow --version | head -1
else
    echo -e "${RED}✗${NC} GNU Stow installation failed"
    exit 1
fi

