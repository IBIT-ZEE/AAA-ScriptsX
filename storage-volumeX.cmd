@wmic ^
	volume ^
		where (name like '%%%~1%%' ) ^
		get * ^
		/format:value
