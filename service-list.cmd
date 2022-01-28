@wmic ^
	service ^
		where (name like '%%%~1%%' ) ^
		get name, processid, servicetype

