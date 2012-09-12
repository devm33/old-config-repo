#!/bin/bash
# Script to control pianobar remotely
# Notifications desgined for GNOME
# To be used with eventcmd.sh script as
# pianobar's event_command target
# and ctl as fifo.

# Author: Devraj Mehta

PDIR=$HOME/.config/pianobar
CTL=$PDIR/ctl
ICOLIKE=$PDIR/icons/Play-Pressed.ico
ICONORM=$PDIR/icons/Play-Normal.ico

read NOWPLAY < $PDIR/nowplaying;
read STATIONS < $PDIR/stationlist;

case $1 in 

	like)
		echo -n '+' > $CTL;
		notify-send -u low -i $ICOLIKE "Liked song $NOWPLAY";
	;;
	
	ban)
		echo -n '-' > $CTL;
		notify-send -u low -i $ICONORM "Banned song $NOWPLAY";
	;;

	show)
		if grep -q "\*\*\*\*\*" $PDIR/nowplaying; then
			notify-send -u low -i $ICOLIKE "$NOWPLAY";
		else
			notify-send -u low -i $ICONORM "$NOWPLAY";
		fi
	;;

	pp)
		echo -n 'p' > $CTL;
	;;

	choose)
		OPTS="--width=400 --height=900 --title Pianobar --text Choose_a_station:\" "
		LIST="--list --column # --column Station "
		ANS=$(zenity $OPTS $LIST $STATIONS)
		if [ $? -eq 0 ]; then
			echo "s$ANS" > $CTL;
		fi
	;;

	launch)
		gnome-terminal -e pianobar --geometry=90x63+1920+0 --hide-menubar -t "Pianobar" 
	;;

	*)
		echo -e "Pianobar remote control script\n";
		echo -e "Usage:";
		echo -e "------------------------------";
		echo -e "like\tlike current song";
		echo -e "ban\tban current song";
		echo -e "show\tpopup notification of current song";
		echo -e "pp\tplay\pause current song";
		echo -e "choose\tchoose station through gui";
		echo -e "launch\tstart pianobar in custom terminal";
		echo -e "";
	;;
esac

