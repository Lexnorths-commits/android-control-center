termux-battery-status | grep -o "\"percentage\": [0-9]*" | cut -d" " -f2 | xargs echo "Tu bateria esta al:"; echo "% - Modo Dios activado"; read
