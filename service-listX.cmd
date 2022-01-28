@wmic ^
	service ^
		where (name like '%%%~1%%' ) ^
		get * ^
		/format:value
