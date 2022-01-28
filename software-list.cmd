@wmic ^
	product where "caption like '%%%1%%'" ^
	get caption, installdate ^
	/format: table
