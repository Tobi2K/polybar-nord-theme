#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

interface=$(ip link ls up | grep ': en' | cut -d':' -f2 | cut -d' ' -f2)

if type "xrandr"; then
	if [[ $(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l) > 1 ]]; then
		echo "More than one display..."
		for m in $(xrandr --query | grep " connected" | grep -v "eDP1" | cut -d" " -f1); do
    			MONITOR=$m INTERFACE=$interface polybar -c $HOME/.config/polybar/bars/dark-config nord-top &
       			MONITOR=$m INTERFACE=$interface polybar -c $HOME/.config/polybar/bars/dark-config nord-down &
		done
	else
		echo "Only one display..."
		for m in $(xrandr --query | grep " connected" | grep "eDP1" | cut -d" " -f1); do
                        MONITOR=$m INTERFACE=$interface polybar -c $HOME/.config/polybar/bars/dark-config nord-top &
                        MONITOR=$m INTERFACE=$interface polybar -c $HOME/.config/polybar/bars/dark-config nord-down &
                done
	fi
else
	INTERFACE=$interface polybar -c $HOME/.config/polybar/bars/dark-config nord-top &
        INTERFACE=$interface polybar -c $HOME/.config/polybar/bars/dark-config nord-down &
fi


echo "Bars launched..."
