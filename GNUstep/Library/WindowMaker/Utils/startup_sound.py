#!/usr/bin/env python3

import os
from playsound3 import playsound

playsound(f"{os.environ['HOME']}/GNUstep/Library/WindowMaker/Utils/Sounds/startup.mp3")
os._exit(0)
