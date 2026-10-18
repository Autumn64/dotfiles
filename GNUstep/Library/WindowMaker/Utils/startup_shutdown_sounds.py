#!/usr/bin/env python3

import os
import sys
from playsound3 import playsound

if len(sys.argv) < 2 or sys.argv[1] not in ["startup", "shutdown"]:
	print("FATAL ERROR: Wrong parameters. Use either 'startup' or 'shutdown'.", file=sys.stderr)
	os._exit(1)

if sys.argv[1] == "startup":
	playsound(f"{os.environ['HOME']}/GNUstep/Library/WindowMaker/Utils/Sounds/startup.mp3")
elif sys.argv[1] == "shutdown":
	playsound(f"{os.environ['HOME']}/GNUstep/Library/WindowMaker/Utils/Sounds/shutdown.mp3")

os._exit(0)