#!/usr/bin/env python3

import os
from playsound3 import playsound

playsound(os.path.join(os.path.dirname(os.path.abspath(__file__)), "Sounds", "startup.mp3"))
os._exit(0)
