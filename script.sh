#!/bin/bash

# Bash para instalar os programas que uso no sistema, a maioria é flatpak

# Função para exibir a mensagem de uso
display_usage() {
    echo "Você precisa fornecer a flag de alguma Distro Linux"
    echo "Exemplo:"
    echo "      sudo bash $0 --manjaro"
    echo "      sudo bash $0 --ubuntu"
    echo "      sudo bash $0 --fedora"
    echo "Eu sei que na real seria --arch, mas como eu não vou instalar o arch, coloquei manjaro mesmo. :)"
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


# Adiciona apps do flathub
# Array de aplicativos com detalhes de nome e identificador
declare -A applications=(
    ["Spotify"]="com.spotify.Client"
    ["Discord"]="com.discordapp.Discord"
    ["Telegram"]="org.telegram.desktop"
    ["VLC"]="org.videolan.VLC"
    ["VSCode"]="com.visualstudio.code"
    ["BeeKeeper"]="io.beekeeperstudio.Studio"
    ["Postman"]="com.getpostman.Postman"
    ["Google Chrome"]="com.google.Chrome"
    ["FlameShot"]="org.flameshot.Flameshot"
)

# Itera sobre cada aplicativo e instala utilizando Flatpak
for app_name in "${!applications[@]}"; do
    app_id="${applications[$app_name]}"
    
    echo "-------------------------"
    echo "-- Instalando $app_name --"
    echo "-------------------------"
    
    flatpak install flathub "$app_id" -y
done


# Configurações para o ZSH
echo "--------------------"
echo "Instalando Oh My ZSH"
echo "--------------------"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "----------------------------"
echo "Baixando e instalando fontes"
echo "----------------------------"

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o /usr/share/fonts/MesloLGS\ NF\ Regular.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o /usr/share/fonts/MesloLGS\ NF\ Bold.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o /usr/share/fonts/MesloLGS\ NF\ Italic.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o /usr/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf




echo "----------------------"
echo "- ZSH Autossugestion -"
echo "----------------------"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "----------------------"
echo "--- ZSH Highlights ---"
echo "----------------------"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo "----------------------"
echo "---- Executa p10k ----"
echo "----------------------"
p10k configure

echo "---------------------"
echo "--- Configura ZSH ---"
echo "---------------------"

cp .zshrc ~/.zshrc