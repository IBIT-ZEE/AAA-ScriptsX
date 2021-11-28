::Call aaa-log %0 %1

:MAIN
	@echo off
	setlocal
	set x=%~n0
	aaa-menu-scripts %x:~,-2%
	endlocal



