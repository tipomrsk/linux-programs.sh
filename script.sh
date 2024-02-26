#!/bin/bash

# Bash para instalar os programas que uso no sistema, a maioria é flatpak

echo "-------------------------"
echo "-- Instalando FlatPak --"
echo "-------------------------"

apt install flatpak

echo "-------------------------"
echo "-- Instalando Spotify --"
echo "-------------------------"

flatpak install flathub com.spotify.Client -y

echo "-------------------------"
echo "-- Instalando Discord --"
echo "-------------------------"

flatpak install flathub com.discordapp.Discord -y

echo "-------------------------"
echo "-- Instalando Telegram --"
echo "-------------------------"

flatpak install flathub org.telegram.desktop -y

echo "-------------------------"
echo "---- Instalando VLC -----"
echo "-------------------------"

flatpak install flathub org.videolan.VLC -y

echo "-------------------------"
echo "--- Instalando VSCODE ---"
echo "-------------------------"

flatpak install flathub com.visualstudio.code -y

echo "-------------------------"
echo "-- Instalando Postman ---"
echo "-------------------------"

flatpak install flathub com.getpostman.Postman -y

echo "-------------------------"
echo "Instalando Google Chrome"
echo "-------------------------"

flatpak install flathub com.google.Chrome -y

echo "--------------------------"
echo "-- Instalando FlameShot --"
echo "--------------------------"

flatpak install flathub org.flameshot.Flameshot -y

echo "--------------------------"
echo "---- Instalando Docker ---"
echo "--------------------------"

apt install docker.io

echo "--------------------------"
echo "Instalando Docker Compose "
echo "--------------------------"

apt install docker-compose

echo "-----------------------------"
echo "Instalando e Configurando ZSH"
echo "-----------------------------"

echo "Instalando ZSH"
apt install zsh

echo "Instalando Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Baixando e instalando fontes"

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o /usr/share/fonts/MesloLGS\ NF\ Regular.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o /usr/share/fonts/MesloLGS\ NF\ Bold.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o /usr/share/fonts/MesloLGS\ NF\ Italic.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o /usr/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf

echo "Executando o p10k para ser configurado"
p10k configure