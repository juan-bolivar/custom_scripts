ffmpeg -y -f x11grab -s 1600x900 -i :0.0 -f alsa -i default "$(echo 'escriba el nombre del screencast' | dmenu).mkv"
pkill -RTMIN+12 dwmblocks

