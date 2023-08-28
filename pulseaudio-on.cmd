::call AAA-Log %0 %*

:MAIN
	@echo off
	:: if "%1"=="" ( AAA-Obs %0 )
	start "PulseAudio" ^
		c:\apl\pulseaudio\pulseaudio.exe ^
			-F c:\apl\pulseaudio\_config.pa ^
			--exit-idle-time=-1 ^
			-v

	exit /b

:OBS
>pulseaudio-
>wsl-

	pulseaudio-on 

  
