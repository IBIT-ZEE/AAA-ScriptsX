
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
	
	mkv-extract
		"foundation  ???.mkv"           tracks 33:x.srt
		"The.Expanse ???.mkv"           tracks 26:x.srt
		"The book of Boba Fett ???.mkv" tracks 16:x.srt
		...



