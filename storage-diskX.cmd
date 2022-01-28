@wmic ^
	diskdrive ^
		where (name like '%%%~1%%' ) ^
		get * ^
		/format:value


