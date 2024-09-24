#!/bin/bash

sudo apt install zsh -y
# Install oh-my-zsh.
0>/dev/null sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export ZSH_CUSTOM
# Configure plugins.
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM}"/plugins/zsh-history-substring-search
sudo apt install thefuck autojump -y
sed -i 's/^plugins=.*/plugins=(git\n extract\n thefuck\n autojump\n jsontools\n colored-man-pages\n zsh-autosuggestions\n zsh-syntax-highlighting\n zsh-history-substring-search\n you-should-use\n nvm\n debian)/g' ~/.zshrc
# Enable nvm plugin feature to automatically read `.nvmrc` to toggle node version.
sed -i "1s/^/zstyle ':omz:plugins:nvm' autoload yes\n/" ~/.zshrc
# Install powerlevel10k and configure it.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}"/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
# Move ".zcompdump-*" file to "$ZSH/cache" directory.
sed -i -e '/source \$ZSH\/oh-my-zsh.sh/i export ZSH_COMPDUMP=\$ZSH\/cache\/.zcompdump-\$HOST' ~/.zshrc
# Configure the default ZSH configuration for new users.
sudo cp ~/.zshrc /etc/skel/
sudo cp ~/.p10k.zsh /etc/skel/
sudo cp -r ~/.oh-my-zsh /etc/skel/
sudo chmod -R 755 /etc/skel/
sudo chown -R root:root /etc/skel/


#### FONTS NERD FONT INSTALL
## V1
# Download the Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
# Unzip the downloaded file
unzip Meslo.zip -d Meslo
# Create the font directory if it doesn't exist
mkdir -p ~/.local/share/fonts
# Move the fonts to the local font directory
mv Meslo/*.ttf ~/.local/share/fonts/
# Remove the zip file and the unzipped folder
rm Meslo.zip
rm -r Meslo
# Update the font cache
fc-cache -fv
echo "Nerd Fonts installed successfully!"

## V1.2 
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
