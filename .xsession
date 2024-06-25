doas mount -t nfs osmc:/media/MediaServer/ /home/pluck/MediaServer/ &
picom -cb & 
feh --bg-scale /home/pluck/Pictures/Backgrounds/faded.jpg &
xrdb -merge /home/pluck/.Xresources &
doas mpd &

#xterm -e lynx https://www.openbsd.org/faq/index.html &
#xterm -e nano ~/todo.txt &

sh /home/pluck/.config/lemonbar.sh | lemonbar-xft -d -f "NotoSansM Nerd Font Mono,NotoSansM NFM Cond Med:size=7" -f 'Font Awesome 6 Free' -f 'Font Awesome 6 Brands' -f 'Font Awesome 6 Free Solid' -n bar -B#2d2d2d -F#d3d0c8 &
cwm
