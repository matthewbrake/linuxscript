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

# Enable?
# zshrc

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

# Edit file 
# Plugins included in this file
# sudo nano ~/.zshrc
# add the following # plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)
# reload shell source ~/.zshrc

# Unnstall zshrc
# rm -rf ~/.zsh/ # and any other foler then apt remove zshrc
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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/plugins/zsh-syntax-highlighting

# Fast syntax highlighting plugin
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Autocomplete plugin
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# second auto somplete newer
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# Update ZSH plugins in .zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc

# Set Zsh as default shell
chsh -s $(which zsh)

# Source the updated .zshrc file
source ~/.zshrc

# Manual
# zshrc or zsh to start shell 

echo "Zsh, Oh My Zsh, and plugins installed and configured successfully."



########################### DIETPI ####################################


ADD BELOW TO ~/.alias
# DietPi-Globals: dietpi-* aliases, G_* functions and variables
. /boot/dietpi/func/dietpi-globals || { echo -e '[\e[31mFAILED\e[0m] DietPi-Login | Failed to load DietPi-Globals. Skipping DietPi login scripts...'; return 1; }

# Aliases
# - sudo alias that allows running other aliases with "sudo": https://github.com/MichaIng/DietPi/issues/424
alias sudo='sudo '
# - DietPi programs
alias dietpi-letsencrypt='/boot/dietpi/dietpi-letsencrypt'
alias dietpi-autostart='/boot/dietpi/dietpi-autostart'
alias dietpi-cron='/boot/dietpi/dietpi-cron'
alias dietpi-launcher='/boot/dietpi/dietpi-launcher'
alias dietpi-cleaner='/boot/dietpi/dietpi-cleaner'
alias dietpi-morsecode='/boot/dietpi/dietpi-morsecode'
alias dietpi-sync='/boot/dietpi/dietpi-sync'
alias dietpi-backup='/boot/dietpi/dietpi-backup'
alias dietpi-bugreport='/boot/dietpi/dietpi-bugreport'
alias dietpi-services='/boot/dietpi/dietpi-services'
alias dietpi-config='/boot/dietpi/dietpi-config'
alias dietpi-software='/boot/dietpi/dietpi-software'
alias dietpi-update='/boot/dietpi/dietpi-update'
alias dietpi-drive_manager='/boot/dietpi/dietpi-drive_manager'
alias dietpi-logclear='/boot/dietpi/func/dietpi-logclear'
alias dietpi-survey='/boot/dietpi/dietpi-survey'
alias dietpi-explorer='/boot/dietpi/dietpi-explorer'
alias dietpi-banner='/boot/dietpi/func/dietpi-banner'
alias dietpi-justboom='/boot/dietpi/misc/dietpi-justboom'
alias dietpi-led_control='/boot/dietpi/dietpi-led_control'
alias dietpi-wifidb='/boot/dietpi/func/dietpi-wifidb'
alias dietpi-optimal_mtu='/boot/dietpi/func/dietpi-optimal_mtu'
alias dietpi-cloudshell='/boot/dietpi/dietpi-cloudshell'
alias dietpi-nordvpn='G_DIETPI-NOTIFY 1 "DietPi-NordVPN has been renamed to DietPi-VPN. Please use the \"dietpi-vpn\" command."'
alias dietpi-vpn='/boot/dietpi/dietpi-vpn'
alias dietpi-ddns='/boot/dietpi/dietpi-ddns'
alias cpu='/boot/dietpi/dietpi-cpuinfo'
# - Optional DietPi software aliases
[[ -d '/mnt/dietpi_userdata/sonarr' || -d '/mnt/dietpi_userdata/radarr' || -d '/mnt/dietpi_userdata/lidarr' ]] && alias dietpi-arr_to_RAM='/boot/dietpi/misc/dietpi-arr_to_RAM'
command -v kodi > /dev/null && alias startkodi='/boot/dietpi/misc/start_kodi'
[[ -f '/usr/games/opentyrian/run' ]] && alias opentyrian='/usr/games/opentyrian/run'
[[ -f '/mnt/dietpi_userdata/dxx-rebirth/run.sh' ]] && alias dxx-rebirth='/mnt/dietpi_userdata/dxx-rebirth/run.sh'
# - 1337 moments ;)
alias 1337='echo "Indeed, you are =)"'

# "G_DIETPI-NOFITY -2 message" starts a process animation. If scripts fail to kill the animation, e.g. cancelled by user, terminal bash prompt has to do it as last resort.
[[ $PROMPT_COMMAND == *'dietpi-process.pid'* ]] || PROMPT_COMMAND="[[ -w '/tmp/dietpi-process.pid' ]] && rm -f /tmp/dietpi-process.pid &> /dev/null && echo -ne '\r\e[J'; $PROMPT_COMMAND"


# DietPi-Login: First run setup, autostarts and login banner
# - Prevent call if $G_DIETPI_LOGIN has been set. E.g. when shell is called as subshell of G_EXEC or dietpi-login itself, we don't want autostart programs to be launched.
[[ $G_DIETPI_LOGIN ]] || /boot/dietpi/dietpi-login





#### NEW #####
#!/bin/bash

# Define the user variable
USER="your_username"

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install Zsh
sudo apt-get install -y zsh

# Change the default shell to Zsh for the specified user
sudo chsh -s /bin/zsh $USER

# Install Oh My Zsh for the specified user
sudo -u $USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Define the Zsh custom directory
ZSH_CUSTOM="/home/$USER/.oh-my-zsh/custom"

# Install Powerlevel10k theme
sudo -u $USER git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

# Update .zshrc to use Powerlevel10k theme
sudo -u $USER sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' /home/$USER/.zshrc

# Install Zsh Autosuggestions plugin
sudo -u $USER git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

# Install Zsh Syntax Highlighting plugin
sudo -u $USER git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# Update .zshrc to include the preferred plugins
sudo -u $USER sed -i 's/plugins=(.*)/plugins=(git history common-aliases zsh-autosuggestions zsh-syntax-highlighting)/' /home/$USER/.zshrc

# Print completion message
echo "Zsh and Oh My Zsh have been installed and configured for user $USER. Please restart your terminal."



add 
source "$HOME/.aliases" somewhere around the top of the ~/.zshrc file and
