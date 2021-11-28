
:MAIN
	if "%~1"=="" AAA-Obs %0 
	
	@"C:\APL\!TOOLS\(video)\_ENCODERS\mkvtoolnix64\mkvextract.exe" %*
	exit /b



:obs
	Fork:

	mkv-
	mkv-extract <args...>


	 /\------------------------/\
	<[]> MKVToolNix enhancer: <[]>
	 \/------------------------\/
	
	Samples: (2021.11.04/...)
	
	mkv-extract "foundation.s01e06.repack.1080p.web.h264-cakes.mkv" tracks 33:6.srt
	mkv-extract "foundation.s01e07.1080p.web.h264-cakes.mkv"        tracks 33:7.srt
	
	...



