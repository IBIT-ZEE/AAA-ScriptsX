@wmic.exe ^
	service ^
		where (name like '%%%~1%%' ) ^
		get * ^
		/format:value
