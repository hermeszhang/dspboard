# This gdb init script automatically connects to the target and
# loads the program 
#
# $Id: .gdbinit,v 1.2 2006/01/22 17:08:05 strubi Exp $
# 

file blink.dxe
target remote :2000
set remotetimeout 999
set remoteaddresssize 32


set prompt (bfin-jtag-gdb)\ 

define init
	monitor reset
end

source init.gdb
source mmr.gdb
source dump.gdb
source catch_exc.gdb


initmem

define syscr
	print/x * ((unsigned short *) 0xffc00104)
end

define target_init
	monitor reset
end

set scheduler-locking off
