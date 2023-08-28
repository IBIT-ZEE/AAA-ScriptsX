
:MAIN
	@echo off
	if "%~1"=="" AAA-Obs %0 
	
	@"C:\APL\!TOOLS\(video)\_ENCODERS\mkvtoolnix64\mkvextract.exe" %*
	exit /b



:OBS
>mkv-info

	Fork:

	mkv-
	mkv-extract <args...>


	 /\------------------------/\
	<[]> MKVToolNix enhancer: <[]>
	 \/------------------------\/
	
	Samples: (2021.11.04/...)
	
	C:\APL\!TOOLS\(video)\_ENCODERS\mkvtoolnix64\mkvextract.exe <file> ...
	
	mkv-extract
		"Foundation..."            tracks 33:x.srt
		"The Expanse..."           tracks 26:x.srt
		"The book of Boba Fett..." tracks 16:x.srt
		"Raised by wolves..."      tracks  5:x.srt
		"Space force"              tracks 23:x.srt
		...



