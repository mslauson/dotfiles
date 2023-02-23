#!/bin/bash
killall -q polybar

# if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
# 	polybar -q top -c "$dir/$style/config.ini" &
# 	polybar -q bottom -c "$dir/$style/config.ini" &

# elif [[ "$style" == "pwidgets" ]]; then
# 	bash "$dir"/pwidgets/launch.sh --main

# else
	if type "xrandr"; then
	  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	    # MONITOR=$m polybar -q main -c "$dir/$style/config.ini" & disown
		MONITOR=$m polybar -q main |tee /tmp/polybar.log & disown
	  done
	else
	 polybar -q main |tee /tmp/polybar.log & disown
	fi
	#polybar -q main -c "$dir/$style/config.ini" &	
# fi
