#!/bin/bash
# Script to use as pianobar's event_command
# Designed for use with remote.sh script

# Author: Devraj Mehta

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|songStationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\|stationCount\|station[0-9]*\)=' /dev/stdin) # don't overwrite $1...

# debug
#echo $1
#cat /dev/stdin

PDIR=$HOME/.config/pianobar
NOWPLAYING=$PDIR/nowplaying
STATLIST=$PDIR/stationlist
PLOG=$PDIR/pianobar.log
ICONORM=$PDIR/icons/Play-Normal.ico
ICOLIKE=$PDIR/icons/Play-Pressed.ico
NOWPLAY="$title by $artist on $album"
if [ $rating -eq 1 ]; then
	NOWPLAY="$NOWPLAY    *****"
fi

case "$1" in

	songstart)
		if [ $rating -eq 1 ]; then
			notify-send -u low -i $ICOLIKE "$NOWPLAY"
		else
			notify-send -u low -i $ICONORM "$NOWPLAY"
		fi

		echo "$NOWPLAY" > $NOWPLAYING;
		echo "$(date) $NOWPLAY" >> $PLOG;
	;;

	songlove)
		echo "$(date) Song liked $NOWPLAY" >> $PLOG;
	;;

	songshelf)
		echo "$(date) Song shelved $NOWPLAY" >> $PLOG;
	;;

	songban)
		echo "$(date) Song banned $NOWPLAY" >> $PLOG;
	;;

	songbookmark)
		echo "$(date) Song bookmarked $NOWPLAY" >> $PLOG;
	;;

	artistbookmark)
		echo "$(date) Artist bookmarked $NOWPLAY" >> $PLOG;
	;;
	
	stationcreate|stationdelete|usergetstations)
		echo -n "" > $STATLIST;
		for I in $(seq 0 $[ $stationCount - 1 ]); do
			echo -n "$I $(eval "echo \$$(echo station$I)"| tr -d "," | tr " " "_") " >> $STATLIST;
		done;

	;;

	*)
		if [ "$pRet" -ne 1 ]; then
			notify-send -u critical -i $ICONORM "$1 failed: $pRetStr";
		elif [ "$wRet" -ne 1 ]; then
			notify-send -u critical -i $ICONORM "$1 failed: Network error: $wRetStr";
		fi
	;;
esac

cp -f $PLOG $HOME/logs/;
