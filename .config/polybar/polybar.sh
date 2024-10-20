#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
#polybar main
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=/home/fabrice/.config/polybar/config.ini --reload main &
done
