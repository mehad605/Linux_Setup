#!/bin/bash



# Define color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color


#if nala is not installed install nala:
if ! dpkg-query -W "nala" >/dev/null 2>&1; then
    echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87015F3DA22D980
    sudo apt-key export DA22D980 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/slack.gpg
    sudo apt install nala -y 
else
    echo "nala is already installed."
fi

#installation:
packages=(
gnome-tweaks
gnome-shell-extensions
dconf-editor
libsass1 
sassc
git
chrome-gnome-shell)
for package in "${packages[@]}"
do
    sudo nala install $package -y
done


#directory creation
mkdir -p ~/.themes ~/.icons ~/.local/share/icons ~/.local/share/fonts ~/.local/share/gnome-shell/extensions ~/Scripts
mkdir -p $HOME/.local/share/gedit/styles $HOME/.config/zathura/ $HOME/.config/kitty/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/Scripts/powerlevel10k
git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes $HOME/Scripts/Top-Bootloader-Themes
git clone https://github.com/linuxdotexe/nordic-wallpapers $HOME/Pictures/Wallpapers/Nordic_Wallpapers

#cloning shell themes:
git clone https://github.com/vinceliuice/Layan-gtk-theme $HOME/Layan-gtk-theme
git clone https://github.com/vinceliuice/Orchis-theme $HOME/Orchis-theme
git clone https://github.com/EliverLara/Sweet.git $HOME/.themes/Sweet

#the mocha theme:
git clone --depth=1 https://github.com/lime-desu/MochaTheme.git ~/.themes/MochaTheme
mv ~/.themes/MochaTheme/* ~/.themes/
#mocha done

$HOME/Layan-gtk-theme/install.sh
$HOME/Orchis-theme/install.sh


#cloning folder icons:
git clone https://github.com/yeyushengfan258/Reversal-icon-theme $HOME/Reversal-icon-theme
git clone https://github.com/vinceliuice/Tela-circle-icon-theme $HOME/Tela-circle-icon-theme
$HOME/Reversal-icon-theme/install.sh -green
$HOME/Reversal-icon-theme/install.sh -blue
$HOME/Reversal-icon-theme/install.sh -red
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt-get update
sudo nala install papirus-icon-theme -y

#cloning cursors:
git clone https://github.com/vinceliuice/Vimix-cursors $HOME/Vimix-cursors
mv $HOME/Vimix-cursors/dist-white $HOME/Vimix-cursors/Vimix-cursors-white
mv $HOME/Vimix-cursors/dist $HOME/Vimix-cursors/Vimix-cursors
mv $HOME/Vimix-cursors/Vimix-cursors-white ~/.icons
mv $HOME/Vimix-cursors/Vimix-cursors ~/.icons


mv $HOME/Linux_Setup/Cappuccin_Wallpapers $HOME/Pictures/Wallpapers/
mv $HOME/Linux_Setup/gedit_themes/* $HOME/.local/share/gedit/styles
mv $HOME/Linux_Setup/Fonts/* $HOME/.local/share/fonts
mv $HOME/Linux_Setup/settings.json $HOME/.config/Code/User/
mv $HOME/Linux_Setup/Zathura/zathurarc $HOME/.config/zathura/
mv $HOME/Linux_Setup/Kitty/* $HOME/.config/kitty/
mv $HOME/Linux_Setup/.zshrc $HOME
mv $HOME/Linux_Setup/grubtheme.sh $HOME/Scripts/Top-Bootloader-Themes/
mv $HOME/Linux_Setup/bootloader_themes/dedsec $HOME/Scripts/Top-Bootloader-Themes/themes/


echo 'source ~/Scripts/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
chsh -s $(which zsh) #changes the default shell to zsh for current user


#remove section
sudo rm -r ~/.themes/MochaTheme
sudo rm -r ~/Layan-gtk-theme ~/Orchis-theme $HOME/.themes/Layan $HOME/.themes/Layan-Solid $HOME/.themes/Layan-Light-Solid $HOME/.themes/Layan-Light
sudo rm -r $HOME/.themes/Orchis $HOME/.themes/Orchis-Compact $HOME/.themes/Orchis-Dark-Compact $HOME/.themes/Orchis-Light-Compact $HOME/.themes/Orchis-Light
sudo rm -r ~/Reversal-icon-theme
sudo rm -r ~/Vimix-cursors



#gsettings
# gsettings set org.gnome.desktop.session idle-delay 240 #after 240 seconds you have to log in again
# #The following two commands make it so in ac after 10 minutes of inactivity it goes to sleep :
# #To prevent sleep instead of sleep write nothing and comment out the second line
# gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
# gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
# gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 600
# gsettings set org.gnome.desktop.interface gtk-theme "Sweet"
# gsettings set org.gnome.desktop.wm.preferences theme "Sweet"
# gsettings set org.gnome.desktop.interface icon-theme "Reversal-green-dark"
# gsettings set org.gnome.desktop.interface cursor-theme "Vimix-cursors"
# gsettings set org.gnome.desktop.interface show-battery-percentage 'true'
# gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
# gsettings set org.gnome.shell.extensions.dash-to-dock extend-height 'false'
# gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity '0.7'
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed 'false'
# gsettings set org.gnome.shell.extensions.dash-to-dock intellihide 'true'
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
# gsettings set org.gnome.shell.extensions.user-theme name "Sweet"
# gsettings set org.gnome.desktop.interface clock-format 12h
dconf load /org/gnome/ < $HOME/Linux_Setup/gnome-backup.txt
gsettings set org.gnome.desktop.background picture-uri 'file:///$HOME/Pictures/Cappuccin_Wallpapers/spooky_spill.jpg'

echo -e "${GREEN}After restart launch kitty for first time setup${NC}\n"




