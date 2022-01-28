@wmic ^
	service ^
		where (name like '%%%~1%%' ) ^
		get caption, started, startmode, state

