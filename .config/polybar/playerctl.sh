#!/bin/sh

status=$(playerctl status 2> /dev/null)
volume=$(playerctl volume 2> /dev/null)

volume=$(printf "%1.2f\n" $volume)
volume=$(echo "$volume * 100" | bc)
volume=$(printf "%1.0f\n" $volume)

msg=""

if [ "$status" = "Playing" ]; then
    msg="  %{T1}$(playerctl metadata artist)%{T-} - $(playerctl metadata title)   $volume% "
elif [ "$status" = "Paused" ]; then
    msg="  $(playerctl metadata artist) - $(playerctl metadata title) "
else
    msg="no ncspot"
fi

echo "$msg"
