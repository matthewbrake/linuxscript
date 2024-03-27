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
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions

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


----------------------------------------------------------------------------

#!/bin/bash

# Install ZSH and necessary plugins
sudo apt update
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting git

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install additional plugins
ZSH_CUSTOM=~/.oh-my-zsh/custom

# Autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Syntax highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Fast syntax highlighting plugin
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Autocomplete plugin
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Update ZSH plugins in .zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc

# Set Zsh as default shell
chsh -s $(which zsh)

# Source the updated .zshrc file
source ~/.zshrc

echo "Zsh, Oh My Zsh, and plugins installed and configured successfully."
