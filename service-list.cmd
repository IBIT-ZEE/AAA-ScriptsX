@wmic.exe ^
	service ^
		where (name like '%%%~1%%' ) ^
		get name, processid, startmode, started
