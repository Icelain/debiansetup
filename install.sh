# pop os / ubuntu setup script
# no particular order just works

mkdir ~/.fonts
mkdir ~/.local/bin

sudo apt update && sudo apt upgrade
sudo apt remove libreoffice-bin libreoffice-calc libreoffice-impress libreoffice-writer geary 
sudo apt purge totem
sudo apt autoremove

sudo apt install discord thunar celluloid zsh

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

cd ~/.fonts && wget https://github.com/pavel/agave-code/raw/master/AgaveCode.ttf
cd 

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#install go
curl -fsSLo- https://s.id/golang-linux | bash

#install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
