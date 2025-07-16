#!/bin/bash

# Colors and Emojis
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"
CHECK="✅"
CROSS="❌"
INFO=">> "
WARN="❗"

# Repository details
REPO_URL="https://kelexine.github.io/kelexine-labs"
KEY_URL="https://raw.githubusercontent.com/kelexine/kelexine-labs/main/gpg_public_key.asc"
SOURCES_LIST_DIR="$PREFIX/etc/apt/sources.list.d"
SOURCES_LIST_FILE="$SOURCES_LIST_DIR/kelexine-labs.list"
KEYRING_DIR="$PREFIX/etc/apt/trusted.gpg.d"
KEYRING_FILE="$KEYRING_DIR/kelexine-labs.gpg"

# Function to handle errors
handle_error() {
  echo -e "\n${RED}${CROSS} Error: $1${RESET}"
  exit 1
}

# Header
echo -e "${BLUE}========================================${RESET}"
echo -e "${GREEN}   Kelexine Labs Repo Installer   ${RESET}"
echo -e "${BLUE}========================================${RESET}"
echo -e "${INFO}This script will add the Kelexine Labs repository and its GPG key.${RESET}"
echo ""

# --- SCRIPT START ---

# 1. Install dependencies
echo -e "${YELLOW}${INFO}Installing required packages (gnupg, curl)...${RESET}"
pkg install gnupg curl -y > /dev/null 2>&1 || handle_error "Failed to install dependencies."
echo -e "${GREEN}${CHECK} Dependencies installed successfully!${RESET}"
echo ""

# 2. Create necessary directories
echo -e "${YELLOW}${INFO}Creating repository directories...${RESET}"
mkdir -p "$SOURCES_LIST_DIR" || handle_error "Failed to create sources directory."
mkdir -p "$KEYRING_DIR" || handle_error "Failed to create keyring directory."
echo -e "${GREEN}${CHECK} Directories are ready.${RESET}"
echo ""

# 3. Download and add the GPG key
echo -e "${YELLOW}${INFO}Adding repository GPG key...${RESET}"
curl -sL "$KEY_URL" | gpg --dearmor > "$KEYRING_FILE" || handle_error "Failed to download or de-armor GPG key."
echo -e "${GREEN}${CHECK} GPG key added successfully!${RESET}"
echo ""

# 4. Add the repository to sources.list
echo -e "${YELLOW}${INFO}Adding Kelexine Labs repository...${RESET}"
echo "deb [signed-by=${KEYRING_FILE}] ${REPO_URL} kelexine main" > "$SOURCES_LIST_FILE" || handle_error "Failed to add repository to sources list."
echo -e "${GREEN}${CHECK} Repository added successfully!${RESET}"
echo ""

# 5. Update package repositories
echo -e "${YELLOW}${INFO}Updating package repositories...${RESET}"
pkg update -y > /dev/null 2>&1 || handle_error "Failed to update repositories. Please check your connection."
echo -e "${GREEN}${CHECK} Repositories updated successfully!${RESET}"
echo ""

# --- SCRIPT END ---

# Success message
echo -e "${BLUE}========================================${RESET}"
echo -e "${GREEN}   Kelexine Labs Setup Complete!    ${RESET}"
echo -e "${BLUE}========================================${RESET}"
echo -e "${INFO}You can now install packages, for example:${RESET}"
echo -e "  ${YELLOW}pkg install termux-info${RESET}"
