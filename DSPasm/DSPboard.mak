# Generated by the VisualDSP++ IDDE

# Note:  Any changes made to this Makefile will be lost the next time the
# matching project file is loaded into the IDDE.  If you wish to preserve
# changes, rename this file and run it externally to the IDDE.

# The syntax of this Makefile is such that GNU Make v3.77 or higher is
# required.

# The current working directory should be the directory in which this
# Makefile resides.

# Supported targets:
#     DSPboard_Debug
#     DSPboard_Debug_clean

# Define this variable if you wish to run this Makefile on a host
# other than the host that created it and VisualDSP++ may be installed
# in a different directory.

ADI_DSP=C:\Program Files\Analog Devices\VisualDSP 3.5 32-Bit

ifndef ADI_DSP_MAKE
ADI_DSP_MAKE=C:/Program\ Files/Analog\ Devices/VisualDSP\ 3.5\ 32-Bit
endif

# $VDSP is a gmake-friendly version of ADI_DIR

empty:=
space:= $(empty) $(empty)
VDSP_INTERMEDIATE=$(subst \,/,$(ADI_DSP))
VDSP=$(subst $(space),\$(space),$(VDSP_INTERMEDIATE))

# Define the command to use to delete files (which is different on Win95/98
# and Windows NT/2000)

ifeq ($(OS),Windows_NT)
RM=cmd /C del /F /Q
else
RM=command /C del
endif

#
# Begin "DSPboard_Debug" configuration
#

ifeq ($(MAKECMDGOALS),DSPboard_Debug)

DSPboard_Debug : ./Debug/DSPboard.dxe 

./Debug/events.doj :./events.asm ./memory.h $(ADI_DSP_MAKE)/212xx/include/def21262.h $(ADI_DSP_MAKE)/212xx/include/def21266.h $(ADI_DSP_MAKE)/212xx/include/def2126x.h 
	$(VDSP)/easm21k.exe .\events.asm -proc ADSP-21262 -g -o .\Debug\events.doj -MM

./Debug/loader.doj :./loader.asm $(ADI_DSP_MAKE)/212xx/include/def21262.h $(ADI_DSP_MAKE)/212xx/include/def21266.h $(ADI_DSP_MAKE)/212xx/include/def2126x.h 
	$(VDSP)/easm21k.exe .\loader.asm -proc ADSP-21262 -g -o .\Debug\loader.doj -MM

./Debug/main.doj :./main.asm $(ADI_DSP_MAKE)/212xx/include/def21262.h $(ADI_DSP_MAKE)/212xx/include/def21266.h $(ADI_DSP_MAKE)/212xx/include/def2126x.h memory.h 
	$(VDSP)/easm21k.exe .\main.asm -proc ADSP-21262 -g -o .\Debug\main.doj -MM

./Debug/samples.doj :./memory.h ./samples.asm $(ADI_DSP_MAKE)/212xx/include/def21262.h $(ADI_DSP_MAKE)/212xx/include/def21266.h $(ADI_DSP_MAKE)/212xx/include/def2126x.h 
	$(VDSP)/easm21k.exe .\samples.asm -proc ADSP-21262 -g -o .\Debug\samples.doj -MM

./Debug/DSPboard.dxe :./DSPboard.ldf ./Debug/events.doj ./Debug/loader.doj ./Debug/main.doj ./Debug/samples.doj 
	$(VDSP)/cc21k.exe .\Debug\events.doj .\Debug\loader.doj .\Debug\main.doj .\Debug\samples.doj -T .\DSPboard.ldf -map .\Debug\DSPboard.map.xml -L .\Debug -flags-link -od,.\Debug -o .\Debug\DSPboard.dxe -proc ADSP-21262 -flags-link -MM

endif

ifeq ($(MAKECMDGOALS),DSPboard_Debug_clean)

DSPboard_Debug_clean:
	$(RM) ".\Debug\events.doj"
	$(RM) ".\Debug\loader.doj"
	$(RM) ".\Debug\main.doj"
	$(RM) ".\Debug\samples.doj"
	$(RM) ".\Debug\DSPboard.dxe"
	$(RM) ".\Debug\*.ipa"
	$(RM) ".\Debug\*.opa"
	$(RM) ".\Debug\*.ti"

endif


