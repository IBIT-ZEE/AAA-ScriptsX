::Call AAA-Log %0 %*

@echo off
setlocal

:CHECKUP
	:: ?argumented file valid??
	if "%~1"=="" %0 "%~f0" OBS
	:: if NOT exist "%~1" AAA-Message %0 "" "%~1 not found..."
	set xFile="%~1"

	:: ?argumented start-of-chunk label valid??
	:: default TEXT-CHUNK for any script is OBS
	if "%~2"=="" %0 %1 OBS
	set xLabel-Start=:%~2\r\n

	:: ???default this argument???
	:: ?argumented end-of-chunk label valid??/OPTIONAL
	if "%~3"=="" (set xLabel-End=\Z) else (set xLabel-End=:%~3\r\n)
	goto :MAIN


:DEBUG
	echo %xRE%
	echo %xFile%
	echo %xLabel-Start%
	echo %xLabel-End\%
	goto :END


:MAIN
	set xRE="\n%xLabel-Start%\K[\w\W]*?(?=%xLabel-End%)"
	:: grep -Poz "\n:OBS\K[\w\W]*?(?=\n:)" %~dpn1.cmd
	call grep -Pozi %xRE% %xFile%
	:: GOTO DEBUG
	goto :END


:END
	echo,
	echo,
	endlocal
	exit /b


:OBS

	 _/\_
	 \[]/	|> Text-Chunk <file> <label-start> [<label-end>]
	/_\/_\
	
	Get a Chunk of text from file
	beginning at passed <label-start>
	up to <label-end> or <EOF>


