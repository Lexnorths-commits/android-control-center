#!/data/data/com.termux/files/usr/bin/bash
# =================================================
# ANDROID CONTROL CENTER v8.0 - UNIVERSAL EDITION
# Autor: GRAND LEXNORTHS / IAFRIEND / 1984FRIENDSTEAM
# Team: 1984FRIENDSTEAM
# Compatible: Cualquier Android con Termux
# Descripción: Tu propia App Store para Android
# =================================================

CYAN='\033[1;36m'; GREEN='\033[1;32m'; PURPLE='\033[1;35m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Detecta que Android es
MODEL=$(getprop ro.product.model 2>/dev/null || echo "Android Device")
ANDROID_VER=$(getprop ro.build.version.release 2>/dev/null || echo "")

mkdir -p ~/mis_apps ~/storage/downloads/YouTube

while true; do
clear
echo -e "${CYAN}=== ANDROID CONTROL CENTER v8.0 ===${NC}"
echo -e "${YELLOW}Universal - Funciona en cualquier Android${NC}"
echo -e "${GREEN}Device: $MODEL | Android $ANDROID_VER${NC}"
echo -e "${PURPLE}By GRAND LEXNORTHS / 1984FRIENDSTEAM${NC}"
echo -e "${PURPLE}--------------------------------${NC}"
echo -e "${GREEN}1)${NC} Info del Sistema"
echo -e "${GREEN}2)${NC} Bajar MP3 YouTube"
echo -e "${GREEN}3)${NC} Bajar VIDEO YouTube"
echo -e "${GREEN}4)${NC} Mis Descargas"
echo -e "${GREEN}5)${NC} Reproducir Musica"
echo -e "${GREEN}6)${NC} Ver Contactos"
echo -e "${GREEN}7)${NC} Tomar Foto"
echo -e "${GREEN}8)${NC} Mis Apps Instaladas (App Store)"
echo -e "${GREEN}9)${NC} Salir"
echo -e "${PURPLE}--------------------------------${NC}"
read -p "Elige: " op
case $op in
  1) clear; neofetch --off 2>/dev/null || (echo "Device: $MODEL"; echo "Android: $ANDROID_VER"; uname -a; free -h; df -h | head -5); read -p "Enter para volver...";;
  2) read -p "Link YouTube: " l; yt-dlp -x --audio-format mp3 -P ~/storage/downloads/YouTube "$l"; read -p "Enter...";;
  3) read -p "Link YouTube: " l; yt-dlp -P ~/storage/downloads/YouTube "$l"; read -p "Enter...";;
  4) ls -lh ~/storage/downloads/YouTube; read -p "Enter...";;
  5) mpv ~/storage/downloads/YouTube; read -p "Enter...";;
  6) termux-contact-list | grep '"name"' | head -20; read -p "Enter...";;
  7) F=~/storage/DCIM/ANDROID_$(date +%s).jpg; termux-camera-photo -c 0 $F 2>/dev/null && termux-media-scan $F && echo "Foto guardada: $F" || echo "Permiso de camara requerido"; read -p "Enter...";;
  8)
    clear
    echo "=== TUS APPS - 1984FRIENDSTEAM STORE ==="
    echo "Total: $(ls ~/mis_apps/ 2>/dev/null | wc -l) apps instaladas"
    echo ""; ls -1 ~/mis_apps/
    echo ""; echo "---"
    read -p "Que app quieres abrir (nombre): " app
    if [ -f ~/mis_apps/$app ]; then
      bash ~/mis_apps/$app
    elif [ -f ~/mis_apps/$app.sh ]; then
      bash ~/mis_apps/$app.sh
    else
      echo "No existe esa app"
      sleep 1
    fi
    ;;
  9) clear; echo "By GRAND LEXNORTHS / 1984FRIENDSTEAM - ¡Hasta luego!"; break ;;
esac
done
