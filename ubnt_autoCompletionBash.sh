#!/bin/bash

# Step 1: Add universe repository
echo "Adding universe repository..."
sudo add-apt-repository universe

# Step 2: Update package lists
echo "Updating package lists..."
sudo apt update

# Step 3: Install Zsh and plugins
echo "Installing Zsh and plugins..."
sudo apt install -y zsh zsh-syntax-highlighting zsh-autosuggestions

# Step 4: Change default shell to Zsh
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Step 5: Configure Zsh plugins in .zshrc
echo "Configuring Zsh plugins in .zshrc..."
cp ~/.zshrc ~/.zshrcbackup
echo "source $(dpkg -L zsh-autosuggestions | grep 'zsh$')" | tee -a ~/.zshrc
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" | tee -a ~/.zshrc

# Step 6: Source the updated .zshrc file
echo "Sourcing the updated .zshrc file..."
source ~/.zshrc

echo "Zsh installation and configuration completed successfully."
