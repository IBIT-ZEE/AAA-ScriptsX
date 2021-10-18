:: c:\APL\Python64\Python.exe -m youtube_dl %*
:: ?137 always mp4/1080p 1920x1080??
:: ?398 always mp4/720p  1280x720??
:: -or-
:: -f bestvideo+bestaudio

@c:\APL\Python64\Python.exe -m youtube_dl ^
	-f bestvideo+bestaudio ^
	--merge-output-format mp4 ^
	--ffmpeg-location "c:\apl\!TOOLS\(video)\_CODECS\FFMPEG64\bin\ffmpeg.exe" ^
	%*
