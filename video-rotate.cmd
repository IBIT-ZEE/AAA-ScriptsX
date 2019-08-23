:ENTRY
	call IBIT_Log %0 %*


:MAIN
	grep -Poz "^:SYNTAX\K[\w\W]*?(?=:)" %~f0
	::sed -n "/^\.Syntax\./,/^\.\./p" %~pnx0
	goto END


:END
	Exit /B



:SYNTAX

VIDEO-ROTATE

	* Will use FFMPEG tools
	// use video-rotate<n> for predefined settings
	ffmpeg -i v1.3gp -vf "transpose=1" v1x.mp4
	
	transpose
		0 = Vertical Flip (default)
		1 = Horizontal Flip
		2 =  90º Counter Clockwise
		3 =  90º Clockwise and Vertical Flip

	* some video files (mainly .3gp) have bad rotationmetadata
	* for easy destination type selection just set file extension

:
