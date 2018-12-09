i3status -c /home/rlexmann/.config/i3/i3status.conf | while :
do
	read line
	keycode10=$(xmodmap -pke | awk '/keycode  10/{print $4}')
	if [ $keycode10 == "exclam" ]
	then
		KB=$"modified us"
	else
		KB=$(setxkbmap -query | awk '/layout/{print $2}')
	fi
#	if [ $KB == "us" ]
#	then
#		kb_color=$"#CCCCCC"
#	else
#		kb_color=$"#CCCCCC"
#	fi
	b_act=$(cat /sys/class/backlight/acpi_video0/brightness)
	b_max=$(cat /sys/class/backlight/acpi_video0/max_brightness)
	brightness=$((100 * $b_act/$b_max))
	layout="[{\"markup\":\"none\",\"full_text\":\"$KB\"},{\"markup\":\"none\",\"full_text\":\"BRT: $brightness%\"},"
#	layout="[{\"color\":\"#00FFFF\",\"markup\":\"none\",\"full_text\":\"$KB\"},{\"markup\":\"none\",\"full_text\":\"BRT: $brightness%\"},"
	echo ${line/[/$layout} || exit 1
done
