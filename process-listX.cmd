@wmic ^
	process ^
		where (caption!='WMIC.exe' AND commandline like '%%%~1%%' ) ^
		get * ^
		/format:value

:: processid,name,caption,commandline,sessionid,status,threadcount,workingsetsize