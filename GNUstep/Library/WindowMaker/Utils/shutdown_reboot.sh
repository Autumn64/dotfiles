#!/bin/bash

if [ -z "$1" ] ; then
echo "Wrong parameters. Use either 'shutdown' or 'reboot'."
exit 1
fi

$HOME/GNUstep/Library/WindowMaker/Utils/startup_shutdown_sounds.py shutdown

if [[ "$1" == "shutdown" ]] ; then
systemctl poweroff
fi

if [[ "$1" == "reboot" ]] ; then
systemctl reboot
fi