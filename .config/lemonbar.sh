#!/usr/bin/bash

Clock(){
	TIME=$(date "+%I:%M %p")
	echo -e -n " ${TIME}" 
}

Cal() {
    DATE=$(date "+%a, %d %B %Y")
    echo -e -n "${DATE}"
}

ActiveWindow(){
	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
	max_len=70
	if [ "$len" -gt "$max_len" ];then
		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
	else
		echo -n "$(xdotool getwindowfocus getwindowname)"
	fi
}

Battery() {
        [[ $(apm -a) -eq 1 ]] \
          && echo -n "${_pwr[0]}" \
          || echo -n "${_bat[$(apm -b)]} "
        echo -n "$(apm -l)%${_norm}"
}

Wifi(){
        [[ -z "$(ifconfig ${_nic[0]} | grep 'status: no carrier')" ]] \
                && (echo -n ${_net[0]} ; return)
        echo -n $(ifconfig iwx0 | grep join | grep -o '"[^"]*"')
}


Sound(){
        _v=$(sndioctl -n output.level | awk '{ print int($0*100) '})
        [[ $(sndioctl -n input.mute) -eq 1 ]] \
                && echo -n "${_norm}MUTE${_norm} " \
                || echo -n "${_warn}${_norm} "
        [[ $(sndioctl -n output.mute) -eq 1 ]] \
                && echo -n "" 
        echo -n "$_v%"
}
	

while true; do
	echo -e "$(ActiveWindow)" "%{c} $(Clock) $(Cal) " "%{r} SSID:$(Wifi)" " BATT:$(Battery)  VOL:$(Sound)  "
	sleep 0.1
done
