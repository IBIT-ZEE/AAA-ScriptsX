

AAA-OBS %0 %*


:OBS
>ffmpeg$


// VIDEO ONLY
ffmpeg -loop 1 -i x%%1d.png -i x.mp3 -r 1 -pix_fmt yuv420p -shortest x.mp4


// WITH AUDIO
ffmpeg -i x.mp3 -r 1 -stream_loop 4 -i x.gif -loop 1 -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" x.mp4



