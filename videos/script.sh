

set -x
programa=$(echo "Favor ingrese el programa a buscar" | dmenu -l 10)

serie=$(echo https://ww4.watch-series.co$(wget -qO- "https://ww4.watch-series.co/search.html?keyword=$programa" | grep view_more | cut -d\" -f2 | dmenu -l 10))/season

episodio=$(echo https://ww4.watch-series.co$(wget -qO- $serie | grep videoHname  | cut -d \" -f4| dmenu -l 10| cut -d \" -f2))
set +x
echo $episode
vlc "$(wget -qO- $episodio | grep data-video | cut -d\" -f6 | while read u ; do youtube-dl -g "$u" 2>/dev/null && break ; done)"



