:: c:\APL\Python64\Python.exe -m youtube_dl %*

@c:\APL\Python64\Python.exe -m youtube_dl ^
	-f137+bestaudio ^
	--merge-output-format mp4 ^
	--ffmpeg-location "c:\apl\!TOOLS\(video)\_CODECS\FFMPEG64\bin\ffmpeg.exe" ^
	%*
