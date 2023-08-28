AAA-OBS %0 %*


:OBS
>ffmpeg-
>ffmpeg$

// h264
ffmpeg -i x.mp4 -c:v libx264 -s:v 1280x720                 xx.mp4
ffmpeg -i x.mp4 -c:v libx264 -s:v 1280x720 -ab 128k -f mp3 xx.mp4
ffmpeg -i x.mp4 -c:v libx264 -s:v 1280x720 -crf 32         xx.mp4
ffmpeg -i x.mp4 -c:v libx264 -s:v 1280x720 -b:v 1024k      xx.mp4

// h265
ffmpeg -i x.mp4 -c:v libx265 -s:v 1280x720         xx.mp4
ffmpeg -i x.mp4 -c:v libx265 -s:v 1280x720 -crf 32 xx.mp4
