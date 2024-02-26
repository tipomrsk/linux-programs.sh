#!/bin/bash

# Bash para instalar os programas que uso no sistema, a maioria é flatpak

# Função para exibir a mensagem de uso
display_usage() {
    echo "Você precisa fornecer a flag de alguma Distro Linux"
    echo "Exemplo:"
    echo "      sudo bash $0 --manjaro"
    echo "      sudo bash $0 --ubuntu"
    echo "      sudo bash $0 --fedora"
}

# Verifica se o número de argumentos é válido
if [ $# -ne 1 ]; then
    display_usage
    exit 1
fi

# Mapeando os geradores de pacote das distros
declare -A package_manager=(
    ["manjaro"]="pacman -S"
    ["ubuntu"]="apt install -y"
    ["fedora"]="dnf install -y"
)

# Verifica se a distro ta dentro do script
case $1 in
    "--manjaro" | "--ubuntu" | "--fedora")
        DISTRO="${1:2}"  # Remove os primeiros dois caracteres (--)
        ;;
    *)
        # Se nenhum parâmetro válido foi fornecido, exibe mensagem de uso
        display_usage
        exit 1
        ;;
esac

# Pacotes a serem instalados
packages=(
    "flatpak"
    "gnome-tweaks"
    "docker"
    "docker-compose"
    "zsh"
)

# Instala os pacotes para a distribuição selecionada
for package in "${packages[@]}"; do
    echo "-------------------------"
    echo "-- Instalando $package --"
    echo "-------------------------"

    # Executa o comando de instalação correspondente à distribuição
    ${package_manager[$DISTRO]} "$package" -y
done


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

echo "--------------------------"
echo "-- Instalando BeeKeeper --"
echo "--------------------------"

flatpak install flathub io.beekeeperstudio.Studio -y

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


echo "Instalando Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Baixando e instalando fontes"

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o /usr/share/fonts/MesloLGS\ NF\ Regular.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o /usr/share/fonts/MesloLGS\ NF\ Bold.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o /usr/share/fonts/MesloLGS\ NF\ Italic.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o /usr/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf

echo "Executando o p10k para ser configurado"
p10k configure