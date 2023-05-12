#!/bin/bash


# Define color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color


#creating directories
mkdir -p ~/Scripts ~/.themes ~/.icons ~/.local/share/icons ~/Pictures/Wallpapers 
mkdir -p  ~/.local/share/gedit/styles ~/.config/kitty ~/.config/zathura/ ~/.config/Code/User/
mkdir -p ~/.local/share/fonts

#creating a history file for zsh
touch "$HOME/.cache/zshhistory"

#giving execution permission to other scripts:
chmod +x $HOME/Linux_Setup/*.sh

#Take user input to change mysql password 
read -s -p "${GREEN}Enter new password for mysql root user: \n${NC}" new_password


#running the gitclone script:
# gnome-terminal --tab --title="git clone" --command="bash -c '$HOME/Linux_Setup/gitclone.sh; $SHELL'"

sudo apt install curl  #installs curl

#addign repositories 
    #vscode:
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg

    #brave_browser:
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    #virtualbox: 
        wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
        #problem:
        sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" -y
        sudo apt-key export 2980AECF | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/virutalbox.gpg
    
    #nala:
        echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87015F3DA22D980
        sudo apt-key export DA22D980 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/slack.gpg

    #lutris:

    #wine:

sudo apt update && sudo apt upgrade -y
sudo apt install nala -y 

#Installig 
    #packages: 
    while read package; do
    if [ "$package" == "brave-browser" ]; then
        # Install the Brave browser and set it as the default browser
        sudo nala install -y brave-browser gnome-tweaks gnome-shell-extensions
        xdg-settings set default-web-browser brave-browser.desktop
        brave-browser https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep &
        wait
        $HOME/Linux_Setup/visit_sites.sh
        wait
    else
        # Install the package using apt
        sudo nala install -y "$package"
    fi
    done < $HOME/Linux_Setup/packages.txt

#adding flatpack apps repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#mysql setup
sudo mysql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$new_password';
FLUSH PRIVILEGES;
EOF
echo -e "${GREEN}\nMysql root user password updated.\n${NC}"


#installig kitty:
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin  #The binaries will be installed in /home/.local/kitty.app/bin
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/ #create a symlink for it so that we can run it directly using any Terminal
#Those who don’t want to start the Kitty using the existing terminal can create an Application shortcut using the given commands:
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
#To open text and image files in Kitty via FIle manager then also run the given command as well:
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/

#Add Icon:
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

#For Desktop Shortcut:
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/Desktop
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/Desktop/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/Desktop/kitty*.desktop

#Allow-launching of the shortcut:
gio set ~/Desktop/kitty*.desktop metadata::trusted true
chmod a+x ~/Desktop/kitty*.desktop

#setting kitty as the default terminal:
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50
#this gives kitty priority of 50 which is greater than 40 of default gnome-terminal making it the new default terminal


#vscode extensions:
code --install-extension dbaeumer.vscode-eslint
code --install-extension DivyanshuAgrawal.competitive-programming-helper
code --install-extension dracula-theme.theme-dracula
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.code-runner
code --install-extension HTMLHint.vscode-htmlhint
code --install-extension ms-vscode.cpptools
code --install-extension ritwickdey.LiveServer
code --install-extension TabNine.tabnine-vscode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension whizkydee.material-palenight-theme
code --install-extension cweijan.vscode-mysql-client2
code --install-extension catppuccin.catppuccin-vsc


#Configuring the programs to my liking
#keyboard shortcut for xkill:
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Xkill"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "xkill"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary>Escape"

#adb for linux:
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d $HOME/Scripts/
rm platform-tools-latest-linux.zip

#running the cousomization script:
#do customization last because of setting zsh as default
gnome-terminal --tab --title="customization" --command="bash -c '$HOME/Linux_Setup/desktop_customization.sh; $SHELL'"





