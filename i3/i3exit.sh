lock() {
	i3lock -c 000000 -i /home/rlexmann/Pictures/Lockscreen/Cthulhu.png
}

case "$2" in
	lock)
		lock
		;;
	*)
esac

case "$1" in
	lock)
		lock
		;;
	suspend)
		systemctl suspend
		;;
	hibernate)
		systemctl hibernate
		;;
	reboot)
		systemctl reboot
		;;
	poweroff)
		systemctl poweroff
		;;
	*)
		echo "Usage: $0 {lock|suspend|hibernate|reboot|poweroff}"
		exit 2
esac

exit 0
