@Call IBIT-Log %*


:INIT
	if not exist "%~1" AAA-Message "Ficheiro inexistente..." "" "%~1"

:MAIN
	setlocal
	
	:: rename to temporary fullpath-name
	set xPath=%~dp1
	set xFile=%~n1~%~x1
	echo Video reencode to 720p
	echo,
	echo Path/File
	echo %xPath%
	echo %xFile%
	echo,
	
	:: reencode to name
	ren "%~1" "%xFile%"
	
	:: h264
	:: ffmpeg -i "%xPath%%xFile%" -c:v libx264 -s:v 1280x720 "%~1"
	:: ffmpeg -i "%xPath%%xFile%" -c:v libx264 -s:v 1280x720 -ab 128k -f mp3 "%~1"
	:: ffmpeg -i "%xPath%%xFile%" -c:v libx264 -s:v 1280x720 -crf 32 "%~1"
	:: ffmpeg -i "%xPath%%xFile%" -c:v libx264 -s:v 1280x720 -b:v 1024k "%~1"
	
	:: h265
	ffmpeg -i "%xPath%%xFile%" -c:v libx265 -s:v 1280x720 "%~1"
	:: ffmpeg -i "%xPath%%xFile%" -c:v libx265 -s:v 1280x720 -crf 32 "%~1"

:END
	endlocal
	echo,
	echo,