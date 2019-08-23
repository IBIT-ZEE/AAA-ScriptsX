aaa-mainx.cmd netstat -an|grep 3306 

if %errorlevel%==1 (
	aaa-message "No service at port TCP:3306"
	)
