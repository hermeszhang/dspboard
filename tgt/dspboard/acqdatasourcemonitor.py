"""
Monitor and print all acqdatasource events
"""


import sys
from somapynet.event import Event
from somapynet import eaddr
from somapynet.neteventio import NetEventIO

import struct
import time

eio = NetEventIO("10.0.0.2")

DSPBOARDADDR = int(sys.argv[1])

ACQDATASOURCE_CMDRESP = 0x42
eio.addRXMask(ACQDATASOURCE_CMDRESP, DSPBOARDADDR)

eio.start()
while True:
    erx = eio.getEvents()
    for q in erx:
        print q

eio.stop()

    
    
