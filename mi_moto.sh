#!/data/data/com.termux/files/usr/bin/bash
# MOTO G72 - Centro de Control v7.0
# Autor: Tu nombre aquí
# GitHub: Moto G72 App Store hecho en Termux

CYAN='\033[1;36m'; GREEN='\033[1;32m'; PURPLE='\033[1;35m'; YELLOW='\033[1;33m'; NC='\033[0m'

mkdir -p ~/mis_apps ~/storage/downloads/YouTube

while true; do
clear
echo -e "${CYAN}=== MOTO G72 - Centro de Control v7.0 ===${NC}"
echo -e "${YELLOW}Tu propia App Store sin anuncios${NC}"
echo -e "${PURPLE}-----------------------------${NC}"
echo -e "${GREEN}1)${NC} Info de mi Moto"
echo -e "${GREEN}2)${NC} Bajar ROLA MP3"
echo -e "${GREEN}3)${NC} Bajar VIDEO"
echo -e "${GREEN}4)${NC} Ver mis rolas"
echo -e "${GREEN}5)${NC} Reproducir mis rolas"
echo -e "${GREEN}6)${NC} Ver CONTACTOS"
echo -e "${GREEN}7)${NC} Tomar FOTO"
echo -e "${GREEN}8)${NC} Contar contactos"
echo -e "${GREEN}10)${NC} MIS APPS (Mi App Store)"
echo -e "${GREEN}9)${NC} Salir"
echo -e "${PURPLE}-----------------------------${NC}"
read -p "Elige: " op
case $op in
  1) neofetch --off; read -p "Enter para volver...";;
  2) read -p "Link de YouTube: " l; yt-dlp -x --audio-format mp3 -P ~/storage/downloads/YouTube "$l"; read -p "Enter...";;
  3) read -p "Link de YouTube: " l; yt-dlp -P ~/storage/downloads/YouTube "$l"; read -p "Enter...";;
  4) ls -lh ~/storage/downloads/YouTube; read -p "Enter...";;
  5) mpv ~/storage/downloads/YouTube; read -p "Enter...";;
  6) termux-contact-list | grep '"name"'; read -p "Enter...";;
  7) F=~/storage/DCIM/MOTO_$(date +%s).jpg; termux-camera-photo -c 0 $F; termux-media-scan $F; echo "Foto guardada: $F"; read -p "Enter...";;
  8) echo "Total: $(termux-contact-list | grep -c '"name"') contactos"; read -p "Enter...";;
  10)
    clear
    echo "=== TUS APPS INSTALADAS ==="
    ls ~/mis_apps/
    echo ""
    read -p "Que app quieres abrir: " app
    if [ -f ~/mis_apps/$app ]; then
      bash ~/mis_apps/$app
    else
      echo "No existe esa app"
      sleep 1
    fi
    ;;
  9) clear; echo "¡Hasta luego!"; break ;;
esac
done
