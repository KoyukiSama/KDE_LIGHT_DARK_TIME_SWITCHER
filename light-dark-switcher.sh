#!/bin/bash

CURR_THEME=$(echo "" > /tmp/curr_theme 2>/dev/null || echo "")

while true; do
# Extract times from ~/.config/kwinrc
evening_time=$(grep 'EveningBeginFixed' ~/.config/kwinrc | cut -d '=' -f2)
morning_time=$(grep 'MorningBeginFixed' ~/.config/kwinrc | cut -d '=' -f2)
current_time=$(date +%H%M)

CURR_THEME=$(cat /tmp/curr_theme 2>/dev/null || echo "")

#echo $CURR_THEME
#echo "e: $evening_time"
#echo "m: $morning_time"

# Switch themes based on the time
if [[ ($current_time -ge $evening_time || $current_time -lt $morning_time) && $CURR_THEME != "DARK" ]]; then

	kitty @ set-colors --reset

    # Switch to Breeze Dark
    lookandfeeltool -a org.kde.breezedark.desktop

    # set brightness lower
    qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 30
	
	
	#echo "indark"

	kitty @ load-config ~/.config/kitty/kitty.conf ~/.config/kitty/dark-theme.auto.conf

    echo "DARK" > /tmp/curr_theme

elif [[ ($current_time -ge $morning_time && $current_time -lt $evening_time) && $CURR_THEME != "LIGHT" ]]; then

	    # Switch to Breeze Light
    lookandfeeltool -a org.kde.breeze.desktop

    # set brightless to 100%
    qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 100
	#echo "inlight"

	kitty @ load-config ~/.config/kitty/kitty.conf ~/.config/kitty/light-theme.auto.conf
    echo "LIGHT" > /tmp/curr_theme

fi

# sleep for 10 min
sleep 1

done

